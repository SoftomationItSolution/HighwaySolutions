from PySide6.QtWidgets import QFrame, QVBoxLayout, QHBoxLayout, QLabel, QPushButton, QListWidget, QListWidgetItem
from PySide6.QtCore import Qt, QSize

from gui.ui.messBox import show_custom_message_box

class TransactionTypeBox(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.logger = logger
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        self.logger = logger
        self.setStyleSheet("border: none;border-bottom: 1px solid white;border-right: 1px solid white;border-left: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height = 30
        lbl_height = 30
        self.list_height = height - (btn_height + lbl_height)
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        self.box_heading = QLabel("<b>Transaction Type</b>")
        self.box_heading.setAlignment(Qt.AlignTop)
        self.box_heading.setFixedHeight(lbl_height)
        self.box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(self.box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.tt_list = QListWidget(self)
        self.tt_list.setFixedHeight(self.list_height)
        self.tt_list.setStyleSheet("QListWidget::item { color: white;border: 1px solid white; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                   "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")

        box_layout.addWidget(self.tt_list)

        self.pt_list = QListWidget(self)
        self.pt_list.setFixedHeight(self.list_height)
        self.pt_list.setStyleSheet("QListWidget::item { color: white;border: 1px solid white; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                   "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
        box_layout.addWidget(self.pt_list)
        self.pt_list.setVisible(False)

        self.et_list = QListWidget(self)
        self.et_list.setFixedHeight(self.list_height)
        self.et_list.setStyleSheet("QListWidget::item { color: white;border: 1px solid white; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                   "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
        box_layout.addWidget(self.et_list)
        self.et_list.setVisible(False)

        # Add buttons
        button_layout = QHBoxLayout()
        button_layout.setContentsMargins(0, 0, 0, 0)
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
        box_layout.addLayout(button_layout)
    
    def bindtt(self,json_data,list_item_height):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["TransactionTypeName"])
            list_item.setData(32, item_data["TransactionTypeId"])
            list_item.setSizeHint(QSize(0, list_item_height))
            list_item.setTextAlignment(Qt.AlignCenter)
            self.tt_list.addItem(list_item)

    def bindpt(self,json_data,list_item_height):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["PaymentTypeName"])
            list_item.setData(32, item_data["PaymentTypeId"])
            list_item.setSizeHint(QSize(0, list_item_height))
            list_item.setTextAlignment(Qt.AlignCenter)
            self.pt_list.addItem(list_item)

    def bindet(self,json_data,list_item_height):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["ExemptTypeName"])
            list_item.setData(32, item_data["ExemptTypeId"])
            list_item.setSizeHint(QSize(0, list_item_height))
            list_item.setTextAlignment(Qt.AlignCenter)
            self.et_list.addItem(list_item)

    def update_ss(self, json_data):    
        self.systemSettingDetails=json_data

    def update_tt(self, json_data):
        self.transaction_Type=json_data
        if json_data is not None and len(json_data)>0:
           list_item_height=int(self.list_height/len(json_data))
           self.bindtt(json_data,list_item_height)
        else:
            self.logger.logError(f"No transaction type found in update_pt")
            show_custom_message_box("Transaction type","No transaction type found","inf")

    def update_pt(self, json_data):
        self.payment_Type=json_data
        if json_data is not None and len(json_data)>0:
           list_item_height=int(self.list_height/len(json_data))
           self.bindpt(json_data,list_item_height)
        else:
            self.logger.logError(f"No payment type found in update_pt")
            show_custom_message_box("Payment type","No payment type found","inf")

    def update_et(self, json_data):
        self.excempt_Type=json_data
        if json_data is not None and len(json_data)>0:
           list_item_height=int(self.list_height/len(json_data))
           self.bindet(json_data,list_item_height)
        else:
            self.logger.logError(f"No excempt type found in update_pt")
            show_custom_message_box("Excempt type","No excempt type found","inf")

    def show_pt(self,show_flag):
        if show_flag==True:
            self.tt_list.setVisible(False)
            self.pt_list.setVisible(True)
            self.box_heading.setText("<b>Payment Type</b>")
        else:
            self.pt_list.setVisible(False)
            self.tt_list.setVisible(True)
            self.box_heading.setText("<b>Transaction Type</b>")

    def show_et(self,show_flag):
        if show_flag==True:
            self.tt_list.setVisible(False)
            self.et_list.setVisible(True)
            self.box_heading.setText("<b>Exempt Type</b>")
        else:
            self.et_list.setVisible(False)
            self.tt_list.setVisible(True)
            self.box_heading.setText("<b>Transaction Type</b>")