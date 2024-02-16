from PySide6.QtWidgets import QFrame, QVBoxLayout, QHBoxLayout, QLabel, QPushButton,QListWidget,QListWidgetItem
from PySide6.QtCore import Qt

class TransactionTypeItem(QListWidgetItem):
    def __init__(self, text, transaction_type_id, parent=None):
        super().__init__(text, parent)
        self.transaction_type_id = transaction_type_id
        self.button = QPushButton(text)
        self.button.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
        self.button.setFixedHeight(30)
        self.button.setFixedWidth(80)
        self.button.clicked.connect(self.handle_button_click)
        
    def handle_button_click(self):
        print(f"Button clicked for Transaction Type ID: {self.transaction_type_id}")



class TransactionTypeBox(QFrame):
    def __init__(self, width, height,TransactionTypeDetails):
        super().__init__()
        self.initUI(width, height,TransactionTypeDetails)

    def initUI(self, width, height,TransactionTypeDetails):
        self.setStyleSheet("border: none;border-bottom: 1px solid white;border-right: 1px solid white;border-left: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=30
        lbl_height=30
        list_height=height-(btn_height+lbl_height)
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Transaction Type</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.tt_list = QListWidget(self)
        self.tt_list.setStyleSheet("color: white;border: none;border-top: 1px solid white;")
        self.tt_list.setFixedHeight(list_height)
        box_layout.addWidget(self.tt_list)
        self.bindtt(TransactionTypeDetails)

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
    
    def bindtt(self,json_data):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["TransactionTypeName"])
            list_item.setData(32, item_data["TransactionTypeId"])
            self.tt_list.addItem(list_item)
        # for item_data in json_data:
        #     list_item = TransactionTypeItem(item_data["TransactionTypeName"], item_data["TransactionTypeId"])
        #     self.tt_list.addItem(list_item)
        #     self.tt_list.setItemWidget(list_item, list_item.button)