from PySide6.QtWidgets import QHBoxLayout, QVBoxLayout, QLabel, QPushButton, QWidget, QSpacerItem, QSizePolicy, QFrame
from PySide6.QtCore import Qt, QSize
from PySide6.QtGui import QPixmap, QColor
import os
from utils.constants import Utilities


class HeaderWidget(QWidget):
    def __init__(self, script_dir, plaza_config, default_directory, system_ip):
        super().__init__()
        self.plaza_config = plaza_config
        self.default_directory = default_directory
        self.system_ip = system_ip

        # Main layout
        header_layout = QHBoxLayout(self)
        header_layout.setContentsMargins(0, 0, 0, 0)
        header_layout.setSpacing(0)

        # Left layout
        left_layout = QHBoxLayout()
        left_layout.setContentsMargins(0, 0, 0, 0)
        left_layout.setSpacing(0)
        logo = QLabel()
        pixmap = QPixmap(os.path.join(script_dir, 'assets', 'images', "icon.ico"))
        logo.setPixmap(pixmap.scaled(40, 40, Qt.KeepAspectRatio, Qt.SmoothTransformation))
        left_layout.addWidget(logo)
        left_frame = QFrame()
        left_frame.setLayout(left_layout)

        # Center layout
        center_layout = QHBoxLayout()
        center_layout.setContentsMargins(0, 0, 0, 0)
        center_layout.setSpacing(0)
        self.system_label = QLabel(f"Static weighbridge ({self.system_ip})")
        self.system_label.setObjectName("loginlabel")
        self.system_label.setAlignment(Qt.AlignCenter)
        center_layout.addWidget(self.system_label)
        center_frame = QFrame()
        center_frame.setLayout(center_layout)
        center_layout.setAlignment(Qt.AlignCenter)

        # Right layout
        right_layout = QHBoxLayout()
        right_layout.setContentsMargins(0, 0, 0, 0)
        right_layout.setSpacing(0)
        self.login_label = QLabel("User123")
        self.login_label.setObjectName("loginlabel")
        self.login_label.setAlignment(Qt.AlignRight)

        self.logout_btn = QPushButton()
        logout_path = os.path.join(script_dir, 'assets', 'icons', "logout.svg")
        logout_icon = Utilities.set_colored_svg_icon(logout_path, QColor(255, 0, 0), Qt.transparent, QSize(24, 24))
        self.logout_btn.setIcon(logout_icon)
        self.logout_btn.setIconSize(QSize(24, 24))
        self.logout_btn.setFlat(True)
        self.logout_btn.setToolTip("Logout")
        self.logout_btn.setObjectName("LogoutButton")


        self.printer_btn = QPushButton()
        self.printer_path = os.path.join(script_dir, 'assets', 'icons', "printer.svg")
        self.printer_icon = Utilities.set_colored_svg_icon(self.printer_path, QColor(255, 0, 0), Qt.transparent, QSize(24, 24))
        self.printer_btn.setIcon(self.printer_icon)
        self.printer_btn.setIconSize(QSize(24, 24))
        self.printer_btn.setFlat(True)
        self.printer_btn.setToolTip("Printer")
        self.printer_btn.setObjectName("LogoutButton")


        self.setting_btn = QPushButton()
        self.setting_path = os.path.join(script_dir, 'assets', 'icons', "cog-outline.svg")
        self.setting_icon = Utilities.set_colored_svg_icon(self.setting_path, QColor(255, 0, 0), Qt.transparent, QSize(24, 24))
        self.setting_btn.setIcon(self.setting_icon)
        self.setting_btn.setIconSize(QSize(24, 24))
        self.setting_btn.setFlat(True)
        self.setting_btn.setToolTip("Setting")
        self.setting_btn.setObjectName("LogoutButton")

        right_layout.addWidget(self.login_label)
        right_layout.addWidget(self.printer_btn)
        right_layout.addWidget(self.setting_btn)
        right_layout.addWidget(self.logout_btn)
        right_frame = QFrame()
        right_frame.setLayout(right_layout)

        # Add left, center, and right frames to the header layout
        header_layout.addWidget(left_frame, 0)
        header_layout.addWidget(center_frame, 1)
        header_layout.addWidget(right_frame, 0)

        self.setFixedHeight(50)
        self.setLayout(header_layout)

    def update_wim_status(self, status):
        color = QColor(0, 255, 0) if status else QColor(255, 0, 0)
        self.setting_icon = Utilities.set_colored_svg_icon(self.setting_path, color, Qt.transparent, QSize(24, 24))
        self.setting_btn.setIcon(self.setting_icon)

    
    def update_printer_status(self, status):
        color = QColor(0, 255, 0) if status else QColor(255, 0, 0)
        self.printer_icon = Utilities.set_colored_svg_icon(self.printer_path, color, Qt.transparent, QSize(24, 24))
        self.printer_btn.setIcon(self.printer_icon)

    def update_header_lable(self, EquipmentName,system_ip):
        self.system_ip=system_ip
        self.system_label.setText(f"{EquipmentName} - ({self.system_ip})")
