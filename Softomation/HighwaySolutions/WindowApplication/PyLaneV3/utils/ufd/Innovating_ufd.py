import platform
import socket
import serial
import time
from utils.log_master import CustomLogger

class InnovatingUFDClient():
    def __init__(self,_handler,default_directory,log_file_name,_ufd_detail,timeout=0.100):
        self.handler=_handler
        self.ufd_detail=_ufd_detail
        self.timeout=timeout
        self.client_socket=None
        self.set_logger(default_directory,log_file_name)
        self.set_status()
        self.set_serial_port()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="InnovatingUFDClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.ufd_detail["OnLineStatus"]==0 or self.ufd_detail["OnLineStatus"]==False:
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception set_status: {str(e)}")

    def set_serial_port(self):
        try:
            self.ProtocolTypeId=self.ufd_detail["ProtocolTypeId"]
            if self.ProtocolTypeId==3:
                self.baudrate=int(self.ufd_detail["PortNumber"])
                if platform.system() == 'Linux':
                    self.comport=self.ufd_detail["IpAddress"]
                    self.comport=self.comport.replace("COM", "/dev/ttyS")
                else:
                    self.comport=self.ufd_detail["IpAddress"]
        except Exception as e:
            self.logger.logError(f"Exception set_serial_port: {str(e)}")
    
    
    def send_data(self,input):
        try:
            input=input+'\r\n'
            bytes_data = input.encode('ascii')
            if self.ufd_detail["ProtocolTypeId"]==1:
                if self.is_active:
                    self.on_tcp(bytes_data)
                    return True
                else:
                    self.handler.update_equipment_list(self.ufd_detail["EquipmentId"],'ConnectionStatus',False)
            elif self.ufd_detail["ProtocolTypeId"]==3:
                self.on_serial(bytes_data)
                return True
            else:
                return False
                  
        except Exception as e:
            self.logger.logError(f"Exception send_data: {str(e)}")
            return False
    
    def on_tcp(self, bytes_data):
        try:
            if self.handler.get_on_line_status(self.ufd_detail["EquipmentTypeId"]):
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.ufd_detail["IpAddress"], self.ufd_detail["PortNumber"]))
                self.handler.update_equipment_list(self.ufd_detail["EquipmentId"],'ConnectionStatus',True)
                self.client_socket.sendall(bytes_data)
                time.sleep(self.timeout)
                self.tcp_close()
        except Exception as e:
            self.logger.logError(f"Exception on_tcp: {str(e)}")
            

    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def tcp_close(self):
        try:
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception on_tcp (closing): {str(e)}")
    

    def on_serial(self,bytes_data):
        try:
            self.client_socket = serial.Serial(timeout=0.200)
            self.client_socket.baudrate = self.baudrate
            self.client_socket.port = self.comport
            self.client_socket.open()
            self.is_running = True
            self.client_socket.write(bytes_data)
            time.sleep(0.300)
            self.serial_close()
        except Exception as e:
            self.logger.logError(f"Exception on_serial: {str(e)}")
            
    
    def serial_close(self):
        try:
            if self.client_socket:
                if self.client_socket.is_open:
                    self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception on_serial (closing): {str(e)}")
   

    def clear_cmd(self):
        self.send_data("MSSL|SCREEN|CLR|00-00|")

    def go_cmd(self):
        self.send_data("MSSL|ARROW0|GRN|00-00|")

    def stop_cmd(self):
        self.send_data("MSSL|ROUND0|RED|00-00|")

    def welcomeMessage(self,message):
        self.clear_cmd()
        self.stop_cmd()
        self.send_data("MSSL|STATIC|F07|00-40|TOLL")
        self.send_data("MSSL|STATIC|F07|00-48|Plaza")
        self.send_data("MSSL|SCROLL|F07|00-32|Welcome TO")

    def thanksMessage(self):
        self.clear_cmd()
        self.go_cmd()
        self.send_data("MSSL|STATIC|F07|00-32|VISIT")
        self.send_data("MSSL|STATIC|F07|00-40|AGAIN")
        self.send_data("MSSL|STATIC|F07|00-48|THANK")
        self.send_data("MSSL|STATIC|F07|00-56|YOU")

    def other_trans(self,className,type,fare):
        self.clear_cmd()
        self.stop_cmd()
        self.send_data(f"MSSL|STATIC|F07|00-32|{className}")
        self.send_data(f"MSSL|STATIC|F07|00-40|{type}")
        self.send_data(f"MSSL|STATIC|F07|00-48|{fare}")
         

    def fast_trans(self,className,status):
        self.clear_cmd()
        self.stop_cmd()
        self.send_data(f"MSSL|STATIC|F07|00-32|{className}")
        self.send_data(f"MSSL|SCROLL|F07|00-40|{status}")