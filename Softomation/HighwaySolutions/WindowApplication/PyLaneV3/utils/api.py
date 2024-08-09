from datetime import datetime
import json
import os
import platform
import threading
from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from models.CommonManager import CommonManager
from utils.constants import Utilities
from utils.crypt import CryptoUtils

class FlaskApiApp(threading.Thread):
    def __init__(self, default_directory,script_dir, logger, bg_handler=None):
        super().__init__()
        self.script_dir=script_dir
        self.app = Flask(__name__, static_folder=os.path.join(script_dir, 'static'),template_folder=os.path.join(script_dir,'templates'))
        self.classname = "TMSApp"
        self.PID_FILE = "TMSv1.pid"
        self.default_directory = default_directory
        self.bg_handler = bg_handler
        self.desktop_app = None
        CORS(self.app)
        self.app.config['CORS_HEADERS'] = 'Content-Type'
        self.logger = logger
        self.lane_details = None
        self.default_plaza_Id = 1
        self.app.add_url_rule('/', 'index', self.index)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/ProjectConfigGet','ProjectConfigGet', self.ProjectConfigGet)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/ValidateUser','ValidateUser', self.ValidateUser, methods=['POST'])
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/getLaneMasterData','getLaneMasterData', self.getLaneMasterData)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/getLaneResentData','getLaneResentData', self.getLaneResentData)

        self.app.add_url_rule('/get_status', 'get_status', self.get_status)
        self.app.add_url_rule('/app_login', 'app_login', self.app_login, methods=['POST'])
        self.app.add_url_rule('/app_logout', 'app_logout', self.app_logout, methods=['POST'])
        self.app.add_url_rule('/restart', 'restart', self.restart)
        self.app.add_url_rule('/login', 'login', self.login)
        self.app.add_url_rule('/logout', 'logout', self.logout)
        self.app.add_url_rule('/shutdown', 'shutdown', self.shutdown)
        self.server = None

    def ProjectConfigGet(self):
        try:
            return jsonify({'message': 'success','ResponseData':self.bg_handler.project_config}), 200
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ProjectConfigGet: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def ValidateUser(self):
        try:
            input=request.get_json()
            res = CommonManager.GetUserByLoginId(self.bg_handler.dbConnectionObj,input["LoginId"])
            if res is None:
                return jsonify({'message': 'Invalid loginid','ResponseData':None}), 200
            else:
                if len(res)>0:
                    if CryptoUtils.encrypt_aes_256_cbc(input["LoginPassword"]) == res[0]["LoginPassword"]:
                        userDetails = json.dumps(res[0])
                        self.bg_handler.get_current_shift()
                        self.bg_handler.app_log_status(True)
                        self.bg_handler.update_user(userDetails)
                        current_time = datetime.now()
                        formatted_time = current_time.strftime("%H:%M:%S")
                        result={"userData":res[0],"shiftDetails":self.bg_handler.current_shift,"loginTime":formatted_time}
                        return jsonify({'message': 'success','ResponseData':result}), 200
                    else:
                        return jsonify({'message': 'Invalid password','ResponseData':None}), 200
                else:
                    return jsonify({'message': 'Invalid loginid','ResponseData':None}), 200
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ValidateUser: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        

    def getLaneMasterData(self):
        try:
            return jsonify({'message': 'success','ResponseData':self.bg_handler.lane_master_data}), 200
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} VehicleClassGet: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def getLaneResentData(self):
        try:
            latest_lane_txn=CommonManager.GetLatestLaneTransaction(self.bg_handler.dbConnectionObj)
            return jsonify({'message': 'success','ResponseData':latest_lane_txn}), 200
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getLaneResentData: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def app_login(self):
        try:
            self.logger.logInfo("app_login route hit")
            if self.bg_handler is not None:
                self.bg_handler.userDetails = request.get_json()
                self.bg_handler.app_log_status(True)
                return jsonify({'message': 'Login done!'}), 200
            else:
                return jsonify({'message': 'App not running!'}), 404
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} app_login: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def app_logout(self):
        try:
            self.logger.logInfo("app_logout route hit")
            if self.bg_handler is not None:
                self.bg_handler.app_log_status(False)
                return jsonify({'message': 'Logout done!'}), 200
            else:
                return jsonify({'message': 'App not running!'}), 404
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} app_logout: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def get_status(self):
        try:
            self.logger.logInfo("get_status route hit")
            if self.bg_handler is not None:
                data = self.bg_handler.get_lane_status()
                if data is not None:
                    return jsonify(data), 200
                else:
                    return jsonify({'message': 'Status not found.'}), 404
            else:
                return jsonify({'message': 'App not running.'}), 404
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_status: {str(e)}")
            return jsonify({'message': 'Internal server error.'}), 500

    def restart(self):
        try:
            result = self.restart_system()
            return result
        except Exception as e:
            return str(e), 500

    def shutdown(self):
        try:
            result = self.shutdown_system()
            return result
        except Exception as e:
            return str(e), 500

    def login(self):
        self.bg_handler.app_log_status(True)
        return "Login functionality"

    def logout(self):
        self.bg_handler.app_log_status(False)
        return "Logout functionality"

   
    
    def index(self):
        config_filePath = os.path.join(self.default_directory, "MasterConfig", "dbConfig.json")
        data = Utilities.read_json_file(config_filePath)
        #path=f'{self.static_url_path}/'+'index.html'
        return render_template('index.html', data=data)

    

    def restart_system(self):
        if platform.system() == 'Windows':
            os.system('shutdown /r /t 1')
        elif platform.system() == 'Linux' or platform.system() == 'Darwin':  # Darwin is macOS
            os.system('shutdown -r now')
        else:
            return "Unsupported OS"
        return "Restart initiated"

    def shutdown_system(self):
        if platform.system() == 'Windows':
            os.system('shutdown /s /t 1')
        elif platform.system() == 'Linux' or platform.system() == 'Darwin':
            os.system('shutdown now')
        else:
            return "Unsupported OS"
        return "Shutdown initiated"

    def run(self):
        self.server = threading.Thread(target=self.app.run, kwargs={'debug': False, 'host': '0.0.0.0', 'port': 5002})
        self.server.start()

    def start_app(self):
        try:
            self.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_app: {str(e)}")

    def stop_app(self):
        try:
            if self.server:
                self.server.join(1)  # Attempt to join the thread for 1 second
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_app: {str(e)}")

# Example usage:
# default_directory = ...
# logger = ...
# bg_handler = ...

# api_app = FlaskApiApp(default_directory, logger, bg_handler)
# api_app.start_app()
# # To stop the app
# api_app.stop_app()
