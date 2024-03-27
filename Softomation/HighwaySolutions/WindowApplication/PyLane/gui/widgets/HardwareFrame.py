from PySide6.QtWidgets import QWidget, QLabel, QGridLayout
from PySide6.QtGui import QPixmap

class HardwareWidget(QWidget):
    def __init__(self, width, height, hardware_name, img_name, is_online, index):
        super().__init__()
        self.hardware_name = hardware_name
        self.is_online = is_online
        self.img_name = img_name
        self.index = index
        self.width = width
        self.height = height
        self.initUI()

    def initUI(self):
        layout = QGridLayout()
        layout.setContentsMargins(10, 0, 10, 0)
        layout.setSpacing(0)
        self.setLayout(layout)
        self.status_label = QLabel()
        layout.addWidget(self.status_label, 0, self.index)
        self.name_label = QLabel(self.hardware_name)
        if self.is_online:
            self.setStyleSheet("background-color: green;")
        else:
            self.setStyleSheet("background-color: red;")
        self.update_status()
        self.setToolTip(self.hardware_name)

    def update_status(self):
        pixmap = QPixmap(self.img_name)
        scaled_pixmap = pixmap.scaledToHeight(self.height)
        self.status_label.setPixmap(scaled_pixmap)

    def set_online_status(self, is_online):
        self.is_online = is_online
        if self.is_online:
            self.setStyleSheet("background-color: green;")
        else:
            self.setStyleSheet("background-color: red;")

    def set_icon(self, icon_path):
        self.img_name = icon_path
        self.update_status()