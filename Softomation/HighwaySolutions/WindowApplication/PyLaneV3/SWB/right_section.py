from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel, QGroupBox, QLineEdit, QPushButton, QFrame
)

class RightSection(QWidget):
    def __init__(self,height, width=300):
        super().__init__()
        self.setup_ui(height,width)

    def setup_ui(self,height, width):
        main_layout = QVBoxLayout()
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(5)
        self.setLayout(main_layout)

        # Create a frame to hold the entire content and apply the border
        frame = QFrame(self)
        frame.setFrameShape(QFrame.StyledPanel)  # Set the frame shape (e.g., a panel with a border)
        frame.setFrameShadow(QFrame.Sunken)     # Optional: add shadow effect to the frame
        frame.setStyleSheet("border: 1px solid white;")  # Apply a border to the frame
        frame_layout = QVBoxLayout(frame)
        frame_layout.setContentsMargins(5, 5, 5, 5)  # Optional: adjust margins inside the frame

        # Create a GroupBox for Connection Settings
        group_box = QGroupBox("Connection Settings")
        group_box_layout = QVBoxLayout()
        group_box.setLayout(group_box_layout)

        # Add IP Address textbox
        ip_label = QLabel("IP Address:")
        self.ip_input = QLineEdit()
        self.ip_input.setPlaceholderText("Enter IP Address")
        group_box_layout.addWidget(ip_label)
        group_box_layout.addWidget(self.ip_input)

        # Add Port textbox
        port_label = QLabel("Port:")
        self.port_input = QLineEdit()
        self.port_input.setPlaceholderText("Enter Port")
        group_box_layout.addWidget(port_label)
        group_box_layout.addWidget(self.port_input)

        # Add buttons for Connect and Disconnect
        button_layout = QHBoxLayout()
        self.connect_button = QPushButton("Connect")
        self.disconnect_button = QPushButton("Disconnect")
        self.disconnect_button.setObjectName("resetButton")

        button_layout.addWidget(self.connect_button)
        button_layout.addWidget(self.disconnect_button)
        group_box_layout.addLayout(button_layout)

        # Add the GroupBox to the frame's layout
        frame_layout.addWidget(group_box)

        # Add the frame to the main layout
        main_layout.addWidget(frame)
        main_layout.addStretch()

        self.setFixedWidth(width)
        self.setFixedHeight(height)