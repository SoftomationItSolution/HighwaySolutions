import socket
import serial
import time
from utils.log_master import CustomLogger

class KistUFDClient():
    def __init__(self,_handler,default_directory,log_file_name,_ufd_detail,timeout=0.100):
        self.handler=_handler
        self.ufd_detail=_ufd_detail
        self.timeout=timeout
        self.client_socket=None
        self.set_logger(default_directory,log_file_name)
        self.set_status()
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="KistUFDClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.ufd_detail["OnLineStatus"]==0 or self.ufd_detail["OnLineStatus"]==False:
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_status: {str(e)}")

    def send_data(self,input):
        try:
            input=input+'\r\n'
            bytes_data = input.encode('ascii')
            if self.ufd_detail["ProtocolTypeId"]==1:
               return self.on_tcp(bytes_data)
            elif self.ufd_detail["ProtocolTypeId"]==3:
                self.on_serial(bytes_data)
                return True
            else:
                return False
                  
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} send_data: {str(e)}")
            return False
    
    def on_tcp(self, bytes_data):
        result=False
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.ufd_detail["IpAddress"], self.ufd_detail["PortNumber"]))
            self.handler.update_equipment_list(self.ufd_detail["EquipmentId"],'ConnectionStatus',True)
            self.client_socket.sendall(bytes_data)
            time.sleep(self.timeout)
            self.tcp_close()
            result=True
        except Exception as e:
            self.handler.update_equipment_list(self.ufd_detail["EquipmentId"],'ConnectionStatus',False)
            self.logger.logError(f"Exception {self.classname} on_tcp: {str(e)}")
        finally:
            return result
            
            

    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def tcp_close(self):
        try:
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_tcp (closing): {str(e)}")
    

    def on_serial(self,bytes_data):
        try:
            self.client_socket = serial.Serial(timeout=0.200)
            self.client_socket.baudrate = self.ufd_detail["IpAddress"]
            self.client_socket.port = self.ufd_detail["PortNumber"]
            self.client_socket.open()
            self.is_running = True
            self.client_socket.write(bytes_data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_serial: {str(e)}")
        finally:
            self.serial_close()
    
    def serial_close(self):
        try:
            if self.client_socket:
                if self.client_socket.is_open:
                    self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_serial (closing): {str(e)}")
   

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

