import os
import sys
import threading
import platform
import time
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication, QStyleFactory
from flask import Flask, jsonify, request
from flask_cors import CORS
from models.CommonManager import CommonManager
from utils.constants import Utilities
from utils.lane_equipment_init import LaneEquipmentSynchronization
from utils.log_master import CustomLogger
from utils.mySqlConnection import MySQLConnections
from utils.window_controller import WindowController

class TMSApp:
    def __init__(self):
        self.classname = "TMSApp"
        self.PID_FILE = "TMSv1.pid"
        self.lane_equipments = None
        self.desktop_app = None
        self.flaskapp = Flask(__name__)
        CORS(self.flaskapp)
        self.flaskapp.config['CORS_HEADERS'] = 'Content-Type'
        self.default_directory = self.check_default_dir()
        self.logger = CustomLogger(self.default_directory, 'main_app')
        self.dbConnectionObj = None
        self.lane_details = None
        self.systemSetting = None
        self.app_thread = None
        self.flask_thread = None
        self.default_plaza_Id = 1
        self.setup_routes() 

    def setup_routes(self):
        @self.flaskapp.route('/app_login', methods=['POST'])
        def app_login():
            try:
                self.logger.logInfo("app_login route hit")
                if self.lane_equipments is not None:
                    self.lane_equipments.userDetails = request.get_json()
                    self.lane_equipments.app_log_status(True)
                    return jsonify({'message': 'Login done!'}), 200
                else:
                    return jsonify({'message': 'App not running!'}), 404
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} app_login: {str(e)}")
                return jsonify({'message': 'Internal server error!'}), 500

        @self.flaskapp.route('/app_logout', methods=['POST'])
        def app_logout():
            try:
                self.logger.logInfo("app_logout route hit")
                if self.lane_equipments is not None:
                    self.lane_equipments.app_log_status(False)
                    return jsonify({'message': 'Logout done!'}), 200
                else:
                    return jsonify({'message': 'App not running!'}), 404
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} app_logout: {str(e)}")
                return jsonify({'message': 'Internal server error!'}), 500

        @self.flaskapp.route('/get_status', methods=['GET'])
        def get_status():
            try:
                self.logger.logInfo("get_status route hit")
                if self.lane_equipments is not None:
                    data = self.lane_equipments.get_lane_status()
                    if data is not None:
                        return jsonify(data), 200
                    else:
                        return jsonify({'message': 'Status not found.'}), 404
                else:
                    return jsonify({'message': 'App not running.'}), 404
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} get_status: {str(e)}")
                return jsonify({'message': 'Internal server error.'}), 500

    def run_flask(self):
        try:
            self.logger.logInfo("Starting Flask app")
            self.flaskapp.run(host='0.0.0.0', port=5002, debug=True, use_reloader=False)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_flask: {str(e)}")

    def run_desktop_app(self, bg_service, dbConnectionObj, default_directory, systemSetting, lane_details, default_plaza_Id, logger):
        try:
            self.desktop_app = QApplication(sys.argv)
            primary_screen = self.desktop_app.primaryScreen()
            screen_geometry = primary_screen.geometry()
            screen_width = screen_geometry.width()
            screen_height = screen_geometry.height()
            self.desktop_app.setStyle(QStyleFactory.create("Fusion"))
            script_dir = os.path.dirname(os.path.abspath(__file__))
            image_dir = os.path.join(script_dir, 'assets', 'images')
            icon = os.path.join(image_dir, 'icon.ico')
            self.desktop_app.setWindowIcon(QIcon(icon))
            controller = WindowController(bg_service, dbConnectionObj, default_directory, image_dir, systemSetting, lane_details, default_plaza_Id, screen_width, screen_height, logger)
            controller.show_login(None)
            sys.exit(self.desktop_app.exec())
        except KeyboardInterrupt:
            sys.exit(self.desktop_app.exec())

    def check_default_dir(self):
        try:
            if platform.system() == 'Linux':
                default_directory = '/home/TMSLane/'
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

    def cleanup(self):
        try:
            if os.path.isfile(self.PID_FILE):
                os.remove(self.PID_FILE)
            if self.lane_equipments is not None:
                self.lane_equipments.on_stop()
            if self.desktop_app is not None:
                sys.exit(self.desktop_app.exec())
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} cleanup: {str(e)}")

    def run_desktop_app_thread(self):
        try:
            if self.app_thread is None:
                self.app_thread = threading.Thread(target=self.run_desktop_app, args=[self.lane_equipments, self.dbConnectionObj, self.default_directory, self.systemSetting, self.lane_details, self.default_plaza_Id, self.logger])
                self.app_thread.daemon = True
                self.app_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_desktop_app_thread: {str(e)}")

    def run_flask_app_thread(self):
        try:
            if self.flask_thread is None:
                self.flask_thread = threading.Thread(target=self.run_flask())
                self.flask_thread.daemon = True
                self.flask_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_desktop_app_thread: {str(e)}")

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
            self.lane_equipments = LaneEquipmentSynchronization(self.default_directory, self.dbConnectionObj, self.default_plaza_Id, self.lane_details, self.systemSetting, system_ip)
            self.lane_equipments.daemon = True
            self.lane_equipments.start()
            if self.lane_details:
                if self.lane_details.get("LaneTypeId") != 3:
                    self.run_desktop_app_thread()

            self.run_flask_app_thread()
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
if __name__ == '__main__':
    app = TMSApp()
    app.main()