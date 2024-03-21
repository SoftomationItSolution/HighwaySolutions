import os
import sys
import threading
import time
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication
import schedule
from models.CommonManager import CommonManager
from utils.ConfigManager import ConfigManager
from utils.DataTransfer import DataSynchronization
from utils.constants import get_ip_address, read_json_file
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

def run_desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip):
    thread = threading.Thread(target=desktop_app, args=(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip))
    thread.start()

def dts_service(dbConnectionObj, config_manager,project_config_path,default_plaza_Id,system_ip):
    data_fetcher = DataSynchronization(config_manager, dbConnectionObj,project_config_path,default_plaza_Id,system_ip)

    def fetch_master_data():
        data_fetcher.fetch_and_store_master_data()

    def fetch_data():
        data_fetcher.fetch_and_store_data()
    fetch_master_data()
    fetch_data()
    schedule.every(24).hours.do(fetch_master_data)
    schedule.every(12).hours.do(fetch_data)

    while True:
        schedule.run_pending()
        time.sleep(0.0100)

if __name__ == '__main__':
    logger = CustomLogger('main_app')
    system_ip=get_ip_address()
    script_dir = os.path.dirname(os.path.abspath(__file__))
    config_file = os.path.join(os.path.dirname(__file__), 'config.ini')
    config_manager = ConfigManager(config_file, script_dir)
    booth_lane = config_manager.get_setting('Settings', 'booth_lane')
    project_config_path = config_manager.get_path('Paths', 'pc_dir')
    db_path = config_manager.get_path('Paths', 'db_dir')
    db_json_data = read_json_file(db_path)
    project_config_data = read_json_file(project_config_path)
    dbConnectionObj = MySQLConnections(host=db_json_data['host'], user=db_json_data['user'],password=db_json_data['password'], database=db_json_data['database'])
    cm=CommonManager(dbConnectionObj)
    systemSetting=cm.GetSystemSetting()
    default_plaza_Id=0
    if systemSetting is not None:
        default_plaza_Id=systemSetting['DefaultPlazaId']
    if booth_lane:
        run_desktop_app(dbConnectionObj, config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip)


    dts_thread = threading.Thread(target=dts_service, args=(dbConnectionObj, config_manager,project_config_path,default_plaza_Id,system_ip))
    #dts_thread.start()