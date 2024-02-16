from PySide6.QtWidgets import QFrame, QVBoxLayout, QHBoxLayout, QLabel, QPushButton,QListWidget,QListWidgetItem
from PySide6.QtCore import Qt

class CurrentTransactionBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("border: none;border-bottom: 1px solid white;border-right: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=30
        lbl_height=30
        list_height=height-(btn_height+lbl_height)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Current Transaction</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setStyleSheet("color: white;border: none;")
        box_heading.setFixedHeight(lbl_height)
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.ct_list = QListWidget(self)
        self.ct_list.setStyleSheet("border: none;border-top: 1px solid white;")
        self.ct_list.setFixedHeight(list_height)
        box_layout.addWidget(self.ct_list)

        

        button_layout = QHBoxLayout()
        button_layout.setContentsMargins(0, 0, 0, 0)
        btnReset = QPushButton("Reset")
        btnSubmit = QPushButton("Submit")
        btnReset.setStyleSheet("background-color: red; font-weight: bold;border: none;border-right: 1px solid black;")
        btnSubmit.setStyleSheet("background-color: green; font-weight: bold;border: none;")
        btnReset.setFixedHeight(btn_height)
        btnSubmit.setFixedHeight(btn_height)
        button_layout.addWidget(btnReset)
        button_layout.addWidget(btnSubmit)
        box_layout.addLayout(button_layout)