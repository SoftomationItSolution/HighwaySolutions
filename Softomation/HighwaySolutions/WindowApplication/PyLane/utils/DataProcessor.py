from MySQLdb import DatabaseError
import requests

class DataProcessor:
    def __init__(self, api_base_url, db, logger):
        self.api_base_url = api_base_url
        self.db = db
        self.logger = logger

    def system_setting_import(self):
        try:
            headers = {'User-Agent': 'MyApp/1.0'}
            api_url = f'{self.api_base_url}Softomation/FTH-TMS-RSD/SystemSettingGet'
            response = requests.get(api_url, headers=headers, verify=False)
            response.raise_for_status()  # Raise an exception for HTTP errors
            data = response.json()["ResponseData"]
            params = [data[key] for key in ['DefaultPlazaId', 'AllotmentDays', 'IsAccessControl', 'CashPenalty', 
                                             'LoginAccess', 'ExemptAccess', 'FleetAccess', 'SubClassRequired', 
                                             'OpeningBalance', 'DataStatus', 'CreatedDate', 'CreatedBy', 
                                             'ModifiedDate', 'ModifiedBy']]
            result_data = self.db.execute_procedure('USP_SystemSettingInsertUpdate', params)
            self.logger.info(f"System setting imported successfully: {result_data}")
            return data['DefaultPlazaId']
        except requests.RequestException as e:
            self.logger.error(f"Error fetching data from API: {e}")
        except DatabaseError as e:
            self.logger.error(f"Error executing stored procedure: {e}")
        except Exception as e:
            self.logger.error(f"Unhandled error: {e}")
