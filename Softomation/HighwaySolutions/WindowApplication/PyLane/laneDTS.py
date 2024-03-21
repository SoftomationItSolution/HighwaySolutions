
import os
from models.DataImporter import DataImporter
from utils.ConfigManager import ConfigManager
from utils.constants import read_json_file
from utils.database import MySQLConnection
from utils.log_master import CustomLogger

logger = CustomLogger('data_import')
script_dir = os.path.dirname(os.path.abspath(__file__))
config_file = os.path.join(os.path.dirname(__file__), 'config.ini')
config_manager = ConfigManager(config_file,script_dir)

def fetch_and_store_data():
    try:
        db_path=config_manager.get_setting('Paths', 'db_dir')
        db_json_data=read_json_file(db_path)
        db = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
        data_importer = DataImporter(config_manager,db)
        data_importer.data_status_import()
        data_importer.lane_mode_import()
        data_importer.lane_point_import()
        data_importer.lane_position_import()
        data_importer.lane_status_import()
        data_importer.transaction_type_import()
        data_importer.payment_type_import()
        data_importer.exempt_type_import()
        data_importer.shift_timing_import()
        data_importer.denomination_type_Import()
        data_importer.equipment_type_Import()
        data_importer.protocol_type_Import()
        data_importer.fasTag_vehicleclass_Import()
        data_importer.system_vehicleclass_Import()
        data_importer.system_vehicle_subclass_Import()
        data_importer.users_Import()
        data_importer.system_setting_Import()
        data_importer.plaza_import()
        data_importer.lane_import()
        data_importer.equipments_Import()
        data_importer.toll_fare_Import()
        data_importer.toll_fare_Future_Import()
        #print("Import Done !")
    except Exception as e:
        logger.logError(f"Error fetching or storing data: {e}")


if __name__ == '__main__':
    fetch_and_store_data()