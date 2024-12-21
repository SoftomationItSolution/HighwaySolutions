from PySide6.QtWidgets import QWidget, QHBoxLayout, QLabel, QPushButton, QFrame
from PySide6.QtCore import Qt, Signal

class HeaderSection(QWidget):
    logout_signal = Signal()

    def __init__(self, height=60):
        super().__init__()
        self.setup_ui(height)

    def setup_ui(self, height):
        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        self.setLayout(layout)

        header_frame = QFrame(self)
        header_frame.setFrameShape(QFrame.StyledPanel) 
        header_frame.setFrameShadow(QFrame.Sunken)     
        header_frame.setStyleSheet("border: 1px solid white;") 
        header_layout = QHBoxLayout(header_frame)
        header_layout.setContentsMargins(5, 5, 5, 5)

        self.name_label = QLabel("Test")
        self.name_label.setAlignment(Qt.AlignLeft)
        self.name_label.setStyleSheet("border: none")
        header_layout.addWidget(self.name_label)

        logout_button = QPushButton("Logout")
        logout_button.setStyleSheet("padding: 5px 10px; font-size: 14px;")
        logout_button.setObjectName("resetButton")
        logout_button.clicked.connect(self.emit_logout_signal)
        header_layout.addWidget(logout_button, alignment=Qt.AlignRight)

        layout.addWidget(header_frame)  # Add the frame to the main layout

        # Set overall style and height for the widget
        self.setStyleSheet("color: white;")
        self.setFixedHeight(height)

    def emit_logout_signal(self):
        self.logout_signal.emit()
