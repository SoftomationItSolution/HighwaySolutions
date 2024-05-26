import os
from PySide6.QtWidgets import QFrame, QHBoxLayout, QGroupBox, QGridLayout
from GUI.widgets.HardwareFrame import HardwareWidget
from PySide6.QtCore import Signal
from pubsub import pub

class Footer(QFrame):
    updateFinished = Signal(bool)
    def __init__(self, width, height, image_dir,bg_service, logger):
        super().__init__()
        self.initUI(width, height, image_dir,bg_service, logger)

    def initUI(self, width, height, image_dir,bg_service, logger):
        try:
            self.bg_service = bg_service
            self.dio_events=self.bg_service.dio_events
            self.logger = logger
            self.width = width
            self.height = height
            self.setFixedWidth(width)
            self.setFixedHeight(height)
            self.icon_height=35
            self.icon_width=70
            self.layout = QHBoxLayout(self)
            self.layout.setContentsMargins(0, 0, 0, 0)
            self.layout.setSpacing(0)
            self.printer_status=False
            self.group_box = QGroupBox("Equipment Status")
            self.group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.3em;padding: 0.5em; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            self.group_box.setFixedHeight(height)
            self.group_box_layout = QGridLayout(self.group_box)
            self.group_box_layout.setContentsMargins(0, 0, 0, 0)
            self.group_box_layout.setHorizontalSpacing(0)  
            self.group_box_layout.setVerticalSpacing(0)
            self.layout.addWidget(self.group_box)

            self.image_dir = image_dir
            self.hardware_widgets = []
            self.hardware_data_widget = []
            self.hardware_data = None
            self.updateFinished.connect(self.bind_hardware)
        except Exception as e:
            self.logger.logError(f"Error in Footer __init__: {e}")

    def bind_hardware(self, status):
        try:
            substring = 'loop'
            if status and self.hardware_data is not None:
                for item in self.hardware_data:
                    if substring in str(item["EquipmentTypeName"]).lower():
                        pass
                    else:
                        icon = item["EquipmentIconName"]
                        if icon:
                            icon_path = os.path.join(self.image_dir, icon)
                            if os.path.exists(icon_path):
                                item["EquipmentIconName"] = icon_path
                                self.hardware_data_widget.append(item)
                self.bind_data()
                self.dio_events=self.bg_service.dio_events
                for item in self.dio_events:
                    self.dio_transaction_info(item)
        except Exception as e:
            self.logger.logError(f"Error in Footer bind_hardware: {e}")
        finally:
            pub.subscribe(self.dio_transaction_info, "hardware_on_off_status")
            pub.subscribe(self.ping_transaction_info, "ping_processed")

    def bind_data(self):
        try:
            self.group_box_layout.setRowMinimumHeight
            num_columns = self.width // self.icon_width  
            for index, item in enumerate(self.hardware_data_widget):
                row = index // num_columns
                col = index % num_columns
                if item['EquipmentTypeId'] == 10:
                    hardware_widget = HardwareWidget(self.width, self.height, item["EquipmentName"], item["EquipmentIconName"], self.printer_status, index)
                else:
                    hardware_widget = HardwareWidget(self.width, self.height, item["EquipmentName"], item["EquipmentIconName"], item["OnLineStatus"], index)
                hardware_widget.setFixedHeight(self.icon_height)
                hardware_widget.setFixedWidth(self.icon_width)
                self.group_box_layout.addWidget(hardware_widget, row, col)
                self.group_box_layout.setColumnMinimumWidth(col, self.icon_width)
                self.hardware_widgets.append(hardware_widget)
        except Exception as e:
            self.logger.logError(f"Error in Footer bind_hardware: {e}")

    def update_el(self, json_data):
        self.hardware_data = json_data

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
                        if old_icon_path != new_icon_path:
                            self.update_icon_path(old_icon_path, new_icon_path)
                        break
        except Exception as e:
            self.logger.logError(f"Error in Footer dio_transaction_info: {e}")

    def ping_transaction_info(self, transactionInfo):
        try:
            #self.update_bg_color(transactionInfo["EquipmentName"], transactionInfo["OnLineStatus"])
            pass
        except Exception as e:
            self.logger.logError(f"Error in Footer ping_transaction_info: {e}")

    def update_printer(self, status):
        try:
            self.printer_status=status
            filtered_item = next(filter(lambda item: item['EquipmentTypeId'] == 10, self.hardware_data_widget), None)
            if filtered_item is not None:
                self.update_bg_color(filtered_item["EquipmentName"], status)
        except Exception as e:
            self.logger.logError(f"Error in Footer update_printer: {e}")