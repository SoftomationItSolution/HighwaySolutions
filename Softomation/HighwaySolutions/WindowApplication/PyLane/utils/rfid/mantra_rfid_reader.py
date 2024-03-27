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
    def __init__(self,_handler, rfid_detail, log_file_name, timeout=0.5):
        threading.Thread.__init__(self)
        self.handler = _handler
        self.rfid_detail = rfid_detail
        self.timeout = timeout
        self.logger = CustomLogger(log_file_name)
        self.connection_string = f"{self.rfid_detail['ProtocolTypeName']}:{self.rfid_detail['IpAddress']}:{self.rfid_detail['PortNumber']}"
        self.reader = None
        self.is_running=False
        self.is_stopped = False
        self.EPC=""
        self.TID=""
        self.UserData=""

    def setup_reader(self):
        self.reader = Reader()
        if self.reader.initReader(self.connection_string):
            self.logger.logInfo(self.reader)
            reader_ant_plan = ReaderWorkingAntSet_Model([1])
            self.logger.logInfo('Setting up the working antenna result:', self.reader.paramSet(EReaderEnum.WO_RFIDWorkingAnt, reader_ant_plan))
            read_tid = ReadExtendedArea_Model(EReadBank.TID, 0, 6, "")
            read_UserData = ReadExtendedArea_Model(EReadBank.UserData, 0, 7, "")
            read_extended_area_list = [read_tid,read_UserData]
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
        
    def run(self):
        while not self.is_stopped:
            try:
                if self.reader is None:
                    self.is_running=self.setup_reader()
                else:
                    self.is_running=True
                    
                while self.is_running:
                    read_list = []
                    self.reader.read(500, read_list)
                    for tag in read_list:
                        if self.EPC != tag._EPC:
                            if hasattr(tag, '_TID'):
                                self.TID=tag._TID
                            else:
                                self.TID=""
                            
                            if hasattr(tag, '_UserData'):
                                self.UserData=tag._UserData
                            else:
                                self.UserData=""
                            transactionInfo = {
                                "TransactionDateTime":Utilities.current_date_time_json(),
                                "EPC": self.EPC,
                                "TID": self.TID,
                                "UserData": self.UserData}
                            pub.sendMessage("rfid_processed", transactionInfo=transactionInfo)
                    time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError("Exception occurred: {}".format(str(e)))
            finally:
                self.client_stop()

    def client_stop(self):
        self.is_running = False
        if self.reader:
            self.reader.stop()

    def stop(self):
        self.is_stopped = True
        self.client_stop()