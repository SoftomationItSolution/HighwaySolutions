from datetime import datetime
import os
import threading
import time
from models.DataImporter import DataImporter
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

class DataSynchronization(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj,default_plaza_Id,system_ip,timeout=0.500):
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
            self.logger.logError(f"Exception get_plaza_url: {str(e)}")
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="DataSynchronization"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def data_impoter(self,dbConnectionObj):
        try:
            self.data_importer = DataImporter(self.default_directory, dbConnectionObj,self.logger,self.default_plaza_Id,self.default_lane_ip)
        except Exception as e:
            self.logger.logError(f"Exception data_impoter: {str(e)}")

    def perform_data_import(self):
        try:
            self.data_importer.project_config_import(self.project_config_path)
        except Exception as e:
            self.logger.logError(f"Exception perform_data_import: {str(e)}")

    def fetch_and_store_master_data(self):
        try:
            threading.Thread(target=self.perform_data_import()).start()
            threading.Thread(target=self.data_importer.data_status_import()).start()
            threading.Thread(target=self.data_importer.lane_mode_import()).start()
            threading.Thread(target=self.data_importer.lane_point_import()).start()
            threading.Thread(target=self.data_importer.lane_position_import()).start()
            threading.Thread(target=self.data_importer.lane_status_import()).start()
            threading.Thread(target=self.data_importer.lane_type_import()).start()
            threading.Thread(target=self.data_importer.lane_direction_import()).start()
            threading.Thread(target=self.data_importer.transaction_type_import()).start()
            threading.Thread(target=self.data_importer.payment_type_import()).start()
            threading.Thread(target=self.data_importer.exempt_type_import()).start()
            threading.Thread(target=self.data_importer.shift_timing_import()).start()
            threading.Thread(target=self.data_importer.denomination_type_Import()).start()
            threading.Thread(target=self.data_importer.equipment_type_Import()).start()
            threading.Thread(target=self.data_importer.protocol_type_Import()).start()
            threading.Thread(target=self.data_importer.manufacturer_Import()).start()
            threading.Thread(target=self.data_importer.key_board_Import()).start()
            threading.Thread(target=self.data_importer.fasTag_vehicleclass_Import()).start()

            threading.Thread(target=self.data_importer.system_integrator_Import()).start()
            threading.Thread(target=self.data_importer.system_vehicleclass_Import()).start()
            threading.Thread(target=self.data_importer.system_vehicle_subclass_Import()).start()
            threading.Thread(target=self.data_importer.users_Import()).start()
            threading.Thread(target=self.data_importer.system_setting_Import()).start()
            threading.Thread(target=self.data_importer.plaza_import()).start()
            threading.Thread(target=self.data_importer.lane_import()).start()
            threading.Thread(target=self.data_importer.equipments_Import()).start()
            threading.Thread(target=self.data_importer.toll_fare_Import()).start()
            threading.Thread(target=self.data_importer.toll_fare_Future_Import()).start()
        except Exception as e:
            self.logger.logError(f"Exception fetch_and_store_master_data: {str(e)}")
    
    

    def run(self):
        last_call_time = time.time()-22600
        while self.is_running:
            try:
                if Utilities.check_api_url(self.api_base_url,self.timeout):
                    if not self.data_upload_running:
                        self.start_data_uploading_threads()
                    current_time = time.time()
                    if current_time - last_call_time >= 21600:
                        self.fetch_and_store_master_data()
                        last_call_time = current_time
            except Exception as e:
                self.logger.logError(f"Exception run: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def start_data_uploading_threads(self):
        self.data_upload_running = True
        threading.Thread(target=self.lane_data_uploading).start()
        threading.Thread(target=self.avc_data_uploading).start()
        threading.Thread(target=self.wim_data_uploading).start()
        threading.Thread(target=self.wim_details_uploading).start()
        threading.Thread(target=self.lane_meida_uploading).start()

    def lane_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneTranscationInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_LaneTransactionPending')
                for s in result_data:
                    if self.data_upload_running==False:
                        break
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.lane_data_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception lane_data_uploading child: {str(e)}")
                    finally:
                        if self.data_upload_running==False:
                            break
                        time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception lane_data_uploading: {str(e)}")
            finally:
                if self.data_upload_running==False:
                    break
                time.sleep(self.timeout)

    def lane_meida_uploading(self):
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_LaneMediaPending')
                for s in result_data:
                    if self.data_upload_running==False:
                        break
                    try:
                        date_object = datetime.strptime(s["TransactionDateTime"], '%d-%b-%Y %H:%M:%S.%f')
                        today = date_object.strftime('%Y-%m-%d')
                        if s["TransactionFrontImage"] is not None and s["TransactionFrontImage"]!='':
                            file_path_dir=os.path.join(self.default_directory, 'Events', 'camera','lpic',s["TransactionFrontImage"])
                            if Utilities.check_file_exists(file_path_dir):
                                uploadPath=f"{self.event_path}{today}/L{str(s['LaneId'])}/lpic/image/{s['TransactionFrontImage']}"
                                Utilities.upload_file_ssh(file_path_dir, uploadPath, self.plaza_config["FtpAddress"], self.plaza_config["FtpUser"], self.plaza_config["FtpPassword"])
                        if s["TransactionBackImage"] is not None and s["TransactionBackImage"]!='':
                            file_path_dir=os.path.join(self.default_directory, 'Events', 'camera','ic',s["TransactionBackImage"])
                            if Utilities.check_file_exists(file_path_dir):
                                uploadPath=f"{self.event_path}{today}/L{str(s['LaneId'])}/ic/image/{s['TransactionBackImage']}"
                                Utilities.upload_file_ssh(file_path_dir, uploadPath, self.plaza_config["FtpAddress"], self.plaza_config["FtpUser"], self.plaza_config["FtpPassword"])
                        if s["TransactionVideo"] is not None and s["TransactionVideo"]!='':
                            file_path_dir=os.path.join(self.default_directory, 'Events', 'camera','ic',s["TransactionVideo"])
                            if Utilities.check_file_exists(file_path_dir):
                                uploadPath=f"{self.event_path}{today}/L{str(s['LaneId'])}/ic/video/{s['TransactionVideo']}"
                                Utilities.upload_file_ssh(file_path_dir, uploadPath, self.plaza_config["FtpAddress"], self.plaza_config["FtpUser"], self.plaza_config["FtpPassword"])
                        LaneManager.lane_media_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception lane_meida_uploading child: {str(e)}")
                    finally:
                        if self.data_upload_running==False:
                            break
                        time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception lane_meida_uploading: {str(e)}")
            finally:
                if self.data_upload_running==False:
                    break
                time.sleep(self.timeout)

    def avc_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/AvcTransactionInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_AvcTransactionPending')
                for s in result_data:
                    if self.data_upload_running==False:
                        break
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
                                    media_status=Utilities.upload_file_ssh(file_path, uploadPath, self.plaza_config["FtpAddress"], self.plaza_config["FtpUser"], self.plaza_config["FtpPassword"])
                                else:
                                    media_status=True
                            else:
                                media_status=True
                        if data_status==False:
                            data_status=self.upload_data(api_url,s)
                        self.update_lane_avc(s)
                        LaneManager.avc_data_marked(self.dbConnectionObj,s,data_status,media_status)
                    except Exception as e:
                        self.logger.logError(f"Exception avc_data_uploading child: {str(e)}")
                    finally:
                        
                        if self.data_upload_running==False:
                            break
                        time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception avc_data_uploading: {str(e)}")
            finally:
                if self.data_upload_running==False:
                    break
                time.sleep(self.timeout)

    def update_lane_avc(self,data):
        try:
            if data["LaneTransactionId"]!='':
                lane_data=LaneManager.lane_update_avc(self.dbConnectionObj,data)
                if lane_data and len(lane_data)>0:
                    endpoint = 'Softomation/FTH-TMS-RSD/LaneTranscationInsert'
                    api_url = f"{self.api_base_url}{endpoint}"
                    res=self.upload_data(api_url,lane_data[0])
        except Exception as e:
                self.logger.logError(f"Exception update_lane_avc: {str(e)}")

    
    def wim_data_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/WimTransactionInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_WimTransactionPending')
                for s in result_data:
                    if self.data_upload_running==False:
                        break
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.wim_data_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception wim_data_uploading child: {str(e)}")
                    finally:
                        if self.data_upload_running==False:
                            break
                        time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception wim_data_uploading: {str(e)}")
            finally:
                if self.data_upload_running==False:
                    break
                time.sleep(self.timeout)

    def wim_details_uploading(self):
        endpoint = 'Softomation/FTH-TMS-RSD/WimTransactionAxleDetailsInsert'
        api_url = f"{self.api_base_url}{endpoint}"
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_WimTransactionAxleDetailsPending')
                for s in result_data:
                    if self.data_upload_running==False:
                        break
                    try:
                        res=self.upload_data(api_url,s)
                        if res:
                            LaneManager.wim_details_marked(self.dbConnectionObj,s)
                    except Exception as e:
                        self.logger.logError(f"Exception wim_details_uploading child: {str(e)}")
                    finally:
                        if self.data_upload_running==False:
                            break
                        time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception wim_details_uploading: {str(e)}")
            finally:
                if self.data_upload_running==False:
                    break
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
                self.logger.logError(f"Exception upload_data: {str(e)}")
        finally:
            return result

    def stop(self):
        try:
            self.is_running = False
            self.data_upload_running = False
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")