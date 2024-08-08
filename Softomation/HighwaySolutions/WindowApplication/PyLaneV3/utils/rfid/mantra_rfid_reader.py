from datetime import datetime, timedelta
import threading
import time
from com.rfid.Reader import *
from com.rfid.enumeration import *
from com.rfid.interface import *
from com.rfid.models import *
from utils.constants import Utilities
from utils.log_master import CustomLogger

class MantraRfidReader(threading.Thread):
    def __init__(self, _handler, default_directory, rfid_detail,presence_loop_required, log_file_name, timeout=0.100):
        threading.Thread.__init__(self)
        self.handler = _handler
        self.rfid_detail = rfid_detail
        self.presence_loop_required=presence_loop_required
        self.presence_loop_status=False
        self.timeout = timeout
        self.connection_string = f"{self.rfid_detail['ProtocolTypeName']}:{self.rfid_detail['IpAddress']}:{self.rfid_detail['PortNumber']}"
        self.reader = None
        self.is_running=False
        self.is_stopped = False
        self.CLEANUP_INTERVAL = 30
        self.set_logger(default_directory,log_file_name)
        self.set_status()
        self.processed_epcs={}

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="mantra_rfid"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")
    
    def set_status(self):
        try:
            if self.rfid_detail["OnLineStatus"]==0 or self.rfid_detail["OnLineStatus"]==False:
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_status: {str(e)}")

    def setup_reader(self):
        try:
            self.reader = Reader()
            if self.reader.initReader(self.connection_string):
                self.logger.logInfo(self.reader)
                reader_ant_plan = ReaderWorkingAntSet_Model([1])
                self.logger.logInfo(f'Setting up the working antenna result: {self.reader.paramSet(EReaderEnum.WO_RFIDWorkingAnt, reader_ant_plan)}')
                read_tid = ReadExtendedArea_Model(EReadBank.TID, 0, 6, "")
                readUserData = ReadExtendedArea_Model(EReadBank.UserData, 0, 32, '00000000')
                read_extended_area_list = [read_tid,readUserData]
                self.logger.logInfo('Set Extended Read Result:TID & UserData')
                self.logger.logInfo(self.reader.paramSet(EReaderEnum.WO_RFIDReadExtended, read_extended_area_list))
                set_reader_buzzer = ReaderBuzzer_Model()
                set_reader_buzzer.buzzerControl = EBuzzerControl.ReaderControl
                if self.reader.paramSet(EReaderEnum.RW_ReaderBuzzerSwitch, set_reader_buzzer) == EReaderResult.RT_OK:
                    self.logger.logInfo('Set the reader buzzer tone successfully!\n --------')
                else:
                    self.logger.logInfo('Set the reader buzzer tone failed!')
                self.is_running=True
                self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',True)
                return True
            else:
                self.logger.logInfo("Failed to create connection!")
                self.reader=None
                self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)
                return False
        except Exception as e:
            self.reader=None
            self.logger.logError(f"Exception {self.classname} setup_reader: {str(e)}")
            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)

    def decode_tag(self,tag):
        try:
            if tag._EPC not in self.processed_epcs:
                self.processed_epcs[tag._EPC] = datetime.now()
                self.tagDetails["ReaderName"]=tag._ReaderName
                self.tagDetails["EPC"]=tag._EPC
                if hasattr(tag, '_TID'):
                    self.tagDetails["TID"]=tag._TID
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
                    self.tagDetails={"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":0,"Plate":"XXXXXXXXXX"}
                    self.presence_loop_status=False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} decode_tag: {str(e)}")
        
        
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
                    self.tagDetails={"SystemDateTime":datetime.now(),"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":0,"Plate":"XXXXXXXXXX","Processed":False}    
                    
                    while self.is_running:
                        if not self.is_active or self.is_stopped or not self.is_running:
                            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"],'ConnectionStatus',False)
                            self.reader=None
                            self.processed_epcs={}
                            break
                        self.processed_epcs = {epc: timestamp for epc, timestamp in self.processed_epcs.items() if datetime.now() - timestamp <= timedelta(seconds=self.CLEANUP_INTERVAL)}
                        read_list = []
                        self.reader.read(100, read_list)
                        for tag in set(read_list):
                            if self.presence_loop_required==False:
                                self.decode_tag(tag)
                            else:
                                if self.presence_loop_status:
                                    self.decode_tag(tag)


                            
                        self.check_status()
                    self.check_status()
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} rfid_run: {str(e)}")
    
    def update_presence_loop_status(self, status):
        self.presence_loop_status=status


    def decrypt_user_data(self,user_data):
        try:
            self.tagDetails["UserData"]=user_data
            self.tagDetails["Class"]= self.convert_hex_to_int(user_data[24:26])
            self.tagDetails["Plate"]=self.hex_to_string_vehicle_number(user_data[4:24])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} decrypt_user_data: {str(e)}")

    def hex_to_string_vehicle_number(self,hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} hex_to_string_vehicle_number: {str(e)}")
                result='XXXXXXXXXX'
        finally:
            return result
    
    def convert_hex_to_int(self,hex_string):
        result='00'
        try:
            result=str(int(hex_string, 16))
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} convert_hex_to_int: {str(e)}")
                result='00'
        finally:
            return result
        
    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def check_status(self):
        try:
            if self.is_active==False and self.is_stopped==False:
                self.is_active=self.handler.get_on_line_status(self.rfid_detail['EquipmentTypeId'])
                if self.is_active==0:
                    self.is_active=False
                elif self.is_active==1:
                    self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} check_status: {str(e)}")

    def client_stop(self):
        try:
            self.is_running = False
            if self.reader:
                self.reader.stop()
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
            self.is_active=False
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} stop: {str(e)}")