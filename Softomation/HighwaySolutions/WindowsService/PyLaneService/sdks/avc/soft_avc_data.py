from datetime import datetime
from multiprocessing import Queue
import os
import socket
import threading
import time
from database.lane_manager import LaneManager
from log.log_master import CustomLogger
from utils.constants import Utilities

class STPLAVCDataClient(threading.Thread):
    def __init__(self,_handler,default_directory,dbConnectionObj,LaneId,avc_detail,log_file_name,timeout=0.100):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dbConnectionObj=dbConnectionObj
        self.LaneId=LaneId
        self.avc_detail=avc_detail
        self.timeout=timeout
        self.client_socket=None
        self.is_running=False
        self.is_running_temp=True
        self.is_stopped = False
        self.last_event_date=datetime.now()
        self.last_event_check=False
        self.temp_tread=None
        self.lane_dataqueue = Queue()
        self.set_logger(default_directory,log_file_name)
        self.set_avc_image_path(default_directory)
        self.set_status()
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.avc_detail["OnLineStatus"]==0 or self.avc_detail["OnLineStatus"]==False:
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception set_status: {str(e)}")

    def set_avc_image_path(self,default_directory):
        try:
            self.image_path=os.path.join(default_directory, 'Events', 'avc')
            Utilities.make_dir(self.image_path)
        except Exception as e:
            self.logger.logError(f"Exception set_avc_image_path: {str(e)}")

    def create_temp_thread(self):
        self.temp_tread = threading.Thread(target=self.check_server_live)
        self.temp_tread.daemon=True
        self.temp_tread.start()

    def check_server_live(self):
        while self.is_running_temp:
            try:
                while self.last_event_check:
                    time_difference_seconds = (datetime.now() - self.last_event_date).total_seconds()
                    if time_difference_seconds>1:
                        self.client_stop()
            except Exception as e:
                self.logger.logError(f"Exception check_server_live: {str(e)}")
            finally:
                time.sleep(0.100)


    def prcess_avc_event(self,data):
        try:
            current_date_time=datetime.now()
            SystemDateTime=data["SystemDateTime"]
            if SystemDateTime is None:
                SystemDateTime=current_date_time.isoformat()
                self.logger.logInfo(f"No System Date time process_data: {str(data)}")
            else:
                current_date_time=datetime.fromisoformat(SystemDateTime)
            LaneTransactionId =self.get_laneTransaction_id(current_date_time)
            transactionInfo = {
                'LaneId':self.LaneId,
                'SystemDateTime':SystemDateTime,
                'TransactionDateTime':Utilities.current_date_time_json(dt=current_date_time),
                'AvcSensorClassId':data["AvcClassId"],
                'AvcClassId': data["AvcClassId"],
                'AvcClassName': data["AvcClassName"],
                'AxleCount': data["AxleCount"],
                'IsReverseDirection': False,
                'WheelBase': 0,
                'TransactionCount': 0,
                'ImageName':data["AvcImageName"],
                'LaneTransactionId':LaneTransactionId,
                "Processed":False}
            if transactionInfo['IsReverseDirection']==False:
                self.handler.update_avc_data(transactionInfo)
            self.process_db(transactionInfo)
        except Exception as e:
            raise e

    def process_data(self, data):
        try:
            data=Utilities.is_valid_json(data)
            if data !=False:
                self.last_event_date=datetime.now()
                if data["type"]=="data":
                    self.prcess_avc_event(data=data)
        except Exception as e:
            self.logger.logError(f"Exception process_data: {str(e)}")
    
    def process_db(self, transactionInfo):
        try:
            LaneManager.avc_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception process_db: {str(e)}")

    def put_lane_data_q(self,LaneTransactionId,TransactionDateTime):
        try:
            x={"LaneTransactionId":LaneTransactionId,"TransactionDateTime":TransactionDateTime}
            self.lane_dataqueue.put(x)
        except Exception as e:
            self.logger.logError(f"Exception put_lane_data_q: {str(e)}")

    def get_laneTransaction_id(self, current_date_time):
        LaneTransactionId = ''
        try:
            while not self.lane_dataqueue.empty():
                data = self.lane_dataqueue.get()
                if 'TransactionDateTime' not in data:
                    self.logger.logError("TransactionDateTime key missing in data")
                    continue
                td = Utilities.difference_in_seconds(data['TransactionDateTime'], current_date_time)
                ldi=data['LaneTransactionId']
                self.logger.logInfo(f"TransactionDateTime diff is {td} for {ldi}")
                if td <= 10 and td >= 0:
                    LaneTransactionId = data.get('LaneTransactionId', '')
                    break
        except Exception as e:
            self.logger.logError(f"Exception in get_laneTransaction_id: {str(e)}")
        finally:
            return LaneTransactionId

    def clean_queue(self):
        try:
            while not self.lane_dataqueue.empty():
                self.lane_dataqueue.get()
        except Exception as e:
            self.logger.logError(f"Exception clean_queue: {str(e)}")

    def run(self):
        while not self.is_stopped:
            try:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect(('127.0.0.1', 4224))
                self.handler.update_equipment_list(self.avc_detail["EquipmentId"],'ConnectionStatus',True)
                self.is_running = True
                self.last_event_check=True
                while self.is_running:
                    if self.is_stopped or not self.is_running:
                        self.handler.update_equipment_list(self.avc_detail["EquipmentId"],'ConnectionStatus',False)
                        break
                    echoed_transaction_number = self.client_socket.recv(50240).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        self.process_data(echoed_transaction_number)
                    time.sleep(self.timeout)
            except ConnectionRefusedError:
                self.logger.logError(f"Connection refused. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception avc_run: {str(e)}")
            finally:
                self.client_stop()

    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def client_stop(self):
        try:
            self.is_running = False
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception client_stop: {str(e)}")
        finally:
            self.last_event_check=False

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
            self.is_running_temp=False
            if self.temp_tread is not None:
                self.temp_tread.join()
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")