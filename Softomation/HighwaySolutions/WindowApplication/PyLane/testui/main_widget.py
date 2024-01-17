from PySide6.QtWidgets import QWidget, QLabel, QFrame, QHBoxLayout
from PySide6.QtCore import Qt

class MainWidget(QFrame):
    def __init__(self,height):
        super().__init__()
        main_layout = QHBoxLayout(self)
        self.setFixedHeight(height)
        for i in range(4):
            part_label = QLabel(f"Part {i + 1}")
            main_layout.addWidget(part_label)
            part_label.setStyleSheet("border: none;")