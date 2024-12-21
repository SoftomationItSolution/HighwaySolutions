import os
import platform
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication
from SWB.login_page import LoginPage
from SWB.main_window import MainWindow
from utils.constants import Utilities
from utils.log_master import CustomLogger

class App(QApplication):
    def __init__(self, sys_argv):
        super().__init__(sys_argv)
        self.script_dir=os.path.dirname(os.path.abspath(__file__))
        self.default_directory=self.check_default_dir()
        self.plaza_config = self.get_plaza_config()
        self.logger = CustomLogger(self.default_directory, 'swb_app')
        self.setStyle("Fusion")

        self.setStyleSheet("""
            QWidget {
                background-color: #011b41;
                color: #D8DEE9;  
                font-size: 14px;
            }

            QPushButton {
                background-color: #011b41;
                border: 1px solid #FFF;
                padding: 5px;
                border-radius: 3px;
            }
            QPushButton:hover {
                background-color: #011b41;
            }
            QPushButton:pressed {
                background-color: #011b41;
            }

            QLabel {
                font-weight: bold;
            }

            QLineEdit {
                background-color: #3B4252;
                border: 1px solid #D8DEE9;
                border-radius: 3px;
                padding: 5px;
                color: #ECEFF4;
            }
            QListWidget {
                background-color: #011b41;
            }
            QListWidget::item {
                color: white;
                border: 1px solid #fff; 
                height:30px;
            } 
            QListWidget::item:selected { 
                background-color: #808080; color: white; 
            }  
            QListWidget::item:hover {
                background-color: #808080;color: black; 
            }
            QGroupBox {
                font-weight: bold;
                border: 1px solid #FFF;
                padding: 10px;
            }
            QPushButton {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 24px;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                margin: 4px 2px;
                border-radius: 12px;
            }
            QPushButton:hover {
                background-color: #45a049;
            }
            QPushButton:pressed {
                background-color: #388e3c;
            }
            QPushButton#resetButton {
                background-color: #f44336; /* Red color for reset button */
            }
            QPushButton#resetButton:hover {
                background-color: #d32f2f; /* Darker red color on hover */
            }
            QPushButton#resetButton:pressed {
                background-color: #b71c1c; /* Even darker red color when pressed */
            }
            QPushButton#resetButton:disabled {
                background-color: #aaaaaa;
                color: #666666;
            }
             QPushButton#searchButton {
                background-color: #0074d9; /* Red color for reset button */
            }
            QPushButton#searchButton:hover {
                background-color: #7fdbff; /* Darker red color on hover */
            }
            QPushButton#searchButton:pressed {
                background-color: #0074d9; /* Even darker red color when pressed */
            }
            QPushButton#searchButton:disabled {
                background-color: #aaaaaa;
                color: #666666;
            }               
            QPushButton:disabled {
                background-color: #aaaaaa;
                color: #666666;
            }
            QCheckBox {
                color: white;                    /* Text color */
                font-size: 14px;                  /* Font size */
                padding-left: 5px;                /* Padding for the label */
            }

            QCheckBox::indicator {
                width: 20px;                     /* Width of the checkbox */
                height: 20px;                    /* Height of the checkbox */
                border: 2px solid white;         /* Border around the checkbox */
                border-radius: 4px;              /* Rounded corners for the checkbox */
                background-color: #444;          /* Background color of the checkbox */
            }

            QCheckBox::indicator:checked {
                background-color: #f44336;          /* Background color when checked */
                border-color: #4a4;              /* Border color when checked */
            }

            QCheckBox::indicator:unchecked {
                background-color: #6c6;          /* Background color when unchecked */
                border-color: white;             /* Border color when unchecked */
            }

            QCheckBox::indicator:checked:hover {
                background-color: #f44336;          /* Light green when hovered over and checked */
            }

            QCheckBox::indicator:unchecked:hover {
                background-color: #6c6;          /* Darker grey when hovered over and unchecked */
            }

            QCheckBox:hover {
                color: #6c6;                     /* Text color when hovered */
            }

            

        """)
        
        self.image_dir = os.path.join(self.script_dir, 'assets', 'images')
        icon = os.path.join(self.image_dir, 'icon.ico')
        self.setWindowIcon(QIcon(icon))

        self.main_window = MainWindow(self.default_directory,self.plaza_config,self.script_dir)
        self.login_page = LoginPage(self.default_directory,self.plaza_config)

        self.login_page.successful_login.connect(self.show_main_window)
        self.main_window.logout_signal.connect(self.show_login_page)

        self.login_page.show()

    def show_main_window(self, username):
        self.main_window.set_user_details(username)
        self.main_window.show()
        self.login_page.hide()


    def show_login_page(self):
        self.login_page = LoginPage(self.default_directory,self.plaza_config)  # Create a new instance of LoginPage
        self.login_page.successful_login.connect(self.show_main_window)
        self.login_page.show()

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
            self.logger.logError(f"Error in check_default_dir {str(e)}")

    def get_plaza_config(self):
        try:
            plaza_path=os.path.join(self.default_directory, 'MasterConfig', 'plazaConfig.json')
            return Utilities.read_json_file(plaza_path)
        except Exception as e:
            self.logger.logError(f"Error in get_plaza_config {str(e)}")

if __name__ == "__main__":
    import sys
    
    app = App(sys.argv)
    sys.exit(app.exec())
