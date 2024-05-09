import threading
import time
from com.rfid.Reader import *
from com.rfid.enumeration import *
from com.rfid.interface import *
from com.rfid.models import *
from utils.constants import Utilities
from utils.log_master import CustomLogger
from pubsub import pub

class MantraRfidReader(threading.Thread):
    def __init__(self,_handler,default_directory, rfid_detail, log_file_name, timeout=0.100):
        threading.Thread.__init__(self)
        self.handler = _handler
        self.rfid_detail = rfid_detail
        self.timeout = timeout
        self.connection_string = f"{self.rfid_detail['ProtocolTypeName']}:{self.rfid_detail['IpAddress']}:{self.rfid_detail['PortNumber']}"
        self.reader = None
        self.is_running=False
        self.is_stopped = False
        self.CLEANUP_INTERVAL = 60
        self.set_logger(default_directory,log_file_name)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="LESyn"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def setup_reader(self):
        try:
            self.reader = Reader()
            if self.reader.initReader(self.connection_string):
                self.logger.logInfo(self.reader)
                reader_ant_plan = ReaderWorkingAntSet_Model([1])
                self.logger.logInfo(f'Setting up the working antenna result: {self.reader.paramSet(EReaderEnum.WO_RFIDWorkingAnt, reader_ant_plan)}')
                read_tid = ReadExtendedArea_Model(EReadBank.TID, 0, 6, "")
                #readUserData = ReadExtendedArea_Model(EReadBank.UserData, 0, 6, '')
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
                return True
            else:
                self.logger.logInfo("Failed to create connection!")
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} setup_reader: {str(e)}")
        
    def run(self):
        processed_epcs = {}  # Initialize a dictionary to store processed EPCs and their timestamps
        last_cleanup_time = time.time()  # Initialize the last cleanup time
        while not self.is_stopped:
            try:
                if self.reader is None:
                    self.is_running=self.setup_reader()
                else:
                    self.is_running=True
                self.tagDetails={"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":'00',"Plate":"XXXXXXXXXX"}    
                current_time = time.time()
                if current_time - last_cleanup_time >= self.CLEANUP_INTERVAL:
                    processed_epcs = {epc: timestamp for epc, timestamp in processed_epcs.items()
                                      if current_time - timestamp <= 60}
                    last_cleanup_time = current_time  # Update the last cleanup time
                while self.is_running:
                    read_list = []
                    self.reader.read(100, read_list)
                    for tag in set(read_list):
                        if tag._EPC not in processed_epcs:
                            processed_epcs[tag._EPC] = current_time
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
                                self.tagDetails["Class"]="00"
                                self.tagDetails["Plate"]="XXXXXXXXXX"
                            if self.tagDetails["Class"]!="00":
                                self.tagDetails["TransactionDateTime"]=Utilities.current_date_time_json()
                                pub.sendMessage("rfid_processed", transactionInfo=self.tagDetails)
                                self.tagDetails={"TransactionDateTime":"","ReaderName":"","EPC":"","TID":"","UserData":"","Class":'00',"Plate":"XXXXXXXXXX"}
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} rfid_run: {str(e)}")
            finally:
                self.client_stop()

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
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} stop: {str(e)}")