import sys
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication
from GUI.forms.MainWindow import MainWindow
from utils.constants import read_json_file
from utils.database import MySQLConnection
from utils.window_controller import WindowController
if __name__ == "__main__":
    app= QApplication(sys.argv)
    app.setWindowIcon(QIcon("assets/images/icon.ico"))
    db_json_data=read_json_file(r'C:\ProjectConfig\TMSLane\MasterConfig\dbConfig.json')
    dbConnectionObj  = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
    # controller = WindowController(dbConnectionObj)
    # controller.show_login()
    w=MainWindow(dbConnectionObj,None)
    w.show()
    sys.exit(app.exec())