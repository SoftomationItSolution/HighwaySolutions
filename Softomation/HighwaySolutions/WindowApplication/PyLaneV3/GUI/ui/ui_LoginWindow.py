from PySide6.QtCore import (QCoreApplication,QMetaObject,QSize,Qt)
from PySide6.QtGui import (QFont)
from PySide6.QtWidgets import (QFrame, QHBoxLayout,QLabel, QLineEdit, QPushButton, QVBoxLayout, QWidget)

class Ui_Login(object):
    def setupUi(self, Login):
        if not Login.objectName():
                Login.setObjectName(u"Login")
        Login.resize(450, 432)
        Login.setMinimumSize(QSize(450, 400))
        Login.setMaximumSize(QSize(450, 432))
        self.centralwidget = QWidget(Login)
        self.centralwidget.setObjectName(u"centralwidget")
        self.centralwidget.setStyleSheet(u"QWidget#centralwidget{""background-color:rgb(1, 27, 65);border-radius: 20px;""}"
                                          "\n""QFrame#frame{""margin: 60px;""border-radius: 20px;""background-color: rgba(225, 228, 221, 120)""}"
                                          "\n""QLineEdit{""min-height: 45px;""border-radius: 20px;""background-color: #FFFFFF;""padding-left: 20px;""color: rgb(140, 140, 140);""}"
                                          "\n""QLineEdit:hover{\n""border: 2px solid rgb(139, 142, 139);""}"
                                          "\n""QPushButton#login_button{""min-height: 45px;""border-radius: 20px;""background-color: rgb(140, 140, 140);""color: #FFFFFF;""}"
                                          "\n""QPushButton#login_button:hover{""border: 2px solid rgb(255, 255, 255);""}"
                                         "\n""QPushButton#close_button{""background-color: rgb(186, 0, 0);""border-radius: 6px;""}"
                                         "")
        self.verticalLayout_2 = QVBoxLayout(self.centralwidget)
        self.verticalLayout_2.setSpacing(0)
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)

        self.top_bar = QFrame(self.centralwidget)
        self.top_bar.setObjectName(u"top_bar")
        self.top_bar.setMinimumSize(QSize(0, 30))
        self.top_bar.setMaximumSize(QSize(16777215, 30))
        self.top_bar.setFrameShape(QFrame.NoFrame)
        self.top_bar.setFrameShadow(QFrame.Raised)

        self.horizontalLayout = QHBoxLayout(self.top_bar)
        self.horizontalLayout.setSpacing(0)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)


        self.frame_4 = QFrame(self.top_bar)
        self.frame_4.setObjectName(u"frame_4")
        self.frame_4.setFrameShape(QFrame.NoFrame)
        self.frame_4.setFrameShadow(QFrame.Raised)
        self.horizontalLayout.addWidget(self.frame_4)
        
        self.frame_3 = QFrame(self.top_bar)
        self.frame_3.setObjectName(u"frame_3")
        self.frame_3.setMaximumSize(QSize(60, 16777215))
        self.frame_3.setFrameShape(QFrame.NoFrame)
        self.frame_3.setFrameShadow(QFrame.Raised)

        self.horizontalLayout_3 = QHBoxLayout(self.frame_3)
        self.horizontalLayout_3.setSpacing(0)
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.horizontalLayout_3.setContentsMargins(0, 0, 5, 0)
        # self.minimize_button = QPushButton(self.frame_3)
        # self.minimize_button.setObjectName(u"minimize_button")
        # self.minimize_button.setMaximumSize(QSize(12, 12))
        # self.horizontalLayout_3.addWidget(self.minimize_button)
        self.close_button = QPushButton(self.frame_3)
        self.close_button.setObjectName(u"close_button")
        self.close_button.setMaximumSize(QSize(12, 12))
        self.horizontalLayout_3.addWidget(self.close_button)
        self.horizontalLayout.addWidget(self.frame_3)

        self.verticalLayout_2.addWidget(self.top_bar)
        
        self.frame = QFrame(self.centralwidget)
        self.frame.setObjectName(u"frame")
        self.frame.setStyleSheet(u"")
        self.frame.setFrameShape(QFrame.NoFrame)
        self.frame.setFrameShadow(QFrame.Raised)

        self.verticalLayout = QVBoxLayout(self.frame)
        self.verticalLayout.setSpacing(10)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.verticalLayout.setContentsMargins(30, 30, 30, 30)
        
        self.label_2 = QLabel(self.frame)
        self.label_2.setObjectName(u"label_2")
        self.label_2.setMaximumSize(QSize(16777215, 40))
        self.label_2.setAlignment(Qt.AlignCenter)
        self.verticalLayout.addWidget(self.label_2)

        self.username_lineEdit = QLineEdit(self.frame)
        self.username_lineEdit.setObjectName(u"username_lineEdit")
        self.verticalLayout.addWidget(self.username_lineEdit)

        self.password_lineEdit = QLineEdit(self.frame)
        self.password_lineEdit.setEchoMode(QLineEdit.Password)
        self.password_lineEdit.setObjectName(u"password_lineEdit")
        self.verticalLayout.addWidget(self.password_lineEdit)

        self.login_button = QPushButton(self.frame)
        self.login_button.setObjectName(u"login_button")
        self.verticalLayout.addWidget(self.login_button)
        self.setDefaultButton(self.login_button)
        self.bottom_frame = QFrame(self.frame)
        self.bottom_frame.setObjectName(u"bottom_frame")
        self.bottom_frame.setMaximumSize(QSize(16777215, 20))
        self.bottom_frame.setFrameShape(QFrame.NoFrame)
        self.bottom_frame.setFrameShadow(QFrame.Raised)
        
        self.horizontalLayout_2 = QHBoxLayout(self.bottom_frame)
        self.horizontalLayout_2.setSpacing(0)
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)

        font = QFont()
        font.setItalic(True)
        self.verticalLayout.addWidget(self.bottom_frame)
        self.verticalLayout_2.addWidget(self.frame)
        Login.setCentralWidget(self.centralwidget)
        self.retranslateUi(Login)
        QMetaObject.connectSlotsByName(Login)

    def setDefaultButton(self, button):
        self.default_button = button
        self.default_button.setDefault(True)

    def retranslateUi(self, Login):
            Login.setWindowTitle(QCoreApplication.translate("Login", u"MainWindow", None))
            self.close_button.setText("X")
            self.label_2.setText(QCoreApplication.translate("Login", u"<html><head/><body><p><span style=\" font-size:20pt;\">Login</span></p></body></html>", None))
            self.username_lineEdit.setPlaceholderText(QCoreApplication.translate("Login", u"Login Id", None))
            self.password_lineEdit.setPlaceholderText(QCoreApplication.translate("Login", u"Password", None))
            self.login_button.setText(QCoreApplication.translate("Login", u"Log In", None))