from ping3 import ping
from scapy.all import IP, ICMP, sr1
import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger

class PingThread(threading.Thread):
    def __init__(self, handler, default_directory,log_file_name, interval=10):
        threading.Thread.__init__(self)
        self.handler = handler
        self.interval = interval
        self.is_running = False
        self.set_logger(default_directory,log_file_name)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="PingThread"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")
    

    def ping_equipment(self, ip_address):
        try:
            result = ping(ip_address, timeout=1)
            return result is not None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ping_equipment: {str(e)}")
            return False
        
    def ping_equipment_scapy(self, ip_address):
        try:
            packet = IP(dst=ip_address)/ICMP()
            response = sr1(packet, timeout=2, verbose=False)
            if response:
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ping_equipment_scapy: {str(e)}")

    def run(self):
        try:
            self.is_running = True
            last_call_time = time.time()-80
            while self.is_running:
                current_time = time.time()
                if current_time - last_call_time >= self.interval:
                    if self.handler.equipment_list is not None:
                        for equipment in self.handler.equipment_list:
                            if equipment["OnLineStatus"]==0:
                                equipment["OnLineStatus"]=False
                            else:
                                equipment["OnLineStatus"]=True
                            ip_address = equipment.get('IpAddress')
                            if Utilities.is_valid_ipv4(ip_address):
                                if equipment["OnLineStatus"]!=self.ping_equipment(ip_address):
                                    equipment["OnLineStatus"]=self.ping_equipment(ip_address)
                                    self.handler.update_equipment_Status(equipment)
                                time.sleep(0.1)
                    last_call_time = current_time
                time.sleep(0.1)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run: {str(e)}")

    def stop(self):
        self.is_running = False