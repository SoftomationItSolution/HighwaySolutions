import os
import socket
import threading
import time
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class SagarAVCDataClient(threading.Thread):
    def __init__(self,_handler,default_directory,dbConnectionObj,LaneId,avc_detail,log_file_name,timeout=0.100):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dbConnectionObj=dbConnectionObj
        self.LaneId=LaneId
        self.avc_detail=avc_detail
        self.timeout=timeout
        self.client_socket=None
        self.is_running=False
        self.is_stopped = False
        self.is_active = False
        self.last_trans=None
        self.LaneTransactionId=0
        self.set_logger(default_directory,log_file_name)
        self.set_avc_image_path(default_directory)
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="SagarAVC"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_avc_image_path(self,default_directory):
        try:
            self.image_path=os.path.join(default_directory, 'Events', 'avc')
            Utilities.make_dir(self.image_path)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_avc_image_path: {str(e)}")

    def process_data(self, data):
        try:
            data = data.split('\r\n')
            for d in data:
                d = d.strip()
                if d.startswith("STX") and d.endswith("ETX"):
                    self.process_avc_data(d)
                elif "STX" in d:
                    d = d[d.index("STX"):]
                    if d.endswith("ETX"):
                        self.process_avc_data(d)
                    else:
                        print(d)
                else:
                    print(d)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_data: {str(e)}")
    
    def process_avc_data(self, avc_data_str):
        try:
            avc_data = avc_data_str.split(',')
            if len(avc_data) == 8:
                transactionInfo = {
                    'LaneId':self.LaneId,
                    'TransactionDateTime':Utilities.current_date_time_json(),
                    'AvcClassId': avc_data[2].strip(),
                    'AxleCount': avc_data[3].strip(),
                    'IsReverseDirection': False if avc_data[4].strip()=='F' else True,
                    'WheelBase': avc_data[5].strip(),
                    'TransactionCount': avc_data[6].strip(),
                    'ImageName':''}
                self.last_trans=transactionInfo
                if self.LaneTransactionId!=0:
                    self.update_db_lane_trans(self.LaneTransactionId)
                self.process_db(transactionInfo)
            else:
                transactionInfo = avc_data_str
                print(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_data: {str(e)}")

    def process_db(self, transactionInfo):
        try:
            LaneManager.avc_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_db: {str(e)}")

    def run(self):
        while not self.is_stopped:
            try:
                while self.is_active:
                    self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    self.client_socket.connect((self.avc_detail["IpAddress"], self.avc_detail["PortNumber"]))
                    self.handler.update_equipment_list(self.avc_detail["EquipmentId"],'ConnectionStatus',True)
                    self.is_running = True
                    while self.is_running:
                        if not self.is_active or self.is_stopped or not self.is_running:
                            self.handler.update_equipment_list(self.avc_detail["EquipmentId"],'ConnectionStatus',False)
                            break
                        echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                        if len(echoed_transaction_number) != 0:
                            self.logger.logInfo("avc data: {}".format(echoed_transaction_number))
                            self.process_data(echoed_transaction_number)
                        time.sleep(self.timeout)
                    time.sleep(self.timeout)
            except ConnectionRefusedError:
                self.logger.logError(f"Connection refused {self.classname}. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} avc_run: {str(e)}")
            finally:
                self.client_stop()

    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def getavc(self,TID):
        try:
            if self.last_trans is not None:
                self.update_db_lane_trans(TID)
            else:
                self.LaneTransactionId=TID
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getavc: {str(e)}")

    def update_db_lane_trans(self,LaneTransactionId):
        try:
            d={"LaneTransactionId":LaneTransactionId,"VehicleAvcClassId":self.last_trans["AvcClassId"],"TransactionAvcImage":self.last_trans["ImageName"]}
            self.last_trans=None
            LaneManager.lane_data_avc_update(self.dbConnectionObj,d)
            self.LaneTransactionId=0
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_db_lane_trans: {str(e)}")

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