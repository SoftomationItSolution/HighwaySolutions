from PySide6.QtWidgets import QWidget, QLabel, QFrame, QHBoxLayout,QPushButton
from PySide6.QtGui import QFont, QIcon
from PySide6.QtCore import QSize, Qt

class MainHeaderWidget(QFrame):
    def __init__(self,height):
        super().__init__()
        self.header_layout = QHBoxLayout(self)
        self.setFixedHeight(height)
        font = QFont()
        font.setPointSize(20)
        font.setFamily("Agency FB")

        self.login_label = QLabel()
        self.login_label.setFont(font)
        self.login_label.setStyleSheet("color: white;border: none;")
        self.header_layout.addWidget(self.login_label, alignment=Qt.AlignLeft | Qt.AlignVCenter)

        self.login_at_label = QLabel()
        self.login_at_label.setFont(font)
        self.login_at_label.setStyleSheet("color: white;border: none;")
        self.header_layout.addWidget(self.login_at_label, alignment=Qt.AlignLeft | Qt.AlignVCenter)


        self.shift_label = QLabel()
        self.shift_label.setStyleSheet("color: white;border: none;") 
        self.shift_label.setFont(font)
        self.header_layout.addWidget(self.shift_label, alignment=Qt.AlignLeft | Qt.AlignVCenter) 
       
        self.datetime_label = QLabel()
        self.datetime_label.setStyleSheet("color: white;border: none;")
        self.datetime_label.setFont(font)
        self.header_layout.addWidget(self.datetime_label, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.logout_button = QPushButton()
        self.logout_button.setIcon(QIcon("assets/images/logout.png"))
        self.logout_button.setIconSize(QSize(24, 24))
        self.logout_button.setStyleSheet("background-color: white;")
        self.header_layout.addWidget(self.logout_button, alignment=Qt.AlignRight | Qt.AlignVCenter)
        self.setStyleSheet("border-bottom: 1px solid white;")