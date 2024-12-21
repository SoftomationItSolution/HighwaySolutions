from PySide6.QtWidgets import QDialog, QVBoxLayout, QListWidget,QListWidgetItem, QPushButton, QHBoxLayout
from PySide6.QtCore import Qt,QSize

from utils.log_master import CustomLogger

class ListPopup(QDialog):
    def __init__(self, default_directory,json_data, parent=None):
        super().__init__(parent)
        self.logger = CustomLogger(default_directory, 'swb_app')
        self.setWindowTitle("Vehicle Sub Class")
        self.setWindowFlags(Qt.Dialog | Qt.CustomizeWindowHint | Qt.WindowTitleHint)
        self.resize(300, 400)

        # Layout
        layout = QVBoxLayout(self)

        self.list_widget = QListWidget(self)
        self.list_widget.itemSelectionChanged.connect(self.onSubVCSelectionChanged)
        layout.addWidget(self.list_widget)

        # # Close button
        # button_layout = QHBoxLayout()
        # self.close_button = QPushButton("Close")
        # self.close_button.clicked.connect(self.close)
        # button_layout.addStretch()  # Align button to the right
        # button_layout.addWidget(self.close_button)
        # layout.addLayout(button_layout)
        self.bindvc(json_data,30)

    def bindvc(self, json_data, list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["FasTagVehicleClassName"])
                list_item.setData(32, item_data["FasTagVehicleClassId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                self.list_widget.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in bindvc {str(e)}")
    
    def onSubVCSelectionChanged(self):
        try:
            selected_items = self.list_widget.selectedItems()
            if selected_items:
                self.selected_item = selected_items[0]
                # item_id = self.selected_item.data(32)
                # item_name = self.selected_item.text()
                self.accept()
                
        except Exception as e:
           self.logger.logError(f"Error in onSubVCSelectionChanged {str(e)}")

    def get_selected_item(self):
        return self.selected_item