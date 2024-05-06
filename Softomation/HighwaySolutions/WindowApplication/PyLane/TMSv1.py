import os
import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication,QStyleFactory
from models.CommonManager import CommonManager
from utils.constants import Utilities
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections
from utils.window_controller import WindowController
import platform

def desktop_app(dbConnectionObj, default_directory,systemSetting,lane_details,default_plaza_Id,logger):
    app = QApplication(sys.argv)
    primary_screen = app.primaryScreen()
    screen_geometry = primary_screen.geometry()
    screen_width = screen_geometry.width()
    screen_height = screen_geometry.height()
    app.setStyle(QStyleFactory.create("Fusion"))
    script_dir = os.path.dirname(os.path.abspath(__file__))
    image_dir=os.path.join(script_dir,'assets','images')
    icon = os.path.join(image_dir, 'icon.ico')
    app.setWindowIcon(QIcon(icon))
    controller = WindowController(dbConnectionObj, default_directory,image_dir,systemSetting,lane_details,default_plaza_Id,screen_width,screen_height,logger)
    controller.show_login(None)
    sys.exit(app.exec())

def check_default_dir():
    try:
        if platform.system()=='Linux':
            default_directory='/home/lane1/Desktop/TMSLane/'
        else:
            default_directory='C:\\ProjectConfig\\TMSLane\\' #"E:\\ServerUpdate\\TMSLane\\"
        if not os.path.exists(default_directory):
            os.makedirs(default_directory)
        return default_directory
    except Exception as e:
            print(str(e))

if __name__ == '__main__':
    default_directory=check_default_dir()
       
    db_path=os.path.join(default_directory, 'MasterConfig', 'dbConfig.json')
    db_json_data = Utilities.read_json_file(db_path)

    logger = CustomLogger(default_directory,'main_app')
   
    system_ip=Utilities.get_local_ips()
    system_ip='192.168.10.12'
    
    dbConnectionObj = MySQLConnections(default_directory,host=db_json_data['host'], user=db_json_data['user'],password=db_json_data['password'], database=db_json_data['database'])
    lane_details=CommonManager.GetLaneDetails(dbConnectionObj,system_ip)
    systemSetting=CommonManager.GetSystemSetting(dbConnectionObj)

    default_plaza_Id=1
    if systemSetting is not None and len(systemSetting) !=0:
        default_plaza_Id=systemSetting['DefaultPlazaId']

    lane_equipments=LaneEquipmentSynchronization(default_directory,dbConnectionObj,default_plaza_Id,lane_details,systemSetting,system_ip)
    #lane_equipments.on_start()

    desktop_app(dbConnectionObj, default_directory,systemSetting,lane_details,default_plaza_Id,logger)