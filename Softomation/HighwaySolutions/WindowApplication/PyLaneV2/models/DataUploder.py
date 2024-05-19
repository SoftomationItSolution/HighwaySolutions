import time
from models.LaneManager import LaneManager
from utils.constants import Utilities
from datetime import date

class DataUploder:
    def __init__(self, default_directory,dbConnectionObj,logger,default_plaza_Id,default_lane_ip):
        self.api_base_url = default_directory.get_setting('Settings', 'plaza_api')
        self.dbConnectionObj = dbConnectionObj
        self.logger = logger
        self.default_lane_ip=default_lane_ip
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_Id=0
        self.headers = {'User-Agent': 'MyApp/1.0'}
        self.is_running=True

    
    def upload_lane_transtions(self):
          while self.is_running:
            try:
                api_url = f"{self.api_base_url}"
                data=LaneManager.GetLaneTransactionPending(self.dbConnectionObj)
                if data is not None:
                    for d in date:
                        try:
                          result= Utilities.upload_data_api(api_url, d)
                          self.logger.logInfo("lane_upload_data_api updated: {}".format(str(d["LaneTransactionId"])))
                          if result is not None and result== True:
                            try:
                                LaneManager.lane_data_marked(self.dbConnectionObj,d)
                            except Exception as e:
                                self.logger.logError("Exception occurred in lane_data_marked: {}".format(str(e)))  
                        except Exception as e:
                            self.logger.logError("Exception occurred in lane_upload_data_api: {}".format(str(e)))
                         
            except Exception as e:
                self.logger.logError("Exception occurred in upload_lane_transtions: {}".format(str(e)))
            finally:
                time.sleep(self.timeout)