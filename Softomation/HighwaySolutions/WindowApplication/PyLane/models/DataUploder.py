import json
import os
import requests
from utils.constants import Utilities
from utils.crypt import encrypt_aes_256_cbc
from datetime import date, timedelta

class DataUploder:
    def __init__(self, config_manager,dbConnectionObj,logger,default_plaza_Id,default_lane_ip):
        self.api_base_url = config_manager.get_setting('Settings', 'plaza_api')
        self.dbConnectionObj = dbConnectionObj
        self.logger = logger
        self.default_lane_ip=default_lane_ip
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_Id=0
        self.headers = {'User-Agent': 'MyApp/1.0'}
    pass

    def upload_data_api(self, endpoint,data):
        try:
            api_url = f"{self.api_base_url}{endpoint}"
            headers = {'Content-Type': 'application/json'}
            response = requests.post(api_url, json=data, headers=headers)
            if response.status_code == 200:
                return True
            else:
                self.logger.logError(f"Failed to push data to API{endpoint}. Status code: {response.status_code}")
                return False
        except Exception as e:
            self.logger.logError(f"Error fetching or storing data:{endpoint} {e}")
            return None