from PySide6.QtWidgets import QFrame,QGroupBox, QVBoxLayout, QTableWidget, QTableWidgetItem,QAbstractItemView,QHeaderView
from PySide6.QtCore import Qt
from PySide6.QtGui import QColor
from pubsub import pub
class RecentTransactionBox(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        try:
            self.logger=logger
            self.setFixedWidth(width)
            self.setFixedHeight(height)
            self.data=None
            layout = QVBoxLayout() 
            self.setLayout(layout)
            layout.setContentsMargins(0, 0, 0, 0)
            layout.setSpacing(0)
            group_box = QGroupBox("Recent Transaction")
            group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; ; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            group_box.setFixedHeight(height)
            layout.addWidget(group_box) 

            group_box_layout = QVBoxLayout()
            group_box.setLayout(group_box_layout)
            group_box_layout.setContentsMargins(0, 0, 0, 0)
            group_box_layout.setSpacing(0)
           
            display_header = ["Txn Id", "Type", "Vehicle Class", "Date Time", "Toll Fare","Tag Penalty","Overweight"]
            self.tblRecentTrans = QTableWidget()
            self.tblRecentTrans.setColumnCount(len(display_header))
            self.tblRecentTrans.setHorizontalHeaderLabels(display_header)
            self.tblRecentTrans.setMaximumWidth(width)
            self.tblRecentTrans.setFixedHeight(height-40)
            self.tblRecentTrans.setFocusPolicy(Qt.NoFocus)
            self.tblRecentTrans.setEditTriggers(QAbstractItemView.NoEditTriggers)
            self.tblRecentTrans.setSelectionMode(QAbstractItemView.NoSelection)
            self.tblRecentTrans.setStyleSheet("border: none;")
            self.tblRecentTrans.verticalHeader().hide()

            header = self.tblRecentTrans.horizontalHeader()
            vertical_header = self.tblRecentTrans.verticalHeader()
            
            header.setStyleSheet("background-color: #b5b6b7; color: #000")
            header.setStyleSheet("QHeaderView::section { background-color: #b5b6b7; color: #000; }")
            vertical_header.setStyleSheet("background-color: #b5b6b7; color: #000")
            vertical_header.setStyleSheet("QHeaderView::section { background-color: #b5b6b7; color: #000; }")
            header.setSectionResizeMode(QHeaderView.ResizeToContents)
            header.setStretchLastSection(True)
            group_box_layout.addWidget(self.tblRecentTrans)
            pub.subscribe(self.update_row_data, "lane_processed")
        except Exception as e:
            self.logger.logError(f"Error in RecentTransactionBox __init__: {e}")
        

    def refresh_table_data(self,):
        try:
            self.tblRecentTrans.setRowCount(len(self.data))
            for row_idx, row_data in enumerate(self.data):
                for col_idx, header in enumerate(self.rowheaders):
                    item = QTableWidgetItem(str(row_data.get(header, "")))
                    item.setForeground(QColor('white'))
                    self.tblRecentTrans.setItem(row_idx, col_idx, item)
        except Exception as e:
            self.logger.logError(f"Error in RecentTransactionBox refresh_table_data: {e}")

    def update_lt(self, data):
        try:
            self.data=data
            self.refresh_table_data()
        except Exception as e:
            self.logger.logError(f"Error in RecentTransactionBox update_lt: {e}")

    def update_row_data(self, transactionInfo):
        try:
            if self.data is None:
                self.data = [transactionInfo]
            else:
                self.data.insert(0, transactionInfo)
                if len(self.data) > 10:
                    self.data.pop()
            self.refresh_table_data()
        except Exception as e:
            self.logger.logError(f"Error in RecentTransactionBox update_row_data: {e}")
    @property
    def rowheaders(self):
        return ["LaneTransactionId", "TransactionTypeName", "VehicleSubClassName", "TransactionDateTime", "TransactionAmount", "TagPenaltyAmount", "OverWeightAmount"]