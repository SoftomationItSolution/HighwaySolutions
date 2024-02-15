from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem
from PySide6.QtCore import Qt

class WimDataQueueBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("background-color: lightgray;border: none;border-bottom: 1px solid black;border-right: 1px solid black;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=0
        lbl_height=20
        list_height=height-(btn_height+lbl_height)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)
        box_heading = QLabel("Wim Data Queue")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setStyleSheet("border:none;")
        box_heading.setFixedHeight(lbl_height)
        box_layout.addWidget(box_heading)

        self.tblWim = QTableWidget()
        #self.tblWim.setColumnCount(5)
        self.tblWim.setHorizontalHeaderLabels(["S.No", "Weight", "Allowed Weight", "Overweight", "Class"])
        self.tblWim.setStyleSheet("color: white;border: none;")
        self.tblWim.setFixedHeight(list_height)
        box_layout.addWidget(self.tblWim)

class RecentTransactionBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("background-color: lightgray;border: none;border-bottom: none;border-right: 1px solid black;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=0
        lbl_height=20
        list_height=height-(btn_height+lbl_height)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("Recent Transaction")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setStyleSheet("border:none;")
        box_heading.setFixedHeight(lbl_height)
        box_layout.addWidget(box_heading)

        

        self.tblRecentTrans = QTableWidget()
        self.tblRecentTrans.setColumnCount(6)
        self.tblRecentTrans.setHorizontalHeaderLabels(["Transaction", "Type", "Vehicle Class", "Date Time", "Toll Amount", "Receipt"])
        self.tblRecentTrans.setRowCount(0)
        self.tblRecentTrans.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(self.tblRecentTrans)

        data = [
            ("1", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt"),
            ("2", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt"),
            ("3", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt")
        ]

        # Populate the table with data
        for row_index, row_data in enumerate(data):
            self.tblRecentTrans.insertRow(row_index)
            for col_index, col_data in enumerate(row_data):
                item = QTableWidgetItem(col_data)
                self.tblRecentTrans.setItem(row_index, col_index, item)