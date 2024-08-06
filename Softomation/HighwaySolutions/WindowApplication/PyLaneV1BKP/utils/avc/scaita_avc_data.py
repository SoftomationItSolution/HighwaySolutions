from datetime import datetime
import os
import socket
import threading
import time
import asyncio
import websockets
import threading
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class ScaitaAVCDataClient(threading.Thread):
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
        self.uri=None
        self.reconnect_interval=1
        self.loop = asyncio.new_event_loop()
        self.set_logger(default_directory,log_file_name)
        self.set_avc_image_path(default_directory)
        self.set_status()
        asyncio.set_event_loop(self.loop)
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="ScaitaAVC"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.avc_detail["OnLineStatus"]==0 or self.avc_detail["OnLineStatus"]==False:
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_status: {str(e)}")

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
                current_date_time=datetime.now()
                transactionInfo = {
                    'LaneId':self.LaneId,
                    'SystemDateTime':current_date_time.isoformat(),
                    'TransactionDateTime':Utilities.current_date_time_json(dt=current_date_time),
                    'AvcClassId': avc_data[2].strip(),
                    'AxleCount': avc_data[3].strip(),
                    'IsReverseDirection': False if avc_data[4].strip()=='F' else True,
                    'WheelBase': avc_data[5].strip(),
                    'TransactionCount': avc_data[6].strip(),
                    'ImageName':'',
                    "Processed":False}
                self.handler.update_avc_data(transactionInfo)
                self.process_db(transactionInfo)
            else:
                transactionInfo = avc_data_str
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_data: {str(e)}")

    def process_db(self, transactionInfo):
        try:
            LaneManager.avc_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_db: {str(e)}")

    async def connect(self):
        while True:
            try:
                if self.is_active:
                    async with websockets.connect(self.uri) as websocket:
                        await self.receive_data(websocket)
            except (websockets.ConnectionClosed, ConnectionRefusedError) as e:
                self.logger.logError(f"Connection closed or refused, retrying in {self.reconnect_interval} seconds... ({e})")
                await asyncio.sleep(self.timeout)
            finally:
                time.sleep(self.timeout)
                self.check_status()


    async def receive_data(self, websocket):
        while True:
            try:
                data = await websocket.recv()
                self.process_data(data)
            except websockets.ConnectionClosed:
                self.logger.logError("Connection closed")
                break

    def run(self):
        self.loop.run_until_complete(self.connect())
        

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
            self.logger.logError(f"Exception {self.classname} check_status: {str(e)}")

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