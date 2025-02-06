import threading
import time
import os
from app.file_decrypt import SftpDecryptThread
from app.file_download import SftpDownloadThread
from app.file_process import SftpProcessThread
from app.test_getMinDate import SftpGetFileDetailsThread
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class ICdSftpProcessing(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj:MSSQLConnectionManager,db_json_data):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.db_json_data=db_json_data
        self.is_running = True
        self.sftp_download_thread=None
        self.sftp_decrypt_thread=None
        self.sftp_process_thread=None
        self.system_setting=None
        self.icd_sftp_detail=None
        self.set_logger(default_directory,"icd_sftp_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    
    def load_sftp_details(self):
        try:
            cch_api_Path = os.path.join(self.default_directory, 'MasterConfig', 'BankAPIPath.json')
            cch_api_data = Utilities.read_json_file(cch_api_Path)
            self.icd_sftp_detail= cch_api_data["SftpDetails"]
        except Exception as e:
            self.logger.logError(f"Exception load_sftp_details: {str(e)}")
            self.icd_sftp_detail is None

    def start_sftp_download_thread(self):
        try:
            if self.sftp_download_thread is None:
                self.sftp_download_thread=SftpDownloadThread(self.dbConnectionObj,self.icd_sftp_detail,self.default_directory)
                self.sftp_download_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_sftp_download_thread: {str(e)}")
    
    def stop_sftp_download_thread(self):
        try:
            if self.sftp_download_thread:
                self.sftp_download_thread.stop()
                self.sftp_download_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_sftp_download_thread: {str(e)}")

    def start_sftp_decrypt_thread(self):
        try:
            if self.sftp_decrypt_thread is None:
                self.sftp_decrypt_thread=SftpDecryptThread(self.dbConnectionObj,self.icd_sftp_detail,self.default_directory)
                self.sftp_decrypt_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_sftp_decrypt_thread: {str(e)}")
    
    def stop_sftp_decrypt_thread(self):
        try:
            if self.sftp_decrypt_thread:
                self.sftp_decrypt_thread.stop()
                self.sftp_decrypt_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_sftp_decrypt_thread: {str(e)}")

    def start_sftp_process_thread(self):
        try:
            if self.sftp_process_thread is None:
                self.sftp_process_thread=SftpProcessThread(self.dbConnectionObj,self.icd_sftp_detail,self.db_json_data,self.default_directory)
                #self.sftp_process_thread=SftpGetFileDetailsThread(self.dbConnectionObj,self.default_directory)
                self.sftp_process_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_sftp_process_thread: {str(e)}")
    
    def stop_sftp_process_thread(self):
        try:
            if self.sftp_process_thread:
                self.sftp_process_thread.stop()
                self.sftp_process_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_sftp_process_thread: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.load_sftp_details()
                if self.icd_sftp_detail:
                    self.start_sftp_download_thread()
                    time.sleep(0.100)
                    self.start_sftp_decrypt_thread()
                    time.sleep(0.100)
                    self.start_sftp_process_thread()
                    time.sleep(0.100)
            except Exception as e:
                self.logger.logError(f"Exception SftpProcessing.run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def on_stop(self):
        try:
            self.stop_sftp_download_thread()
            time.sleep(0.100)
            self.stop_sftp_decrypt_thread()
            time.sleep(0.100)
            self.stop_sftp_process_thread()
            time.sleep(0.100)
        except Exception as e:
            self.logger.logError(f"Exception SftpProcessing.on_stop: {str(e)}")