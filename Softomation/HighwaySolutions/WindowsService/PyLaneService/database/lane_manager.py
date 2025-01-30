from utils.constants import Utilities


class LaneManager:
    @staticmethod
    def GetUserByLoginId(dbConnectionObj, LoginId):
        try:
            params = [LoginId]
            resultData = dbConnectionObj.execute_procedure('USP_UsersGetByLoginId', params)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod
    def GetLatestLaneTransaction(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_LaneTransactionGetLatest', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod  
    def GetLaneDetails(dbConnectionObj,LaneId,current_date):
        try:
            
            params = [LaneId,current_date]
            resultData = dbConnectionObj.get_dataset_from_procedure('USP_GetLaneDetails', params)
            return resultData
        except Exception as e:
            raise e  
        
    @staticmethod
    def lane_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"],d["JourneyId"],d["PlazaId"],d["LaneId"],d["ShiftId"],d["TransactionTypeId"],
                    d["PaymentTypeId"],d["ExemptTypeId"],d["ExemptSubTypeId"],d["VehicleClassId"],d["VehicleSubClassId"],
                    d["VehicleAvcClassId"],d["PlateNumber"],d["RCTNumber"],d["TagEPC"],d["TagClassId"],d["TagPlateNumber"],
                    Utilities.json_dt_mysql_dt(d["TagReadDateTime"]),d["TagReadCount"],d["TagReadById"],d["PermissibleVehicleWeight"],
                    d["ActualVehicleWeight"],d["IsOverWeightCharged"],d["OverWeightAmount"],d["TagPenaltyAmount"],
                    d["TransactionAmount"],Utilities.json_dt_mysql_dt(d["TransactionDateTime"]),d["TransactionFrontImage"],
                    d["TransactionBackImage"],d["TransactionAvcImage"],d["TransactionVideo"],d["ExemptionProofImage"],
                    d["UserId"],d["LoginId"],d["IsReturnJourney"],d["IsExcessJourney"],d["IsBarrierAutoClose"],d["IsTowVehicle"],
                    d["IsFleetTranscation"],d["FleetCount"],d["TCRemark"]]
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def lane_data_ic_update(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"],d["TransactionBackImage"],d["TransactionVideo"]]
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionUpdateIC', params)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod
    def lane_data_pending(dbConnectionObj):
        try:
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionPending', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def lane_data_marked(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"]]
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionMarkedTransfer', params)
            return resultData
        except Exception as e:
            raise e
        
    @staticmethod
    def lane_media_pending(dbConnectionObj):
        try:
            resultData=dbConnectionObj.execute_procedure('USP_LaneMediaPending', None)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod
    def lane_media_marked(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"]]
            resultData=dbConnectionObj.execute_procedure('USP_LaneMediaMarkedTransfer', params)
            return resultData
        except Exception as e:
            raise e

    @staticmethod    
    def wim_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionId"],d["TotalWeight"],d['AxleCount'],d['IsReverseDirection'],
                    Utilities.json_dt_mysql_dt(d["TransactionDateTime"])]
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod    
    def wim_details_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionId"],d["AxleNumber"],d['AxleWeight'],
                    d["Speed"],d["AxleDistance"]]
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionAxleDetailsInsert', params)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod
    def wim_data_pending(dbConnectionObj):
        try:
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionPending', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def wim_data_marked(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionId"],True]
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionMarkedTransfer', params)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def wim_details_pending(dbConnectionObj):
        try:
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionAxleDetailsPending', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def wim_details_marked(dbConnectionObj,d):
        try:
            params=[d["Id"],True]
            resultData=dbConnectionObj.execute_procedure('USP_WimTransactionAxleDetailsMarkedTransfer', params)
            return resultData
        except Exception as e:
            raise e

    @staticmethod    
    def avc_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionCount"],d["AvcSensorClassId"],d["AvcClassId"],d['AxleCount'],d['IsReverseDirection'],
                    d["WheelBase"],d["ImageName"],Utilities.json_dt_mysql_dt(d["TransactionDateTime"]),d["LaneTransactionId"]]
            resultData=dbConnectionObj.execute_procedure('USP_AvcTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e
    
    @staticmethod
    def avc_data_pending(dbConnectionObj):
        try:
            resultData=dbConnectionObj.execute_procedure('USP_AvcTransactionPending', None)
            return resultData
        except Exception as e:
            raise e
        
    @staticmethod
    def avc_data_marked(dbConnectionObj,d,data_status,media_status):
        try:
            params=[d["Id"],data_status,media_status]
            resultData=dbConnectionObj.execute_procedure('USP_AvcTransactionMarkedTransfer', params)
            return resultData
        except Exception as e:
            raise e
        
    @staticmethod
    def lane_update_avc(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"],d['AvcClassId'],d['ImageName']]
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionUpdateAVC', params)
            return resultData
        except Exception as e:
            raise e
    
    # @staticmethod
    # def lane_data_avc_update(dbConnectionObj,d):
    #     try:
    #         params=[d["LaneTransactionId"],d["VehicleAvcClassId"],
    #                 d["TransactionAvcImage"]]
    #         resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionUpdateAVC', params)
    #         return resultData
    #     except Exception as e:
    #         raise e
        
    # @staticmethod
    # def lane_data_lpic_update(dbConnectionObj,d):
    #     try:
    #         params=[d["LaneTransactionId"],d["TransactionFrontImage"]]
    #         resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionUpdateLpic', params)
    #         return resultData
    #     except Exception as e:
    #         raise e
        
    # @staticmethod
    # def GetLaneTransactionPending(dbConnectionObj):
    #     try:
    #         resultData = dbConnectionObj.execute_procedure('USP_LaneTransactionPending', None)
    #         return resultData
    #     except Exception as e:
    #         raise e    