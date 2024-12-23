import os
import platform
import threading
from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from utils.constants import Utilities

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
        self.app.add_url_rule('/get_status', 'get_status', self.get_status)
        self.app.add_url_rule('/app_login', 'app_login', self.app_login, methods=['POST'])
        self.app.add_url_rule('/app_logout', 'app_logout', self.app_logout, methods=['POST'])
        self.app.add_url_rule('/restart', 'restart', self.restart)
        self.app.add_url_rule('/login', 'login', self.login)
        self.app.add_url_rule('/logout', 'logout', self.logout)
        self.app.add_url_rule('/shutdown', 'shutdown', self.shutdown)
        self.server = None

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
