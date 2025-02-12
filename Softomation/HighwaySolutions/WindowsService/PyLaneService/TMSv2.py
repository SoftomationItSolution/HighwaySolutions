import os
import platform
import sys
import threading
import time
from database.mySqlConnection import MySQLConnections
from threads.lane_bg_process import LaneBGProcess
from utils.constants import Utilities
from log.log_master import CustomLogger

class TMSAppv2:
    def __init__(self):
        self.PID_FILE = "TMSv2.pid"
        self.stop_event = threading.Event()
        self.default_directory = self.check_default_dir()
        self.script_dir=os.path.dirname(os.path.abspath(__file__))
        self.logger = CustomLogger(self.default_directory, 'main_app')
        self.db_path = os.path.join(self.default_directory, 'MasterConfig', 'dbConfig.json')
        self.cam_path = os.path.join(self.default_directory, 'MasterConfig', 'camConfig.json')
        self.bg_handler = None
        self.dbConnectionObj = None
        self.lane_details = None
        self.systemSetting = None
        self.flask_thread = None
        self.flask_app=None
        self.app_thread=None
        self.desktop_app=None
        self.desktop_thread = None
        self.default_plaza_Id = 1

    def check_default_dir(self):
        try:
            if platform.system() == 'Linux':
                default_directory = '/home/ProjectConfig/TMSLaneV2/'
            else:
                default_directory = 'C:\\ProjectConfig\\TMSLaneV2\\'
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
            self.logger.logError(f"Exception check_duplicate_instance: {str(e)}")

    def get_cam_config(self):
        try:
            ic_json_data = Utilities.read_json_file(self.cam_path)
            return ic_json_data
            #return int(ic_json_data["timeout"])
        except Exception as e:
            return None


    def main(self):
        try:
            self.check_duplicate_instance()
            db_json_data = Utilities.read_json_file(self.db_path)
            cam_config=self.get_cam_config()
            self.system_ip = Utilities.get_local_ips()
            # if self.compare_ips(self.system_ip, '192.168.10.12')==False:
            #self.system_ip='192.168.11.22'
            self.dbConnectionObj = MySQLConnections(self.default_directory, host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
            self.bg_handler = LaneBGProcess(self.default_directory, self.dbConnectionObj, self.script_dir, self.system_ip,cam_config)
            self.bg_handler.daemon = True
            self.bg_handler.start()
        except Exception as e:
            self.logger.logError(f"Exception main: {str(e)}")
        except KeyboardInterrupt:
             print('close 1')
             self.stop()
    
    def stop(self):
        if self.bg_handler is not None:
            self.bg_handler.on_stop()
        self.stop_event.set()

    def cleanup(self):
        try:
            if os.path.isfile(self.PID_FILE):
                os.remove(self.PID_FILE)
            if self.bg_handler is not None:
                self.bg_handler.on_stop()
                self.bg_handler.join()
        except Exception as e:
            self.logger.logError(f"Exception cleanup: {str(e)}")
        finally:
            sys.exit(0)

    def compare_ips(self,ip1, ip2):
        octets1 = ip1.split('.')
        octets2 = ip2.split('.')
        return octets1[:3] == octets2[:3]

if __name__ == '__main__':
    app = TMSAppv2()
    app.main()
    while True:
        try:
            time.sleep(0.1)
        except KeyboardInterrupt:
            print('closed While')
            app.cleanup()
            sys.exit(0)