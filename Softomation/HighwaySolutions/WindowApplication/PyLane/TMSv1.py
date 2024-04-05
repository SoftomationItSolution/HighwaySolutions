import os
import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication
from models.CommonManager import CommonManager
from utils.ConfigManager import ConfigManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections
from utils.window_controller import WindowController


def desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip):
    app = QApplication(sys.argv)
    image_dir=config_manager.get_path('Paths', 'image_dir')
    icon = os.path.join(image_dir, 'icon.ico')
    app.setWindowIcon(QIcon(icon))
    controller = WindowController(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip)
    controller.show_login(None)
    sys.exit(app.exec())


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
    #if booth_lane:
    desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip)