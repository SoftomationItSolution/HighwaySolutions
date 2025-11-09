class CommonManager:
    @staticmethod
    def GetSystemSetting(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_SystemSettingGet', None)
            if len(resultData) > 0:
                return resultData[0]
            else:
                return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetShiftTimining(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_ShiftTiminingGetAll', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetTransactionType(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_TransactionTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetExemptType(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_ExemptTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetPaymentType(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_PaymentTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetsystemVehicleClass(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_SystemVehicleClassGet', None)
            return resultData
        except Exception as e:
            raise e

    @staticmethod
    def GetsystemVehicleSubClass(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_SystemVehicleSubClassGet', None)
            return resultData
        except Exception as e:
            raise e

    

    @staticmethod
    def GetTollfare(dbConnectionObj, EffectedFrom):
        try:
            params = [EffectedFrom]
            resultData = dbConnectionObj.execute_procedure('USP_TollFareGetByEffectedFrom', params)
            return resultData
        except Exception as e:
            raise e

        
   
        
    
        
   
        
    @staticmethod
    def GetDenominationMaster(dbConnectionObj):
        try:
            resultData = dbConnectionObj.execute_procedure('USP_GetDenominationMaster', None)
            return resultData
        except Exception as e:
            raise e
        
    @staticmethod
    def GetLaneTransactionCount(dbConnectionObj, ShiftId,TransactionDate):
        try:
            params = [ShiftId,TransactionDate]
            resultData = dbConnectionObj.execute_procedure('USP_GetLaneTransactionCount', params)
            if len(resultData)>0:
                return resultData[0]["LaneTransactionCount"]
            else:
                return 0
        except Exception as e:
            raise e