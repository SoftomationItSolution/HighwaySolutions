import subprocess
import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.ms_sql import MSSQLConnectionManager

class LpicThread(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj:MSSQLConnectionManager):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.flag=True
        self.nvr_ip = '192.168.11.208'
        self.username = 'admin'
        self.password = 'mcube%40123'
        self.media_path='/mnt/TMS/Apps/TMSNodeAPI/EventMedia/LaneData/'
        self.size=['1920x1080','1280x720','640x360','320x240']
        self.set_logger(default_directory,"nvr_export_lpic")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")


    
    def update_status(self,PlazaTransactionId,statusId,file_name):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_LanePendingLPICMediaUpdate",params=[PlazaTransactionId, statusId,file_name])
        except Exception as e:
            self.logger.logError(f"Error send update_status {PlazaTransactionId}: {e}")
    
    
    def get_file(self,PlazaTransactionId,row,file_name,cmd,old_file_path):
        try:
            result=subprocess.run(cmd)
            if result.returncode != 0:
                self.update_status(row["PlazaTransactionId"],2,file_name)
            else:
                self.update_status(row["PlazaTransactionId"],1,file_name)
                Utilities.delete_if_exists(old_file_path)
        except FileNotFoundError:
            self.logger.logError(f"ffmpeg not found. Install it via apt or download manually.{PlazaTransactionId}")
            self.update_status(row["PlazaTransactionId"],2,file_name)
        except subprocess.TimeoutExpired:
            self.logger.logError(f"FFmpeg command timed out.{PlazaTransactionId}")
        except Exception as e:
            self.logger.logError(f"Unexpected error {PlazaTransactionId}:", str(e))
            self.update_status(row["PlazaTransactionId"],2,file_name)
    
    
    def generate_image(self, row):
        try:
            PlazaTransactionId=row['PlazaTransactionId']
            rtsp_url = (f"rtsp://{self.username}:{self.password}@{self.nvr_ip}:554/cam/playback"
            f"?channel={row['LpicChannel']}"
            f"&starttime={Utilities.mssql_to_nvr_format(row['TransactionDateTime'])}"
            f"&endtime={Utilities.mssql_to_nvr_format(row['TransactionDateTime'],10)}")
            file_name=f"{PlazaTransactionId}_1_lpic.jpg"
            if not str(row['TransactionFrontImage']).strip():
                old_file_path = ''
            else:
                old_file_path = f"{self.media_path}{Utilities.mssql_to_date_only(row['TransactionDateTime'])}/{str(row['LaneCode']).replace('ane', '')}/lpic/image/{row['TransactionFrontImage']}"
            file_path = f"{self.media_path}{Utilities.mssql_to_date_only(row['TransactionDateTime'])}/{str(row['LaneCode']).replace('ane', '')}/lpic/image/{file_name}"
            Utilities.delete_if_exists(file_path)
            cmd = [
            "ffmpeg",
            "-analyzeduration", "100M",
            "-probesize", "100M",
            "-i", rtsp_url,
            "-vf", "select=gte(n\\,10)",  # select frame 10
            "-frames:v", "1",
            "-pix_fmt", "yuvj420p",
            "-q:v", "2",
            "-s", str(self.size[1]),  # <-- Set image size here
            file_path
        ]
            self.get_file(PlazaTransactionId,row,file_name,cmd,old_file_path)
        except Exception as e:
            self.update_status(row["PlazaTransactionId"],2,file_name)
            self.logger.logError(f"Error generate_image {row['PlazaTransactionId']}: {e}")
    
    
    def run(self):
        while self.flag:
            try:
                data = self.dbConnectionObj.execute_stored_procedure("USP_LanePendingLPICMediaGet")
                if data:
                    for row in data:
                        self.generate_image(row)
                        time.sleep(0.100)
                time.sleep(0.100)
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")
        
