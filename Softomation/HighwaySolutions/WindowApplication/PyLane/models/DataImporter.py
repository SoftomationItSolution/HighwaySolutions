import json
import os
import requests

from utils.constants import Utilities
from utils.crypt import encrypt_aes_256_cbc
from datetime import date, timedelta

class DataImporter:
    def __init__(self, config_manager,dbConnectionObj,logger,default_plaza_Id,default_lane_ip):
        self.api_base_url = config_manager.get_setting('Settings', 'plaza_api')
        self.dbConnectionObj = dbConnectionObj
        self.logger = logger
        self.default_lane_ip=default_lane_ip
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_Id=0
        self.headers = {'User-Agent': 'MyApp/1.0'}

    def import_data_list(self, endpoint, params, procedure_name):
        try:
            api_url = f"{self.api_base_url}{endpoint}"
            response = requests.get(api_url, headers=self.headers, verify=False)
            if response.status_code == 200:
                data = response.json()
                data = data["ResponseData"]
                for d in data:
                    result_data = self.dbConnectionObj.execute_procedure(procedure_name, params(d))
                    self.logger.logInfo(result_data)
            else:
                self.logger.logError(f"Error:{endpoint} {response.status_code} - {response.text}")
                return 0
        except Exception as e:
            self.logger.logError(f"Error fetching or storing data:{endpoint} {e}")
            return 0
        
    def import_data(self, endpoint, params, procedure_name):
        try:
            api_url = f"{self.api_base_url}{endpoint}"
            response = requests.get(api_url, headers=self.headers, verify=False)
            if response.status_code == 200:
                data = response.json()
                d=data["ResponseData"]
                result_data = self.dbConnectionObj.execute_procedure(procedure_name, params(d))
                self.logger.logInfo(result_data)
                return d
            else:
                self.logger.logError(f"Error:{endpoint} {response.status_code} - {response.text}")
                return None
        except Exception as e:
            self.logger.logError(f"Error fetching or storing data:{endpoint} {e}")
            return None

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
                            d['FasTagPenalty'],d['OverweightPenalty']]
                        resultData1=self.dbConnectionObj.execute_procedure('USP_TollFareConfigurationInsertUpdate', params)
                        self.logger.logInfo(resultData1)
                self.logger.logInfo(resultData)
            else:
                self.logger.logError(f"Error:{endpoint} {response.status_code} - {response.text}")
                return None
        except Exception as e:
            self.logger.logError(f"Error fetching or storing data:{endpoint} {e}")
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
        endpoint = 'Softomation/FTH-TMS-RSD/ProjectConfigGet'
        self.fetch_and_save_json(endpoint,file_path)


    def lane_mode_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneModeMasterGetAll'
        params = lambda d: [d['LaneModeId'], d['LaneModeName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LaneModeInsertUpdate')

    def lane_type_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneTypeMasterGetAll'
        params = lambda d: [d['LaneTypeId'], d['LaneTypeName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LaneTypeInsertUpdate')

    def lane_direction_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneDirectionMasterGetAll'
        params = lambda d: [d['LaneDirectionId'], d['LaneDirectionName'],d['LaneDirectionCode'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LaneDirectionInsertUpdate')

    def lane_point_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LanePointMasterGetAll'
        params = lambda d: [d['LanePointId'], d['LanePointName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LanePointInsertUpdate')

    def lane_position_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LanePositionMasterGetAll'
        params = lambda d: [d['LanePositionId'], d['LanePositionName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LanePositionInsertUpdate')

    def lane_status_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneStatusMasterGetAll'
        params = lambda d: [d['LaneStatusId'], d['LaneStatusName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_LaneStatusInsertUpdate')

    def data_status_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/DataStatusMasterGetAll'
        params = lambda d: [d['DataStatusId'], d['DataStatusName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_DataStatusInsertUpdate')
    
    def transaction_type_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/TransactionTypeDetails'
        params = lambda d: [d['TransactionTypeId'], d['TransactionTypeName'],d['ReviewRequired'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_TransactionTypeMasterInsertUpdate')

    def payment_type_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/PaymentMethodTypeDetails'
        params = lambda d: [d['PaymentTypeId'],d['PaymentTypeName'],d['TransactionTypeId'],
                           d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_PaymentTypeMasterInsertUpdate')

    def exempt_type_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/ExemptTypeDetails'
        params = lambda d: [d['ExemptTypeId'],d['ExemptTypeName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_ExemptTypeMasterInsertUpdate')

    def shift_timing_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/ShiftTimingDetails'
        params = lambda d: [d['ShiftId'],d['StartTimmng'],d['EndTimming'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_ShiftTiminingInsertUpdate')

    def denomination_type_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/DenominationDetails'
        params = lambda d: [d['DenominationId'],d['DenominationValue'],d['OrderBy'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_DenominationMasterInsertUpdate')

    def equipment_type_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/EquipmentTypeDetails'
        params = lambda d: [d['EquipmentTypeId'],d['EquipmentTypeName'],d['EquipmentIconName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_EquipmentTypeMasterInsertUpdate')
    
    def protocol_type_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/ProtocolTypeMasterGetAll'
        params = lambda d: [d['ProtocolTypeId'],d['ProtocolTypeName'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_ProtocolTypeMasterInsertUpdate')

    def manufacturer_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/ManufacturerGetAll'
        params = lambda d: [d['ManufacturerId'],d['Name'],d['Address'],d['MobileNumber'],d['EmailId'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_ManufacturerInsertUpdate')

    def fasTag_vehicleclass_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/FasTagVehicleClassDetails'
        params = lambda d: [d['FasTagVehicleClassId'],d['FasTagVehicleClassName'],d['FasTagVehicleClassDescription'],
                            d['PermissibleWeight'],d['AxcelCount'],d['VehicleHeight'],d['VehicleLength'],d['FasTagVehicleClassColor'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_FasTagVehicleClassInsertUpdate')

    def system_vehicleclass_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/SystemVehicleClassDetails'
        params = lambda d: [d['SystemVehicleClassId'],d['FasTagVehicleClassId'],d['AvcVehicleClassId'],
                            d['SystemVehicleClassName'],d['SystemVehicleClassDescription'],
                            d['SystemSubClassIds'],d['PermissibleWeight'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_SystemVehicleClassInsertUpdate')

    def system_vehicle_subclass_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/SystemVehicleSubClassDetails'
        params = lambda d: [d['SystemVehicleClassId'],d['SystemSubClassId'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_SystemVehicleSubClassInsertUpdate')

    def users_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/UserDetails'
        params = lambda d: [d['UserId'],d['LoginId'],
                            encrypt_aes_256_cbc(d['LoginPasswordPlan']),
                            d['FirstName'],d['LastName'],d['EmailId'],d['MobileNumber'],
                            Utilities.json_dt_mysql_d(d['AccountExpiredDate']),
                            d['PlazaId'],d['UserTypeId'],d['RoleId'],d['DataStatus'], 
                            Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], 
                            Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), 
                            d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_UserMasterInsertUpdate')
    
    def system_integrator_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/SystemIntegratorGetAll'
        params = lambda d: [d['SystemIntegratorId'],d['Name'],d['Address'],d['MobileNumber'],d['EmailId'],
                            d['LoginId'],d['Password'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_SystemIntegratorInsertUpdate')
    
    def system_setting_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/SystemSettingGet'
        params = lambda d: [d['DefaultPlazaId'],d['AllotmentDays'],d['IsAccessControl'],d['CashPenalty'],d['LoginAccess'],
                            d['ExemptAccess'],d['FleetAccess'],d['SubClassRequired'],d['OpeningBalance'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        data=self.import_data(endpoint, params, 'USP_SystemSettingInsertUpdate')
        if data is not None:
            self.default_plaza_Id=data['DefaultPlazaId']

    def plaza_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/PlazaDetails?PlazaId='+str(self.default_plaza_Id)
        params = lambda d: [d['PlazaId'],d['SystemIntegratorId'],d['PlazaName'],d['PlazaTypeId'],d['PlazaServerIpAddress'],
                            d['PlazaZoneId'],d['ChainageNumber'],d['Latitude'],d['Longitude'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data(endpoint, params, 'USP_PlazaInsertUpdate')

    def lane_import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/LaneDetails?IpAddress=' + self.default_lane_ip
        params = lambda d: [d['LaneId'], d['PlazaId'], d['LaneNumber'], d['LaneName'], d['LaneTypeId'], d['LaneStatusId'],
                            d['LanePointId'], d['LaneDirectionId'], d['LaneStatusId'], d['LaneModeId'], d['LaneSystemIpAddress'],
                            d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        data=self.import_data(endpoint, params, 'USP_LaneInsertUpdate')
        if data is not None:
            self.default_lane_Id=data['LaneId']

    def equipments_Import(self):
        endpoint = 'Softomation/FTH-TMS-RSD/EquipmentDetails?LaneId='+str(self.default_lane_Id)
        params = lambda d: [d['EquipmentId'],d['PlazaId'],d['LaneId'],d['EquipmentTypeId'],d['EquipmentName'],
                        d['ProtocolTypeId'],d['IpAddress'], d['PortNumber'],d['LoginId'],d['LoginPassword'],
                        d['ManufacturerId'], d['MacAddress'],d['ModelNumber'],d['SerialNumber'],
                        d['ManufacturerDate'][:10], 
                        d['PurchageDate'][:10],
                        d['WarrantyExpireDate'][:10],
                        d['UrlAddress'],
                        d['DataStatus'], Utilities.json_dt_mysql_dt_import(d['CreatedDate']), 
                            d['CreatedBy'], Utilities.json_dt_mysql_dt_import(d['ModifiedDate']), d['ModifiedBy']]
        self.import_data_list(endpoint, params, 'USP_EquipmentDetailsInsertUpdate')
    
    def toll_fare_Import(self):
        current_date=Utilities.JsonDateFormat()
        endpoint = 'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+current_date
        self.import_fare_data(endpoint)

    def toll_fare_Future_Import(self):
        current_date = date.today()
        new_date = current_date + timedelta(days=1)
        new_date=Utilities.JsonDateFormat(new_date)
        endpoint = 'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+new_date
        self.import_fare_data(endpoint)

    




    