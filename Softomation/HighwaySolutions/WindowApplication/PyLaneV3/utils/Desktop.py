import os
import sys
import threading
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication, QStyleFactory
from utils.log_master import CustomLogger
from utils.window_controller import WindowController

class DesktopApp(threading.Thread):
    def __init__(self, handler):
        super().__init__()
        self.handler = handler
        self.set_logger(handler.default_directory,'desktop_app')
        self.desktop_app = None
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="DesktopApp"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def setup_config(self):
        try:
            self.desktop_app.setStyle(QStyleFactory.create("Fusion"))
            self.image_dir = os.path.join(self.handler.script_dir, 'assets', 'images')
            icon = os.path.join(self.image_dir, 'icon.ico')
            self.desktop_app.setWindowIcon(QIcon(icon))
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} setup_config: {str(e)}")

    def run_desktop_app(self):
        try:
            self.desktop_app = QApplication(sys.argv)
            self.desktop_app.setStyle(QStyleFactory.create("Fusion"))
            self.primary_screen = self.desktop_app.primaryScreen()
            self.screen_geometry = self.primary_screen.geometry()
            self.screen_width = self.screen_geometry.width()
            self.screen_height = self.screen_geometry.height()
            self.setup_config()

            controller = WindowController(self.screen_width, self.screen_height, self.handler,self.logger,self.image_dir)
            controller.show_login(None)
            self.desktop_app.exec()
            sys.exit(self.desktop_app.exec())
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_desktop_app: {str(e)}")

    def run(self):
        self.run_desktop_app()

    def start_app(self):
        try:
            self.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_app: {str(e)}")

    def stop_app(self):
        try:
            if self.desktop_app:
                self.desktop_app.quit()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_app: {str(e)}")

# Example usage:
# handler = ...
# default_directory = ...
# logger = ...
# bg_service = ...
# dbConnectionObj = ...
# systemSetting = ...
# lane_details = ...
# default_plaza_Id = ...

# app_thread = DesktopApp(handler, default_directory, logger, bg_service, dbConnectionObj, systemSetting, lane_details, default_plaza_Id)
# app_thread.start_app()
# # To stop the app
# app_thread.stop_app()
