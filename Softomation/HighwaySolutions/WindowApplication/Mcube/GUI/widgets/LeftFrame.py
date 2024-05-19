from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QListWidget, QListWidgetItem, QGroupBox
from PySide6.QtCore import Qt, QSize
from GUI.ui.messBox import show_custom_message_box
from utils.constants import Utilities

class LeftFrame(QFrame):
    def __init__(self, width, height, logger):
        super().__init__()
        try:
            self.logger = logger
            self.setStyleSheet("border: none;")
            self.setFixedWidth(width)
            self.setFixedHeight(height)
            self.classList = None
            self.list_height = height - 30

            box_layout = QVBoxLayout(self)
            box_layout.setContentsMargins(0, 0, 0, 0)
            box_layout.setSpacing(0)

            self.group_box = QGroupBox("Vehicle Class")
            self.group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.3em; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            self.group_box.setFixedHeight(height)
            box_layout.addWidget(self.group_box)

            group_box_layout = QVBoxLayout(self.group_box)
            group_box_layout.setContentsMargins(0, 0, 0, 0)
            group_box_layout.setSpacing(0)
            self.vc_list = QListWidget(self)
            self.vc_list.setStyleSheet("QListWidget::item { color: white;border-bottom: 1px solid #b5b6b7; } QListWidget::item:selected { background-color: #808080; color: white; }"  
                                    "QListWidget::item:hover {background-color: #808080;color: black; } color: white;border: none;border-top: 1px solid white;")
            self.vc_list.setFixedHeight(self.list_height)
            group_box_layout.addWidget(self.vc_list)
        except Exception as e:
            self.logger.logError(f"Error in LeftFrame __init__: {e}")

    def update_ss(self, json_data):    
        self.systemSettingDetails = json_data

    def update_vc(self, json_data):
        try:
            self.classList = json_data
            if json_data is not None and len(json_data) > 0:
                list_item_height = int(self.list_height / len(json_data))
                if self.systemSettingDetails['SubClassRequired'] == 1:
                    self.bindSubvc(json_data, list_item_height)
                else:
                    self.bindvc(json_data, list_item_height)
            else:
                self.logger.logError(f"No Vehicle Class found in update_vc")
                show_custom_message_box("Vehicle Class", "No Vehicle Class found", "inf")
        except Exception as e:
            self.logger.logError(f"Error in LeftFrame update_vc: {e}")

    def bindvc(self, json_data, list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["SystemVehicleClassName"])
                list_item.setData(32, item_data["SystemVehicleClassId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                self.vc_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in LeftFrame bindvc: {e}")

    def bindSubvc(self, json_data, list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["SystemVehicleSubClassName"])
                list_item.setData(32, item_data["SystemVehicleSubClassId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                self.vc_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in LeftFrame bindSubvc: {e}")

    def set_vc(self, classId):
        FasTagClassName=""
        try:
            FasTagClassId = Utilities.is_integer(classId)
            if FasTagClassId > 0 and self.classList is not None:
                default_selected_index = 0
                for i, item in enumerate(self.classList):
                    if self.systemSettingDetails['SubClassRequired'] == 1:
                        if item.get('SystemVehicleSubClassId') == int(classId):
                            FasTagClassName=item.get('SystemVehicleSubClassName')
                            default_selected_index = i
                            break
                    else:
                        if item.get('SystemVehicleClassId') == int(classId):
                            FasTagClassName=item.get('SystemVehicleClassName')
                            default_selected_index = i
                            break
                self.vc_list.setCurrentRow(default_selected_index)
        except Exception as e:
            self.logger.logError(f"Error in LeftFrame set_vc: {e}")
        finally:
            FasTagClassName
