import socket
import time
from utils.log_master import CustomLogger

class KistUFDClient():
    def __init__(self,_handler,default_directory,log_file_name,_ufd_detail,timeout=0.100):
        self.handler=_handler
        self.ufd_detail=_ufd_detail
        self.timeout=timeout
        self.client_socket=None
        self.set_logger(default_directory,log_file_name)
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="KistUFDClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def send_data(self,input):
        try:
            input=input+'\r\n'
            bytes_data = input.encode('ascii')
            if self.ufd_detail["ProtocolTypeId"]==1:
                self.on_tcp(bytes_data) 
            time.sleep(self.timeout)      
            return True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} send_data: {str(e)}")
            return False
    
    def on_tcp(self, bytes_data):
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.ufd_detail["IpAddress"], self.ufd_detail["PortNumber"]))
            self.client_socket.sendall(bytes_data)
            self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_tcp: {str(e)}")

    def clear_cmd(self):
        self.send_data("CT")
        self.send_data("CB")

    def go_cmd(self):
        self.send_data("GO")

    def stop_cmd(self):
        self.send_data("NO")

    def default_cmd(self,message):
        self.send_data(f"CD{message}")

    def single_line_cmd(self,message):
        self.send_data(f"S1{message}")

    def l1_cmd(self,message):
        self.send_data(f"L1{message}")

    def l2_cmd(self,message):
        self.send_data(f"L2{message}")

    def l1s_cmd(self,message):
        self.send_data(f"S1{message}")

    def l2s_cmd(self,message):
        self.send_data(f"S2{message}")

