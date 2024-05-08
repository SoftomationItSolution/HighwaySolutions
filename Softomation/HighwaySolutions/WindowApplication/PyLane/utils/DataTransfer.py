from datetime import datetime
import os
import threading
import time
from models.DataImporter import DataImporter
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class DataSynchronization(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj,default_plaza_Id,system_ip,timeout=0.100):
        threading.Thread.__init__(self)
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_ip=system_ip
        self.project_config_path = os.path.join(default_directory, 'MasterConfig', 'ProjectConfiguration.json')
        self.is_running=True
        self.timeout=timeout
        self.data_upload_running=False
        self.set_logger(default_directory,'data_import')
        self.data_impoter(dbConnectionObj)
        self.get_plaza_url(default_directory)

    def get_plaza_url(self,default_directory):
        try:
            plaza_config_path=os.path.join(default_directory, 'MasterConfig', 'plazaConfig.json')
            self.media_path=os.path.join(default_directory, 'Events')
            self.plaza_config = Utilities.read_json_file(plaza_config_path)
            self.api_base_url=self.plaza_config["plaza_api_p"]
            self.event_path=self.plaza_config["event_path"]
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_plaza_url: {str(e)}")
        
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="DataSynchronization"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def data_impoter(self,dbConnectionObj):
        try:
            self.data_importer = DataImporter(self.default_directory, dbConnectionObj,self.logger,self.default_plaza_Id,self.default_lane_ip)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} data_impoter: {str(e)}")

    def fetch_and_store_master_data(self):
        try:
            self.data_importer.project_config_import(self.project_config_path)
            self.data_importer.data_status_import()
            self.data_importer.lane_mode_import()
            self.data_importer.lane_point_import()
            self.data_importer.lane_position_import()
            self.data_importer.lane_status_import()
            self.data_importer.lane_type_import()
            self.data_importer.lane_direction_import()
            self.data_importer.transaction_type_import()
            self.data_importer.payment_type_import()
            self.data_importer.exempt_type_import()
            self.data_importer.shift_timing_import()
            self.data_importer.denomination_type_Import()
            self.data_importer.equipment_type_Import()
            self.data_importer.protocol_type_Import()
            self.data_importer.manufacturer_Import()
            self.data_importer.fasTag_vehicleclass_Import()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} fetch_and_store_master_data: {str(e)}")
    
    def fetch_and_store_data(self):
        try:
            self.data_importer.system_integrator_Import()
            self.data_importer.system_vehicleclass_Import()
            self.data_importer.system_vehicle_subclass_Import()
            self.data_importer.users_Import()
            self.data_importer.system_setting_Import()
            self.data_importer.plaza_import()
            self.data_importer.lane_import()
            self.data_importer.equipments_Import()
            self.data_importer.toll_fare_Import()
            self.data_importer.toll_fare_Future_Import()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} fetch_and_store_data: {str(e)}")

    def run(self):
        last_call_time = time.time()-22600
        while self.is_running:
            try:
                if self.data_upload_running==False:
                    self.data_upload_running=True
                    lane_push_thread = threading.Thread(target=self.lane_data_uploading)
                    lane_push_thread.start()

                    avc_push_thread = threading.Thread(target=self.avc_data_uploading)
                    avc_push_thread.start()

                    wim_push_thread = threading.Thread(target=self.wim_data_uploading)
                    wim_push_thread.start()

                    wimDetails_push_thread = threading.Thread(target=self.wim_details_uploading)
                    wimDetails_push_thread.start()
                current_time = time.time()
                if current_time - last_call_time >= 21600:
                    self.fetch_and_store_master_data()
                    self.fetch_and_store_data()
                    last_call_time = current_time
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} run: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def lane_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneTranscationInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_LaneTransactionPending')
                for s in result_data:
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.lane_data_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception {self.classname} lane_data_uploading child: {str(e)}")
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} lane_data_uploading: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def avc_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/AvcTransactionInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_AvcTransactionPending')
                for s in result_data:
                    data_status=s['IsDataTransfer']
                    media_status=s['IsMediaTransfer']
                    try:
                        if media_status==False:
                            if s["ImageName"] is not None and s["ImageName"]!='':
                                date_object = datetime.strptime(s["TransactionDateTime"], '%d-%b-%Y %H:%M:%S.%f')
                                today = date_object.strftime('%Y-%m-%d')
                                file_path=os.path.join(self.media_path, 'avc',today,s["ImageName"])
                                if Utilities.check_file_exists(file_path):
                                    uploadPath=f"{self.event_path}{today}/L{str(s['LaneId'])}/avc/{s['ImageName']}"
                                    media_status=Utilities.upload_file_ssh(file_path, uploadPath, self.plaza_config["FtpAddress"], 'srb', "Srb@2024")
                                else:
                                    media_status=True
                            else:
                                media_status=True
                        if data_status==False:
                            data_status=self.upload_data(api_url,s)
                        LaneManager.avc_data_marked(self.dbConnectionObj,s,data_status,media_status)
                    except Exception as e:
                        self.logger.logError(f"Exception {self.classname} avc_data_uploading child: {str(e)}")
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} avc_data_uploading: {str(e)}")
            finally:
                time.sleep(self.timeout)
    
    def wim_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/WimTransactionInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_WimTransactionPending')
                for s in result_data:
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.wim_data_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception {self.classname} wim_data_uploading child: {str(e)}")
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} wim_data_uploading: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def wim_details_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/WimTransactionAxleDetailsInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_WimTransactionAxleDetailsPending')
                for s in result_data:
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.wim_details_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception {self.classname} wim_details_uploading child: {str(e)}")
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} wim_details_uploading: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def upload_data(self,endpoint,data):
        result=False
        try:
            response=Utilities.upload_data_api(endpoint,data)
            if response.status_code == 200:
                result=True
            else:
                self.logger.logInfo(f"{self.classname} response {response.status_code}  upload_data: {endpoint} {response.text}")
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} lane_data_uploading: {str(e)}")
        finally:
            return result

    def stop(self):
        try:
            self.is_running = False
            self.data_upload_running = False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_data_uploading: {str(e)}")