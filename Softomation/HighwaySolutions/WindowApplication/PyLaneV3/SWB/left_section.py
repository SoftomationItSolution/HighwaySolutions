import threading
import requests
from PySide6.QtWidgets import QWidget, QVBoxLayout, QGroupBox, QListWidget, QListWidgetItem, QMessageBox, QFrame
from PySide6.QtCore import QSize

from utils.log_master import CustomLogger

class LeftSection(QWidget):
    def __init__(self, default_directory,apipath, width=300):
        super().__init__()
        self.setup_ui(default_directory,apipath, width)

    def setup_ui(self, default_directory,apipath, width):
        self.apipath = apipath
        self.logger = CustomLogger(default_directory, 'swb_app')
        main_layout = QVBoxLayout()
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0)
        self.setLayout(main_layout)

        # Create a frame to hold the entire content and apply the border
        frame = QFrame(self)
        frame.setFrameShape(QFrame.StyledPanel)  # Set the frame shape (e.g., a panel with a border)
        frame.setFrameShadow(QFrame.Sunken)     # Optional: add shadow effect to the frame
        frame.setStyleSheet("border: 1px solid white;")  # Apply a border to the frame
        frame_layout = QVBoxLayout(frame)
        frame_layout.setContentsMargins(5, 5, 5, 5)  # Optional: adjust margins inside the frame

        group_box = QGroupBox("Vehicle Class")
        group_box_layout = QVBoxLayout()
        group_box.setLayout(group_box_layout)

        # Add a QListWidget inside the GroupBox
        self.vc_list = QListWidget()
        group_box_layout.addWidget(self.vc_list)

        frame_layout.addWidget(group_box)  # Add the group box to the frame's layout

        main_layout.addWidget(frame)  # Add the frame to the main layout

        self.setFixedWidth(width)

        # Start a new thread to load data
        thread = threading.Thread(target=self.load_masterData)
        thread.start()
        thread.join()

    def load_masterData(self):
        try:
            self.get_SystemVehicleClass()
            self.get_FasTagVehicleClass()
        except Exception as e:
            self.logger.logError(f"Error in update_svc {str(e)}")

    def get_SystemVehicleClass(self):
        try:
            api_url = self.apipath + "SystemVehicleClassGetActive"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    self.systemVehicleClass = data["ResponseData"]
                    self.bindvc(self.systemVehicleClass, 50)
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_SystemVehicleClass : {e}")

    def get_FasTagVehicleClass(self):
        try:
            api_url = self.apipath + "FasTagVehicleClassGetActive"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    self.fasTagVehicleClass = data["ResponseData"]
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_FasTagVehicleClass : {e}")

    def bindvc(self, json_data, list_item_height):
        try:
            for item_data in json_data:
                list_item = QListWidgetItem(item_data["SystemVehicleClassName"])
                list_item.setData(32, item_data["SystemVehicleClassId"])
                list_item.setSizeHint(QSize(0, list_item_height))
                self.vc_list.addItem(list_item)
        except Exception as e:
            self.logger.logError(f"Error in bindvc {str(e)}")
