import sys
from PySide6.QtWidgets import QApplication, QToolButton, QMainWindow, QVBoxLayout, QLineEdit, QPushButton, QWidget, QFrame, QLabel, QHBoxLayout
from PySide6.QtGui import QPixmap, QPainter, QIcon
from PySide6.QtCore import Qt, QSize
import qtawesome

class LoginForm(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Login Form")
        self.showFullScreen()
        self.background_image = QPixmap("assets/images/title-img.png")

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
        user_login_layout.addWidget(user_icon_button)

        username_line_edit = QLineEdit()
        username_line_edit.setFixedHeight(icon_height)
        username_line_edit.setStyleSheet("border: 1px solid #495057;")
        user_login_layout.addWidget(username_line_edit)

        user_password_layout = QHBoxLayout()
        user_password_layout.setSpacing(0)

        login_icon = QIcon(qtawesome.icon('fa.key', color_off='#FFFFFF', color_off_active='#FFFFFF'))
        password_icon_button = QPushButton()
        password_icon_button.setIcon(login_icon)
        password_icon_button.setIconSize(QSize(24, 24))
        password_icon_button.setStyleSheet("background-color: #011b41;")
        password_icon_button.setFixedWidth(icon_width)
        password_icon_button.setFixedHeight(icon_height)
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


if __name__ == "__main__":
    app = QApplication(sys.argv)

    window = LoginForm()
    window.show()

    sys.exit(app.exec())
