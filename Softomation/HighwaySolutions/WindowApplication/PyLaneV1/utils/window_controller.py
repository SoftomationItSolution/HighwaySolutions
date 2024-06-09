

from GUI.forms.LoginWindow import LoginForm
from GUI.forms.MainWindow import MainWindow

class WindowController:
    def __init__(self,screen_width,screen_height,bg_service,logger,image_dir):
        self.screen_width=screen_width
        self.screen_height=screen_height
        self.bg_service=bg_service
        self.logger=logger
        self.image_dir=image_dir
        self.window=None

    def show_login(self,user_details):
        self.login = LoginForm(self.bg_service,self.screen_width,self.screen_height,self.logger,self.image_dir)
        self.login.switch_window.connect(self.show_main)
        self.login.show()
        if self.window is not None:
            self.window.hide()
    def show_main(self,user_details):
        self.window = MainWindow(self.bg_service,self.screen_width,self.screen_height,self.logger,self.image_dir,user_details)
        self.window.switch_window.connect(self.show_login)
        self.login.hide()
        self.window.show()