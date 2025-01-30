import time
import os
import threading
import gnupg
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class SftpDecryptThread(threading.Thread):
    def __init__(self,dbConnectionObj:MSSQLConnectionManager,default_directory):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.encrypt_file_dir=os.path.join(self.output_dir,"Encrypted")
        self.decrypted_file_dir=os.path.join(self.output_dir,"Decrypted")
        self.logger = CustomLogger(default_directory, 'icd_sftp_decrypt')
        self.gpg = gnupg.GPG()
        self.passphrase="Mcube@7890"
        
    def decrypt_files(self,item):
        file_name=item["BltFileName"]
        try:
            self.logger.logInfo(f"start decrypting: {file_name}")
            local_filename=file_name.replace('.blt.gpg', '.csv')
            encrypted_file_path = os.path.join(self.encrypt_file_dir, file_name)
            decrypted_file_path = os.path.join(self.decrypted_file_dir, local_filename)
            with open(encrypted_file_path, 'rb') as encrypted_file:
                decrypted_data = self.gpg.decrypt_file(encrypted_file, passphrase=self.passphrase, output=decrypted_file_path)
                if decrypted_data.ok:
                    os.remove(encrypted_file_path)
                    item["BltFileName"]=local_filename
                    item["IsDecrypted"]=True
                    self.update_file_status(file_name,item)
                    return True
                else:
                    item["Remark"]=str(decrypted_data.status)
                    item["IsDecrypted"]=False
                    self.logger.logError(f"Failed to decrypt {encrypted_file_path}: {decrypted_data.status}")
                    self.update_file_status(file_name,item)
                    return False
        except Exception as e:
            item["IsDecrypted"]=False
            item["Remark"]=str(e)
            self.logger.logError(f"Error occurred during decryption: {e}")
            self.update_file_status(file_name,item)
            return False
            
    
    def run(self):
        try:
            Utilities.make_dir(self.decrypted_file_dir)
            while self.flag:
                try:
                    data=self.get_pending_files()
                    if data:
                        for item in data:
                            self.decrypt_files(item)
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
            return self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusGetEncrypted",None)
        except Exception as e:
            self.logger.logError(f"Error in get_pending_files: {e}")

    def update_file_status(self,EncryptedFileName,item):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusUpdate",params=[
                EncryptedFileName,
                item["BltFileName"],
                item["IsDecrypted"],
                item["Remark"]
            ])
        except Exception as e:
            self.logger.logError(f"Error in update_file_status: {e}")
            
    def stop(self):
        try:
            self.flag = False
            self.logger.logInfo("Stopping the Decrypt thread.")
        except Exception as e:
            self.logger.logError(f"Error in on process loop: {e}")