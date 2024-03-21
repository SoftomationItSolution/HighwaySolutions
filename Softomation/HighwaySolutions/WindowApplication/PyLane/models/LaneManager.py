class LaneManager:
    def __init__(self, db_instance):
        self.db_instance = db_instance

    def lane_data_insert(self,EffectedFrom):
        try:
            params=[EffectedFrom]
            resultData=self.db_instance.execute_procedure('USP_LaneTransactionInsert', params)
            return resultData
        except Exception as e:
            raise e