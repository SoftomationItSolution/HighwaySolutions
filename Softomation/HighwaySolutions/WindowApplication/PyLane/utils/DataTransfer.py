import os
import threading
import time
from models.DataImporter import DataImporter
from utils.log_master import CustomLogger

class DataSynchronization(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj,default_plaza_Id,system_ip,timeout=0.100):
        threading.Thread.__init__(self)
        self.logger = CustomLogger(default_directory,'data_import')
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_ip=system_ip
        self.project_config_path = os.path.join(default_directory, 'MasterConfig', 'ProjectConfiguration.json')
        self.is_running=True
        self.timeout=timeout
        self.data_upload_running=False
        self.set_logger(default_directory)
        self.data_impoter(default_directory)
        
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="PingThread"
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
                    continuous_push_thread = threading.Thread(target=self.lane_data_uploading)
                    continuous_push_thread.start()
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
        while self.data_upload_running:
            try:
                result_data = self.dbConnectionObj.execute_procedure('USP_LaneTransactionPending')
                for s in result_data:
                    print(s)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} lane_data_uploading: {str(e)}")
            finally:
                time.sleep(self.timeout)

    def stop(self):
        try:
            self.is_running = False
            self.data_upload_running = False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_data_uploading: {str(e)}")