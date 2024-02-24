from models.SystemSettingModel import systemSettingImport
from models.laneModel import laneImport
from models.plazaModel import plazaImport
from models.tollFareModle import tollFareFutureImport, tollFareImport
from utils.constants import read_json_file
from utils.database import MySQLConnection
from models.denominationModel import denominationTypeImport
from models.equipmentModle import equipmentDetailsImport, equipmentTypeImport, protocolTypeImport
from models.exemptTypeModel import exemptTypeImport
from models.paymentTypeModel import paymentTypeImport
from models.shiftTimingModel import shiftTimingImport
from models.transactionTypeModel import transactionTypeImport
from models.userModel import  userDetailsImport
from models.vehicleClassModel import fasTagVehicleClassImport, systemVehicleClassImport, systemVehicleSubClassImport
from utils.log_master import CustomLogger

class DataImporter:
    def __init__(self, api_base_url, db_json_data):
        self.api_base_url = api_base_url
        self.db_json_data = db_json_data
        self.db = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
        self.logger = CustomLogger('data_import')

    def fetch_and_store_data(self):
        try:
            DefaultPlazaId = systemSettingImport(self.api_base_url, self.db)
            transactionTypeImport(self.api_base_url, self.db)
            paymentTypeImport(self.api_base_url, self.db)
            exemptTypeImport(self.api_base_url, self.db)
            shiftTimingImport(self.api_base_url, self.db)
            userDetailsImport(self.api_base_url, self.db)
            fasTagVehicleClassImport(self.api_base_url, self.db)
            systemVehicleClassImport(self.api_base_url, self.db)
            systemVehicleSubClassImport(self.api_base_url, self.db)
            denominationTypeImport(self.api_base_url, self.db)
            equipmentTypeImport(self.api_base_url, self.db)
            protocolTypeImport(self.api_base_url, self.db)
            plazaImport(self.api_base_url, self.db, DefaultPlazaId)
            LaneId = laneImport(self.api_base_url, self.db)
            equipmentDetailsImport(self.api_base_url, self.db, LaneId)
            tollFareImport(self.api_base_url, self.db)
            tollFareFutureImport(self.api_base_url, self.db)
        except Exception as e:
            self.logger.logError(f"Error fetching or storing data: {e}")

if __name__ == '__main__':
    api_base_url = 'https://tmsapi.avsrealtor.in/'
    db_json_path = r'C:\ProjectConfig\TMSLane\MasterConfig\dbConfig.json'
    db_json_data = read_json_file(db_json_path)
    importer = DataImporter(api_base_url, db_json_data)
    importer.fetch_and_store_data()
