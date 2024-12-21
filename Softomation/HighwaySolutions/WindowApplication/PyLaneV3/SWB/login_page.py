from PySide6.QtWidgets import QWidget, QLabel, QLineEdit, QPushButton, QVBoxLayout, QMessageBox,QApplication
from PySide6.QtCore import Signal,Qt
from PySide6.QtGui import QScreen
import requests
class LoginPage(QWidget):
    successful_login = Signal(dict)
    def __init__(self,default_directory,plaza_config):
        super().__init__()
        self.setWindowTitle("Login Page")
        self.setGeometry(300, 300, 300, 150)
        self.default_directory=default_directory
        self.plaza_config=plaza_config
        self.label_username = QLabel("Username:")
        self.input_username = QLineEdit()
        self.label_password = QLabel("Password:")
        self.input_password = QLineEdit()
        self.input_password.setEchoMode(QLineEdit.Password)
        self.button_login = QPushButton("Login")
        self.button_login.setDefault(True)
        self.button_login.clicked.connect(self.authenticate)

        layout = QVBoxLayout()
        layout.addWidget(self.label_username)
        layout.addWidget(self.input_username)
        layout.addWidget(self.label_password)
        layout.addWidget(self.input_password)
        layout.addWidget(self.button_login)

        self.setLayout(layout)
        self.center_window()

    def center_window(self):
        screen = QScreen.availableGeometry(QApplication.primaryScreen())
        x = (screen.width() - self.width()) // 2
        y = (screen.height() - self.height()) // 2
        self.move(x, y)

    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Return or event.key() == Qt.Key_Enter:
            self.authenticate()
        

    def authenticate(self):
        apipath=self.plaza_config["plaza_api_p"]+"Softomation/FastTrackHighway-TMS/"
        username = self.input_username.text()
        password = self.input_password.text()
        if not username or not password:
            QMessageBox.warning(self, "Error", "Please enter both username and password!")
            return
        
        payload = {
            "LoginId": username,
            "LoginPassword": password
        }
        try:
            api_url=apipath+"ValidateUser"
            response = requests.post(api_url, json=payload, timeout=10)
            response.raise_for_status()

            data = response.json()
            if len(data["Message"])>0:
                if data["Message"][0]["AlertMessage"]=="success":
                    self.successful_login.emit(data["ResponseData"])
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Invalid credentials!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {e}")
