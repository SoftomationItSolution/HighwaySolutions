import os
from PySide6.QtWidgets import QFrame, QHBoxLayout
from GUI.widgets.HardwareFrame import HardwareWidget
from PySide6.QtCore import Signal
from pubsub import pub
class Footer(QFrame):
    updateFinished = Signal(bool)
    def __init__(self, width, height,config_manager):
        super().__init__()
        self.initUI(width, height,config_manager)

    def initUI(self, width, height,config_manager):
        self.config_manager=config_manager
        self.width=width
        self.height=height
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.setStyleSheet("border: 1px solid white;")
        self.layout = QHBoxLayout(self)
        self.layout.setContentsMargins(0,0,0,0)
        self.layout.setSpacing(0)
        self.updateFinished.connect(self.bind_hardware)
        self.footer_frame = QFrame()
        self.footer_frame.setFixedHeight(height)
        self.footer_frame.setFixedWidth(width)
        self.footer_frame.setContentsMargins(0, 0, 0, 0)
        self.footer_frame.setFrameStyle(QFrame.NoFrame)
        self.layout.addWidget(self.footer_frame)
        self.image_dir=config_manager.get_path('Paths', 'image_dir')
        self.hardware_widgets=[]
        self.hardware_data_widget=[]
        pub.subscribe(self.dio_transaction_info, "dio_processed_out")
        pub.subscribe(self.ping_transaction_info, "ping_processed")

    def bind_hardware(self, status):
        if status:
            for item in self.hardware_data:
                icon = item["EquipmentIconName"]
                if icon:
                    icon_path = os.path.join(self.image_dir, icon)
                    if os.path.exists(icon_path):
                        item["EquipmentIconName"] = icon_path
                        self.hardware_data_widget.append(item)
            self.bind_data(True) 

    def bind_data(self, status):
        if status:
            for index, item in enumerate(self.hardware_data_widget):
                hardware_widget = HardwareWidget(self.width, self.height, item["EquipmentName"], item["EquipmentIconName"], item["OnLineStatus"], index)
                self.layout.addWidget(hardware_widget)
                self.hardware_widgets.append(hardware_widget)    

    def update_el(self, json_data):    
        self.hardware_data=json_data

    def filter_widgets_by_icon(self, icon_path):
        filtered_widgets = []
        for widget in self.hardware_widgets:
            if widget.img_name == icon_path:
                filtered_widgets.append(widget)
        return filtered_widgets
    
    def update_icon_path(self, old_icon_path, new_icon_path):
        for widget in self.hardware_widgets:
            if widget.img_name == old_icon_path:
                widget.img_name = new_icon_path
                widget.update_status() 

    def update_bg_color(self, EquipmentName, OnLineStatus):
        for widget in self.hardware_widgets:
            if widget.hardware_name == EquipmentName:
                widget.is_online = OnLineStatus
                widget.set_online_status(OnLineStatus) 

    def dio_transaction_info(self, transactionInfo):
        try:
            if self.hardware_data_widget:
                for item in self.hardware_data_widget:
                    if item["EquipmentTypeId"] == transactionInfo["EquipmentTypeId"]:
                        old_icon_path = item["EquipmentIconName"]
                        item["EquipmentIconName"] = item["EquipmentIconName"].replace("OFF", "ON") if transactionInfo["Status"] else item["EquipmentIconName"].replace("ON", "OFF")
                        new_icon_path = item["EquipmentIconName"]
                        if old_icon_path !=new_icon_path:
                            self.update_icon_path(old_icon_path, new_icon_path)
                        break
        except Exception as e:
            print(e)

    def ping_transaction_info(self, transactionInfo):
        try:
            self.update_bg_color(transactionInfo["EquipmentName"],transactionInfo["OnLineStatus"])
        except Exception as e:
            print(e)
                    