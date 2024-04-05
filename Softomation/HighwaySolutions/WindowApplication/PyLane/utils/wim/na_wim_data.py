import socket
import threading
import time
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from pubsub import pub

class NAWinDataClient(threading.Thread):
    def __init__(self,_handler,dbConnectionObj,LaneId,wim_detail,log_file_name,timeout=0.5):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dbConnectionObj=dbConnectionObj
        self.LaneId=LaneId
        self.wim_detail=wim_detail
        self.timeout=timeout
        self.logger = CustomLogger(log_file_name)
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket=None
        self.is_running=False
        self.is_stopped=False


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
            self.logger.logError("Exception occurred during data processing: {}".format(str(e)))
    
    def process_axel_data(self, axel_data_str):
        axel = axel_data_str.split(',')
        if len(axel) == 4:
            x = {'AxleNumber': axel[0].replace('#', '').strip(),
                'AxleWeight': axel[1].replace('w', '').strip(),
                'Speed': axel[2].replace('s', '').strip(),
                'AxleDistance': axel[3].replace('d', '').strip()}
        else:
            x = axel_data_str.replace('#', '')
        self.axleData.append(x)

    def process_total_weight(self, total_weight_str):
        self.totalWeight = total_weight_str.split('=')[1].strip()

    def process_transaction_id(self, transaction_id_str):
        self.transactionId = transaction_id_str

    def process_transaction_info(self):
        transactionInfo = {
            "LaneId":self.LaneId,
            "TransactionDateTime":Utilities.current_date_time_json(),
            "AxleData": self.axleData,
            "TotalWeight": self.totalWeight,
            "TransactionId": self.transactionId,
            'AxleCount': 0 if self.axleData is None else len(self.axleData),
        }
        pub.sendMessage("wim_processed", transactionInfo=transactionInfo)
        self.process_db(transactionInfo)
       

    def process_db(self, transactionInfo):
        try:
            LaneManager.wim_data_insert(self.dbConnectionObj,transactionInfo)
            if transactionInfo["axleData"] is not None:
                for d in transactionInfo["axleData"]:
                    d["TransactionId"] = transactionInfo["TransactionId"]
                    d["LaneId"] = transactionInfo["LaneId"]
                    LaneManager.wim_details_data_insert(self.dbConnectionObj,d)
        except Exception as e:
            self.logger.logError("Exception occurred during wim data processing in db: {}".format(str(e)))
        finally:
            self.axleData = []
            self.totalWeight = None
            self.transactionId = None


    def run(self):
        while not self.is_stopped:
            try:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
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