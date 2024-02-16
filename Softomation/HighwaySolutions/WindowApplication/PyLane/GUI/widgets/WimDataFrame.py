from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem
from PySide6.QtCore import Qt

class WimDataQueueBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("border: none;border-right: 1px solid white;border-left: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=0
        lbl_height=30
        list_height=height-(btn_height+lbl_height)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)
        

        box_heading = QLabel("<b>Wim Data Queue</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)



        self.tblWim = QTableWidget()
        self.tblWim.setHorizontalHeaderLabels(["S.No", "Weight", "Allowed Weight", "Overweight", "Class"])
        self.tblWim.setStyleSheet("color: white;border: none;border-top: 1px solid white;")
        self.tblWim.setFixedHeight(list_height)
        box_layout.addWidget(self.tblWim)