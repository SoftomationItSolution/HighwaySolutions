import threading
import socket
from datetime import datetime
from utils.constants import Utilities
from pubsub import pub
from utils.log_master import CustomLogger

class WimSocktConnect(threading.Thread):
    def __init__(self,default_directory, server_ip, server_port):
        threading.Thread.__init__(self)
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket = None
        self.is_running = False
        self.is_stopped = False
        self.server_ip = server_ip
        self.server_port = server_port
        self.connection = None
        self.logger = CustomLogger(default_directory, 'swb_app')

    def run(self):
        self.connect(self.server_ip, self.server_port)
        self.is_running = True
        while self.is_running and not self.is_stopped:
            self.receive_data()

    def connect(self, server_ip, server_port):
        try:
            self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.connection.connect((server_ip, server_port))
            self.logger.logInfo(f"Connected to {server_ip}:{server_port}")
            pub.sendMessage("wim_status", transactionInfo=True)
        except Exception as e:
            self.logger.logError(f"Connection error: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def send_data(self, data):
        try:
            if self.connection:
                self.connection.send(data)
        except Exception as e:
            self.logger.logError(f"Send data error: {e}")

    def receive_data(self):
        try:
            echoed_transaction_number = self.connection.recv(1024).decode('utf-8').strip()
            if len(echoed_transaction_number) != 0:
                if (echoed_transaction_number.startswith('F') or echoed_transaction_number.startswith('R')) and echoed_transaction_number.endswith('E'):
                    self.process_data(echoed_transaction_number)
                else:
                    if echoed_transaction_number.endswith('E'):
                        con_data += echoed_transaction_number
                        self.process_data(con_data)
                        con_data = ''
                    else:
                        con_data += echoed_transaction_number
        except Exception as e:
            self.logger.logError(f"Exception in receive_data: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def process_data(self, indata):
        try:
            axcelData = ''
            data = indata.split(',')
            x = {"IsReverseDirection": False, "AxleCount": 0, "TotalWeight": 0}
            if data is not None:
                for index, item in enumerate(data):
                    val = item.strip()
                    if index == 0:
                        x["IsReverseDirection"] = False if val == 'F' else True
                    elif index == 1:
                        pass
                    elif index == 2:
                        x["AxleCount"] = int(val)
                    elif index == 3:
                        x["TotalWeight"] = int(val)
                    else:
                        if axcelData == '':
                            axcelData = val
                        else:
                            if val != 'E':
                                axcelData = f"{axcelData},{val}"
            self.process_axel_data(axcelData)
            self.process_transaction_info(x)
        except Exception as e:
            self.logger.logError(f"Exception in process_data: {str(e)} data is {indata}")

    def process_axel_data(self, axel_data_str):
        try:
            axel = axel_data_str.split(',')
            avg_speed = int(axel[-1])
            axel = [int(num) for num in axel[:-1]]
            midpoint = len(axel) // 2
            axel_Weight = axel[:midpoint]
            axel_speed = axel[midpoint:]
            for i in range(len(axel_Weight)):
                x = {'AxleNumber': (i+1),
                     'AxleWeight': axel_Weight[i],
                     'Speed': axel_speed[i],
                     'AxleDistance': 0}
                self.axleData.append(x)
        except Exception as e:
            self.logger.logError(f"Exception in process_axel_data: {str(e)}")

    def process_transaction_info(self, d):
        try:
            current_date_time = datetime.now()
            transactionInfo = {
                "SystemDateTime": current_date_time.isoformat(),
                "TransactionDateTime": Utilities.current_date_time_json(dt=current_date_time),
                "AxleData": self.axleData,
                "TotalWeight": d["TotalWeight"],
                'AxleCount': d["AxleCount"],
                'IsReverseDirection': d["IsReverseDirection"],
                "Processed": False
            }
            pub.sendMessage("wim_data", transactionInfo=transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception in process_transaction_info: {str(e)}")

    def dis_connect(self):
        if self.connection:
            self.connection.close()
            self.logger.logInfo("Connection closed")
            pub.sendMessage("wim_status", transactionInfo=False)

    def stop(self):
        self.is_running = False
        self.is_stopped = True
        self.dis_connect()