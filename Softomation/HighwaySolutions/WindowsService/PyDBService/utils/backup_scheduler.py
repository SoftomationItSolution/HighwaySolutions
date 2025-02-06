from datetime import datetime
import os
import threading
import time
import schedule
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger


class BackupScheduler(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj: MSSQLConnectionManager, logger: CustomLogger):
        super().__init__() 
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.logger = logger
        self.interval_hours = 24
        self.is_running = True
        self.schedule_setup = False
        self.bckup_config = None

    def _setup_schedule(self):
        try:
            schedule.clear() 
            schedule.every(self.interval_hours).hours.do(self.take_backup)
            self.logger.logInfo(f"Backup scheduled every {self.interval_hours} hours.")
            self.schedule_setup=True
            self.take_backup()
        except Exception as e:
            self.logger.logError(f"Exception in _setup_schedule: {str(e)}")
            self.schedule_setup=False

    
    def mssql_process(self,item):
        try:
            conn=Utilities.ms_sql_con(item)
            if conn:
                final_path,backup_file_path,backup_file_name=Utilities.genereate_filepath(self.bckup_config["LocalPath"],item,"bak")
                bkp_done=Utilities.get_ms_sql_bkp(conn,item['DataBaseName'],final_path)
                zip_file_name=backup_file_name.replace("bak","zip")
                zip_filepath=os.path.join(backup_file_path,zip_file_name)
                self.dbConnectionObj.execute_stored_procedure("USP_DBBackUpDetailUpdate",params=[
                    item["DBBackUpDetailId"],bkp_done["LastBackUpDatetime"],
                    bkp_done["LastBackUpSize"],bkp_done["LastBackupFileSize"]
                ])
                Utilities.zip_file(final_path,zip_filepath)
                remote_file_path=os.path.join(self.bckup_config["RemotePath"],item["BackUpPreFix"]) 
                Utilities.upload_on_sftp(self.bckup_config["ServerUrl"], self.bckup_config["ServerPort"], self.bckup_config["Username"], self.bckup_config["Password"], zip_filepath, remote_file_path,zip_file_name)
                os.remove(zip_filepath)
        except Exception as e:
            self.logger.logError(f"Exception in mssql_process: {str(e)}")

    def mysql_process(self,item):
        try:
            final_path,backup_file_path,backup_file_name=Utilities.genereate_filepath(self.bckup_config["LocalPath"],item,"sql")
            bkp_done=Utilities.get_my_sql_bkp(item,final_path)
            zip_file_name=backup_file_name.replace("sql","zip")
            zip_filepath=os.path.join(backup_file_path,zip_file_name)
            self.dbConnectionObj.execute_stored_procedure("USP_DBBackUpDetailUpdate",params=[
                item["DBBackUpDetailId"],bkp_done["LastBackUpDatetime"],
                bkp_done["LastBackUpSize"],bkp_done["LastBackupFileSize"]
            ])
            Utilities.zip_file(final_path,zip_filepath)
            remote_file_path=os.path.join(self.bckup_config["RemotePath"],item["BackUpPreFix"]) 
            Utilities.upload_on_sftp(self.bckup_config["ServerUrl"], self.bckup_config["ServerPort"], self.bckup_config["Username"], self.bckup_config["Password"], zip_filepath, remote_file_path,zip_file_name)
            os.remove(zip_filepath)
        except Exception as e:
            self.logger.logError(f"Exception in mysql_process: {str(e)}")
    
    
    def take_backup(self):
        try:
            self.logger.logInfo("Starting backup process...")
            bckup_details = self.dbConnectionObj.execute_stored_procedure("USP_DBBackUpDetailGetAll", None)           
            for item in bckup_details:
                if item["DataStatus"]==1:
                    if item["DataBaseTypeId"]==1: #MSSQL
                        #self.mssql_process(item)
                        thread = threading.Thread(target=self.mssql_process, args=(item,))
                        thread.start()
                    elif item["DataBaseTypeId"]==2: #MYSQL        
                        #self.mysql_process(item)
                        thread = threading.Thread(target=self.mysql_process, args=(item,))
                        thread.start()
            self.logger.logInfo("Backup completed successfully.")
        except Exception as e:
            self.logger.logError(f"Exception in take_backup: {str(e)}")

    
    def get_schedule_config(self):
        try:
            if self.bckup_config is None:
                self.bckup_config = self.dbConnectionObj.execute_stored_procedure_single("USP_FileUploadDetailGetAll", None)
                if self.bckup_config:
                    self.interval_hours = self.bckup_config["ScheduleHours"]
                    self._setup_schedule()
        except Exception as e:
            self.logger.logError(f"Exception in get_schedule_config: {str(e)}")

    
    def run(self):
        self.logger.logInfo("Backup scheduler started.")
        while self.is_running:
            try:
                self.get_schedule_config()
                if self.schedule_setup==False and self.bckup_config:
                    self._setup_schedule()
                if self.schedule_setup:
                    schedule.run_pending()
            except Exception as e:
                self.logger.logError(f"Exception in BackupScheduler.run: {str(e)}")
            time.sleep(0.100)  

    def on_stop(self):
        try:
            self.is_running = False
            schedule.clear() 
            self.logger.logInfo("Backup scheduler stopped")
        except Exception as e:
            self.logger.logError(f"Exception in BackupScheduler.on_stop: {str(e)}")