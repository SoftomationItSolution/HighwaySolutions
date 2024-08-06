from PySide6.QtWidgets import (QTableWidget, QTableWidgetItem, QVBoxLayout, QDialog, QHBoxLayout, QLabel, QPushButton)
from PySide6.QtCore import Qt
from GUI.ui.messBox import show_custom_message_box
from models.CommonManager import CommonManager
from utils.constants import Utilities

class CurrencyDialog(QDialog):
    def __init__(self,dbConnectionObj,api_base_url, denomination_master,lane_detail,userDetails,current_shift,float_type_id,title,parent=None):
        super().__init__(parent)
        self.dbConnectionObj=dbConnectionObj
        self.api_base_url=api_base_url
        self.lane_detail=lane_detail
        self.userDetails=userDetails
        self.current_shift=current_shift
        self.float_type_id=float_type_id
        self.title=title
        self.resize(350, 400)
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        self.setWindowTitle(title)
        self.layout = QVBoxLayout(self)
        self.total_amount = 0.0
        self.set_denomination_master(denomination_master)
        self.table = QTableWidget(len(self.denomination_master), 3, self)
        self.table.setHorizontalHeaderLabels(['Type', 'Count', 'Amount'])
        header = self.table.horizontalHeader()
        header.setStyleSheet("background-color: #b5b6b7; color: #000")
        vertical_header = self.table.verticalHeader()
        vertical_header.setStyleSheet("background-color: #b5b6b7; color: #000")
        for row, data in enumerate(self.denomination_master):
            denomination = data["DenominationValue"]
            count = data["DenominationCount"]
            currency_item = QTableWidgetItem(f"₹{denomination}")
            currency_item.setFlags(currency_item.flags() & ~Qt.ItemIsEditable)  # Make non-editable
            currency_item.setBackground(Qt.white)
            self.table.setItem(row, 0, currency_item)
            
            count_item = QTableWidgetItem(str(count))
            count_item.setFlags(count_item.flags() | Qt.ItemIsEditable)  # Make editable
            count_item.setBackground(Qt.white)
            self.table.setItem(row, 1, count_item)
            
            amount_item = QTableWidgetItem('₹0.00')
            amount_item.setFlags(amount_item.flags() & ~Qt.ItemIsEditable)  # Make non-editable
            amount_item.setBackground(Qt.white)
            self.table.setItem(row, 2, amount_item)
            
        self.table.itemChanged.connect(self.update_amounts)

        self.layout.addWidget(self.table)

        self.footer_layout = QHBoxLayout()
        self.sum_count_label = QLabel("Sum Count: 0")
        self.sum_amount_label = QLabel("Sum Amount: ₹0.00")
        
        self.sum_count_label.setStyleSheet("color: white; border: none;")
        self.sum_amount_label.setStyleSheet("color: white; border: none;")
        
        self.footer_layout.addWidget(self.sum_count_label)
        self.footer_layout.addWidget(self.sum_amount_label)

        self.layout.addLayout(self.footer_layout)
        
        self.update_footer()
        self.submit_button = QPushButton("Submit")
        self.submit_button.setEnabled(False)
        self.submit_button.clicked.connect(self.submit_data)
        self.submit_button.setStyleSheet("background-color: green; font-weight: bold;border: none;")
        self.submit_button.setFixedHeight(30)
        self.layout.addWidget(self.submit_button)
        self.update_submit_button_state()
    
    def set_denomination_master(self,denomination_master):
        if denomination_master is None:
            self.denomination_master=[
                {"DenominationId" : 3,"DenominationValue" : 500,"DenominationCount" : 0},
                {"DenominationId" : 4,"DenominationValue" : 200,"DenominationCount" : 0},
                {"DenominationId" : 5,"DenominationValue" : 100,"DenominationCount" : 0},
                {"DenominationId" : 6,"DenominationValue" : 50,"DenominationCount" : 0},
                {"DenominationId" : 7,"DenominationValue" : 20,"DenominationCount" : 0},
                {"DenominationId" : 8,"DenominationValue" : 10,"DenominationCount" : 0},
                {"DenominationId" : 9,"DenominationValue" : 5,"DenominationCount" : 0},
                {"DenominationId" : 10,"DenominationValue" : 2,"DenominationCount" : 0},
                {"DenominationId" : 11,"DenominationValue" : 1,"DenominationCount" : 0}]
        else:
            self.denomination_master=denomination_master

    def update_amounts(self, item):
        if item.column() == 1:
            try:
                count = int(item.text())
                item.setBackground(Qt.white)
            except ValueError:
                item.setBackground(Qt.red)
                count = 0

            row = item.row()
            value = self.denomination_master[row]["DenominationValue"]
            amount = count * value
            self.table.item(row, 2).setText(f"₹{amount:.2f}")
            self.update_footer()
            self.update_submit_button_state()

    def update_footer(self):
        total_count = 0
        self.total_amount = 0.0

        for row in range(self.table.rowCount()):
            count_item = self.table.item(row, 1)
            amount_item = self.table.item(row, 2)
            if count_item and amount_item:
                try:
                    count = int(count_item.text())
                    amount = float(amount_item.text().replace('₹', ''))
                except ValueError:
                    count = 0
                    amount = 0.0
                total_count += count
                self.total_amount += amount

        self.sum_count_label.setText(f"Sum Count: {total_count}")
        self.sum_amount_label.setText(f"Sum Amount: ₹{self.total_amount:.2f}")

    def update_submit_button_state(self):
        valid = True
        for row in range(self.table.rowCount()):
            count_item = self.table.item(row, 1)
            try:
                int(count_item.text())
                count_item.setBackground(Qt.white)  # Reset background color if valid
            except ValueError:
                count_item.setBackground(Qt.red)  # Set background color to red if invalid
                valid = False
        self.submit_button.setEnabled(valid)

    def submit_data(self):
        data = []
        if self.total_amount==0:
            show_custom_message_box(self.title, "Float amount must be declare!", 'cri') 
        else:
            for row in range(self.table.rowCount()):
                denomination_id = self.denomination_master[row]["DenominationId"]
                denomination_value = self.denomination_master[row]["DenominationValue"]
                count_item = self.table.item(row, 1)
                count = int(count_item.text())
                data.append({"DenominationId":denomination_id,"DenominationValue":denomination_value,"DenominationCount":count})
            
            LaneTransactionCount=CommonManager.GetLaneTransactionCount(self.dbConnectionObj,self.current_shift["ShiftId"],Utilities.my_sql_date_format())
            
            input={
                "PlazaId":self.lane_detail["PlazaId"],
                "LaneId":self.lane_detail["LaneId"],
                "ShiftId":self.current_shift["ShiftId"],
                "FloatTransactionTypeId":self.float_type_id,
                "TransactionDate":Utilities.JsonDateFormat(),
                "TransactionAmount":self.total_amount,
                "ReceiptNumber":Utilities.generate_receipt_number(),
                "AssignedBy":self.userDetails["UserId"],
                "AssignedTo":self.userDetails["UserId"],
                "LaneTransactionCount":LaneTransactionCount,
                "DataStatus":1,
                "CreatedBy":self.userDetails["UserId"],
                "ModifiedBy":self.userDetails["UserId"],
                "FloatProcessDenominationList":data
            }
            if Utilities.check_api_url(self.api_base_url,0.100):
                endpoint = 'Softomation/FastTrackHighway-TMS/FloatProcessSetUp'
                api_url = f"{self.api_base_url}{endpoint}"
                try:
                    response=Utilities.upload_data_api(api_url,input)
                    if response.status_code == 200:
                        show_custom_message_box(self.title, "Float submitted successfully!", 'inf')
                        self.close()
                    else:
                        show_custom_message_box(self.title,f"faild to process the request {response.status_code}", 'cri')
                except Exception as e:
                    show_custom_message_box(self.title, str(e), 'cri')
                
            else:
                 show_custom_message_box(self.title, "Plaza is disconnect! ", 'cri')