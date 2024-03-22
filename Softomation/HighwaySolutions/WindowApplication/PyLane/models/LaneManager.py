from utils.constants import JsonDT_mySqlDT


class LaneManager:
    def __init__(self, db_instance):
        self.db_instance = db_instance

    def lane_data_insert(self,d):
        try:
            params=[d["LaneTransactionId"],d["SystemIntegratorId"],
                    d["JourneyId"],d["PlazaId"],d["LaneId"],
                    d["LaneStatusId"],d["LaneModeId"],d["LaneDirectionId"],
                    d["ShiftId"],d["TransactionTypeId"],d["PaymentTypeId"],
                    d["ExemptTypeId"],d["ExemptSubTypeId"],d["VehicleClassId"],
                    d["VehicleSubClassId"],d["VehicleAvcClassId"],d["PlateNumber"],
                    d["RCTNumber"],d["TagEPC"],d["TagClassId"],d["TagPlateNumber"],
                    JsonDT_mySqlDT(d["TagReadDateTime"]),d["TagReadCount"],d["IsReadByReader"],
                    d["PermissibleVehicleWeight"],d["ActualVehicleWeight"],
                    d["IsOverWeightCharged"],d["OverWeightAmount"],
                    d["TagPenaltyAmount"],d["TransactionAmount"],
                    JsonDT_mySqlDT(d["TransactionDateTime"]),
                    d["TransactionFrontImage"],d["TransactionBackImage"],
                    d["TransactionAvcImage"],d["TransactionVideo"],d["ExemptionProofImage"],
                    d["DestinationPlazaId"],d["UserId"],d["LoginId"],d["IsReturnJourney"],
                    d["IsExcessJourney"],d["IsBarrierAutoClose"],d["IsTowVehicle"],
                    d["IsFleetTranscation"],d["FleetCount"]]
            resultData=self.db_instance.execute_procedure('USP_LaneTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e