import os
import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication, QStyleFactory
from utils.window_controller import WindowController

class DesktopApp:
    def __init__(self,handler, default_directory, logger, bg_service,dbConnectionObj,systemSetting,lane_details,default_plaza_Id):
        self.default_directory=default_directory
        self.logger=logger
        self.bg_service=bg_service
        self.dbConnectionObj=dbConnectionObj
        self.systemSetting=systemSetting
        self.lane_details=lane_details
        self.default_plaza_Id=default_plaza_Id
        self.handler=handler
        self.desktop_app = QApplication(sys.argv)
        self.primary_screen = self.desktop_app.primaryScreen()
        self.screen_geometry = self.primary_screen.geometry()
        self.screen_width = self.screen_geometry.width()
        self.screen_height = self.screen_geometry.height()
        self.setup_config()


    def setup_config(self):
        self.desktop_app.setStyle(QStyleFactory.create("Fusion"))
        script_dir = os.path.dirname(os.path.abspath(__file__))
        self.image_dir = os.path.join(script_dir, 'assets', 'images')
        icon = os.path.join(self.image_dir, 'icon.ico')
        self.desktop_app.setWindowIcon(QIcon(icon))

    def run(self):
        controller = WindowController(self.bg_service, self.dbConnectionObj, self.default_directory, 
                                      self.image_dir, self.systemSetting, self.lane_details, self.default_plaza_Id, self.screen_width, self.screen_height, self.logger)
        controller.show_login(None)
        exc=self.desktop_app.exec()
        self.handler.cleanup() 
        sys.exit(self.desktop_app.exec())