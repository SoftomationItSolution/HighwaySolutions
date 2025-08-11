import threading
import time
import os
from fastapi import FastAPI
from api.TagAPi import TagRequestApi
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from cryptography.hazmat.primitives.serialization import pkcs12
from cryptography.hazmat.backends import default_backend
from fastapi.middleware.cors import CORSMiddleware

class ICdTagProcessing(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj:MSSQLConnectionManager):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.is_running = True
        self.api_thread=None
        self.shutdown_flag=None
        self.private_key=None
        self.certificate=None
        self.additional_certificates=None
        self.system_setting=None
        self.plaza_details=None
        self.icd_api_detail=None
        self.is_production=False
        self.set_logger(default_directory,"icd_bg_service_UAT")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    
    def load_certificate(self,CertificateName,CertificatePassword):
        try:
            certificate_path= os.path.join(self.default_directory, 'MasterConfig','PlazaKeys', CertificateName)
            with open(certificate_path, "rb") as cert_file:
                pfx_data = cert_file.read()
            self.private_key, self.certificate, self.additional_certificates = pkcs12.load_key_and_certificates(pfx_data,password=CertificatePassword.encode(),backend=default_backend())
        except Exception as e:
            self.logger.logError(f"Exception load_certificate: {str(e)}")

    def load_api_details(self):
        try:
            cch_api_Path = os.path.join(self.default_directory, 'MasterConfig', 'BankAPIPath.json')
            cch_api_data = Utilities.read_json_file(cch_api_Path)
            if self.is_production:
                self.icd_api_detail= cch_api_data["ProdApiDetails"]
            else:
                self.icd_api_detail= cch_api_data["UatApiDetails"]
        except Exception as e:
            self.logger.logError(f"Exception load_api_details: {str(e)}")
    
    def start_api(self):
        try:
            if self.api_thread is None:
                app = FastAPI()
                app.add_middleware(CORSMiddleware,allow_origins=["*"],allow_credentials=True,allow_methods=["*"],allow_headers=["*"],)
                self.shutdown_flag = threading.Event()
                self.api_thread = TagRequestApi(self.dbConnectionObj,self.default_directory, self.icd_api_detail,self.plaza_details, self.private_key, self.certificate, app)
                threading.Thread(target=self.api_thread.run, daemon=True).start()
        except Exception as e:
            self.logger.logError(f"Exception in start_api: {str(e)}")

    def stop_api(self):
        try:
            if self.api_thread:
                self.api_thread.stop() 
        except Exception as e:
            self.logger.logError(f"Exception in stop_api: {str(e)}")

    
    def load_master_data(self):
        try:
            if self.system_setting is None:
                self.system_setting=self.dbConnectionObj.execute_stored_procedure_single("USP_SystemSettingGet")
            
            if self.system_setting and self.plaza_details is None:
                self.plaza_details=self.dbConnectionObj.execute_stored_procedure_single("USP_ICDPlazaGetById",params=[self.system_setting["DefaultPlazaId"],])
            
            if self.plaza_details and self.private_key is None:
                #self.is_production=self.plaza_details["IsProducation"]
                self.load_certificate(self.plaza_details["CertificateName"],self.plaza_details["CertificatePassword"])
            
            if self.plaza_details and self.icd_api_detail is None:
                self.load_api_details()
        except Exception as e:
            self.logger.logError(f"Exception load_master_data: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.load_master_data()
                if self.private_key and self.icd_api_detail:
                    self.start_api()
                    
            except Exception as e:
                self.logger.logError(f"Exception ICDProcessing.run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def on_stop(self):
        try:
            self.stop_api()
        except Exception as e:
            self.logger.logError(f"Exception ICDProcessing.on_stop: {str(e)}")