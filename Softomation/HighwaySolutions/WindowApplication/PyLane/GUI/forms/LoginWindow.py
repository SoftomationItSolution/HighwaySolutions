import json
import os
from PySide6.QtWidgets import QToolButton, QMainWindow, QVBoxLayout, QLineEdit, QPushButton, QWidget, QFrame, QLabel, QHBoxLayout
from PySide6.QtGui import QPixmap, QPainter, QIcon
from PySide6.QtCore import Qt, QSize,Signal
import qtawesome
from GUI.ui.messBox import show_custom_message_box
from models.CommonManager import CommonManager
from utils.crypt import CryptoUtils

class LoginForm(QMainWindow):
    switch_window = Signal(str)
    def __init__(self, dbConnectionObj, config_manager,logger):
        super().__init__()
        self.dbConnectionObj = dbConnectionObj
        self.config_manager = config_manager
        self.logger = logger
        self.showFullScreen()
        image_dir=config_manager.get_path('Paths', 'image_dir')
        icon = os.path.join(image_dir, 'title-img.png')
        self.background_image = QPixmap(icon)

        central_widget = QWidget()
        central_layout = QVBoxLayout(central_widget)
        central_layout.setAlignment(Qt.AlignCenter)

        white_frame = QFrame()
        white_frame.setObjectName("WhiteFrame")
        white_frame.setFixedWidth(520) 
        white_frame.setStyleSheet("QFrame#WhiteFrame {background-color: white; border-radius: 10px;}")

        frame_layout = QHBoxLayout(white_frame)
        frame_layout.setSpacing(10)
        frame_layout.setContentsMargins(10, 10, 10, 10)
        # Left Part
        left_layout = QVBoxLayout()
        left_layout.setAlignment(Qt.AlignCenter)
        left_layout.setSpacing(10)

        title_label = QLabel("Login")
        title_label.setStyleSheet("color: #f68e2b; font-size: 24px;")

        sub_title_label = QLabel("Sign in to continue to TMS.")
        sub_title_label.setStyleSheet("color: #74788d;")

        icon_height = 35
        icon_width = 35
        user_login_layout = QHBoxLayout()
        user_login_layout.setSpacing(0)

        icon = QIcon(qtawesome.icon('fa.user-o', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        user_icon_button = QPushButton()
        user_icon_button.setIcon(icon)
        user_icon_button.setIconSize(QSize(24, 24))
        user_icon_button.setStyleSheet("background-color: #011b41;")
        user_icon_button.setFixedWidth(icon_width)
        user_icon_button.setFixedHeight(icon_height)
        user_icon_button.setDisabled(True)
        user_login_layout.addWidget(user_icon_button)

        self.username_line_edit = QLineEdit()
        self.username_line_edit.setFixedHeight(icon_height)
        self.username_line_edit.setStyleSheet("border: 1px solid #495057;")
        user_login_layout.addWidget(self.username_line_edit)

        user_password_layout = QHBoxLayout()
        user_password_layout.setSpacing(0)

        login_icon = QIcon(qtawesome.icon('fa.key', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        password_icon_button = QPushButton()
        password_icon_button.setIcon(login_icon)
        password_icon_button.setIconSize(QSize(24, 24))
        password_icon_button.setStyleSheet("background-color: #011b41;")
        password_icon_button.setFixedWidth(icon_width)
        password_icon_button.setFixedHeight(icon_height)
        password_icon_button.setDisabled(True)
        user_password_layout.addWidget(password_icon_button)

        self.password_line_edit = QLineEdit()
        self.password_line_edit.setEchoMode(QLineEdit.Password)
        self.password_line_edit.setFixedHeight(icon_height)
        self.password_line_edit.setStyleSheet("border: 1px solid #495057;")
        user_password_layout.addWidget(self.password_line_edit)

        password_icon = QIcon(qtawesome.icon('fa.eye', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        self.show_hide_button = QToolButton()
        self.show_hide_button.setIcon(password_icon)
        self.show_hide_button.setIconSize(QSize(24, 24))
        self.show_hide_button.setStyleSheet("background-color: #011b41;")
        self.show_hide_button.setCheckable(True)
        self.show_hide_button.setFixedWidth(icon_width)
        self.show_hide_button.setFixedHeight(icon_height)
        self.show_hide_button.clicked.connect(self.toggle_password_visibility)
        user_password_layout.addWidget(self.show_hide_button)


        active_style = """
            QPushButton  {background-color: #f68e2b;border-color: #f68e2b;color: #fff;}
            QPushButton:hover {
                background-color: #011b41;
                border-color: #011b41;
                color: #fff;
            }
            QPushButton:pressed {
                background-color: #424ab7;
                border-color: #424ab7;
                color: #fff;
            }
            """
        login_button = QPushButton('Log In')
        login_button.setStyleSheet(active_style)
        login_button.setFixedHeight(icon_height)
        login_button.clicked.connect(self.login_user)
        

        left_layout.addWidget(title_label)
        left_layout.addWidget(sub_title_label)
        left_layout.addLayout(user_login_layout)
        left_layout.addLayout(user_password_layout)
        left_layout.addWidget(login_button)


        frame_layout.addLayout(left_layout)
        central_layout.addWidget(white_frame)

        self.setCentralWidget(central_widget)

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.drawPixmap(self.rect(), self.background_image)

    def toggle_password_visibility(self):
        if self.show_hide_button.isChecked():
            self.password_line_edit.setEchoMode(QLineEdit.Normal)
            password_icon = QIcon(qtawesome.icon('fa.eye-slash', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        else:
            self.password_line_edit.setEchoMode(QLineEdit.Password)
            password_icon = QIcon(qtawesome.icon('fa.eye', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        self.show_hide_button.setIcon(password_icon)
        self.show_hide_button.setStyleSheet("background-color: #011b41; color: #FFFFFF;")

    
    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Return or event.key() == Qt.Key_Enter:
            # If Enter key is pressed anywhere in the widget
            self.login_user()


    def login_user(self):
        username = self.username_line_edit.text()
        password = self.password_line_edit.text()
        if not username or not password:
            show_custom_message_box(
                "Login Failed", "Username and password cannot be blank.", 'war')
            return
        else:
            try:
                res = CommonManager.GetUserByLoginId(self.dbConnectionObj,username)
                if res is None:
                    show_custom_message_box(
                        "Login Failed", "Invalid Username", 'inf')
                    return
                else:
                    if CryptoUtils.encrypt_aes_256_cbc(password) == res[0]["LoginPassword"]:
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