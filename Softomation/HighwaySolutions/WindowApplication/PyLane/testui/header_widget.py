from PySide6.QtWidgets import QWidget, QLabel, QFrame, QHBoxLayout
from PySide6.QtCore import Qt

class HeaderWidget(QFrame):
    def __init__(self):
        super().__init__()

        header_layout = QHBoxLayout(self)
        self.setFixedHeight(50)

        for i in range(4):
            part_label = QLabel(f"Part {i + 1}")
            header_layout.addWidget(part_label)
            part_label.setStyleSheet("border: none;")  # Set border to none for the labels

        self.setStyleSheet("background-color: lightblue; border-bottom: 2px solid blue;")
