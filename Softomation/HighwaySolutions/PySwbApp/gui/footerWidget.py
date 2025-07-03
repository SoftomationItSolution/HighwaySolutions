# Footer.py
from PySide6.QtCore import Qt
from PySide6.QtWidgets import QLabel, QWidget, QHBoxLayout

class FooterWidget(QWidget):
    def __init__(self):
        super().__init__()

        # Create the footer label
        footer_label = QLabel("SWB App")
        footer_label.setAlignment(Qt.AlignCenter)
        footer_label.setStyleSheet("font-size: 20px; padding: 10px;")

        # Create a layout and add the label to it
        layout = QHBoxLayout()
        layout.addWidget(footer_label)
        layout.setContentsMargins(0, 0, 0, 0)
        self.setLayout(layout)
        self.setFixedHeight(50)  # Set the fixed height for the footer
        #self.setStyleSheet("background-color: lightgreen;")
