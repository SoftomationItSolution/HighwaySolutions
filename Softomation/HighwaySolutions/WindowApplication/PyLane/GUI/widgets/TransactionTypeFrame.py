from PySide6.QtWidgets import QFrame,QGroupBox, QVBoxLayout, QHBoxLayout, QPushButton, QListWidget, QListWidgetItem
from PySide6.QtCore import Qt, QSize

from GUI.ui.messBox import show_custom_message_box

class TransactionTypeBox(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.logger = logger
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        try:
            self.logger = logger
            self.setFixedWidth(width)
            self.setFixedHeight(height)
            btn_height = 30
            self.list_height = height - btn_height-25
            
            self.group_box = QGroupBox("Transaction Type")
            self.group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; ; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            self.group_box.setFixedHeight(height)
            
            main_layout = QVBoxLayout(self)
            main_layout.setContentsMargins(0, 0, 0, 0)
            main_layout.setSpacing(0)

            self.central_layout = QVBoxLayout()
            self.central_layout.setContentsMargins(0, 0, 0, 0)
            self.central_layout.setSpacing(0)
            self.group_box.setLayout(self.central_layout)

            top_layout = QVBoxLayout()
            top_layout.setContentsMargins(0, 10, 0, 5)
            top_layout.setSpacing(0)
            
            self.tt_list = QListWidget(self)
            self.tt_list.setFixedHeight(self.list_height)
            self.tt_list.setStyleSheet("QListWidget::item { color: white;border-bottom: 1px solid #b5b6b7; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                        "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
            top_layout.addWidget(self.tt_list)

            self.pt_list = QListWidget(self)
            self.pt_list.setFixedHeight(self.list_height)
            self.pt_list.setStyleSheet("QListWidget::item { color: white;border-bottom: 1px solid #b5b6b7; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                        "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
            self.pt_list.setVisible(False)
            top_layout.addWidget(self.pt_list)
            

            self.et_list = QListWidget(self)
            self.et_list.setFixedHeight(self.list_height)
            self.et_list.setStyleSheet("QListWidget::item { color: white;border-bottom: 1px solid #b5b6b7; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                        "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
            self.et_list.setVisible(False)
            top_layout.addWidget(self.et_list)
            
            # # Add buttons
            button_layout = QHBoxLayout()
            button_layout.setContentsMargins(0, 5, 0, 5)
            btnFleet = QPushButton("Fleet-Start")
            btnTow = QPushButton("Tow-Start")
            btnMid = QPushButton("Mid Declare")
            btnBleed = QPushButton("Bleed off")
            btnFleet.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
            btnTow.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
            btnMid.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
            btnBleed.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;")
            btnFleet.setFixedHeight(btn_height)
            btnTow.setFixedHeight(btn_height)
            btnMid.setFixedHeight(btn_height)
            btnBleed.setFixedHeight(btn_height)
            button_layout.addWidget(btnFleet)
            button_layout.addWidget(btnTow)
            button_layout.addWidget(btnMid)
            button_layout.addWidget(btnBleed)

            self.central_layout.addLayout(top_layout)
            self.central_layout.addLayout(button_layout)
            main_layout.addWidget(self.group_box)
          
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  initUI: {e}")
    
    def bindtt(self,json_data,list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["TransactionTypeName"])
                list_item.setData(32, item_data["TransactionTypeId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                list_item.setTextAlignment(Qt.AlignCenter)
                self.tt_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  bindtt: {e}")

    def bindpt(self,json_data,list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["PaymentTypeName"])
                list_item.setData(32, item_data["PaymentTypeId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                list_item.setTextAlignment(Qt.AlignCenter)
                self.pt_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  bindpt: {e}")

    def bindet(self,json_data,list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["ExemptTypeName"])
                list_item.setData(32, item_data["ExemptTypeId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                list_item.setTextAlignment(Qt.AlignCenter)
                self.et_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  bindet: {e}")

    def update_ss(self, json_data):
        try:    
            self.systemSettingDetails=json_data
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  update_ss: {e}")

    def update_tt(self, json_data):
        try:
            self.transaction_Type=json_data
            if json_data is not None and len(json_data)>0:
                list_item_height=int(self.list_height/len(json_data))
                self.bindtt(json_data,list_item_height)
            else:
                self.logger.logError(f"No transaction type found in update_pt")
                show_custom_message_box("Transaction type","No transaction type found","inf")
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  update_tt: {e}")

    def update_pt(self, json_data):
        try:
            self.payment_Type=json_data
            if json_data is not None and len(json_data)>0:
                list_item_height=int(self.list_height/len(json_data))
                self.bindpt(json_data,list_item_height)
            else:
                self.logger.logError(f"No payment type found in update_pt")
                show_custom_message_box("Payment type","No payment type found","inf")
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  update_pt: {e}")

    def update_et(self, json_data):
        try:
            self.excempt_Type=json_data
            if json_data is not None and len(json_data)>0:
                list_item_height=int(self.list_height/len(json_data))
                self.bindet(json_data,list_item_height)
            else:
                self.logger.logError(f"No excempt type found in update_pt")
                show_custom_message_box("Excempt type","No excempt type found","inf")
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  update_et: {e}")

    def show_pt(self,show_flag):
        try:
            if show_flag==True:
                self.tt_list.setVisible(False)
                self.pt_list.setVisible(True)
                self.group_box.setTitle("Payment Method")
            else:
                self.pt_list.setVisible(False)
                self.tt_list.setVisible(True)
                self.group_box.setTitle("Transaction Type")
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  show_pt: {e}")

    def show_et(self,show_flag):
        try:
            if show_flag==True:
                self.tt_list.setVisible(False)
                self.et_list.setVisible(True)
                self.group_box.setTitle("Exempt Type")
            else:
                self.et_list.setVisible(False)
                self.tt_list.setVisible(True)
                self.group_box.setTitle("Transaction Type")
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  show_et: {e}")

    def set_tt_value(self,tt):
        try:
            default_selected_index=0
            self.tt_list.setVisible(True)
            self.pt_list.setVisible(False)
            self.et_list.setVisible(False)
            for i, item in enumerate(self.transaction_Type):
                if item.get('TransactionTypeId') == tt:
                    default_selected_index = i
                    break
            self.tt_list.setCurrentRow(default_selected_index)
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  set_tt_value: {e}")

    def reset_tt_value(self):
        try:
            self.tt_list.setVisible(True)
            self.pt_list.setVisible(False)
            self.et_list.setVisible(False)
        except Exception as e:
            self.logger.logError(f"Error in TransactionTypeBox  reset_tt_value: {e}")