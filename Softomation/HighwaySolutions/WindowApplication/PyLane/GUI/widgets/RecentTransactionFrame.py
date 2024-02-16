from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem
from PySide6.QtCore import Qt
from PySide6.QtGui import QColor,QPalette
class RecentTransactionBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("border: none;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=0
        lbl_height=30
        list_height=height-(btn_height+lbl_height)
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Recent Transaction</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)
        

        self.tblRecentTrans = QTableWidget()
        self.tblRecentTrans.setColumnCount(6)
        self.tblRecentTrans.setHorizontalHeaderLabels(["Transaction", "Type", "Vehicle Class", "Date Time", "Toll Amount", "Receipt"])
        self.tblRecentTrans.setRowCount(0)
        header = self.tblRecentTrans.horizontalHeader()
        vertical_header = self.tblRecentTrans.verticalHeader()
        
        header.setStyleSheet("background-color: black; color: white")
        header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        vertical_header.setStyleSheet("background-color: black; color: white")
        vertical_header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")


        
        
        self.tblRecentTrans.setStyleSheet("border: none;border-top: 1px solid white;")
        box_layout.addWidget(self.tblRecentTrans)

        data = [
            ("1", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt"),
            ("2", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt"),
            ("3", "Transaction", "Type", "Date Time", "Toll Amount", "Receipt")
        ]

        for row_index, row_data in enumerate(data):
            self.tblRecentTrans.insertRow(row_index)
            for col_index, col_data in enumerate(row_data):
                item = QTableWidgetItem(col_data)
                item.setForeground(QColor('white'))
                self.tblRecentTrans.setItem(row_index, col_index, item)