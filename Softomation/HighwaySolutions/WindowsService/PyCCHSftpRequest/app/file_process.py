import time
import os
import threading
import pandas as pd
from sqlalchemy import create_engine
import urllib.parse
from database.ms_sql import MSSQLConnectionManager
from utils.log_master import CustomLogger

class SftpProcessThread(threading.Thread):
    def __init__(self,dbConnectionObj:MSSQLConnectionManager,db_details,default_directory,chunk_size=100000):
        super().__init__()
        self.flag = True
        self.dbConnectionObj=dbConnectionObj
        self.output_dir=os.path.join(default_directory, 'ICDDataFiles')
        self.decrypted_file_dir=os.path.join(self.output_dir,"Decrypted")
        self.logger = CustomLogger(default_directory, 'icd_sftp_process')
        self.chunk_size = chunk_size
        self.columns = ['TagID', 'TagStatus', 'TagStatusTimestamp', 'Category']
        self.db_connection(db_details)
    
    def db_connection(self,db_details):
        try:
            server = db_details["server"]
            database = db_details["database"]
            username = urllib.parse.quote_plus(db_details["user"])
            password = urllib.parse.quote_plus(db_details["password"])
            connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
            self.engine = create_engine(connection_string,pool_size=10,max_overflow=20,pool_timeout=3600,pool_recycle=3600)
        except Exception as e:
            self.engine=None
            self.logger.logError(f"Error in on db_connection: {e}")

    def insert_data(self, file_path,final_data):
        try:
            table_name = 'tbl_VehicleStatusLog'
            if self.engine:
                #data = pd.read_csv(file_path, header=None, names=self.columns)
                for chunk in pd.read_csv(file_path, header=None, names=self.columns, chunksize=self.chunk_size):
                    chunk.to_sql(table_name, con=self.engine, if_exists='append', index=False)
                    self.logger.logInfo(f"Inserted {len(chunk)} rows into {table_name}.")
                return self.update_file_status(final_data,file_path)
            else:
                self.logger.logError("Database not working!")
                return False
        except Exception as e:
            self.logger.logError(f"Error occurred during data insertion: {e}")
            return False
    
    def process_decrypted_file(self,data):
        file_name=data["BltFileName"]
        csv_file_path = os.path.join(self.decrypted_file_dir, file_name)
        try:
            self.logger.logError(f"start process decrypted: {file_name}")
            with open(csv_file_path, 'r') as file:
                lines = file.readlines()
            if lines and lines[-1].startswith('#'):
                lines = lines[:-1]
            if lines and lines[0].startswith('#'):
                if 'DIFF' in lines[0].upper():
                    lines = lines[1:]
                    with open(csv_file_path, 'w') as csv_file:
                        csv_file.writelines(lines)
                    data["IsInitFile"]=False
                else:
                    lines = lines[1:]
                    with open(csv_file_path, 'w') as csv_file:
                        csv_file.writelines(lines)
                    data["IsInitFile"]=True 
            return self.insert_data(csv_file_path,data) 
        except Exception as e:
            self.logger.logError(f"Error process_decrypted_file {csv_file_path}: {e}")
            return False
    
    def run(self):
        try:
            while self.flag:
                try:
                    data=self.get_pending_files()
                    if data:
                        for item in data:
                            item["IsCurrentProcess"]=True
                            self.update_file_process(item)
                            if item["IsDecrypted"]:
                                result=self.process_decrypted_file(item)
                                if result==False:
                                    self.logger.logError(f"Failed to process the file:{item['BltFileName']}")
                                    break
                            else:
                                self.logger.logError(f"File is not decrypted:{item['BltFileName']}")
                                break
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
            return self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusGetUnProcessed",None)
        except Exception as e:
            self.logger.logError(f"Error in get_pending_files: {e}")
    
    def update_file_status(self,data,file_path):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_ProcessBLTData",params=[data["BltFileName"],data["IsInitFile"]])
            os.remove(file_path)
            self.logger.logInfo("Data insertion completed successfully!")
            data["IsCurrentProcess"]=False
            return self.update_file_process(data)
        except Exception as e:
            self.logger.logError(f"Error in update_file_status: {e}")
            return False

    def update_file_process(self,data):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_SftpFileStatusUpdateProcess",params=[data["BltFileName"],data["IsCurrentProcess"]])
            return True 
        except Exception as e:
            self.logger.logError(f"Error in update_file_process: {e}")
            return False
    
    def stop(self):
        try:
            self.flag = False
            if self.engine:
                self.engine.dispose()
            self.logger.logInfo("Stopping the Download thread.")
        except Exception as e:
            self.logger.logError(f"Error in on process loop: {e}")