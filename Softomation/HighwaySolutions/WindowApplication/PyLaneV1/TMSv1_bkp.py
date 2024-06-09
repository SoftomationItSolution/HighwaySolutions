

import os
import platform
import sys
import threading
import time
from utils.Desktop import DesktopApp
from utils.api import FlaskApiApp
from models.CommonManager import CommonManager
from utils.constants import Utilities
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections

class TMSAppv1:
    def __init__(self):
        self.classname = "TMSApp"
        self.PID_FILE = "TMSv1.pid"
        self.bg_handler = None
        self.default_directory = self.check_default_dir()
        self.logger = CustomLogger(self.default_directory, 'main_app')
        self.dbConnectionObj = None
        self.lane_details = None
        self.systemSetting = None
        self.flask_thread = None
        self.flask_app=None
        self.app_thread=None
        self.desktop_app=None
        self.desktop_thread = None
        self.default_plaza_Id = 1

    def start_flask_app(self):
        try:
            self.flask_app = FlaskApiApp(default_directory=self.default_directory,logger=self.logger,bg_handler=self.bg_handler)
            self.flask_app.run()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_flask_app: {str(e)}")

    def run_desktop_app(self):
        try:
            self.desktop_app=DesktopApp(self,self.default_directory, self.logger, self.bg_handler,self.dbConnectionObj,
                                   self.systemSetting,self.lane_details,self.default_plaza_Id)
            self.desktop_app.run()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_desktop_app: {str(e)}")


    def check_default_dir(self):
        try:
            if platform.system() == 'Linux':
                default_directory = '/home/ProjectConfig/TMSLane/'
            else:
                default_directory = 'C:\\ProjectConfig\\TMSLane\\'
            if not os.path.exists(default_directory):
                os.makedirs(default_directory)
            return default_directory
        except Exception as e:
            print(str(e))

    def check_duplicate_instance(self):
        try:
            final_path = os.path.join(self.default_directory, self.PID_FILE)
            if os.path.isfile(final_path):
                with open(final_path, "r") as f:
                    pid = int(f.read().strip())
                    f.close()
                    if Utilities.pid_exists(pid):
                        Utilities.kill_process(pid)
                        with open(final_path, "w") as f:
                            f.write(str(os.getpid()))
                            f.close()
                    else:
                        with open(final_path, "w") as f:
                            f.write(str(os.getpid()))
                            f.close()
            else:
                with open(final_path, "w") as f:
                    f.write(str(os.getpid()))
                    f.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} check_duplicate_instance: {str(e)}")

    def main(self):
        try:
            self.check_duplicate_instance()
            db_path = os.path.join(self.default_directory, 'MasterConfig', 'dbConfig.json')
            db_json_data = Utilities.read_json_file(db_path)
            system_ip = Utilities.get_local_ips()
            
            self.dbConnectionObj = MySQLConnections(self.default_directory, host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
            self.lane_details = CommonManager.GetLaneDetails(self.dbConnectionObj, system_ip)
            self.systemSetting = CommonManager.GetSystemSetting(self.dbConnectionObj)
            if self.systemSetting:
                self.default_plaza_Id = self.systemSetting.get('DefaultPlazaId')
            else:
                self.default_plaza_Id = 1
            
            self.bg_handler = LaneEquipmentSynchronization(self.default_directory, self.dbConnectionObj, self.default_plaza_Id, self.lane_details, self.systemSetting, system_ip)
            self.bg_handler.daemon = True
            self.bg_handler.start()

            self.flask_thread = threading.Thread(target=self.start_flask_app)
            self.flask_thread.daemon=True
            self.flask_thread.start()

            if self.lane_details:
                if self.lane_details.get("LaneTypeId") != 3:
                    self.desktop_thread = threading.Thread(target=self.run_desktop_app)
                    self.desktop_thread.daemon=True
                    self.desktop_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} main: {str(e)}")
        while True:
            try:
                time.sleep(0.1)
            except KeyboardInterrupt:
                self.cleanup()
                sys.exit(0)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} main_loop: {str(e)}")
                time.sleep(0.1)

    def cleanup(self):
        try:
            if os.path.isfile(self.PID_FILE):
                os.remove(self.PID_FILE)

            if self.flask_app is not None:
                self.flask_app.stop_flask_app()
            
            if self.flask_thread.is_alive():
                self.flask_app.stop_flask.set()
                self.flask_thread.join(timeout=1)

            if self.bg_handler is not None:
                self.bg_handler.on_stop()
                self.bg_handler.join()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} cleanup: {str(e)}")
        finally:
            sys.exit(0)

if __name__ == '__main__':
    app = TMSAppv1()
    app.main()