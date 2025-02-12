from datetime import datetime, timedelta
import threading
import time
from com.rfid.Reader import *
from com.rfid.enumeration import *
from com.rfid.interface import *
from com.rfid.models import *
from log.log_master import CustomLogger
from utils.constants import Utilities


class MantraRfidReader(threading.Thread):
    def __init__(self, _handler, default_directory, rfid_detail,presence_loop_required, log_file_name, timeout=0.100):
        threading.Thread.__init__(self)
        self.handler = _handler
        self.rfid_detail = rfid_detail
        self.presence_loop_required=presence_loop_required
        self.presence_loop_status=False
        self.timeout = timeout
        self.connection_string = f"TCP:{self.rfid_detail['IpAddress']}:{self.rfid_detail['PortNumber']}"
        self.reader = None
        self.is_running=False
        self.is_stopped = False
        self.is_active=True
        self.CLEANUP_INTERVAL = 30
        self.set_logger(default_directory,log_file_name)
        self.processed_epcs={}

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def setup_reader(self):
        try:
            self.reader = Reader()
            if self.reader.initReader(self.connection_string):
                readerAntPlan = ReaderWorkingAntSet_Model([1])
                self.reader.paramSet(EReaderEnum.WO_RFIDWorkingAnt, readerAntPlan)
                readTID = ReadExtendedArea_Model(EReadBank.TID, 0, 6, "")
                readUserData = ReadExtendedArea_Model(EReadBank.UserData, 0, 32, '00000000')
                readExtendedAreaList = [readTID,readUserData]
                self.reader.paramSet(EReaderEnum.WO_RFIDReadExtended, readExtendedAreaList)
                setReaderBuzzer = ReaderBuzzer_Model()
                setReaderBuzzer.buzzerControl = EBuzzerControl.ReaderControl
                if self.reader.paramSet(EReaderEnum.RW_ReaderBuzzerSwitch, setReaderBuzzer) == EReaderResult.RT_OK:
                    self.logger.logInfo('reader is conncted successfully!\n --------')
                    self.is_running=True
                    self.processed_epcs={}
                    self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',True)
                    return True
                else:
                    self.logger.logError('failed to connect reader!')
                    self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)
                    self.reader=None
            else:
                self.logger.logError('failed to connect reader!')
                self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)
                self.reader=None    
        except Exception as e:
            self.reader=None
            self.logger.logError(f"Exception setup_reader: {str(e)}")
            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)

    def check_reader_status(self):
        setReaderBuzzer = ReaderBuzzer_Model()
        setReaderBuzzer.buzzerControl = EBuzzerControl.ReaderControl
        if self.reader.paramSet(EReaderEnum.RW_ReaderBuzzerSwitch, setReaderBuzzer) != EReaderResult.RT_OK:
            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)
            self.logger.logError('failed to connect reader!')
            self.is_active=True
            self.client_stop()
            return False
        else:
            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',True)
            return True
    
    def decode_tag(self,tag):
        try:
            if tag._EPC not in self.processed_epcs:
                self.processed_epcs[tag._EPC] = datetime.now()
                self.tagDetails["ReaderName"]=tag._ReaderName
                self.tagDetails["EPC"]=tag._EPC
                self.logger.logInfo(f"Tag EPC: {str(tag._EPC)}")
                if hasattr(tag, '_TID'):
                    self.tagDetails["TID"]=Utilities.handle_tag_id(tag._TID)
                else:
                    self.tagDetails["TID"]=""
                if hasattr(tag, '_UserData'):
                    self.decrypt_user_data(tag._UserData)
                else:
                    self.tagDetails["UserData"]=""
                    self.tagDetails["Class"]=0
                    self.tagDetails["Plate"]="XXXXXXXXXX"
                if int(self.tagDetails["Class"])!=0:
                    current_date_time=datetime.now()
                    self.tagDetails["SystemDateTime"]=current_date_time.isoformat()
                    self.tagDetails["TransactionDateTime"]=Utilities.current_date_time_json(dt=current_date_time)
                    self.handler.update_rfid_data(self.tagDetails)
                    self.tagDetails={"TagReadById":1,"SystemDateTime":datetime.now(),"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":0,"Plate":"XXXXXXXXXX","Processed":False}
                    self.presence_loop_status=False
        except Exception as e:
            self.logger.logError(f"Exception decode_tag: {str(e)}")
        
        
    def run(self):
        self.processed_epcs={}  
        while not self.is_stopped:
            try:
                while self.is_active: 
                    if self.reader is None:
                        self.is_running=self.setup_reader()
                        self.processed_epcs={}
                    else:
                        self.is_running=True
                    self.tagDetails={"TagReadById":1,"SystemDateTime":datetime.now(),"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":0,"Plate":"XXXXXXXXXX","Processed":False,"TagStatus":"NA"}    
                    while self.is_running:
                        if self.check_reader_status()==False:
                            break
                        self.processed_epcs = {epc: timestamp for epc, timestamp in self.processed_epcs.items() if datetime.now() - timestamp <= timedelta(seconds=self.CLEANUP_INTERVAL)}
                        read_list = []
                        self.reader.read(500, read_list)
                        for tag in set(read_list):
                            result,epc=Utilities.vaildate_tag_epc(tag._EPC)
                            if result:
                                tag._EPC=epc
                                if self.presence_loop_required==False:
                                    self.decode_tag(tag)
                                else:
                                    if self.presence_loop_status:
                                        self.decode_tag(tag)
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception rfid_run: {str(e)}")
    
    def update_presence_loop_status(self, status):
        self.presence_loop_status=status


    def decrypt_user_data(self,user_data):
        try:
            self.tagDetails["UserData"]=user_data
            self.tagDetails["Class"]= self.convert_hex_to_int(user_data[24:26])
            self.tagDetails["Plate"]=self.hex_to_string_vehicle_number(user_data[4:24])
        except Exception as e:
            self.logger.logError(f"Exception decrypt_user_data: {str(e)}")

    def hex_to_string_vehicle_number(self,hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
                self.logger.logError(f"Exception hex_to_string_vehicle_number: {str(e)}")
                result='XXXXXXXXXX'
        finally:
            return result
    
    def convert_hex_to_int(self,hex_string):
        result='00'
        try:
            result=str(int(hex_string, 16))
        except Exception as e:
                self.logger.logError(f"Exception convert_hex_to_int: {str(e)}")
                result='00'
        finally:
            return result

    def client_stop(self):
        try:
            self.is_running = False
            if self.reader:
                self.reader.stop()
        except Exception as e:
                self.logger.logError(f"Exception client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
            self.is_active=False
        except Exception as e:
                self.logger.logError(f"Exception stop: {str(e)}")