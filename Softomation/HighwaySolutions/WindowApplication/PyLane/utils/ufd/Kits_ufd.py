import socket
from utils.log_master import CustomLogger

class KistUFDClient():
    def __init__(self,_handler,config_manager,_ufd_detail,log_file_name,timeout=0.5):
        self.handler=_handler
        self.ufd_detail=_ufd_detail
        self.timeout=timeout
        self.logger = CustomLogger(config_manager,log_file_name)
        self.client_socket=None
        
    def send_data(self,input):
        try:
            input=input+'\r\n'
            bytes_data = input.encode('ascii')
            if self.ufd_detail["ProtocolTypeId"]==1:
                self.on_tcp(bytes_data)       
            return True
        except Exception as e:
            self.logger.logError("Exception send_data: {}".format(str(e)))
            return False
    
    def on_tcp(self, bytes_data):
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client_socket.connect((self.ufd_detail["IpAddress"], self.ufd_detail["PortNumber"]))
        self.client_socket.sendall(bytes_data)
        self.client_socket.close()

    def clear_cmd(self):
        self.send_data("CT")
        self.send_data("CB")


    def go_cmd(self):
        self.send_data("GO")

    def stop_cmd(self):
        self.send_data("NO")

    def default_cmd(self,message):
        self.send_data(f"DF{message}")

    def l1_cmd(self,message):
        self.send_data(f"L1{message}")

    def l2_cmd(self,message):
        self.send_data(f"L2{message}")

    def l1s_cmd(self,message):
        self.send_data(f"S1{message}")

    def l2s_cmd(self,message):
        self.send_data(f"S2{message}")

