from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QGroupBox, QHBoxLayout,
    QLabel, QLineEdit, QPushButton, QDateTimeEdit, QTableWidget, QTableWidgetItem,QMessageBox
)
from PySide6.QtCore import Qt, QDateTime
import requests

class CentreWidget(QWidget):
    def __init__(self, plaza_config,wh=250):
        super().__init__()
        self.plaza_config=plaza_config
        self.setFixedWidth(wh)
        self.setContentsMargins(0, 0, 0, 0)
        self.filterData=None
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        # GroupBox for Transaction details
        group_box = QGroupBox("Transaction Details")
        group_box.setContentsMargins(0, 0, 0, 0)
        group_box_layout = QVBoxLayout()

        # ────── 🔍 Search Panel ──────
        search_layout = QHBoxLayout()

        self.start_datetime = QDateTimeEdit(QDateTime.currentDateTime())
        self.start_datetime.setDisplayFormat("yyyy-MM-dd HH:mm:ss")
        #self.start_datetime.setCalendarPopup(True)
        self.start_datetime.setToolTip("Start DateTime")

        self.end_datetime = QDateTimeEdit(QDateTime.currentDateTime())
        self.end_datetime.setDisplayFormat("yyyy-MM-dd HH:mm:ss")
        #self.end_datetime.setCalendarPopup(True)
        self.end_datetime.setToolTip("End DateTime")

        self.txn_number = QLineEdit()
        self.txn_number.setPlaceholderText("Transaction No.")

        self.plate_number = QLineEdit()
        self.plate_number.setPlaceholderText("Plate No.")

        self.search_button = QPushButton("Search")
        self.search_button.clicked.connect(self.on_search_clicked)

        search_layout.addWidget(self.start_datetime)
        search_layout.addWidget(self.end_datetime)
        search_layout.addWidget(self.txn_number)
        search_layout.addWidget(self.plate_number)
        search_layout.addWidget(self.search_button)

        # ────── 📋 Data Grid ──────
        self.table = QTableWidget()
        #self.table.setColumnCount(4)
        #self.table.setHorizontalHeaderLabels(["Txn No", "Plate", "Start Time", "End Time"])
        self.columns = [
            "Transcation Id", "Lane", "Shift", "Date Time", "Plate Number", "Type",
            "Sys Class", "Sub Class", "AVC Class", "Tag Class", "Receipt/Tag Number",
            "Weight", "Over Weight Penalty", "FasTag Penalty", "Transaction Amount",
            "Operator"
        ]

        self.table.setColumnCount(len(self.columns))
        self.table.setHorizontalHeaderLabels(self.columns)
        self.table.setSelectionBehavior(QTableWidget.SelectRows)
        self.table.setSelectionMode(QTableWidget.SingleSelection)
        #self.table.itemSelectionChanged.connect(self.on_row_selected)
        # Add widgets to group box
        group_box_layout.addLayout(search_layout)
        group_box_layout.addWidget(self.table)
        group_box.setLayout(group_box_layout)

        layout.addWidget(group_box)

    def on_search_clicked(self):
        obj = {"ShiftFilterList": "0","TCUserFilterList":"0","PlazaFilterList":"0","LaneFilterList":"0",
               "VehicleClassFilterList":"0","VehicleSubClassFilterList": "0","TransactionTypeFilterList":"0",
               "PlateNumber":self.plate_number.text(),"TransactionId":self.txn_number.text(),
               "StartDateTime": self.start_datetime.dateTime().toString("dd-MMM-yyyy HH:mm:ss"),"EndDateTime": self.end_datetime.dateTime().toString("dd-MMM-yyyy HH:mm:ss"),
               "AuditerFilterList":"0","IsReviewedRequired":False,"IsReviewedStatus":False}
        self.getData(obj)

    def getData(self,payload):
        apipath=self.plaza_config["api_url"]+"Softomation/FastTrackHighway-TMS/"
        try:
            api_url=apipath+"LaneTransactionGetByFilter"
            response = requests.post(api_url, json=payload, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"])>0:
                if data["Message"][0]["AlertMessage"]=="success":
                    self.filterData=data["ResponseData"]
                    self.populate_table()
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = "No data found"
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {e}")

    def populate_table(self):
        self.table.setRowCount(len(self.filterData))
        for row_index, row_data in enumerate(self.filterData):
            self.table.setItem(row_index, 0, QTableWidgetItem(row_data.get("LaneTransactionId", "")))
            self.table.setItem(row_index, 1, QTableWidgetItem(row_data.get("LaneNumber", "")))
            self.table.setItem(row_index, 2, QTableWidgetItem(row_data.get("ShiftNumber", "")))
            self.table.setItem(row_index, 3, QTableWidgetItem(row_data.get("TransactionDateTimeStamp", "")))
            self.table.setItem(row_index, 4, QTableWidgetItem(row_data.get("PlateNumber", "")))
            self.table.setItem(row_index, 5, QTableWidgetItem(row_data.get("TransactionTypeName", "")))
            self.table.setItem(row_index, 6, QTableWidgetItem(row_data.get("VehicleClassName", "")))
            self.table.setItem(row_index, 7, QTableWidgetItem(row_data.get("VehicleSubClassName", "")))
            self.table.setItem(row_index, 8, QTableWidgetItem(row_data.get("VehicleAvcClassName", "")))
            self.table.setItem(row_index, 9, QTableWidgetItem(row_data.get("TagClassName", "")))
            self.table.setItem(row_index, 10, QTableWidgetItem(row_data.get("RCTNumber", "")))

            # Format numbers and currency-like fields
            self.table.setItem(row_index, 11, QTableWidgetItem(f"{row_data.get('ActualVehicleWeight', 0):,.3f}"))
            self.table.setItem(row_index, 12, QTableWidgetItem(f"₹{row_data.get('OverWeightAmount', 0):,.2f}"))
            self.table.setItem(row_index, 13, QTableWidgetItem(f"₹{row_data.get('TagPenaltyAmount', 0):,.2f}"))
            self.table.setItem(row_index, 14, QTableWidgetItem(f"₹{row_data.get('TransactionAmount', 0):,.2f}"))

            self.table.setItem(row_index, 15, QTableWidgetItem(row_data.get("LoginId", "")))

    def on_row_selected(self):
        selected_items = self.table.selectedItems()
        if selected_items:
            row = selected_items[0].row()
            row_data = {}
            for col in range(self.table.columnCount()):
                header = self.columns[col]
                value = self.table.item(row, col).text()
                row_data[header] = value

    def remove_selected_row(self):
        selected_row = self.table.currentRow()
        if selected_row >= 0:
            self.table.removeRow(selected_row)