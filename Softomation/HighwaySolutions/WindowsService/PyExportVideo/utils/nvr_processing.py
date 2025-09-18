import threading
import time
from utils.log_master import CustomLogger
from utils.ms_sql import MSSQLConnectionManager
from utils.take_snapshot import LpicThread
from utils.take_video import IcThread

class NvrProcessing(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj:MSSQLConnectionManager):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.is_running = True
        self.lpic_thread = None
        self.Ic_thread = None
        self.nvr_ip = '192.168.10.220'
        self.username = 'admin'
        self.password = 'aipl@123'
        self.set_logger(default_directory,"nvr_export_app")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    
    def start_lpic(self):
        try:
            if self.lpic_thread is None:
                self.lpic_thread = LpicThread(self.default_directory,self.dbConnectionObj)
                self.lpic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception in start_lpic_thread: {str(e)}")

    def stop_lpic(self):
        try:
            if self.lpic_thread:
                self.lpic_thread.stop() 
        except Exception as e:
            self.logger.logError(f"Exception in stop_lpic_thread: {str(e)}")

    def start_ic(self):
        try:
            if self.Ic_thread is None:
                self.Ic_thread = IcThread(self.default_directory,self.dbConnectionObj)
                self.Ic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception in start_ic: {str(e)}")

    def stop_ic(self):
        try:
            if self.Ic_thread:
                self.Ic_thread.stop() 
        except Exception as e:
            self.logger.logError(f"Exception in stop_ic: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.start_lpic()
                time.sleep(0.100) 
                self.start_ic()
            except Exception as e:
                self.logger.logError(f"Exception NvrProcessing.run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def on_stop(self):
        try:
            self.stop_lpic()
            time.sleep(0.100) 
            self.start_ic()
        except Exception as e:
            self.logger.logError(f"Exception NvrProcessing.on_stop: {str(e)}")