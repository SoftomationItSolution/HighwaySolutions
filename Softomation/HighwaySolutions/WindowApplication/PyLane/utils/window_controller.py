
from ui.LoginWindow import LoginUI
from ui.MainWindow import MainWindow

class WindowController:
    def __init__(self,dbConnectionObj):
        self.db=dbConnectionObj
     
    def show_login(self):
        self.login = LoginUI(self.db)
        self.login.switch_window.connect(self.show_main)
        self.login.show()

    def show_main(self,user_details):
        self.window = MainWindow(self.db, user_details)
        self.window.switch_window.connect(self.show_login)
        self.login.hide()
        self.window.show()