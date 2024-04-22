import os
import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication,QStyleFactory
from models.CommonManager import CommonManager
from utils.ConfigManager import ConfigManager
from utils.constants import Utilities
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections
from utils.window_controller import WindowController


def desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip):
    app = QApplication(sys.argv)
    primary_screen = app.primaryScreen()
    screen_geometry = primary_screen.geometry()
    screen_width = screen_geometry.width()
    screen_height = screen_geometry.height()
    app.setStyle(QStyleFactory.create("Fusion"))
    image_dir=config_manager.get_path('Paths', 'image_dir')
    icon = os.path.join(image_dir, 'icon.ico')
    app.setWindowIcon(QIcon(icon))
    controller = WindowController(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip,screen_width,screen_height)
    controller.show_login(None)
    sys.exit(app.exec())


if __name__ == '__main__':
    script_dir = os.path.dirname(os.path.abspath(__file__))
    config_file = os.path.join(os.path.dirname(__file__), 'config.ini')
    config_manager = ConfigManager(config_file, script_dir)
    logger = CustomLogger(config_manager,'main_app')
    system_ip=Utilities.get_local_ips()
    system_ip='192.168.10.12'
    booth_lane = config_manager.get_setting('Settings', 'booth_lane')
    project_config_path = config_manager.get_path('Paths', 'pc_dir')
    db_path = config_manager.get_path('Paths', 'db_dir')
    db_json_data = Utilities.read_json_file(db_path)
    project_config_data = Utilities.read_json_file(project_config_path)
    dbConnectionObj = MySQLConnections(config_manager=config_manager,host=db_json_data['host'], user=db_json_data['user'],password=db_json_data['password'], database=db_json_data['database'])
    systemSetting=CommonManager.GetSystemSetting(dbConnectionObj)
    default_plaza_Id=0
    if systemSetting is not None:
        default_plaza_Id=systemSetting['DefaultPlazaId']
    lane_equipments=LaneEquipmentSynchronization(config_manager,dbConnectionObj,default_plaza_Id,system_ip)
    lane_equipments.on_start()
    desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip)