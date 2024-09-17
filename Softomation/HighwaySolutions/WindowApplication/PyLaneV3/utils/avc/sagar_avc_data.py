from datetime import datetime
from multiprocessing import Queue
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
        self.lane_dataqueue = Queue()
        self.buffer = ""
        self.set_logger(default_directory,log_file_name)
        self.set_avc_image_path(default_directory)
        self.set_status()
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="SagarAVC"
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
    

    def process_db(self, transactionInfo):
        try:
            LaneManager.avc_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception process_db: {str(e)}")

    def append_data(self, data):
        try:
            self.logger.logInfo("avc data: {}".format(data))
            self.buffer += data
            self.process_buffer()
        except Exception as e:
            self.logger.logError(f"Exception append_data: {str(e)}")

    def process_buffer(self):
        try:
            while "STX" in self.buffer and "ETX" in self.buffer:
                start_idx = self.buffer.find("STX")
                end_idx = self.buffer.find("ETX") + len("ETX")
                if start_idx != -1 and end_idx != -1 and start_idx < end_idx:
                    complete_segment = self.buffer[start_idx:end_idx]
                    self.process_segment(complete_segment)
                    self.buffer = self.buffer[end_idx:]
                else:
                    break 
        except Exception as e:
            self.logger.logError(f"Exception process_buffer: {str(e)}")

    def process_segment(self, segment):
        try:
            avc_data=segment.split(',')
            if len(avc_data)==8:
                current_date_time=datetime.now()
                AvcSensorClassId=int(avc_data[2].strip())
                if AvcSensorClassId>0 or AvcSensorClassId<8:
                    AxleCount=int(avc_data[3].strip())
                    IsReverseDirection=False if avc_data[4].strip()=='F' else True
                    LaneTransactionId=''
                    if IsReverseDirection==False:
                        LaneTransactionId =self.get_laneTransaction_id(current_date_time)
                    transactionInfo = {
                        'LaneId':self.LaneId,
                        'SystemDateTime':current_date_time.isoformat(),
                        'TransactionDateTime':Utilities.current_date_time_json(dt=current_date_time),
                        'AvcSensorClassId':AvcSensorClassId,
                        'AvcClassId': self.get_fasttag_class(AvcSensorClassId,AxleCount),
                        'AxleCount': AxleCount,
                        'IsReverseDirection': IsReverseDirection,
                        'WheelBase': int(avc_data[5].strip()),
                        'TransactionCount': int(avc_data[6].strip()),
                        'ImageName':'',
                        'LaneTransactionId':LaneTransactionId,
                        'Processed':False}
                    self.handler.update_avc_data(transactionInfo)
                    self.process_db(transactionInfo)
                else:
                    self.logger.logInfo(f"Wrong data: {segment}")
        except Exception as e:
            self.logger.logError(f"Exception process_segment: {str(e)} data: {segment}")

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
                        data = self.client_socket.recv(1024)
                        decoded_data = data.decode('utf-8').strip()
                        self.append_data(decoded_data)
                        time.sleep(self.timeout)
                    time.sleep(self.timeout)
                    self.check_status()
                self.check_status()
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

    def check_status(self):
        try:
            if self.is_active==False and self.is_stopped==False:
                self.is_active=self.handler.get_on_line_status(self.avc_detail['EquipmentTypeId'])
                if self.is_active==0:
                    self.is_active=False
                elif self.is_active==1:
                    self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception check_status: {str(e)}")

    def client_stop(self):
        try:
            self.is_running = False
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception client_stop: {str(e)}")

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

    def get_fasttag_class(self,classid,axcelCount):
        try:
            classid=int(classid)
            axcelCount=int(axcelCount)
            if classid==1:
                return 4
            elif classid==2:
                return 5
            elif classid==3:
                return 7
            elif classid==5:
                return 11
            elif classid==6:
                if axcelCount==4:
                    return 12
                elif axcelCount==5:
                    return 13
                else:
                    return 14
            elif classid==7:
                return 15
        except Exception as e:
            self.logger.logError(f"Exception get_fasttag_class: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")