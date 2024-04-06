import socket
import threading
import time
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from pubsub import pub

class SagarAVCDataClient(threading.Thread):
    def __init__(self,_handler,config_manager,dbConnectionObj,LaneId,avc_detail,log_file_name,timeout=0.5):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dbConnectionObj=dbConnectionObj
        self.LaneId=LaneId
        self.avc_detail=avc_detail
        self.timeout=timeout
        self.logger = CustomLogger(config_manager,log_file_name)
        self.client_socket=None
        self.is_running=False
        self.is_stopped = False

    def process_data(self, data):
        try:
            data = data.split('\r\n')
            for d in data:
                d = d.strip()
                if d.startswith('STX,02'):
                    self.process_avc_data(d)
        except Exception as e:
            self.logger.logError("Exception occurred during data processing: {}".format(str(e)))
    
    def process_avc_data(self, avc_data_str):
        avc_data = avc_data_str.split(',')
        if len(avc_data) == 8:
            transactionInfo = {
                'LaneId':self.LaneId,
                'TransactionDateTime':Utilities.current_date_time_json(),
                'AvcClassId': avc_data[2].strip(),
                'AxleCount': avc_data[3].strip(),
                'IsReverseDirection': False if avc_data[4].strip()=='F' else True,
                'WheelBase': avc_data[5].strip(),
                'TransactionCount': avc_data[6].strip()}
        else:
            transactionInfo = avc_data_str
        pub.sendMessage("avc_processed", transactionInfo=transactionInfo)
        self.process_db(transactionInfo)

    def process_db(self, transactionInfo):
        try:
            LaneManager.avc_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError("Exception occurred during avc data processing: {}".format(str(e)))

    def run(self):
        while not self.is_stopped:
            try:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.avc_detail["IpAddress"], self.avc_detail["PortNumber"]))
                self.is_running = True

                while self.is_running:
                    echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        self.logger.logInfo("avc data: {}".format(echoed_transaction_number))
                        self.process_data(echoed_transaction_number)
                    time.sleep(self.timeout)

            except ConnectionRefusedError:
                self.logger.logInfo("Connection refused. Retrying in {} seconds...".format(self.timeout))
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError("Exception occurred: {}".format(str(e)))
            finally:
                self.client_stop()

    def client_stop(self):
        self.is_running = False
        if self.client_socket:
            self.client_socket.close()

    def stop(self):
        self.is_stopped = True
        self.client_stop()