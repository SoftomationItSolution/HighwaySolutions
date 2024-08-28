import platform
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
        self.set_serial_port()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="KistUFDClient"
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
                    #comportid=int((self.comport.replace("COM", "")))
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
        self.send_data("CT")
        time.sleep(0.1)
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

    def welcomeMessage(self,message):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"S1{message}")

    def thanksMessage(self):
        self.clear_cmd()
        time.sleep(0.1)
        self.go_cmd()
        time.sleep(0.1)
        self.send_data(f"S1VISIT AGAIN THANK YOU")
        time.sleep(0.1)

    def other_trans(self,className,type,fare):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"L1{className} {fare}")
        time.sleep(0.1)
        self.send_data(f"L2{type}")
        time.sleep(0.1)

    def fast_trans(self,className,status):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"L1{className}")
        time.sleep(0.1)
        self.send_data(f"L2{status}")
        time.sleep(0.1)