import json
import os
import threading
import requests
from log.log_master import CustomLogger
from utils.constants import Utilities
from datetime import date, timedelta

from utils.crypt import CryptoUtils
#from utils.crypt import CryptoUtils


class DataImporter:
    def __init__(self, default_directory,dbConnectionObj,default_plaza_Id,default_lane_ip):
        self.dbConnectionObj = dbConnectionObj
        self.classname="DataImporter"
        self.default_lane_ip=default_lane_ip
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_Id=0
        self.headers = {'User-Agent': 'MyApp/1.0'}
        self.set_logger(default_directory,"data_import")
        self.get_plaza_url(default_directory)
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def get_plaza_url(self,default_directory):
        try:
            plaza_config_path=os.path.join(default_directory, 'MasterConfig', 'plazaConfig.json')
            plaza_config = Utilities.read_json_file(plaza_config_path)
            self.api_base_url=plaza_config["plaza_api_p"]
        except Exception as e:
            self.logger.logError(f"Exception get_plaza_url: {str(e)}")

    
    

    def import_fare_data(self, endpoint):
        try:
            api_url = f"{self.api_base_url}{endpoint}"
            response = requests.get(api_url, headers=self.headers, verify=False)
            if response.status_code == 200:
                data = response.json()
                data=data["ResponseData"]
                params=[data['TollFareId'],Utilities.json_dt_mysql_dt_import(data['EffectedFrom']),data['DataStatus'], 
                        Utilities.json_dt_mysql_dt_import(data['CreatedDate']),data['CreatedBy'], 
                        Utilities.json_dt_mysql_dt_import(data['ModifiedDate']), data['ModifiedBy']]
                resultData=self.dbConnectionObj.execute_procedure('USP_TollFareMasterInsertUpdate', params)
                if resultData[0]['AlertMessage'] != 'Cannot update toll fare. EffectedFrom must be greater than the current date;':
                    for d in data['TollFareConfigurations']:
                        params=[d['TollFareId'],d['JourneyId'],d['SystemVehicleClassId'],d['SubVehicleClassId'],d['TollFare'],d['ReturnFare'],
                            d['FasTagPenalty'],d['OverweightPenalty'],d['MonthlyPass']]
                        resultData1=self.dbConnectionObj.execute_procedure('USP_TollFareConfigurationInsertUpdate', params)
                        self.logger.logInfo(resultData1)
                self.logger.logInfo(resultData)
            else:
                self.logger.logError(f"Error:{endpoint} {response.status_code} - {response.text}")
                return None
        except Exception as e:
            self.logger.logError(f"Exception  import_fare_data: {str(e)}")
            return None

    def fetch_and_save_json(self, endpoint,file_path):
        api_url = f"{self.api_base_url}{endpoint}"
        response = requests.get(api_url, headers=self.headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            d=data["ResponseData"]
            if os.path.exists(file_path):
                with open(file_path, 'w') as file:
                    json.dump(d, file, indent=4)
                self.logger.logInfo(f"File '{file_path}' updated successfully.")
            else:
                with open(file_path, 'w') as file:
                    json.dump(d, file, indent=4)
                self.logger.logInfo(f"File '{file_path}' created and JSON data saved successfully.")
        else:
            self.logger.logError(f"Failed to fetch data from API. Status code: {response.status_code}")
    

    def project_config_import(self,file_path):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/ProjectConfigGet'
            self.fetch_and_save_json(endpoint,file_path)
        except Exception as e:
            self.logger.logError(f"Exception project_config_import: {str(e)}")
        
    
    def transaction_type_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/TransactionTypeDetails'
            self.import_data_list(endpoint, 'USP_TransactionTypeMasterInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception transaction_type_import: {str(e)}")

    def payment_type_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/PaymentMethodTypeDetails'
            self.import_data_list(endpoint, 'USP_PaymentTypeMasterInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception payment_type_import: {str(e)}")

    def exempt_type_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/ExemptTypeDetails'
            self.import_data_list(endpoint, 'USP_ExemptTypeMasterInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception exempt_type_import: {str(e)}")

    def shift_timing_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/ShiftTimingDetails'
            self.import_data_list(endpoint, 'USP_ShiftTiminingInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception shift_timing_import: {str(e)}")

    def denomination_type_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/DenominationDetails'
            self.import_data_list(endpoint, 'USP_DenominationMasterInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception denomination_type_Import: {str(e)}")

    def equipment_type_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/EquipmentTypeDetails'
            self.import_data_list(endpoint, 'USP_EquipmentTypeMasterInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception equipment_type_Import: {str(e)}")
    
    def manufacturer_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/ManufacturerGetAll'
            self.import_data_list(endpoint, 'USP_ManufacturerInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception manufacturer_Import: {str(e)}")
    
    def key_board_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/KeyboardDetailGetAll'
            self.import_data_list(endpoint, 'USP_KeyboardDetailsInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception key_board_Import: {str(e)}")

    def fasTag_vehicleclass_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/FasTagVehicleClassDetails'
            self.import_data_list(endpoint, 'USP_FasTagVehicleClassInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception fasTag_vehicleclass_Import: {str(e)}")

    def system_vehicleclass_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/SystemVehicleClassDetails'
            self.import_data_list(endpoint, 'USP_SystemVehicleClassInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception system_vehicleclass_Import: {str(e)}")

    def system_vehicle_subclass_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/SystemVehicleSubClassDetails'
            self.import_data_list(endpoint, 'USP_SystemVehicleSubClassInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception system_vehicle_subclass_Import: {str(e)}")
    
    def system_setting_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/SystemSettingGet'
            data=self.import_data_list(endpoint, 'USP_SystemSettingInsertUpdate')
            if data is not None:
                self.default_plaza_Id=data['DefaultPlazaId']
                threading.Thread(target=self.plaza_import()).start()
        except Exception as e:
            self.logger.logError(f"Exception system_setting_Import: {str(e)}")

    def plaza_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/PlazaDetails?PlazaId='+str(self.default_plaza_Id)
            self.import_data_list(endpoint, 'USP_PlazaInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception plaza_import: {str(e)}")

    def lane_import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/LaneDetails?IpAddress=' + self.default_lane_ip
            data=self.import_data_list(endpoint, 'USP_LaneInsertUpdate')
            if data is not None:
                self.default_lane_Id=data['LaneId']
                threading.Thread(target=self.equipments_Import()).start()
        except Exception as e:
            self.logger.logError(f"Exception lane_import: {str(e)}")

    def equipments_Import(self):
        try:
            if self.default_lane_Id is not None:
                endpoint = 'Softomation/FTH-TMS-RSD/EquipmentDetails?LaneId='+str(self.default_lane_Id)
                self.import_data_list(endpoint, 'USP_EquipmentDetailsInsertUpdate')
        except Exception as e:
            self.logger.logError(f"Exception equipments_Import: {str(e)}")
    def users_Import(self):
        try:
            endpoint = 'Softomation/FTH-TMS-RSD/UserDetails'
            self.import_data_list(endpoint,'USP_UserMasterInsertUpdate',True)
        except Exception as e:
            self.logger.logError(f"Exception users_Import: {str(e)}")
    
    def toll_fare_Import(self):
        try:
            current_date=Utilities.JsonDateFormat()
            endpoint = 'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+current_date
            self.import_data_list(endpoint,"USP_TollFareMasterInsertUpdate")
        except Exception as e:
            self.logger.logError(f"Exception toll_fare_Import: {str(e)}")

    def toll_fare_Future_Import(self):
        try:
            current_date = date.today()
            new_date = current_date + timedelta(days=1)
            new_date=Utilities.JsonDateFormat(new_date)
            endpoint = 'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+new_date
            self.import_data_list(endpoint,"USP_TollFareMasterInsertUpdate")
        except Exception as e:
            self.logger.logError(f"Exception toll_fare_Future_Import: {str(e)}")
    
        
    def import_data_list(self, endpoint, procedure_name,encrypt=False):
        try:
            api_url = f"{self.api_base_url}{endpoint}"
            response = requests.get(api_url, headers=self.headers, verify=False)
            if response.status_code == 200:
                data = response.json()
                data = data["ResponseData"]
                if encrypt:
                    data = list(map(lambda x: {**x, 'LoginPassword': CryptoUtils.encrypt_aes_256_cbc(x['LoginPasswordPlan'])}, data))
                result_data = self.dbConnectionObj.execute_procedure(procedure_name, [json.dumps(data)])
                return result_data
            else:
                self.logger.logError(f"Error:{endpoint} {response.status_code} - {response.text}")
                return None
        except Exception as e:
            self.logger.logError(f"Exception import_data_list: {str(e)}")
            return None