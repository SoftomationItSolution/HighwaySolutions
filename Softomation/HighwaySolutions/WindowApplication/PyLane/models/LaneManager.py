from utils.constants import Utilities


class LaneManager:
    @staticmethod
    def lane_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneTransactionId"],d["SystemIntegratorId"],
                    d["JourneyId"],d["PlazaId"],d["LaneId"],
                    d["LaneStatusId"],d["LaneModeId"],d["LaneDirectionId"],
                    d["ShiftId"],d["TransactionTypeId"],d["PaymentTypeId"],
                    d["ExemptTypeId"],d["ExemptSubTypeId"],d["VehicleClassId"],
                    d["VehicleSubClassId"],d["VehicleAvcClassId"],d["PlateNumber"],
                    d["RCTNumber"],d["TagEPC"],d["TagClassId"],d["TagPlateNumber"],
                    Utilities.json_dt_mysql_dt(d["TagReadDateTime"]),d["TagReadCount"],d["IsReadByReader"],
                    d["PermissibleVehicleWeight"],d["ActualVehicleWeight"],
                    d["IsOverWeightCharged"],d["OverWeightAmount"],
                    d["TagPenaltyAmount"],d["TransactionAmount"],
                    Utilities.json_dt_mysql_dt(d["TransactionDateTime"]),
                    d["TransactionFrontImage"],d["TransactionBackImage"],
                    d["TransactionAvcImage"],d["TransactionVideo"],d["ExemptionProofImage"],
                    d["DestinationPlazaId"],d["UserId"],d["LoginId"],d["IsReturnJourney"],
                    d["IsExcessJourney"],d["IsBarrierAutoClose"],d["IsTowVehicle"],
                    d["IsFleetTranscation"],d["FleetCount"]]
            resultData=dbConnectionObj.execute_procedure('USP_LaneTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e
        
    @staticmethod
    def GetLaneTransactionPending(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_LaneTransactionPending', None)
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
    def wim_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionId"],d["TotalWeight"],d['AxleCount'],
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
    def avc_data_insert(dbConnectionObj,d):
        try:
            params=[d["LaneId"],d["TransactionCount"],d["AvcClassId"],d['AxleCount'],d['IsReverseDirection'],
                    d["WheelBase"],Utilities.json_dt_mysql_dt(d["TransactionDateTime"])]
            resultData=dbConnectionObj.execute_procedure('USP_AvcTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e