import threading
import time
from models.DataImporter import DataImporter
from utils.log_master import CustomLogger

class DataSynchronization(threading.Thread):
    def __init__(self, config_manager, dbConnectionObj,default_plaza_Id,system_ip,timeout=0.100):
        threading.Thread.__init__(self)
        self.logger = CustomLogger('data_import')
        self.config_manager = config_manager
        self.dbConnectionObj = dbConnectionObj
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_ip=system_ip
        self.project_config_path = config_manager.get_path('Paths', 'pc_dir')
        self.is_running=True
        self.timeout=timeout
        self.data_upload_running=False
        self.data_importer = DataImporter(self.config_manager, dbConnectionObj,self.logger,self.default_plaza_Id,self.default_lane_ip)

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
            self.logger.logError(f"Error fetching or storing data: {e}")
    

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
            self.logger.logError(f"Error fetching or storing data: {e}")

    def run(self):
        last_call_time = time.time()-22600
        while self.is_running:
            try:
                if self.data_upload_running==False:
                    continuous_push_thread = threading.Thread(target=self.data_uploading)
                    continuous_push_thread.start()
                    self.data_upload_running=True
                    
                current_time = time.time()
                if current_time - last_call_time >= 21600:
                    self.fetch_and_store_master_data()
                    self.fetch_and_store_data()
                    last_call_time = current_time
            except Exception as e:
                self.logger.logError("Exception occurred: {}".format(str(e)))
            finally:
                time.sleep(self.timeout)

    def data_uploading(self):
        while self.is_running:
            try:
                pass
            except Exception as e:
                self.logger.logError("Exception occurred: {}".format(str(e)))
            finally:
                time.sleep(self.timeout)

    def stop(self):
        self.is_running = False