import os
import threading
from PySide6.QtWidgets import (
    QWidget, QLabel, QLineEdit, QPushButton, QCheckBox, QComboBox, QGridLayout,QMessageBox
)
from PySide6.QtCore import Qt
from PySide6.QtGui import QPixmap
import requests

from utils.log_master import CustomLogger
from utils.swb_receipt_printer import SwbReceiptPrinter


class TopFormSection(QWidget):
    def __init__(self,default_directory,apipath,script_dir):
        super().__init__()
        self.setup_ui(default_directory,apipath,script_dir)

    def setup_ui(self,default_directory,apipath,script_dir):
        self.logger = CustomLogger(default_directory, 'swb_app')
        self.apipath=apipath
        self.image_dir = os.path.join(script_dir, 'assets', 'images')
        form_layout = QGridLayout()
        form_layout.setContentsMargins(10, 10, 10, 10)
        form_layout.setSpacing(10)
        self.setLayout(form_layout)
        self.vehicle_class_Id=0
        self.sub_vehicle_class_Id=0
        self.LaneId=0
        self.TransactionTypeId=0
        self.tollFare=[]
        self.project_config_data=None
        self.receipt_printer=None
        self.receipt_printer_status=False

        # Row 1: Transaction ID and Search Button
        transaction_id_label = QLabel("Transaction ID:")
        transaction_id_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        transaction_id_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(transaction_id_label, 0, 0)

        self.transaction_id_textbox = QLineEdit()
        self.transaction_id_textbox.setStyleSheet("color: white; border: 1px solid white;")
        form_layout.addWidget(self.transaction_id_textbox, 0, 1)

        # Search Button in columns 2 and 3 (spanning 2 columns)
        search_button = QPushButton("Search")
        search_button.setObjectName("searchButton")
        search_button.clicked.connect(self.get_trans_data)
        form_layout.addWidget(search_button, 0, 2, 1, 2)

        # Row 2: Vehicle Class and Vehicle Sub Class
        vehicle_class_label = QLabel("Vehicle Class:")
        vehicle_class_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        vehicle_class_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(vehicle_class_label, 1, 0)

        self.vehicle_class_textbox = QLineEdit()
        self.vehicle_class_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.vehicle_class_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.vehicle_class_textbox, 1, 1)

        vehicle_subclass_label = QLabel("Vehicle Sub Class:")
        vehicle_subclass_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        vehicle_subclass_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(vehicle_subclass_label, 1, 2)

        self.vehicle_subclass_textbox = QLineEdit()
        self.vehicle_subclass_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.vehicle_subclass_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.vehicle_subclass_textbox, 1, 3)

        # Row 3: Permissible Weight and Actual Weight
        permissible_weight_label = QLabel("Permissible Weight:")
        permissible_weight_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        permissible_weight_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(permissible_weight_label, 2, 0)

        self.permissible_weight_textbox = QLineEdit()
        self.permissible_weight_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.permissible_weight_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.permissible_weight_textbox, 2, 1)

        actual_weight_label = QLabel("Actual Weight:")
        actual_weight_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        actual_weight_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(actual_weight_label, 2, 2)

        self.actual_weight_textbox = QLineEdit()
        self.actual_weight_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.actual_weight_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.actual_weight_textbox, 2, 3)

        # Row 4: Plate Number and Overweight Checkbox
        plate_number_label = QLabel("Plate Number:")
        plate_number_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        plate_number_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(plate_number_label, 3, 0)

        self.plate_number_textbox = QLineEdit()
        self.plate_number_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.plate_number_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.plate_number_textbox, 3, 1)

        is_overweight_label = QLabel("Is Overweight:")
        is_overweight_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        is_overweight_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(is_overweight_label, 3, 2)

        self.is_overweight_checkbox = QCheckBox()
        self.is_overweight_checkbox.setStyleSheet("color: white; border: none;")
        self.is_overweight_checkbox.setEnabled(False)
        form_layout.addWidget(self.is_overweight_checkbox, 3, 3)
        #self.is_overweight_checkbox = self.is_overweight_checkbox  # Store reference for later usage

        # Ensure the checkbox state is functional
        self.is_overweight_checkbox.stateChanged.connect(self.checkbox_state_changed)
        self.setStyleSheet("border: 1px solid white; color: white;")
        
        # Row 5: Lane Number, Dropdown, DateTime, and ReadOnly Textbox
        lane_number_label = QLabel("Lane Number:")
        lane_number_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        lane_number_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(lane_number_label, 4, 0)

        self.lane_number_combobox = QComboBox()
        self.lane_number_combobox.currentIndexChanged.connect(self.on_lane_selection_changed)
        form_layout.addWidget(self.lane_number_combobox, 4, 1)

        transaction_label = QLabel("Transaction Type:")
        transaction_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        transaction_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(transaction_label, 4, 2)

        self.transaction_Type_combobox = QComboBox()
        self.transaction_Type_combobox.currentIndexChanged.connect(self.on_tt_selection_changed)
        form_layout.addWidget(self.transaction_Type_combobox, 4, 3)

        # Row 6: Transaction Type, Dropdown, DateTime, and ReadOnly Textbox
        datetime_label = QLabel("Date Time:")
        datetime_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        datetime_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(datetime_label, 5, 0)

        self.datetime_textbox = QLineEdit()
        self.datetime_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.datetime_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.datetime_textbox, 5, 1)


        overWeight_label = QLabel("OverWeight Penalty:")
        overWeight_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        overWeight_label.setStyleSheet("color: white; border: none;")
        form_layout.addWidget(overWeight_label, 5, 2)

        self.overWeight_textbox = QLineEdit()
        self.overWeight_textbox.setStyleSheet("color: white; border: 1px solid white;")
        self.overWeight_textbox.setReadOnly(True)  # Set to read-only
        form_layout.addWidget(self.overWeight_textbox, 5, 3)

        

        # Row 7: Submit and Reset Buttons
        submit_button = QPushButton("Submit")
        submit_button.clicked.connect(self.submit_form)
        form_layout.addWidget(submit_button, 6, 0,1, 2)

        reset_button = QPushButton("Reset")
        reset_button.setObjectName("resetButton")
        reset_button.clicked.connect(self.reset_form)
        form_layout.addWidget(reset_button, 6, 2)

        self.status_icon = QLabel()
        icon = os.path.join(self.image_dir, 'recipt-printer.png')
        self.status_icon.setPixmap(QPixmap(icon).scaled(50, 50))
        self.status_icon.setStyleSheet("background-color: red;")
        self.status_icon.setFixedWidth(50)
        form_layout.addWidget(self.status_icon, 6, 3)

        thread = threading.Thread(target=self.load_masterData)
        thread.start()
        thread.join()

    def get_trans_data(self):
        try:
            transaction_id=self.transaction_id_textbox.text()
            if not transaction_id:
                QMessageBox.warning(self, "Error", "Please enter transaction id!")
                return
            api_url = self.apipath + "LaneTransactionGetById?TransactionId="+transaction_id
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    laneData = data["ResponseData"]
                    if laneData:
                        self.permissible_weight_textbox.setText(str(laneData["PermissibleVehicleWeight"]))
                        self.vehicle_class_textbox.setText(str(laneData["VehicleClassName"]))
                        self.vehicle_subclass_textbox.setText(str(laneData["VehicleSubClassName"]))
                        self.actual_weight_textbox.setText(str(laneData["ActualVehicleWeight"]))
                        self.plate_number_textbox.setText(str(laneData["PlateNumber"]))
                        self.datetime_textbox.setText(str(laneData["TransactionDateTimeStamp"]))
                        self.LaneId=int((laneData["LaneNumber"]).replace("Lane-",""))
                        self.TransactionTypeId=int(laneData["TransactionTypeId"])
                        self.vehicle_class_Id=int(laneData["VehicleClassId"])
                        self.sub_vehicle_class_Id=int(laneData["VehicleSubClassId"])
                        self.select_lane()
                        self.select_tt()
                        self.get_tollFare()
                        self.lane_number_combobox.setEnabled(False)
                        self.transaction_Type_combobox.setEnabled(False)
                    else:
                        error_message = data.get("message", "No record found!")
                        QMessageBox.warning(self, "Error", error_message)
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {e}")

    def load_masterData(self):
        try:
            self.get_lanes()
            self.get_tt()
            self.get_project_config()
            self.setup_printer()
        except Exception as e:
            self.logger.logError(f"Error in get_wim_data {str(e)}")

    def get_lanes(self):
        try:
            api_url = self.apipath + "LaneGetActive"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    laneDetails = data["ResponseData"]
                    for lane in laneDetails:
                        self.lane_number_combobox.addItem(lane['LaneName'], lane['LaneId'])
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_lanes : {e}")

    def get_tt(self):
        try:
            api_url = self.apipath + "TransactionTypeGetActive"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    laneDetails = data["ResponseData"]
                    for lane in laneDetails:
                        self.transaction_Type_combobox.addItem(lane['TransactionTypeName'], lane['TransactionTypeId'])
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
           self.logger.logError(f"Failed to connect to the server get_tt : {e}")

    def get_tollFare(self):
        try:
            api_url = self.apipath + "TollFareGetByEffectedFrom?EffectedFrom="+self.datetime_textbox.text().strip()
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    self.tollFare = data["ResponseData"]
                    if len(self.tollFare)>0:
                        self.tollFare =self.tollFare["TollFareConfigurations"]
                        permissible_weight = self.permissible_weight_textbox.text().strip()
                        actual_weight = self.actual_weight_textbox.text().strip()
                        if int(actual_weight)>int(permissible_weight):
                            filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == self.vehicle_class_Id, self.tollFare))
                            if filtered_data:
                                self.is_overweight_checkbox.setChecked(True)
                                self.overWeight_textbox.setText(str(filtered_data[0]["OverweightPenalty"]))
                            else:
                                self.overWeight_textbox.setText("0.00")
                                self.is_overweight_checkbox.setChecked(False)  
                        else:
                             self.overWeight_textbox.setText("0.00")   


                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
           self.logger.logError(f"Failed to connect to the server get_tollFare : {e}")
    
    def get_project_config(self):
        try:
            api_url = self.apipath + "ProjectConfigGet"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    self.project_config_data = data["ResponseData"]
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_project_config : {e}")
    
    def on_lane_selection_changed(self):
        # Get the selected lane name and lane id
        selected_text = self.lane_number_combobox.currentText()  # Get the lane name (Text)
        selected_id = self.lane_number_combobox.currentData()    # Get the LaneId (Data)
        self.LaneId=selected_id

    def on_tt_selection_changed(self):
        # Get the selected lane name and lane id
        selected_text = self.transaction_Type_combobox.currentText()  # Get the lane name (Text)
        selected_id = self.transaction_Type_combobox.currentData()    # Get the LaneId (Data)
        self.TransactionTypeId=selected_id
        # Print the selected lane information
        #print(f"Selected Transaction Type: {selected_text} (Transaction Id: {selected_id})")

    
    def select_lane(self):
        for index in range(self.lane_number_combobox.count()):
            if self.lane_number_combobox.itemData(index) == self.LaneId:
                self.lane_number_combobox.setCurrentIndex(index)
                break

    def select_tt(self):
        for index in range(self.transaction_Type_combobox.count()):
            if self.transaction_Type_combobox.itemData(index) == self.TransactionTypeId:
                self.transaction_Type_combobox.setCurrentIndex(index)
                break

    def reset_form(self):
        # Clear all text boxes
        self.transaction_id_textbox.clear()
        self.vehicle_class_textbox.clear()
        self.vehicle_subclass_textbox.clear()
        self.permissible_weight_textbox.clear()
        self.actual_weight_textbox.clear()
        self.plate_number_textbox.clear()
        self.datetime_textbox.clear()
        self.overWeight_textbox.clear()
        # Reset the combo boxes to their default index
        if self.lane_number_combobox.count() > 0:
            self.lane_number_combobox.setCurrentIndex(0)
        if self.transaction_Type_combobox.count() > 0:
            self.transaction_Type_combobox.setCurrentIndex(0)
        
        # Reset the checkbox
        self.is_overweight_checkbox.setChecked(False)
        self.lane_number_combobox.setEnabled(True)
        self.transaction_Type_combobox.setEnabled(True)
        
        # Reset internal state variables
        self.vehicle_class_Id = 0
        self.sub_vehicle_class_Id = 0
        self.LaneId = 0
        self.TransactionTypeId = 0
        self.tollFare=[]
    
    def submit_form(self):
        transaction_id = self.transaction_id_textbox.text().strip()
        lane_number = self.lane_number_combobox.currentText()
        transaction_type = self.transaction_Type_combobox.currentText()
        vehicle_class = self.vehicle_class_textbox.text().strip()
        vehicle_subclass = self.vehicle_subclass_textbox.text().strip()
        permissible_weight = self.permissible_weight_textbox.text().strip()
        actual_weight = self.actual_weight_textbox.text().strip()
        plate_number = self.plate_number_textbox.text().strip()
        date_time = self.datetime_textbox.text().strip()
        is_overweight = self.is_overweight_checkbox.isChecked()

        if not transaction_id or not lane_number or not transaction_type:
            QMessageBox.warning(self, "Validation Error", "Transaction ID, Lane Number, and Transaction Type are required.")
            return
        
        if not actual_weight:
            QMessageBox.warning(self, "Validation Error", "Actual Weight is required.")
            return
        
        try:
            permissible_weight = float(permissible_weight) if permissible_weight else 0.0
            actual_weight = float(actual_weight)  # Mandatory, so no need to check if it's empty
        except ValueError:
            QMessageBox.warning(self, "Validation Error", "Permissible and Actual Weights must be numeric.")
            return

        # Prepare data for processing or storing
        form_data = {
            "transaction_id": transaction_id,
            "lane_number": lane_number,
            "transaction_type": transaction_type,
            "vehicle_class": vehicle_class,
            "vehicle_subclass": vehicle_subclass,
            "permissible_weight": permissible_weight,
            "actual_weight": actual_weight,
            "plate_number": plate_number,
            "date_time": date_time,
            "is_overweight": is_overweight,
        }

        # Log or save data
        print("Form Data Submitted:", form_data)
        # Or pass the form data to another method for saving to a database or API call

        # Display success message
        QMessageBox.information(self, "Success", "Form submitted successfully!")

        # Optionally reset the form after submission
        self.reset_form()

    def setup_printer(self):
        try:
            self.receipt_printer=SwbReceiptPrinter(self.project_config_data,None)
            self.receipt_printer_status=True
            self.status_icon.setStyleSheet("background-color: green;")
        except Exception as e:
            self.receipt_printer_status=False
            self.status_icon.setStyleSheet("background-color: red;")
            self.logger.logError(f"Error in get_wim_data {str(e)}")

    def checkbox_state_changed(self, state):
        if state == Qt.Checked:
            print("Checkbox checked")
        else:
            print("Checkbox unchecked")
