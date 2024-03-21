import json
import sys
from PySide6.QtCore import Qt, Signal
from PySide6.QtWidgets import QMainWindow
from gui.ui.messBox import show_custom_message_box
from gui.ui.ui_LoginWindow import Ui_Login
from models.CommonManager import CommonManager
from utils.crypt import encrypt_aes_256_cbc


class LoginUI(QMainWindow, Ui_Login):
    switch_window = Signal(str)

    def __init__(self, dbConnectionObj, user_details, logger):
        super(LoginUI, self).__init__()
        self.db = dbConnectionObj
        self.logger = logger
        self.db_cm = CommonManager(dbConnectionObj)
        self.setupUi(self)
        self.setWindowFlags(Qt.FramelessWindowHint)
        self.setAttribute(Qt.WA_TranslucentBackground)
        self.close_button.clicked.connect(self.close)
        self.login_button.clicked.connect(self.login)

    def login(self):
        username = self.username_lineEdit.text()
        password = self.password_lineEdit.text()
        if not username or not password:
            show_custom_message_box(
                "Login Failed", "Username and password cannot be blank.", 'war')
            return
        else:
            try:
                res = self.db_cm.GetUserByLoginId(username)
                if res is None:
                    show_custom_message_box(
                        "Login Failed", "Invalid Username", 'inf')
                    return
                else:
                    if encrypt_aes_256_cbc(password) == res[0]["LoginPassword"]:
                        userDetails = json.dumps(res[0])
                        self.switch_window.emit(userDetails)
                    else:
                        show_custom_message_box(
                            "Login Failed", "Invalid password", 'cri')
                        return
            except Exception as e:
                self.logger.logError(f"Error in login: {e}")
                show_custom_message_box(
                    "Login Failed", "Somthing went wrong!", 'cri')

    def close(self):
        sys.exit()

    def closeEvent(self, event):
        sys.exit()

    def minimize(self):
        self.showMinimized()