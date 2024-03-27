from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem,QAbstractItemView,QHeaderView
from PySide6.QtCore import Qt
from PySide6.QtGui import QColor
class RecentTransactionBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("border: none;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.data=None
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
        
        display_header = ["Id", "Type", "Vehicle Class", "Date Time", "Toll Fare","Tag Penalty","Overweight"]
        self.tblRecentTrans = QTableWidget()
        self.tblRecentTrans.setColumnCount(len(display_header))
        self.tblRecentTrans.setHorizontalHeaderLabels(display_header)
        self.tblRecentTrans.setMinimumWidth(width)
        self.tblRecentTrans.setFocusPolicy(Qt.NoFocus)
        self.tblRecentTrans.setEditTriggers(QAbstractItemView.NoEditTriggers)
        self.tblRecentTrans.setSelectionMode(QAbstractItemView.NoSelection)
        self.tblRecentTrans.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.tblRecentTrans.setStyleSheet("border: none;border-top: 1px solid white;")

        header = self.tblRecentTrans.horizontalHeader()
        vertical_header = self.tblRecentTrans.verticalHeader()
        
        header.setStyleSheet("background-color: black; color: white")
        header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        vertical_header.setStyleSheet("background-color: black; color: white")
        vertical_header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        header.setSectionResizeMode(QHeaderView.ResizeToContents)
        header.setStretchLastSection(True)
        
        box_layout.addWidget(self.tblRecentTrans)
        

    def refresh_table_data(self,):
        self.tblRecentTrans.setRowCount(len(self.data))
        for row_idx, row_data in enumerate(self.data):
         for col_idx, header in enumerate(self.rowheaders):
            item = QTableWidgetItem(str(row_data.get(header, "")))
            item.setForeground(QColor('white'))
            self.tblRecentTrans.setItem(row_idx, col_idx, item)

    def update_lt(self, data):
        self.data=data
        self.refresh_table_data()

    def update_row_data(self, new_item):
        if self.data is None:
            self.data = [new_item]
        else:
            self.data.insert(0, new_item)
            if len(self.data) > 10:
                self.data.pop()
        self.refresh_table_data()


    @property
    def rowheaders(self):
        return ["LaneTransactionId", "TransactionTypeName", "VehicleSubClassName", "TransactionDateTime", "TransactionAmount", "TagPenaltyAmount", "OverWeightAmount"]