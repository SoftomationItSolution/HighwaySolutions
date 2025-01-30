from datetime import datetime
import time
import paramiko
import os
import threading
import pandas as pd
import gnupg
from sqlalchemy import create_engine
import urllib.parse
from utils.constants import Utilities
from utils.log_master import CustomLogger

class DownloadFilesThread(threading.Thread):
    def __init__(self,dbConnectionObj,sftpDetails,db_details,default_directory,chunk_size=100000):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.sftpDetails=sftpDetails  
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.download_file_status_path=os.path.join(default_directory, 'MasterConfig','icd_file_status.json')
        self.date_format='%d-%b-%Y %H:%M:%S'
        self.logger = CustomLogger(default_directory, 'icd_sftp')
        self.chunk_size = chunk_size
        self.gpg = gnupg.GPG()
        self.passphrase="Mcube@7890"
        self.transport=None
        self.sftp=None
        self.columns = ['TagID', 'TagStatus', 'TagStatusTimestamp', 'Category']
        self.db_connection(db_details)
    
    def db_connection(self,db_details):
        try:
            server = db_details["server"]
            database = db_details["database"]
            username = urllib.parse.quote_plus(db_details["user"])
            password = urllib.parse.quote_plus(db_details["password"])
            connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
            #self.engine = create_engine(connection_string)
            self.engine = create_engine(
            connection_string,
            pool_size=10,       # Number of connections to keep in the pool
            max_overflow=20,    # Number of connections allowed beyond pool_size
            pool_timeout=3600,    # Max wait time for getting a connection from the pool
            pool_recycle=3600   
        )
        except Exception as e:
            self.engine=None
            self.logger.logError(f"Error in on db_connection: {e}")

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
            #,reverse=False
            remote_files = self.sftp.listdir_attr(self.sftpDetails["RemoteDirectory"]) #asc true for desc
            remote_files.sort(key=lambda x: x.st_mtime)
            return remote_files
        except Exception as e:
            self.logger.logError(f"Error in get_remote_files: {e}")
            self.transport=None
            self.sftp=None
            return None
    
    def insert_data(self,file_path,file_type,file_name):
        try:
            table_name='tbl_VehicleStatusLog'
            file_name = os.path.basename(file_path)
            if self.engine:
                data = pd.read_csv(file_path, header=None, names=self.columns)
                data['FileName'] = file_name
                for chunk in pd.read_csv(file_path, header=None, names=self.columns, chunksize=self.chunk_size):
                    chunk.to_sql(table_name, con=self.engine, if_exists='append', index=False)
                    self.logger.logInfo(f"Inserted {len(chunk)} rows into {table_name}.")
                self.logger.logInfo("Data insertion completed successfully!")
                try:
                    self.dbConnectionObj.execute_stored_procedure("USP_ProcessBLTData",params=[file_type])
                    self.logger.logInfo("Data moved to main is successfully!")
                    os.remove(file_path)
                except Exception as e:
                    self.logger.logError(f"Error send update_request {file_name}: {e}")
                return True
            else:
                self.logger.logError("Data base not working!")
                return False
        except Exception as e:
            self.logger.logError(f"Error occurred during data insertion: {e}")
            return False     
    
    def process_decrypted_file(self, csv_file_path,file_name):
        try:
            self.logger.logError(f"start process decrypted: {file_name}")
            with open(csv_file_path, 'r') as file:
                lines = file.readlines()
            if lines and lines[-1].startswith('#'):
                lines = lines[:-1]
            if lines and lines[0].startswith('#'):
                if 'DIFF' in lines[0].upper():
                    if self.sftpDetails["Diff"]:
                        lines = lines[1:]
                        diff_folder = os.path.join(self.output_dir,"Decrypted", 'Diff')
                        Utilities.make_dir(diff_folder)
                        diff_file_path = os.path.join(diff_folder, os.path.basename(csv_file_path))
                        with open(diff_file_path, 'w') as csv_file:
                            csv_file.writelines(lines)
                        self.logger.logInfo(f"start insert db: {file_name}")
                        return self.insert_data(diff_file_path,'Diff',file_name)
                    else:
                        self.logger.logInfo(f"diff file is not allowed: {file_name}")
                        return True
                else:
                    if self.sftpDetails["Init"]:
                        lines = lines[1:]
                        init_folder = os.path.join(self.output_dir,"Decrypted", 'INIT')
                        Utilities.make_dir(init_folder)
                        init_file_path = os.path.join(init_folder, os.path.basename(csv_file_path))
                        with open(init_file_path, 'w') as csv_file:
                            csv_file.writelines(lines)
                        self.logger.logInfo(f"start insert db: {file_name}")
                        return self.insert_data(init_file_path,'init',file_name)
                    else:
                        self.logger.logInfo(f"init file is not allowed: {file_name}")
                        return True
        except Exception as e:
            self.logger.logError(f"Error processing CSV file {csv_file_path}: {e}")
            return False
        
    def decrypt_files(self,encrypted_file_path):
        try:
            file_name = os.path.basename(encrypted_file_path)
            self.logger.logInfo(f"start decrypting: {file_name}")
            decrypted_file_dir=os.path.join(self.output_dir,"Decrypted")
            Utilities.make_dir(decrypted_file_dir)
            decrypted_file_path = os.path.join(decrypted_file_dir, file_name.replace('.blt.gpg', '.csv'))
            with open(encrypted_file_path, 'rb') as encrypted_file:
                decrypted_data = self.gpg.decrypt_file(encrypted_file, passphrase=self.passphrase, output=decrypted_file_path)
                if decrypted_data.ok:
                    res=self.process_decrypted_file(decrypted_file_path,file_name)
                    if res:
                        os.remove(encrypted_file_path)
                        os.remove(decrypted_file_path)
                else:
                    self.logger.logError(f"Failed to decrypt {encrypted_file_path}: {decrypted_data.status}")
        except Exception as e:
            self.logger.logError(f"Error occurred during decryption: {e}")
    
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
                            last_downloaded_timestamp=self.get_last_file()
                            for file in remote_files:
                                if last_downloaded_timestamp is None or file.st_mtime > last_downloaded_timestamp:
                                    remote_file_path = os.path.join(self.sftpDetails["RemoteDirectory"], file.filename)
                                    local_file_path = os.path.join(remote_file_dir, file.filename)
                                    self.logger.logInfo(f"start file downloading: {file.filename}")
                                    self.sftp.get(remote_file_path, local_file_path)
                                    last_downloaded_timestamp = file.st_mtime
                                    self.logger.logInfo(f"file downloaded: {file.filename}")
                                    Utilities.update_downloaded_details(self.download_file_status_path,file.filename, last_downloaded_timestamp,self.date_format)
                                    self.decrypt_files(local_file_path)
                                time.sleep(0.100)
                except Exception as e:
                    self.logger.logError(f"Error in process loop: {e}")
                finally:
                    time.sleep(0.100)
        except Exception as e:
            self.logger.logError(f"Error in process in run loop: {e}")
    
    def stop(self):
        try:
            self.flag = False
            self.sftp.close()
            self.transport.close()
            self.logger.logInfo("Stopping the Download thread.")
        except Exception as e:
            self.logger.logError(f"Error in on process loop: {e}")