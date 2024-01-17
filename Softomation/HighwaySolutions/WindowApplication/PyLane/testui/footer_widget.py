from PySide6.QtWidgets import QWidget, QLabel, QFrame, QHBoxLayout
from PySide6.QtCore import Qt

class FooterWidget(QFrame):
    def __init__(self):
        super().__init__()

        footer_layout = QHBoxLayout(self)
        self.setFixedHeight(50)

        for i in range(4):
            part_label = QLabel(f"Part {i + 1}")
            footer_layout.addWidget(part_label)
            part_label.setStyleSheet("border: none;")  # Set border to none for the labels

        self.setStyleSheet("background-color: lightblue; border-top: 2px solid blue;")
