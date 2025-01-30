import time
import paramiko
import os
import threading
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class SftpDownloadThread(threading.Thread):
    def __init__(self,dbConnectionObj:MSSQLConnectionManager,sftpDetails,default_directory):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.sftpDetails=sftpDetails  
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.encrypt_file_dir=os.path.join(self.output_dir,"Encrypted")
        self.logger = CustomLogger(default_directory, 'icd_sftp_download')
        self.transport=None
        self.sftp=None

    def connect_sftp(self):
        try:
            self.transport = paramiko.Transport((self.sftpDetails["Host"], int(self.sftpDetails["Port"])))
            self.transport.connect(username=self.sftpDetails["Username"], password=self.sftpDetails["Password"])
            self.sftp = paramiko.SFTPClient.from_transport(self.transport)
            self.logger.logInfo(f"sftp connected")
        except Exception as e:
            self.logger.logError(f"Error in connect_sftp: {e}")
            self.transport=None
            self.sftp=None
    
    def get_remote_files(self):
        try:
            remote_files = self.sftp.listdir_attr(self.sftpDetails["RemoteDirectory"]) #asc true for desc
            remote_files.sort(key=lambda x: x.st_mtime)
            return remote_files
        except Exception as e:
            self.logger.logError(f"Error in get_remote_files: {e}")
            self.transport=None
            self.sftp=None
            return None
        
    def get_detail_from_remote_file(self,file,file_date_time):
        try:
            modified_time=Utilities.format_file_date(file.st_mtime)
            file_name=file.filename
            file_size,size_type = Utilities.human_readable_file_size(file.st_size)
            last_file_status={"BltFileName":file_name,"FileDateTime":file_date_time,"ModifiedTime":modified_time,"FileSize":file_size,
                  "FileSizeType":size_type,"IsDownloaded":False,"IsDecrypted":False,"IsProcessed":False}
            return last_file_status
        except Exception as e:
            self.logger.logError(f"Error in get_detail_from_remote_file: {e}")
            return None
    
    def run(self):
        try:
            Utilities.make_dir(self.output_dir)
            Utilities.make_dir(self.encrypt_file_dir)
            while self.flag:
                try:
                    if self.sftp is None:
                        self.connect_sftp()
                    else:
                        remote_files=self.get_remote_files()
                        if remote_files:
                            for file in remote_files:
                                remote_file_path = os.path.join(self.sftpDetails["RemoteDirectory"], file.filename)
                                file_stat = self.sftp.stat(remote_file_path)
                                file_size = file_stat.st_size
                                file_date_time,filetimestamp=Utilities.get_dateTime_fromFile(file.filename)
                                if file_date_time and file_size>0:
                                    last_file_status=self.get_detail_from_remote_file(file,file_date_time)
                                    if last_file_status:
                                        encrypt_file_path = os.path.join(self.encrypt_file_dir, file.filename)
                                        self.logger.logInfo(f"start file downloading: {file.filename}")
                                        self.sftp.get(remote_file_path, encrypt_file_path)
                                        self.logger.logInfo(f"file downloaded: {file.filename}")
                                        last_file_status["IsDownloaded"]=True
                                        last_file_status["IsDecrypted"]=False
                                        self.update_file_status(last_file_status)
                                        self.sftp.remove(remote_file_path)
                                else:
                                    self.logger.logError(f"file time stamp is missing or size is {file_size} : {file.filename}")
                except Exception as e:
                    self.logger.logError(f"Error in process loop: {e}")
                finally:
                    time.sleep(0.100)
        except Exception as e:
            self.logger.logError(f"Error in process in run loop: {e}")
    
    def update_file_status(self,last_file_status):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusInsert",params=[
                last_file_status["BltFileName"],
                last_file_status["FileDateTime"],
                last_file_status["ModifiedTime"],
                last_file_status["FileSize"],
                last_file_status["FileSizeType"],
                last_file_status["IsDownloaded"],
                last_file_status["IsDecrypted"],
                last_file_status["IsProcessed"]
            ])
        except Exception as e:
            self.logger.logError(f"Error in update_file_status: {e}")
            
    def stop(self):
        try:
            self.flag = False
            self.sftp.close()
            self.transport.close()
            self.logger.logInfo("Stopping the Download thread.")
        except Exception as e:
            self.logger.logError(f"Error in on process loop: {e}")