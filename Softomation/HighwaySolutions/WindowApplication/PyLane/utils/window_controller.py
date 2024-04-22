

from GUI.forms.LoginWindow import LoginForm
from GUI.forms.MainWindow import MainWindow


class WindowController:
    def __init__(self,dbConnectionObj,config_manager,systemSetting,project_config_data,logger,default_plaza_Id,system_ip,screen_width,screen_height):
        self.dbConnectionObj=dbConnectionObj
        self.config_manager=config_manager
        self.systemSetting=systemSetting
        self.screen_width=screen_width
        self.screen_height=screen_height
        self.logger=logger
        self.default_plaza_Id=default_plaza_Id
        self.system_ip=system_ip
        self.project_config_data=project_config_data
        self.window=None
        
    def show_login(self,user_details):
        self.login = LoginForm(self.dbConnectionObj,self.config_manager,self.logger,self.screen_width,self.screen_height)
        self.login.switch_window.connect(self.show_main)
        self.login.show()
        if self.window is not None:
            self.window.hide()

    def show_main(self,user_details):
        self.window = MainWindow(self.dbConnectionObj,self.config_manager, user_details,self.systemSetting,self.project_config_data,self.logger,self.default_plaza_Id,self.system_ip,self.screen_width,self.screen_height)
        self.window.switch_window.connect(self.show_login)
        self.login.hide()
        self.window.show()