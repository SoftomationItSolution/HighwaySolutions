from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem,QAbstractItemView,QHeaderView
from PySide6.QtCore import Qt
from PySide6.QtGui import QColor
from pubsub import pub
class WimDataQueueBox(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("border: none;border-right: 1px solid white;border-left: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.wim_q=[]
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



        # self.tblWim = QTableWidget()
        # self.tblWim.setHorizontalHeaderLabels(["S.No", "Weight", "Allowed Weight", "Overweight", "Class"])
        # self.tblWim.setStyleSheet("color: white;border: none;border-top: 1px solid white;")
        # self.tblWim.setFixedHeight(list_height)
        display_header = ["Date Time", "Total Weight", "Axle Count"]
        self.tblWim = QTableWidget()
        self.tblWim.setColumnCount(len(display_header))
        self.tblWim.setHorizontalHeaderLabels(display_header)
        self.tblWim.setMinimumWidth(width)
        self.tblWim.setFixedHeight(list_height)
        #self.tblWim.setFocusPolicy(Qt.NoFocus)
        self.tblWim.setEditTriggers(QAbstractItemView.NoEditTriggers)
        #self.tblWim.setSelectionMode(QAbstractItemView.NoSelection)
        self.tblWim.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.tblWim.setStyleSheet("border: none;border-top: 1px solid white;")
        self.tblWim.setSelectionBehavior(QTableWidget.SelectRows)
        #self.tblWim.itemSelectionChanged.connect(self.on_selection_changed)
        header = self.tblWim.horizontalHeader()
        vertical_header = self.tblWim.verticalHeader()
        
        header.setStyleSheet("background-color: black; color: white")
        header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        vertical_header.setStyleSheet("background-color: black; color: white")
        vertical_header.setStyleSheet("QHeaderView::section { background-color: black; color: white; }")
        header.setSectionResizeMode(QHeaderView.ResizeToContents)
        header.setStretchLastSection(True)
        box_layout.addWidget(self.tblWim)
        pub.subscribe(self.wim_transaction_info, "wim_processed")

    def wim_transaction_info(self, transactionInfo):
        try:
            self.wim_q.append(transactionInfo)
            self.refresh_table_data()
        except Exception as e:
            pass

    def on_selection_changed(self):
        selected_rows = set(item.row() for item in self.tblWim.selectedItems())
        removed_values = []
        for row in sorted(selected_rows, reverse=True):  # Iterate in reverse order to avoid index issues
            item = self.tblWim.item(row, 2)
            if item:
                removed_values.append(item.text())
            self.tblWim.removeRow(row)
            del self.wim_q[row]

    def refresh_table_data(self,):
            self.tblWim.setRowCount(len(self.wim_q))
            for row_idx, row_data in enumerate(self.wim_q):
                for col_idx, header in enumerate(self.rowheaders):
                    item = QTableWidgetItem(str(row_data.get(header, "")))
                    item.setForeground(QColor('white'))
                    self.tblWim.setItem(row_idx, col_idx, item) 

    @property
    def rowheaders(self):
        return ["TransactionDateTime", "TotalWeight", "AxleCount"]                               
