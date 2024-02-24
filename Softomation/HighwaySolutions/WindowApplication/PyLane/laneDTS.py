
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

def fetch_and_store_data(logger):
    try:
        api_base_url = 'https://tmsapi.avsrealtor.in/'
        db_json_data=read_json_file(r'C:\ProjectConfig\TMSLane\MasterConfig\dbConfig.json')
        db = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
        DefaultPlazaId=systemSettingImport(api_base_url,db)
        transactionTypeImport(api_base_url,db)
        paymentTypeImport(api_base_url,db)
        exemptTypeImport(api_base_url,db)
        shiftTimingImport(api_base_url,db)
        userDetailsImport(api_base_url,db)
        fasTagVehicleClassImport(api_base_url,db)
        systemVehicleClassImport(api_base_url,db)
        systemVehicleSubClassImport(api_base_url,db)
        denominationTypeImport(api_base_url,db)
        equipmentTypeImport(api_base_url,db)
        protocolTypeImport(api_base_url,db)
        plazaImport(api_base_url,db,DefaultPlazaId)
        LaneId=laneImport(api_base_url,db)
        equipmentDetailsImport(api_base_url,db,LaneId)
        tollFareImport(api_base_url,db)
        tollFareFutureImport(api_base_url,db)
    except Exception as e:
        logger.logError(f"Error fetching or storing data: {e}")


if __name__ == '__main__':
    logger = CustomLogger('data_import')
    fetch_and_store_data(logger)