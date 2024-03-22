class CommonManager:
    def __init__(self, db_instance):
        self.db_instance = db_instance

    def GetSystemSetting(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_SystemSettingGet', None)
            if len(resultData) > 0:
                return resultData[0]
            else:
                return resultData
        except Exception as e:
            raise e

    def GetShiftTimining(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_ShiftTiminingGetAll', None)
            return resultData
        except Exception as e:
            raise e

    def GetTransactionType(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_TransactionTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    def GetExemptType(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_ExemptTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    def GetPaymentType(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_PaymentTypeGetAll', None)
            return resultData
        except Exception as e:
            raise e

    def GetsystemVehicleClass(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_SystemVehicleClassGet', None)
            return resultData
        except Exception as e:
            raise e

    def GetsystemVehicleSubClass(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_SystemVehicleSubClassGet', None)
            return resultData
        except Exception as e:
            raise e

    def GetUserByLoginId(self, LoginId):
        try:
            params = [LoginId]
            resultData = self.db_instance.execute_procedure('USP_UsersGetByLoginId', params)
            return resultData
        except Exception as e:
            raise e

    def GetTollfare(self, EffectedFrom):
        try:
            params = [EffectedFrom]
            resultData = self.db_instance.execute_procedure('USP_TollFareGetByEffectedFrom', params)
            return resultData
        except Exception as e:
            raise e

    def GetLaneDetails(self, LaneIp):
        try:
            params = [LaneIp]
            resultData = self.db_instance.execute_procedure('USP_LaneGetbyIpAddress', params)
            return resultData
        except Exception as e:
            raise e

    def GetEquipmentDetails(self, LaneId):
        try:
            params = [LaneId]
            resultData = self.db_instance.execute_procedure('USP_EquipmentDetailsGetByLaneId', params)
            return resultData
        except Exception as e:
            raise e
        
    def GetLatestLaneTransaction(self):
        try:
            resultData = self.db_instance.execute_procedure('USP_LaneTransactionGetLatest', None)
            return resultData
        except Exception as e:
            raise e
