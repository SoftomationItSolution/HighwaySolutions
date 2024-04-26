

from GUI.forms.LoginWindow import LoginForm
from GUI.forms.MainWindow import MainWindow

class WindowController:
    def __init__(self,dbConnectionObj,default_directory,image_dir,systemSetting,lane_details,default_plaza_Id,screen_width,screen_height,logger):
        self.dbConnectionObj=dbConnectionObj
        self.default_directory=default_directory
        self.image_dir=image_dir
        self.systemSetting=systemSetting
        self.lane_details=lane_details
        self.default_plaza_Id=default_plaza_Id
        self.screen_width=screen_width
        self.screen_height=screen_height
        self.logger=logger
        self.window=None

    def show_login(self,user_details):
        self.login = LoginForm(self.dbConnectionObj,self.image_dir,self.logger,self.screen_width,self.screen_height)
        self.login.switch_window.connect(self.show_main)
        self.login.show()
        if self.window is not None:
            self.window.hide()
    def show_main(self,user_details):
        self.window = MainWindow(self.dbConnectionObj,self.default_directory,self.image_dir, user_details,self.systemSetting,self.lane_details,self.logger,self.default_plaza_Id,self.screen_width,self.screen_height)
        self.window.switch_window.connect(self.show_login)
        self.login.hide()
        self.window.show()