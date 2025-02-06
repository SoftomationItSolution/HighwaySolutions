from datetime import datetime, timedelta
import threading
import time
from com.rfid.Reader import *
from com.rfid.enumeration import *
from com.rfid.interface import *
from com.rfid.models import *
from utils.constants import Utilities


class MantraRfidReaderTest(threading.Thread):
    def __init__(self,rfid_detail,timeout=0.100):
        threading.Thread.__init__(self)
        self.rfid_detail = rfid_detail
        self.presence_loop_status=False
        self.timeout = timeout
        self.connection_string = f"TCP:{self.rfid_detail['IpAddress']}:{self.rfid_detail['PortNumber']}"
        self.reader = None
        self.is_running=False
        self.is_stopped = False
        self.CLEANUP_INTERVAL = 30
        self.processed_epcs={}
        self.is_active=True

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
                    print('Set the reader buzzer tone successfully!\n --------')
                else:
                    print('Set the reader buzzer tone failed!')
                self.is_running=True
                return True
            else:
                print("Failed to create connection!")
                self.reader=None
                return False
        except Exception as e:
            self.reader=None
            print(f"Exception setup_reader: {str(e)}")


    def check_reader(self):
        setReaderBuzzer = ReaderBuzzer_Model()
        setReaderBuzzer.buzzerControl = EBuzzerControl.ReaderControl
        if self.reader.paramSet(EReaderEnum.RW_ReaderBuzzerSwitch, setReaderBuzzer) != EReaderResult.RT_OK:
            self.is_active=True
            self.client_stop()
            return False
        else:
            return True
           

    def decode_tag(self,tag):
        try:
            if tag._EPC not in self.processed_epcs:
                self.processed_epcs[tag._EPC] = datetime.now()
                self.tagDetails["ReaderName"]=tag._ReaderName
                self.tagDetails["EPC"]=tag._EPC
                print(f"Tag EPC: {str(tag._EPC)}")
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
                    print(self.tagDetails)
                    self.tagDetails={"TagReadById":1,"SystemDateTime":datetime.now(),"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":0,"Plate":"XXXXXXXXXX","Processed":False}
                    self.presence_loop_status=False
        except Exception as e:
            print(f"Exception decode_tag: {str(e)}")
        
        
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
                        #self.processed_epcs = {epc: timestamp for epc, timestamp in self.processed_epcs.items() if datetime.now() - timestamp <= timedelta(seconds=self.CLEANUP_INTERVAL)}
                        if self.check_reader()==False:
                            break
                        read_list = []
                        self.reader.read(500, read_list)
                        for tag in set(read_list):
                            print(tag._EPC)
                            print("EPC:",tag._EPC)
                            if hasattr(tag, '_TID'):
                                print("TID:",Utilities.handle_tag_id(tag._TID))
                            if hasattr(tag, '_UserData'):
                                clsId,plate=self.decrypt_user_data(tag._UserData)
                                print("Class id:",clsId)
                                print("Plate:",plate)
                            time.sleep(self.timeout)
                        time.sleep(self.timeout)
                time.sleep(self.timeout)
            except Exception as e:
                print(f"Exception rfid_run: {str(e)}")
    
    def update_presence_loop_status(self, status):
        self.presence_loop_status=status


    def decrypt_user_data(self,user_data):
        try:
            classId=self.convert_hex_to_int(user_data[24:26])
            plateNumber=self.hex_to_string_vehicle_number(user_data[4:24])
            return classId,plateNumber
        except Exception as e:
            print(f"Exception decrypt_user_data: {str(e)}")
            return "0","XXXXXXXXXX"

    def hex_to_string_vehicle_number(self,hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
                print(f"Exception hex_to_string_vehicle_number: {str(e)}")
                result='XXXXXXXXXX'
        finally:
            return result
    
    def convert_hex_to_int(self,hex_string):
        result='00'
        try:
            result=str(int(hex_string, 16))
        except Exception as e:
                print(f"Exception convert_hex_to_int: {str(e)}")
                result='00'
        finally:
            return result
        
   
   

    def client_stop(self):
        try:
            self.is_running = False
            if self.reader:
                self.reader.stop()
                self.reader=None
        except Exception as e:
                print(f"Exception client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
            self.is_active=False
        except Exception as e:
                print(f"Exception stop: {str(e)}")