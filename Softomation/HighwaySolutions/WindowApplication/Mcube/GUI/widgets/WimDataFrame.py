from PySide6.QtWidgets import QFrame, QVBoxLayout, QTableWidget, QTableWidgetItem, QAbstractItemView, QHeaderView, QGroupBox
from PySide6.QtCore import Qt,QTimer
from datetime import datetime, timedelta
from PySide6.QtGui import QColor
from pubsub import pub

class WimDataQueueBox(QFrame):
    def __init__(self, width, height, logger):
        super().__init__()
        self.initUI(width, height, logger)

    def initUI(self, width, height, logger):
        try:
            self.logger = logger
            self.setFixedWidth(width)
            self.setFixedHeight(height)
            self.wim_q = []
            layout = QVBoxLayout() 
            self.setLayout(layout)
            layout.setContentsMargins(0, 0, 0, 0)
            layout.setSpacing(0)
            group_box = QGroupBox("Wim Data Queue")
            group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; ; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            group_box.setFixedHeight(height)
            layout.addWidget(group_box) 

            group_box_layout = QVBoxLayout()
            group_box.setLayout(group_box_layout)
            group_box_layout.setContentsMargins(0, 0, 0, 0)
            group_box_layout.setSpacing(0)

            display_header = ["Date Time", "Total Weight", "Axle Count"]
            self.tblWim = QTableWidget()
            self.tblWim.setColumnCount(len(display_header))
            self.tblWim.setHorizontalHeaderLabels(display_header)
            self.tblWim.setMaximumWidth(width)
            self.tblWim.setFixedHeight(height-40)
            self.tblWim.setFocusPolicy(Qt.NoFocus)
            self.tblWim.setEditTriggers(QAbstractItemView.NoEditTriggers)
            self.tblWim.setSelectionBehavior(QTableWidget.SelectRows)
            self.tblWim.setStyleSheet("border: none;")
            header = self.tblWim.horizontalHeader()
            vertical_header = self.tblWim.verticalHeader()
            header.setStyleSheet("background-color: #b5b6b7; color: #000")
            header.setStyleSheet("QHeaderView::section { background-color: #b5b6b7; color: #000; }")
            vertical_header.setStyleSheet("background-color: #b5b6b7; color: #000")
            vertical_header.setStyleSheet("QHeaderView::section { background-color: #b5b6b7; color: #000; }")
            header.setSectionResizeMode(QHeaderView.ResizeToContents)
            header.setStretchLastSection(True)
            group_box_layout.addWidget(self.tblWim)
            self.timer = QTimer(self)
            self.timer.timeout.connect(self.remove_old_data)
            self.timer.start(60000) 
            pub.subscribe(self.wim_transaction_info, "wim_processed")
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox __init__: {e}")

    def remove_old_data(self):
        try:
            current_time = datetime.now()
            minutes_ago = current_time - timedelta(minutes=1)
            rows_to_remove = []
            for idx, row_data in enumerate(self.wim_q):
                transaction_datetime_str  = row_data.get("TransactionDateTime")
                transaction_datetime = datetime.strptime(transaction_datetime_str, "%d-%b-%Y %H:%M:%S.%f")
                if transaction_datetime < minutes_ago:
                    rows_to_remove.append(idx)
            for row_idx in reversed(rows_to_remove):
                self.tblWim.removeRow(row_idx)
                del self.wim_q[row_idx]
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox remove_old_data: {e}")


    def wim_transaction_info(self, transactionInfo):
        try:
            self.wim_q.append(transactionInfo)
            self.refresh_table_data()
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox  wim_transaction_info: {e}")

    def refresh_table_data(self):
        try:
            self.tblWim.setRowCount(len(self.wim_q))
            for row_idx, row_data in enumerate(self.wim_q):
                for col_idx, header in enumerate(self.rowheaders):
                    item = QTableWidgetItem(str(row_data.get(header, "")))
                    item.setForeground(QColor('white'))
                    self.tblWim.setItem(row_idx, col_idx, item)
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox  refresh_table_data: {e}")


    def get_top_wim(self):
         if len(self.wim_q)>0:
           data=self.wim_q[0]
           self.wim_q.pop(0)
           self.refresh_table_data()
           return data
         else:
             None                

    @property
    def rowheaders(self):
        return ["TransactionDateTime", "TotalWeight", "AxleCount"]
