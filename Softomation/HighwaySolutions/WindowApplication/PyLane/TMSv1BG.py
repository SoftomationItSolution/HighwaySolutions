import os
from models.CommonManager import CommonManager
from utils.ConfigManager import ConfigManager
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections




if __name__ == '__main__':
    logger = CustomLogger('main_app')
    system_ip=Utilities.get_local_ips()
    script_dir = os.path.dirname(os.path.abspath(__file__))
    config_file = os.path.join(os.path.dirname(__file__), 'config.ini')
    config_manager = ConfigManager(config_file, script_dir)
    booth_lane = config_manager.get_setting('Settings', 'booth_lane')
    project_config_path = config_manager.get_path('Paths', 'pc_dir')
    db_path = config_manager.get_path('Paths', 'db_dir')
    db_json_data = Utilities.read_json_file(db_path)
    project_config_data = Utilities.read_json_file(project_config_path)
    dbConnectionObj = MySQLConnections(host=db_json_data['host'], user=db_json_data['user'],password=db_json_data['password'], database=db_json_data['database'])
    systemSetting=CommonManager.GetSystemSetting(dbConnectionObj)
    default_plaza_Id=0
    if systemSetting is not None:
        default_plaza_Id=systemSetting['DefaultPlazaId']
    

    lane_equipments=LaneEquipmentSynchronization(config_manager,dbConnectionObj,default_plaza_Id,system_ip)
    lane_equipments.on_start()

    
