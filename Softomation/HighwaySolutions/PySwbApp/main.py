import os
import platform
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication,QDialog
import requests
from gui.apiDialog import ApiDialog
from gui.loginWidget import LoginWidget
from gui.mainWidget import MainWidget
from utils.constants import Utilities
from utils.log_master import CustomLogger

class SwbApp(QApplication):
    def __init__(self, sys_argv,script_dir):
        super().__init__(sys_argv)
        self.script_dir=script_dir
        self.default_directory=self.check_default_dir()
        self.logger = CustomLogger(self.default_directory, 'swb_app')
        style = self.load_stylesheet(os.path.join(self.script_dir, 'assets','style', "style.qss"))
        self.setWindowIcon(QIcon(os.path.join(self.script_dir, 'assets','images', "icon.ico")))
        self.setStyle("Fusion")
        self.setStyleSheet(style)
        self.plaza_config = self.get_plaza_config()
        self.system_ip=Utilities.get_local_ips()
        
        self.image_dir = os.path.join(self.script_dir, 'assets', 'images')
        icon = os.path.join(self.image_dir, 'icon.ico')
        self.setWindowIcon(QIcon(icon))

        self.main_window = MainWidget(self.default_directory,self.script_dir,self.logger,self.system_ip)
        self.main_window.header.logout_btn.clicked.connect(self.handle_logout)
        self.login_page = LoginWidget(self.default_directory,self.plaza_config,self.logger,self.system_ip)

        self.login_page.successful_login.connect(self.show_main_window)

        self.login_page.show()

    def show_main_window(self, username):
        self.main_window.set_user_details(username)
        self.main_window.show()
        self.login_page.hide()


    def show_login_page(self):
        self.login_page = LoginWidget(self.default_directory,self.plaza_config,self.logger,self.system_ip)
        self.login_page.successful_login.connect(self.show_main_window)
        self.login_page.show()
       

    def handle_logout(self):
        x={"UserId":self.main_window.userData["UserData"]["UserId"],"LocalAddress":self.system_ip}
        self.login_activity(x)
        self.main_window.on_wim_disconnect()
        self.show_login_page() 
        self.main_window.close()

    def login_activity(self,payload):
        try:
            apipath=self.plaza_config["api_url"]+"Softomation/FastTrackHighway-TMS/"
            api_url=apipath+"UserLoginActivity"
            response = requests.post(api_url, json=payload, timeout=10)
            response.raise_for_status()
            data = response.json()
            self.logger.logInfo('logout')
            self.logger.logInfo(data)
        except requests.exceptions.RequestException as e:
            self.logger.logInfo('logout')
            self.logger.logError(f"Failed to connect to the server-login_activity: {e}")

    def check_default_dir(self):
        try:
            if platform.system() == 'Linux':
                default_directory = '/home/ProjectConfig/TmsSwb/'
            else:
                default_directory = 'C:\\ProjectConfig\\TmsSwb\\'
            if not os.path.exists(default_directory):
                os.makedirs(default_directory)
            return default_directory
        except Exception as e:
            self.logger.logError(f"Error in check_default_dir {str(e)}")

   

    def get_plaza_config(self):
        try:
            self.plaza_path = os.path.join(self.default_directory, 'MasterConfig', 'plazaConfig.json')
            if os.path.exists(self.plaza_path):
                return Utilities.read_json_file(self.plaza_path)
            dialog = ApiDialog()
            if dialog.exec() == QDialog.Accepted:
                api_url = dialog.get_api_url()
                if api_url:
                    data = {"api_url": api_url}
                    Utilities.save_json_file(self.plaza_path,data)
                    os.makedirs(os.path.dirname(self.plaza_path), exist_ok=True)
                    return data
            return None  # User cancelled
        except Exception as e:
            self.logger.logError(f"Error in get_plaza_config {str(e)}")
            return None

    def load_stylesheet(self,file_path):
        try:
            with open(file_path, "r") as f:
                return f.read()
        except Exception as e:
            self.logger.logError(f"Failed to load stylesheet {file_path}: {e}")
            return ""


if __name__ == "__main__":
    import sys
    script_dir=os.path.dirname(os.path.abspath(__file__))
    app = SwbApp(sys.argv,script_dir)
    app.setStyle("Fusion")
    app.setWindowIcon(QIcon(os.path.join(script_dir, 'assets','images', "icon.ico")))
    sys.exit(app.exec())
