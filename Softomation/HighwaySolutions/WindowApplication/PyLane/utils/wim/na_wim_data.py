import socket
import threading
import time
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from pubsub import pub

class NAWinDataClient(threading.Thread):
    def __init__(self,_handler,default_directory,dbConnectionObj,LaneId,wim_detail,log_file_name,timeout=0.5):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dbConnectionObj=dbConnectionObj
        self.LaneId=LaneId
        self.wim_detail=wim_detail
        self.timeout=timeout
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket=None
        self.is_running=False
        self.is_stopped=False
        self.set_logger(default_directory,log_file_name)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="NAWinClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def process_data(self, data):
        try:
            data = data.split('\r\n')
            for d in data:
                d = d.strip()
                if d.startswith('#'):
                    self.process_axel_data(d)
                elif d.startswith('Total Weight'):
                    self.process_total_weight(d)
                elif d.isdigit():
                    self.process_transaction_id(d)
                elif d == 'Done':
                    self.process_transaction_info()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_data: {str(e)}")
    
    def process_axel_data(self, axel_data_str):
        try:
            axel = axel_data_str.split(',')
            if len(axel) == 4:
                x = {'AxleNumber': axel[0].replace('#', '').strip(),
                    'AxleWeight': axel[1].replace('w', '').strip(),
                    'Speed': axel[2].replace('s', '').strip(),
                    'AxleDistance': axel[3].replace('d', '').strip()}
            else:
                x = axel_data_str.replace('#', '')
            self.axleData.append(x)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_axel_data: {str(e)}")

    def process_total_weight(self, total_weight_str):
        try:
            self.totalWeight = total_weight_str.split('=')[1].strip()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_total_weight: {str(e)}")

    def process_transaction_id(self, transaction_id_str):
        try:
            self.transactionId = transaction_id_str
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_transaction_id: {str(e)}")

    def process_transaction_info(self):
        try:
            transactionInfo = {
                "LaneId":self.LaneId,
                "TransactionDateTime":Utilities.current_date_time_json(),
                "AxleData": self.axleData,
                "TotalWeight": self.totalWeight,
                "TransactionId": self.transactionId,
                'AxleCount': 0 if self.axleData is None else len(self.axleData),
                'IsReverseDirection':False
            }
            pub.sendMessage("wim_processed", transactionInfo=transactionInfo)
            self.process_db(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_transaction_info: {str(e)}")

    def process_db(self, transactionInfo):
        try:
            LaneManager.wim_data_insert(self.dbConnectionObj,transactionInfo)
            if transactionInfo["axleData"] is not None:
                for d in transactionInfo["axleData"]:
                    d["TransactionId"] = transactionInfo["TransactionId"]
                    d["LaneId"] = transactionInfo["LaneId"]
                    LaneManager.wim_details_data_insert(self.dbConnectionObj,d)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_db: {str(e)}")
        finally:
            self.axleData = []
            self.totalWeight = None
            self.transactionId = None

    def run(self):
        while not self.is_stopped:
            try:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.settimeout(0.200)
                self.client_socket.connect((self.wim_detail["IpAddress"], self.wim_detail["PortNumber"]))
                self.client_socket.send("ACK\r\n".encode('utf-8'))
                self.is_running=True
                while self.is_running:
                    echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        self.logger.logInfo("wim data: {}".format(echoed_transaction_number))
                        self.process_data(echoed_transaction_number)
                        self.client_socket.send("ACK\r\n".encode('utf-8'))
                    time.sleep(self.timeout)
            except ConnectionRefusedError:
                self.logger.logError(f"Connection refused {self.classname}. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} wim_data_run: {str(e)}")
            finally:
                self.client_stop()

    def client_stop(self):
        try:
            self.is_running = False
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop: {str(e)}")