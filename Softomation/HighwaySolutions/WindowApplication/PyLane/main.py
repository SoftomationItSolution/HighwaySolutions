import os
import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication
from utils.ConfigManager import ConfigManager
from utils.constants import read_json_file
from utils.database import MySQLConnection
from utils.window_controller import WindowController
if __name__ == "__main__":
    config_file = 'config.ini'
    config_manager = ConfigManager(config_file)
    app= QApplication(sys.argv)
    icon = os.path.join(config_manager.get_path('Paths', 'image_dir'), 'icon.ico') 
    app.setWindowIcon(QIcon(icon))
    db_json_data=read_json_file(config_manager.get_path('Paths', 'db_dir'))
    dbConnectionObj  = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
    controller = WindowController(dbConnectionObj,config_manager)
    controller.show_login(None)
    # w=MainWindow(dbConnectionObj,None)
    # w.show()
    sys.exit(app.exec())