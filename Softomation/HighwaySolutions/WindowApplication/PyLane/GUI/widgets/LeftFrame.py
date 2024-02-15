from PySide6.QtWidgets import QFrame, QVBoxLayout,QLabel,QListWidget,QListWidgetItem
from PySide6.QtCore import Qt
class LeftFrame(QFrame):
    def __init__(self, width,height,vc,systemSettingDetails):
        super().__init__()
        self.initUI(width,height,vc,systemSettingDetails)
        #border-top: none;border-bottom: none;
    def initUI(self,width,height,vc,systemSettingDetails):
        self.setStyleSheet("border: 1px solid white;")
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.setContentsMargins(0, 0, 0, 0)
        lbl_height=20
        list_height=height-lbl_height-20
        layout = QVBoxLayout(self)
        layout.setSpacing(0)
        box_heading = QLabel("<b>Vehicle Class</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height)
        box_heading.setStyleSheet("color: white;border: none;")
        layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.vc_list = QListWidget(self)
        self.vc_list.setStyleSheet("color: white;border: none;border-top: 1px solid white;")
        self.vc_list.setFixedHeight(list_height)
        self.vc_list.setFixedWidth(width-10)
        
        layout.addWidget(self.vc_list, alignment=Qt.AlignLeft)
        if systemSettingDetails['SubClassRequired']==1:
            self.bindSubvc(vc)
        else:
            self.bindvc(vc)

    def bindvc(self,json_data):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemVehicleClassName"])
            list_item.setData(32, item_data["SystemVehicleClassId"])
            self.vc_list.addItem(list_item)

    def bindSubvc(self,json_data):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemSubClassNames"])
            list_item.setData(32, item_data["SystemSubClassId"])
            self.vc_list.addItem(list_item)
