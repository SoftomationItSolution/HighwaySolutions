from PySide6.QtWidgets import QWidget, QLabel, QGridLayout
from PySide6.QtGui import QPixmap

class HardwareWidget(QWidget):
    def __init__(self, width, height, hardware_name, img_name, is_online, is_connectioned, index, logger):
        try:
            super().__init__()
            self.hardware_name = hardware_name
            self.is_online = is_online
            self.is_connectioned = is_connectioned
            self.img_name = img_name
            self.index = index
            self.width = width
            self.height = height
            self.logger = logger
            self.initUI()
        except Exception as e:
            self.logger.logError(f"Error in HardwareWidget __init__: {e}")

    def initUI(self):
        layout = QGridLayout()
        layout.setContentsMargins(10, 0, 10, 0)
        layout.setSpacing(0)
        self.setLayout(layout)

        self.status_label = QLabel()
        layout.addWidget(self.status_label, 0, self.index)

        self.name_label = QLabel(self.hardware_name)
        layout.addWidget(self.name_label, 1, self.index)

        self.set_online_status()
        self.update_status()
        self.setToolTip(self.hardware_name)

    def update_status(self):
        try:
            pixmap = QPixmap(self.img_name)
            if pixmap.isNull():
                self.logger.logError(f"Error: QPixmap is null in update_status for image {self.img_name}")
            else:
                scaled_pixmap = pixmap.scaledToHeight(self.height)
                self.status_label.setPixmap(scaled_pixmap)
        except Exception as e:
            self.logger.logError(f"Error in HardwareWidget update_status: {e}")

    def set_online_status(self):
        try:
            if not self.is_online:
                self.setStyleSheet("background-color: gray;")
            else:
                if self.is_connectioned:
                    self.setStyleSheet("background-color: orange;")
                else:
                    self.setStyleSheet("background-color: green;")
        except Exception as e:
            self.logger.logError(f"Error in HardwareWidget set_online_status: {e}")

    def set_icon(self, icon_path):
        try:
            self.img_name = icon_path
            self.update_status()
        except Exception as e:
            self.logger.logError(f"Error in HardwareWidget set_icon: {e}")
