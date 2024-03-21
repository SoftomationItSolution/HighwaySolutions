from PySide6.QtWidgets import QFrame, QVBoxLayout, QHBoxLayout, QLabel, QPushButton, QListWidget, QListWidgetItem,QWidget
from PySide6.QtCore import Qt, QSize

class TransactionTypeItem(QListWidgetItem):
    def __init__(self, text, transaction_type_id, parent=None):
        super().__init__(parent)
        self.transaction_type_id = transaction_type_id
        self.setText(text)
        self.setTextAlignment(Qt.AlignCenter)
        
        # Create a button
        self.button = QPushButton("Button")
        self.button.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
        self.button.clicked.connect(self.handle_button_click)
        
        # Setup layout
        layout = QHBoxLayout()
        layout.addWidget(self.button)
        layout.setAlignment(Qt.AlignCenter)
        
        # Set layout for the item
        widget = QWidget()
        widget.setLayout(layout)
        self.setSizeHint(widget.sizeHint())

    def handle_button_click(self):
        print(f"Button clicked for Transaction Type ID: {self.transaction_type_id}")

class TransactionTypeBox(QFrame):
    def __init__(self, width, height, TransactionTypeDetails):
        super().__init__()
        self.initUI(width, height, TransactionTypeDetails)

    def initUI(self, width, height, TransactionTypeDetails):
        self.setStyleSheet("border: none;border-bottom: 1px solid white;border-right: 1px solid white;border-left: 1px solid white;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height = 30
        lbl_height = 30
        list_height = height - (btn_height + lbl_height)
        list_item_height = int(list_height / len(TransactionTypeDetails))
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Transaction Type</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.tt_list = QListWidget(self)
        # self.tt_list.setStyleSheet("QListWidget { color: white; border: none; border-top: 1px solid white; }" 
        #                             "QListWidget::item { height: %dpx; }" % list_item_height
        #                             "QListWidget::item:hover { background-color: #383838; }" 
        #                             "QListWidget::item:selected { background-color: #6FA8DC; }")
        self.tt_list.setFixedHeight(list_height)
        box_layout.addWidget(self.tt_list)
        self.bindtt(TransactionTypeDetails, list_item_height)
    
    def bindtt(self, json_data, list_item_height):
        for item_data in json_data:
            list_item = TransactionTypeItem(item_data["TransactionTypeName"], item_data["TransactionTypeId"])
            self.tt_list.addItem(list_item)

# Example usage:
import sys
from PySide6.QtWidgets import QApplication

if __name__ == "__main__":
    app = QApplication(sys.argv)
    transaction_type_details = [
        {"TransactionTypeName": "Type 1", "TransactionTypeId": 1},
        {"TransactionTypeName": "Type 2", "TransactionTypeId": 2},
        {"TransactionTypeName": "Type 3", "TransactionTypeId": 3},
        {"TransactionTypeName": "Type 4", "TransactionTypeId": 4},
        {"TransactionTypeName": "Type 5", "TransactionTypeId": 5},
        # Add more data as needed
    ]
    transaction_type_box = TransactionTypeBox(300, 300, transaction_type_details)
    transaction_type_box.show()
    sys.exit(app.exec_())
