import threading
import time
import os
from request.pay import RequestPayAPI
from utils.constants import Utilities
from utils.log_master import CustomLogger
from cryptography.hazmat.primitives.serialization import pkcs12, load_pem_private_key
from cryptography.hazmat.backends import default_backend

class CCHProcessing(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj, script_dir,icd_api_data):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.script_dir=script_dir
        self.icd_api_data=icd_api_data
        self.is_running = True
        self.request_pay_thread=None
        self.api_version='1.0'
        self.currecy_code='INR'
        self.private_key=None
        self.certificate=None
        self.additional_certificates=None
        self.set_logger(default_directory,"cch_bg_service")
        self.load_certificate()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    
    def load_certificate(self):
        try:
            certificate_path= os.path.join(self.default_directory, 'MasterConfig','PlazaKeys', 'certificate.pfx')
            with open(certificate_path, "rb") as cert_file:
                pfx_data = cert_file.read()
            self.private_key, self.certificate, self.additional_certificates = pkcs12.load_key_and_certificates(pfx_data,password=b"mcube@123",backend=default_backend())
            #print(self.private_key)
        except Exception as e:
            self.logger.logError(f"Exception load_certificate: {str(e)}")
    def start_pay_thread(self):
        try:
            if self.request_pay_thread is None:
                api_detail=Utilities.get_api_details("RequestPay",self.icd_api_data)
                self.request_pay_thread=RequestPayAPI(self.dbConnectionObj,self.default_directory,api_detail,self.api_version,self.currecy_code,self.private_key, self.certificate, self.additional_certificates)
                self.request_pay_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_pay_thread: {str(e)}")

    def stop_pay_thread(self):
        try:
            if self.request_pay_thread is None:
                self.request_pay_thread.stop()
                self.request_pay_thread = None
        except Exception as e:
            self.logger.logError(f"Exception start_pay_thread: {str(e)}")

    

    def run(self):
        while self.is_running:
            try:
                self.start_pay_thread()
            except Exception as e:
                self.logger.logError(f"Exception CCHProcessing.run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    


    def on_stop(self):
        try:
            self.stop_pay_thread()
        except Exception as e:
            self.logger.logError(f"Exception CCHProcessing.on_stop: {str(e)}")