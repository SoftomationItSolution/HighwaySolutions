import os
from PySide6.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout, QLabel, QRadioButton,
    QLineEdit, QPushButton, QComboBox, QWidget, QStackedWidget
)
from serial.tools import list_ports

from utils.constants import Utilities


class ConnectionDialog(QDialog):
    def __init__(self,plaza_config, parent=None):
        super().__init__(parent)
        self.plaza_config=plaza_config
        self.setWindowTitle("Select WIM Connection Type")
        self.setFixedWidth(300)

        self.layout = QVBoxLayout(self)

        # Radio Buttons
        self.tcp_radio = QRadioButton("TCP")
        self.serial_radio = QRadioButton("Serial")
        self.tcp_radio.setChecked(True)

        radio_layout = QHBoxLayout()
        radio_layout.addWidget(self.tcp_radio)
        radio_layout.addWidget(self.serial_radio)
        self.layout.addLayout(radio_layout)

        # Create stacked widget
        self.stacked_widget = QStackedWidget()

        # TCP Layout
        tcp_widget = QWidget()
        tcp_layout = QVBoxLayout(tcp_widget)
        self.ip_input = QLineEdit()
        self.ip_input.setPlaceholderText("Enter IP Address")
        self.port_input = QLineEdit()
        self.port_input.setPlaceholderText("Enter Port Number")
        tcp_layout.addWidget(QLabel("IP Address:"))
        tcp_layout.addWidget(self.ip_input)
        tcp_layout.addWidget(QLabel("Port:"))
        tcp_layout.addWidget(self.port_input)

        # Serial Layout
        serial_widget = QWidget()
        serial_layout = QVBoxLayout(serial_widget)
        self.com_port_combo = QComboBox()
        self.baudrate_combo = QComboBox()
        self.baudrate_combo.addItems(["2400","9600", "19200", "38400", "57600", "115200"])
        serial_layout.addWidget(QLabel("COM Port:"))
        serial_layout.addWidget(self.com_port_combo)
        serial_layout.addWidget(QLabel("Baud Rate:"))
        serial_layout.addWidget(self.baudrate_combo)

        # Add to stacked widget
        self.stacked_widget.addWidget(tcp_widget)    # index 0
        self.stacked_widget.addWidget(serial_widget) # index 1

        self.layout.addWidget(self.stacked_widget)

        # Connect Button
        self.connect_btn = QPushButton("Save")
        self.connect_btn.clicked.connect(self.accept)
        self.layout.addWidget(self.connect_btn)

        # Events
        self.tcp_radio.toggled.connect(self.toggle_mode)
        self.serial_radio.toggled.connect(self.toggle_mode)

        # Init
        self.load_config()
        self.populate_com_ports()
        self.toggle_mode()

    def toggle_mode(self):
        if self.tcp_radio.isChecked():
            self.stacked_widget.setCurrentIndex(0)  # TCP
        else:
            self.stacked_widget.setCurrentIndex(1)  # Serial

    def populate_com_ports(self):
        ports = list_ports.comports()
        self.com_port_combo.clear()
        for port in ports:
            self.com_port_combo.addItem(port.device)

    def load_config(self):
        if self.plaza_config.get("type")== "tcp":
            self.tcp_radio.setChecked(True)
            self.ip_input.setText(self.plaza_config.get("ip", ""))
            self.port_input.setText(self.plaza_config.get("port", ""))
        
        elif self.plaza_config.get("type")== "serial":
            self.serial_radio.setChecked(True)
            port = self.plaza_config.get("com_port", "")
            baud = self.plaza_config.get("baudrate", "9600")
            self.populate_com_ports()
            index = self.com_port_combo.findText(port)
            if index >= 0:
                self.com_port_combo.setCurrentIndex(index)
            else:
                self.com_port_combo.setCurrentIndex(0)

            baud_index = self.baudrate_combo.findText(baud)
            if baud_index >= 0:
                self.baudrate_combo.setCurrentIndex(baud_index)