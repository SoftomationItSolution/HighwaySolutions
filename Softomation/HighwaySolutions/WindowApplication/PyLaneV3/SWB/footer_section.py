from PySide6.QtWidgets import QWidget, QHBoxLayout, QLabel
from PySide6.QtCore import Qt

class FooterSection(QWidget):
    def __init__(self,height=60, title="Footer"):
        super().__init__()
        self.setup_ui(height,title)

    def setup_ui(self,height, title):
        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        self.setLayout(layout)

        # Add a label to the footer
        self.footer_label = QLabel(title)
        self.footer_label.setAlignment(Qt.AlignCenter)
        layout.addWidget(self.footer_label)

        # Set footer style
        self.setStyleSheet("border: 1px solid white;color: white;")
        self.setFixedHeight(height)