from datetime import datetime
import time
import os
import threading
from database.ms_sql import MSSQLConnectionManager
from utils.log_master import CustomLogger
import mmap

class SftpGetFileDetailsThread(threading.Thread):
    def __init__(self,dbConnectionObj:MSSQLConnectionManager,default_directory):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.encrypt_file_dir=os.path.join(self.output_dir,"Encrypted")
        self.decrypted_file_dir=os.path.join(self.output_dir,"Decrypted")
        self.logger = CustomLogger(default_directory, 'icd_sftp_decrypt_test')

    def find_min_max_date(self,file_path):
        min_date = None
        max_date = None
        IsInitFile=True
        with open(file_path, "r") as file:
            with mmap.mmap(file.fileno(), length=0, access=mmap.ACCESS_READ) as mmapped_file:
                for line in iter(mmapped_file.readline, b""):
                    line = line.decode("utf-8").strip()  # Convert bytes to string
                    if line.startswith("#HEADER"):
                        if 'DIFF' in line.upper():
                            IsInitFile=False
                        else:
                            IsInitFile=True
                        continue
                    elif line.startswith("#TRAILER"):
                        continue
                    parts = line.split(",")
                    if len(parts) >= 3:
                        try:
                            date = datetime.strptime(parts[2], "%Y/%m/%d %H:%M:%S")
                            if min_date is None or date < min_date:
                                min_date = date
                            if max_date is None or date > max_date:
                                max_date = date
                        except ValueError:
                             self.logger.logError(f"Skipping invalid date format: {parts[2]}")
        return min_date, max_date,IsInitFile
        
    def decrypt_files(self,item):
        file_name=item["BltFileName"]
        try:
            if 'CSV' in file_name.upper():
                file_path=os.path.join(self.decrypted_file_dir, file_name)
                min_date, max_date,IsInitFile=self.find_min_max_date(file_path)
                self.logger.logError(f"{file_name},{IsInitFile},{min_date},{max_date}")
                item["IsInitFile"]=IsInitFile
                item["MinDateTime"]=min_date
                item["MaxDateTime"]=max_date
                self.update_file_status(file_name,item)
                bltfilepath=file_path.replace("csv","blt.gpg")
                bltfilepath=bltfilepath.replace("Decrypted","Encrypted")
                if os.path.exists(bltfilepath):
                    os.remove(bltfilepath)
        except Exception as e:
            self.logger.logError(f"Error occurred during decryption: {e}")
            
    
    def run(self):
        try:
            while self.flag:
                try:
                    data=self.get_pending_files()
                    if data:
                        for item in data:
                            #self.decrypt_files(item)
                            thread = threading.Thread(target=self.decrypt_files, args=(item,))
                            thread.start()
                            time.sleep(0.100)
                    time.sleep(0.100) 
                except Exception as e:
                    self.logger.logError(f"Error in process loop: {e}")
                finally:
                    time.sleep(0.100)
        except Exception as e:
            self.logger.logError(f"Error in process in run loop: {e}")

    def get_pending_files(self):
        try:
            return self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusGetEncrypted_test",None)
        except Exception as e:
            self.logger.logError(f"Error in get_pending_files: {e}")

    def update_file_status(self,EncryptedFileName,item):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusUpdate",params=[
                EncryptedFileName,
                item["BltFileName"],
                item["IsDecrypted"],
                item["Remark"],
                item["IsInitFile"],
                item["MinDateTime"],
                item["MaxDateTime"]
            ])
        except Exception as e:
            self.logger.logError(f"Error in update_file_status: {e}")
            
    def stop(self):
        try:
            self.flag = False
            self.logger.logInfo("Stopping the Decrypt thread.")
        except Exception as e:
            self.logger.logError(f"Error in on process loop: {e}")