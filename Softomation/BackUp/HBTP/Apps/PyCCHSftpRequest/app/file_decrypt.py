from datetime import datetime
import time
import paramiko
import os
import threading
import gnupg
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class SftpDecryptThread(threading.Thread):
    def __init__(self,dbConnectionObj:MSSQLConnectionManager,sftpDetails,default_directory):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.sftpDetails=sftpDetails  
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.download_file_status_path=os.path.join(default_directory, 'MasterConfig','icd_file_status.json')
        self.date_format='%d-%b-%Y %H:%M:%S'
        self.logger = CustomLogger(default_directory, 'icd_sftp')
        self.gpg = gnupg.GPG()
        self.passphrase="Mcube@7890"
        self.transport=None
        self.sftp=None
        self.last_file_status=None
    
    

    def get_last_file(self):
        last_downloaded_timestamp = None
        try:
            last_downloaded_details = Utilities.read_json_file(self.download_file_status_path)
            if last_downloaded_details:
                last_downloaded_timestamp = datetime.strptime(last_downloaded_details.get('last_downloaded_timestamp'), self.date_format).timestamp()
        except Exception as e:
            self.logger.logError(f"Error in get_last_file: {e}")
        finally:
            return last_downloaded_timestamp

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
        
    def decrypt_files(self,encrypted_file_path):
        try:
            file_name = os.path.basename(encrypted_file_path)
            self.logger.logInfo(f"start decrypting: {file_name}")
            decrypted_file_dir=os.path.join(self.output_dir,"Decrypted")
            Utilities.make_dir(decrypted_file_dir)
            local_filename=file_name.replace('.blt.gpg', '.csv')
            decrypted_file_path = os.path.join(decrypted_file_dir, file_name.replace('.blt.gpg', '.csv'))
            with open(encrypted_file_path, 'rb') as encrypted_file:
                decrypted_data = self.gpg.decrypt_file(encrypted_file, passphrase=self.passphrase, output=decrypted_file_path)
                if decrypted_data.ok:
                    os.remove(encrypted_file_path)
                    self.last_file_status["BltFileName"]=local_filename
                    return True
                else:
                    self.logger.logError(f"Failed to decrypt {encrypted_file_path}: {decrypted_data.status}")
                    return False
        except Exception as e:
            self.logger.logError(f"Error occurred during decryption: {e}")
            return False
    
    def get_remote_file(self,file,file_date_time):
        try:
            modified_time=Utilities.format_file_date(file.st_mtime)
            file_name=file.filename
            file_size,size_type = Utilities.human_readable_file_size(file.st_size)
            self.last_file_status={"BltFileName":file_name,"FileDateTime":file_date_time,"ModifiedTime":modified_time,"FileSize":file_size,
                  "FileSizeType":size_type,"IsDownloaded":False,"IsEncrypted":False,"IsProcessed":False}
        except Exception as e:
            self.logger.logError(f"Error in get_remote_file: {e}")
    
    def run(self):
        try:
            Utilities.make_dir(self.output_dir)
            remote_file_dir=os.path.join(self.output_dir,"Encrypted")
            Utilities.make_dir(remote_file_dir)
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
                                    self.get_remote_file(file,file_date_time)
                                    local_file_path = os.path.join(remote_file_dir, file.filename)
                                    self.logger.logInfo(f"start file downloading: {file.filename}")
                                    self.sftp.get(remote_file_path, local_file_path)
                                    self.logger.logInfo(f"file downloaded: {file.filename}")
                                    self.last_file_status["IsDownloaded"]=True
                                    self.last_file_status["IsEncrypted"]=self.decrypt_files(local_file_path)
                                    self.update_file_status()
                                    self.sftp.remove(remote_file_path)
                                else:
                                    self.logger.logError(f"file time stamp is missing or size is {file_size} : {file.filename}")
                except Exception as e:
                    self.logger.logError(f"Error in process loop: {e}")
                finally:
                    time.sleep(0.100)
        except Exception as e:
            self.logger.logError(f"Error in process in run loop: {e}")
    
    
    def get_last_status(self):
        try:
            self.last_file_status=self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusGetLastFileStatus",None)
            if self.last_file_status is None:
                self.last_file_status={"BltFileName":None,"FileDateTime":None,"ModifiedTime":None,"FileSize":0,
                  "FileSizeType":None,"IsDownloaded":False,"IsEncrypted":False,"IsProcessed":False}
                last_downloaded_timestamp=None
                return last_downloaded_timestamp
            else:
                self.last_file_status=self.last_file_status[0]
                #last_downloaded_timestamp=Utilities.python_format_to_normal(self.last_file_status.get('FileDateTime'))
                last_downloaded_timestamp='09-Jan-2025 02:19:31'
                last_downloaded_timestamp = datetime.strptime(last_downloaded_timestamp, self.date_format).timestamp()
                return last_downloaded_timestamp
        except Exception as e:
            self.logger.logError(f"Error in on get_last_status: {e}")


    def update_file_status(self):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusInsert",params=[
                self.last_file_status["BltFileName"],
                self.last_file_status["FileDateTime"],
                self.last_file_status["ModifiedTime"],
                self.last_file_status["FileSize"],
                self.last_file_status["FileSizeType"],
                self.last_file_status["IsDownloaded"],
                self.last_file_status["IsEncrypted"],
                self.last_file_status["IsProcessed"]
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