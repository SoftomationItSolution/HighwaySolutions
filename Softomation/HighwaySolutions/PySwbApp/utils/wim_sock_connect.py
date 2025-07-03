import threading
import socket
import serial
from datetime import datetime
from utils.constants import Utilities
from pubsub import pub
from utils.log_master import CustomLogger

class WimSocktConnect(threading.Thread):
    def __init__(self,default_directory, plaza_config):
        threading.Thread.__init__(self)
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket = None
        self.is_running = False
        self.is_stopped = False
        self.plaza_config=plaza_config
        self.connection = None
        self.last_payload=''
        self.logger = CustomLogger(default_directory, 'swb_wim_data')

    def run(self):
        conn_type = self.plaza_config.get("type")
        try:
            if conn_type == 'tcp':
                self.tcp_connect(self.plaza_config.get("ip"), self.plaza_config.get("port"))
            elif conn_type == 'serial':
                self.serial_connect(self.plaza_config.get("com_port"), self.plaza_config.get("baudrate"))
            else:
                self.logger.logError(f"Unsupported connection type: {conn_type}")
                return

            self.is_running = True
            while self.is_running and not self.is_stopped:
                self.receive_data()
        except Exception as e:
            self.logger.logError(f"Run error: {e}")
        finally:
            self.dis_connect()

    def serial_connect(self, com_port, baudrate):
        try:
            self.connection = serial.Serial(com_port, baudrate, timeout=1)
            self.logger.logInfo(f"Serial connected to {com_port} at {baudrate} baud.")
            pub.sendMessage("wim_status", transactionInfo=True)
        except Exception as e:
            self.logger.logError(f"Serial connection error: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def tcp_connect(self, ip, port):
        try:
            self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.connection.connect((ip, port))
            self.logger.logInfo(f"TCP connected to {ip}:{port}")
            pub.sendMessage("wim_status", transactionInfo=True)
        except Exception as e:
            self.logger.logError(f"TCP connection error: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def send_data(self, data):
        try:
            if self.connection:
                if isinstance(self.connection, serial.Serial):
                    self.connection.write(data.encode('utf-8'))
                else:
                    self.connection.send(data.encode('utf-8'))
        except Exception as e:
            self.logger.logError(f"Send data error: {e}")

    def receive_data(self):
        try:
            if isinstance(self.connection, serial.Serial):
                raw_bytes = self.connection.readline()
            else:
                raw_bytes = self.connection.recv(1024)
            
            raw = raw_bytes.decode('utf-8', errors='ignore').strip()
            if not raw:
                return
            if raw.startswith('\x02') and raw.endswith('\x03'):
                data = raw[1:-1]
                try:
                    numeric_value = float(data)
                    if self.last_payload != numeric_value:
                        self.last_payload = numeric_value
                        current_date_time = datetime.now()
                        transactionInfo = {
                            "SystemDateTime": current_date_time.isoformat(),
                            "TransactionDateTime": Utilities.current_date_time_json(dt=current_date_time),
                            "TotalWeight": self.last_payload
                        }
                        pub.sendMessage("wim_data", transactionInfo=transactionInfo)
                except ValueError:
                    self.logger.logError(f"[Warning] Invalid numeric payload: {data}")
        except Exception as e:
            self.logger.logError(f"Receive data error: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)
    

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
        try:
            if isinstance(self.connection, serial.Serial):
                self.connection.close()
            elif self.connection:
                self.connection.shutdown(socket.SHUT_RDWR)
                self.connection.close()
            self.logger.logInfo("Connection closed")
            pub.sendMessage("wim_status", transactionInfo=False)
        except Exception as e:
            self.logger.logError(f"Error during disconnect: {e}")

    def stop(self):
        self.is_running = False
        self.is_stopped = True
        self.dis_connect()