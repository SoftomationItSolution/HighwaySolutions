import os
import sys
import threading
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication,QStyleFactory
from models.CommonManager import CommonManager
from utils.constants import Utilities
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections
from utils.window_controller import WindowController
import platform
import psutil
import signal
import  time
from threading import Thread
lane_equipments=None
app=None
PID_FILE = "TMSv1.pid"

def signal_handler(sig, frame):
    global app
    print('Received main signal:', sig)
    #cleanup()

def desktop_app(bg_service,dbConnectionObj, default_directory,systemSetting,lane_details,default_plaza_Id,logger):
    global app
    try:
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
        controller = WindowController(bg_service,dbConnectionObj, default_directory,image_dir,systemSetting,lane_details,default_plaza_Id,screen_width,screen_height,logger)
        controller.show_login(None)
        sys.exit(app.exec())
    except KeyboardInterrupt:
        sys.exit(app.exec())

def check_default_dir():
    try:
        if platform.system()=='Linux':
            default_directory='/home/TMSLane/'
        else:
            default_directory='C:\\ProjectConfig\\TMSLane\\' #"E:\\ServerUpdate\\TMSLane\\"
        if not os.path.exists(default_directory):
            os.makedirs(default_directory)
        return default_directory
    except Exception as e:
            print(str(e))

def check_duplicate_instance_close_old():
    if os.path.isfile(PID_FILE):
        with open(PID_FILE, "r") as f:
            pid = int(f.read().strip())
            f.close()
            if pid_exists(pid):
                print("Another instance is already running.")
                kill_process(pid)
                with open(PID_FILE, "w") as f:
                    f.write(str(os.getpid()))
                    f.close()
                #sys.exit(1)
            else:
                with open(PID_FILE, "w") as f:
                    f.write(str(os.getpid()))
                    f.close()
    else:
        with open(PID_FILE, "w") as f:
            f.write(str(os.getpid()))
            f.close()

def check_duplicate_instance_close_new(dir):
    final_path=os.path.join(dir,PID_FILE)
    if os.path.isfile(final_path):
        with open(final_path, "r") as f:
            pid = int(f.read().strip())
            f.close()
            if pid_exists(pid):
                sys.exit(1)
            else:
                with open(final_path, "w") as f:
                    f.write(str(os.getpid()))
                    f.close()
    else:
        with open(final_path, "w") as f:
            f.write(str(os.getpid()))
            f.close()

def pid_exists(pid):
    return psutil.pid_exists(pid)

def kill_process(pid):
    try:
        process = psutil.Process(pid)
        process.terminate()
        print(f"Process with PID {pid} terminated successfully.")
    except psutil.NoSuchProcess:
        print(f"No process found with PID {pid}.")

def cleanup():
    global app
    if os.path.isfile(PID_FILE):
        os.remove(PID_FILE)

    if lane_equipments is not None:
        print('going to stop lane_equipments')
        lane_equipments.on_stop()
    else:
        print('lane_equipments not found')
    
    if app is not None:
        print('going to stop app')
        sys.exit(app.exec())
    else:
        print('app not found')

if __name__ == '__main__':
    try:
        # signal.signal(signal.SIGINT, signal_handler)
        # signal.signal(signal.SIGTERM, signal_handler)
        check_duplicate=False
        default_directory=check_default_dir()
        check_duplicate_instance_close_new(default_directory)
        
        
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
        lane_equipments.daemon = True
        lane_equipments.start()

        #threading.Thread(target=desktop_app(),args=[lane_equipments,dbConnectionObj, default_directory,systemSetting,lane_details,default_plaza_Id,logger]).start()
        #desktop_app(lane_equipments,dbConnectionObj, default_directory,systemSetting,lane_details,default_plaza_Id,logger)
        app_thread = threading.Thread(target=desktop_app, args=[lane_equipments, dbConnectionObj, default_directory, systemSetting, lane_details, default_plaza_Id, logger])
        app_thread.daemon=True
# Start the thread
        app_thread.start()

    except Exception as e:
        print("An error occurred:", e)
    while True:
        try:
           time.sleep(.001)
        except KeyboardInterrupt:
            sys.exit(0)
            