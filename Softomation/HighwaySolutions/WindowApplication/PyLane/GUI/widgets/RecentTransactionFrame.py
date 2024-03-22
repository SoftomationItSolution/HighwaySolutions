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
        #self.table.setFont(self.fontSize)
        #self.refresh_table_data()
        self.tblRecentTrans.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        header = self.tblRecentTrans.horizontalHeader()
        vertical_header = self.tblRecentTrans.verticalHeader()
        
        header.setStyleSheet("background-color: black; color: white")
        header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        vertical_header.setStyleSheet("background-color: black; color: white")
        vertical_header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        
        self.tblRecentTrans.setStyleSheet("border: none;border-top: 1px solid white;")
        box_layout.addWidget(self.tblRecentTrans)
        

    def refresh_table_data(self,data):
        self.tblRecentTrans.setRowCount(len(data))
        for row_idx, row_data in enumerate(data):
         for col_idx, header in enumerate(self.rowheaders):
            item = QTableWidgetItem(str(row_data.get(header, "")))
            item.setForeground(QColor('white'))
            self.tblRecentTrans.setItem(row_idx, col_idx, item)

    def update_lt(self, data):
        self.refresh_table_data(data)

    @property
    def rowheaders(self):
        return ["LaneTransactionId", "TransactionTypeName", "VehicleSubClassName", "TransactionDateTime", "TransactionAmount", "TagPenaltyAmount", "OverWeightAmount"]