import threading
import time
import os
from fastapi import FastAPI
from fast_api.background_task_api import TagRequestApi
from request.check_status import RequestCheckStatus
from request.exception_request import RequestExceptionList
from request.heart_beat import RequestHeartBeat
from request.pay import RequestPayAPI
from request.sync_time import RequestSyncTime
from request.participants_details import ParticipantsDetails
from sftp.sftp_file_download import DownloadFilesThread
from utils.constants import Utilities
from utils.log_master import CustomLogger
from cryptography.hazmat.primitives.serialization import pkcs12, load_pem_private_key
from cryptography.hazmat.backends import default_backend

class CCHProcessing(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj,db_json_data, script_dir):
        super().__init__()
        self.default_directory=default_directory
        self.dbConnectionObj=dbConnectionObj
        self.db_json_data=db_json_data
        self.script_dir=script_dir
        self.is_running = True
        self.api_thread=None
        self.shutdown_flag=None
        self.sftp_thread=None
        self.request_pay_thread=None
        self.check_status_thread=None
        self.request_sync_time_thread=None
        self.participants_status_thread=None
        self.request_heart_beat_thread=None
        self.request_query_exception_thread=None
        self.currecy_code='INR'
        self.private_key=None
        self.certificate=None
        self.additional_certificates=None
        self.system_setting=None
        self.plaza_details=None
        self.icd_api_detail=None
        self.icd_sftp_detail=None
        self.is_production=False
        
        self.set_logger(default_directory,"icd_bg_service")

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
            #print(self.private_key)
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
    
    def load_sftp_details(self):
        try:
            cch_api_Path = os.path.join(self.default_directory, 'MasterConfig', 'BankAPIPath.json')
            cch_api_data = Utilities.read_json_file(cch_api_Path)
            self.icd_sftp_detail= cch_api_data["SftpDetails"]
        except Exception as e:
            self.logger.logError(f"Exception load_sftp_details: {str(e)}")
            self.icd_sftp_detail is None
    
    def start_api(self):
        try:
            if self.api_thread is None:
                app = FastAPI()
                self.shutdown_flag = threading.Event()
                self.api_thread = TagRequestApi(self.dbConnectionObj,self.default_directory, self.icd_api_detail,self.plaza_details, self.private_key, self.certificate, app)
                threading.Thread(target=self.api_thread.run, daemon=True).start()
        except Exception as e:
            self.logger.logError(f"Exception in start_api: {str(e)}")

    def stop_api(self):
        try:
            if self.api_thread:
                self.api_thread.stop()  # Call stop to shut down the server gracefully
        except Exception as e:
            self.logger.logError(f"Exception in stop_api: {str(e)}")

    def start_sftp_thread(self):
        try:
            if self.sftp_thread is None:
                self.sftp_thread=DownloadFilesThread(self.dbConnectionObj,self.icd_sftp_detail,self.db_json_data,self.default_directory)
                self.sftp_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_sftp_thread: {str(e)}")

    def stop_sftp_thread(self):
        try:
            if self.sftp_thread:
                self.sftp_thread.stop()
                self.sftp_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_sftp_thread: {str(e)}")
    
    def start_pay_thread(self):
        try:
            if self.request_pay_thread is None:
                self.request_pay_thread=RequestPayAPI(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.currecy_code,self.private_key, self.certificate, self.additional_certificates)
                self.request_pay_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_pay_thread: {str(e)}")

    def stop_pay_thread(self):
        try:
            if self.request_pay_thread:
                self.request_pay_thread.stop()
                self.request_pay_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_pay_thread: {str(e)}")

    def start_check_status_thread(self):
        try:
            if self.check_status_thread is None:
                self.check_status_thread=RequestCheckStatus(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.currecy_code,self.private_key, self.certificate, self.additional_certificates)
                self.check_status_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_check_status_thread: {str(e)}")

    def stop_check_status_thread(self):
        try:
            if self.check_status_thread:
                self.check_status_thread.stop()
                self.check_status_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_check_status_thread: {str(e)}")

    def start_participants_thread(self):
        try:
            if self.participants_status_thread is None:
                self.participants_status_thread=ParticipantsDetails(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.private_key, self.certificate, self.additional_certificates)
                self.participants_status_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_tag_status_thread: {str(e)}")

    def stop_participants_thread(self):
        try:
            if self.participants_status_thread:
                self.participants_status_thread.stop()
                self.participants_status_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_tag_status_thread: {str(e)}")

    def start_heart_beat_thread(self):
        try:
            if self.request_heart_beat_thread is None:
                self.request_heart_beat_thread=RequestHeartBeat(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.private_key, self.certificate, self.additional_certificates)
                self.request_heart_beat_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_heart_beat_thread: {str(e)}")

    def stop_heart_beat_thread(self):
        try:
            if self.request_heart_beat_thread:
                self.request_heart_beat_thread.stop()
                self.request_heart_beat_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_heart_beat_thread: {str(e)}")

    def start_sync_time_thread(self):
        try:
            if self.request_sync_time_thread is None:
                self.request_sync_time_thread=RequestSyncTime(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.private_key, self.certificate, self.additional_certificates)
                self.request_sync_time_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_pay_thread: {str(e)}")

    def start_query_exception_thread(self):
        try:
            if self.request_query_exception_thread is None:
                self.request_query_exception_thread=RequestExceptionList(self.dbConnectionObj,self.default_directory,self.plaza_details,self.icd_api_detail,self.private_key, self.certificate, self.additional_certificates)
                self.request_query_exception_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_heart_beat_thread: {str(e)}")

    def stop_query_exception_thread(self):
        try:
            if self.request_query_exception_thread:
                self.request_query_exception_thread.stop()
                self.request_query_exception_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_heart_beat_thread: {str(e)}")
    
    def load_master_data(self):
        try:
            if self.system_setting is None:
                self.system_setting=self.dbConnectionObj.execute_stored_procedure_single("USP_SystemSettingGet")
            
            if self.system_setting and self.plaza_details is None:
                self.plaza_details=self.dbConnectionObj.execute_stored_procedure_single("USP_ICDPlazaGetById",params=[self.system_setting["DefaultPlazaId"],])
            
            if self.plaza_details and self.private_key is None:
                self.is_production=self.plaza_details["IsProducation"]
                self.load_certificate(self.plaza_details["CertificateName"],self.plaza_details["CertificatePassword"])
            
            if self.plaza_details and self.icd_api_detail is None:
                self.load_api_details()
            if self.plaza_details and self.icd_sftp_detail is None:
                self.load_sftp_details()
        except Exception as e:
            self.logger.logError(f"Exception load_master_data: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.load_master_data()
                if self.private_key and self.icd_api_detail:
                    self.start_api()
                    #self.start_sync_time_thread()
                    #self.start_heart_beat_thread()
                    #self.start_query_exception_thread()
                    self.start_pay_thread()
                    #self.start_check_status_thread()
                    #self.start_participants_thread()
                if self.icd_sftp_detail:
                    self.start_sftp_thread()
            except Exception as e:
                self.logger.logError(f"Exception CCHProcessing.run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def on_stop(self):
        try:
            #self.start_sync_time_thread()
            #self.stop_participants_thread()
            self.stop_pay_thread()
            self.stop_check_status_thread()
            self.stop_heart_beat_thread()
            self.stop_query_exception_thread()
            self.stop_api()
        except Exception as e:
            self.logger.logError(f"Exception CCHProcessing.on_stop: {str(e)}")