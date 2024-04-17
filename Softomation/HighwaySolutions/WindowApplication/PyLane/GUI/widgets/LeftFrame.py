from PySide6.QtWidgets import QFrame, QVBoxLayout,QLabel,QListWidget,QListWidgetItem
from PySide6.QtCore import Qt,QSize

from GUI.ui.messBox import show_custom_message_box
class LeftFrame(QFrame):
    def __init__(self, width,height,logger):
        super().__init__()
        self.logger = logger
        self.setStyleSheet("border: none;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        btn_height=0
        lbl_height=30
        self.list_height=height-(btn_height+lbl_height)
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Vehicle Class</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment= Qt.AlignHCenter | Qt.AlignVCenter)
        
        self.vc_list = QListWidget(self)
        self.vc_list.setStyleSheet("QListWidget::item { color: white;border: 1px solid white; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                   "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
        self.vc_list.setFixedHeight(self.list_height)
        box_layout.addWidget(self.vc_list)
        

    def update_ss(self, json_data):    
        self.systemSettingDetails=json_data

    def update_vc(self, json_data):
        if json_data is not None and len(json_data)>0:
            list_item_height=int(self.list_height/len(json_data))
            if self.systemSettingDetails['SubClassRequired']==1:
                self.bindSubvc(json_data,list_item_height)
            else:
                self.bindvc(json_data,list_item_height)
        else:
            self.logger.logError(f"No Vehicle Class found in update_vc")
            show_custom_message_box("Vehicle Class","No Vehicle Class found","inf")

    def bindvc(self,json_data,list_item_height):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemVehicleClassName"])
            list_item.setData(32, item_data["SystemVehicleClassId"])
            list_item.setSizeHint(QSize(0, list_item_height))
            self.vc_list.addItem(list_item)

    def bindSubvc(self,json_data,list_item_height):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemSubClassNames"])
            list_item.setData(32, item_data["SystemSubClassId"])
            list_item.setSizeHint(QSize(0, list_item_height))
            self.vc_list.addItem(list_item)
