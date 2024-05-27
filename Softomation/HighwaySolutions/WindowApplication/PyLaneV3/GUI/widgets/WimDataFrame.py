import gc
from PySide6.QtWidgets import QFrame, QVBoxLayout, QTableWidget, QTableWidgetItem, QAbstractItemView, QHeaderView, QGroupBox
from PySide6.QtCore import Qt, QMutex
from PySide6.QtGui import QColor
from pubsub import pub

class WimDataQueueBox(QFrame):
    def __init__(self, width, height, logger):
        super().__init__()
        self.initUI(width, height, logger)

    def initUI(self, width, height, logger):
        try:
            self.logger = logger
            self.mutex = QMutex() 
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
            pub.subscribe(self.wim_transaction_info, "wim_processed")
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox __init__: {e}")

    def wim_transaction_info(self, transactionInfo):
        self.mutex.lock()
        try:
            if transactionInfo is not None:
                self.wim_q.append(transactionInfo)
                if len(self.wim_q) > 5:
                    self.wim_q.pop(0)
                self.refresh_table_data()
                #gc.collect()  
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox wim_transaction_info: {e}")
        finally:
            self.mutex.unlock()

    def get_top_wim(self):
        self.mutex.lock()
        result_data=None
        try:
            if len(self.wim_q) > 0:
                data = self.wim_q.pop(0)
                self.refresh_table_data()
                #gc.collect() 
                result_data=data
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox get_top_wim: {e}")
            return None
        finally:
            self.mutex.unlock()
            return result_data

    def refresh_table_data(self):
        try:
            self.tblWim.setRowCount(len(self.wim_q))
            for row_idx, row_data in enumerate(self.wim_q):
                for col_idx, header in enumerate(self.rowheaders):
                    item = QTableWidgetItem(str(row_data.get(header, "")))
                    item.setForeground(QColor('white'))
                    self.tblWim.setItem(row_idx, col_idx, item)
        except Exception as e:
            self.logger.logError(f"Error in WimDataQueueBox refresh_table_data: {e}")
        finally:
            gc.collect()

    @property
    def rowheaders(self):
        return ["TransactionDateTime", "TotalWeight", "AxleCount"]
