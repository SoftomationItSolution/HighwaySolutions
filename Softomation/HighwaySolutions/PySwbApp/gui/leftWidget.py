from PySide6.QtWidgets import QWidget, QVBoxLayout, QGroupBox, QListWidget
from PySide6.QtCore import Qt

class LeftWidget(QWidget):
    def __init__(self,wh=250):
        super().__init__()
        self.setContentsMargins(0, 0, 0, 0)
        self.setFixedWidth(wh)

        # Create a layout for the left widget
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        # Create a group box to hold the list
        group_box = QGroupBox("Vehicle Class")
        group_box.setContentsMargins(0, 0, 0, 0)
        group_box_layout = QVBoxLayout()

        # Add a list widget to the group box
        list_widget = QListWidget()
        list_widget.addItems(["Option 1", "Option 2", "Option 3", "Option 4"])
        group_box_layout.addWidget(list_widget)

        # Set layout for the group box
        group_box.setLayout(group_box_layout)

        # Add the group box to the main layout
        layout.addWidget(group_box)
