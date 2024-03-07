

from gui.forms.LoginWindow import LoginUI
from gui.forms.MainWindow import MainWindow


class WindowController:
    def __init__(self,dbConnectionObj,config_manager):
        self.db=dbConnectionObj
        self.config_manager=config_manager
     
    def show_login(self,user_details):
        self.login = LoginUI(self.db,user_details)
        self.login.switch_window.connect(self.show_main)
        self.login.show()

    def show_main(self,user_details):
        self.window = MainWindow(self.db, user_details)
        self.window.switch_window.connect(self.show_login)
        self.login.hide()
        self.window.show()