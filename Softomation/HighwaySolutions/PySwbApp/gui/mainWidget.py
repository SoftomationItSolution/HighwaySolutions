from datetime import datetime
import os
import time
from PySide6.QtWidgets import QApplication,QWidget, QMessageBox,QVBoxLayout,QHBoxLayout
from pubsub import pub
import requests
from utils.swb_receipt_printer import SwbReceiptPrinter
from utils.wim_sock_connect import WimSocktConnect
from gui.centreWidget import CentreWidget
from gui.connectionDialog import ConnectionDialog
from gui.footerWidget import FooterWidget
from gui.headerWidget import HeaderWidget
from gui.rightWidget import RightWidget
from utils.constants import Utilities
from utils.log_master import CustomLogger

class MainWidget(QWidget):
    def __init__(self, default_directory,script_dir,logger:CustomLogger,system_ip):
        super().__init__()
        self.default_directory = default_directory
        self.script_dir=script_dir
        self.plaza_config=self.get_plaza_config()
        self.logger = logger
        self.apipath = self.plaza_config["api_url"] + "Softomation/FastTrackHighway-TMS/"
        self.wim_data_thread=None
        self.swb_detail=None
        self.is_wim_conncted=False
        self.is_login=False
        self.receipt_printer_status=False
        self.system_ip=system_ip
        self.init_ui()

    def init_ui(self):
        self.setWindowTitle("SWB Application")
        self.setGeometry(100, 100, 800, 600)  # Full-size window
        screen_rect = QApplication.primaryScreen().availableGeometry()
        screen_height = screen_rect.height()
        screen_width = screen_rect.width()
        main_layout = QVBoxLayout(self)

        self.header = HeaderWidget(self.script_dir,self.plaza_config,self.default_directory,self.system_ip)
        self.header.setObjectName("setborder")
        self.header.setting_btn.clicked.connect(self.show_setting)
        main_layout.addWidget(self.header)

        center_layout = QHBoxLayout()

        left_width = 0
        right_width = 350
        spacing = 50  # estimated or set from layout
        mid_width = screen_width - (left_width + right_width + spacing)

        self.mid_widget = CentreWidget(self.plaza_config,mid_width)
        self.mid_widget.table.itemSelectionChanged.connect(self.on_row_selected)
        center_layout.addWidget(self.mid_widget)

        self.right_widget = RightWidget(self.system_ip,right_width)
        self.right_widget.submit_data.clicked.connect(self.submit_data_process)
        center_layout.addWidget(self.right_widget)
        main_layout.addLayout(center_layout)
        footer = FooterWidget()
        main_layout.addWidget(footer)
        self.setLayout(main_layout)
        pub.subscribe(self.get_wim_status, "wim_status")
        pub.subscribe(self.get_wim_data, "wim_data")
    
    def get_plaza_config(self):
        try:
            self.plaza_path = os.path.join(self.default_directory, 'MasterConfig', 'plazaConfig.json')
            return Utilities.read_json_file(self.plaza_path)
        except Exception as e:
            self.logger.logError(f"Error in get_plaza_config {str(e)}")
    
    def show(self):
        super().showMaximized()


    def set_user_details(self, user_data):
        self.is_login=True
        self.userData = user_data
        self.header.login_label.setText(user_data["LoginId"])
        self.on_wim_connect()
        self.get_project_config()
        self.get_equipment_config()

    def show(self):
        super().showMaximized()

    def show_setting(self):
        popup = ConnectionDialog(self.plaza_config)
        if popup.exec():
            if popup.tcp_radio.isChecked():
                self.plaza_config["type"] = "tcp"
                self.plaza_config["ip"] = popup.ip_input.text()
                self.plaza_config["port"] = popup.port_input.text()
            else:
                self.plaza_config["type"] = "serial"
                self.plaza_config["com_port"] = popup.com_port_combo.currentText()
                self.plaza_config["baudrate"] = popup.baudrate_combo.currentText()
            Utilities.save_json_file(self.plaza_path,self.plaza_config)
            os.makedirs(os.path.dirname(self.plaza_path), exist_ok=True)
            self.on_wim_disconnect()
            time.sleep(0.100)
            self.on_wim_connect()
            return self.plaza_config
    
    def on_wim_connect(self):
        try:
            if "type" in self.plaza_config:
                self.wim_data_thread = WimSocktConnect(self.default_directory,self.plaza_config)
                self.wim_data_thread.start()
            else:
                QMessageBox.critical(self, "Error", f"Wim config is not found: {str(e)}")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {str(e)}")

    def on_wim_disconnect(self):
        try:
            if self.wim_data_thread is not None:
                self.wim_data_thread.stop()
                self.is_wim_conncted=False
        except Exception as e:
           QMessageBox.critical(self, "Error", f"Failed to disconnect to the server: {str(e)}")

    def on_row_selected(self):
        selected_items = self.mid_widget.table.selectedItems()
        if selected_items:
            row = selected_items[0].row()
            lane_txn_id = self.mid_widget.table.item(row, 0).text()  # Assuming column 0 is LaneTransactionId
            matched_data = next((item for item in self.mid_widget.filterData if str(item.get("LaneTransactionId")) == lane_txn_id),None)
            if matched_data:
                self.right_widget.bind_transaction_data(matched_data)

    def get_wim_data(self,transactionInfo):
        try:
            self.right_widget.get_wim_data(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Error in get_wim_data {str(e)}")

    def get_wim_status(self,transactionInfo):
        try:
            self.header.update_wim_status(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Error in get_wim_status {str(e)}")
    
    def get_project_config(self):
        try:
            api_url = self.apipath + "ProjectConfigGet"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    self.project_config_data = data["ResponseData"]
                    self.setup_printer()
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                error_message = data.get("message", "Something went wrong!")
                QMessageBox.warning(self, "Error", error_message)
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_project_config : {e}")


    def get_equipment_config(self):
        try:
            api_url = self.apipath + "EquipmentDetailsByTypeId?TypeId=39"
            response = requests.get(api_url, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"]) > 0:
                if data["Message"][0]["AlertMessage"] == "success":
                    equipment_list=data["ResponseData"]
                    self.swb_detail = next((item for item in equipment_list if item.get("UrlAddress") == self.system_ip), None)
                    self.right_widget.update_swb_details(self.swb_detail)
                    if self.swb_detail:
                        self.header.update_header_lable(self.swb_detail["EquipmentName"],self.system_ip)
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                QMessageBox.warning(self, "Error", "Something went wrong!")
        except requests.exceptions.RequestException as e:
            self.logger.logError(f"Failed to connect to the server get_equipment_config : {e}")
    
    
    def setup_printer(self):
        try:
            self.receipt_printer=SwbReceiptPrinter(self.project_config_data,self.plaza_config)
            self.receipt_printer_status=True
            self.header.update_printer_status(True)
        except Exception as e:
            self.receipt_printer_status=False
            self.header.update_printer_status(False)

    def submit_data_process(self):
        try:
            if self.receipt_printer_status:
                current_date_time=datetime.now()
                printData={
                    "PlazaName":self.swb_detail["PlazaName"],
                    "SystemIpAddress":self.system_ip,
                    "SWBName":f'{self.swb_detail["EquipmentName"]}',
                    "UserId":self.userData["UserData"]["UserId"],
                    "LoginId":self.userData["UserData"]["LoginId"],
                    "VehicleClassName":self.right_widget.trans_data["VehicleClassName"],
                    "VehicleSubClassName":self.right_widget.trans_data["VehicleSubClassName"],
                    "LaneTransactionId":self.right_widget.trans_data["LaneTransactionId"],
                    "PermissibleVehicleWeight":self.right_widget.trans_data["PermissibleVehicleWeight"],
                    "PaymentTypeName":"Cash",
                    "TransactionDateTime":Utilities.current_date_time_json(dt=current_date_time),
                    "ActualVehicleWeight":self.right_widget.wim_data["TotalWeight"],
                    "ExcessWeight":self.right_widget.excess_weight.text(),
                    "OverWeightAmount":self.right_widget.overweight_amount.text(),
                }
                self.upload_wim_data(printData)
            else:
                QMessageBox.warning(self, "Error", "printer not conncted!")
        except Exception as e:
           QMessageBox.warning(self, "Error", str(e))

    def upload_wim_data(self,payload):
        try:
            api_url = self.plaza_config["api_url"] + "Softomation/FTH-TMS-RSD/StaticWimTransactionInsert"
            response = requests.post(api_url, json=payload, timeout=10)
            response.raise_for_status()
            data = response.json()
            if len(data["Message"])>0:
                if data["Message"][0]["AlertMessage"]=="success":
                    self.receipt_printer.generate_receipt(payload)
                    QMessageBox.information(self, "Success", "Data saved successfully!")
                    self.mid_widget.remove_selected_row()
                    self.right_widget.rest_data()
                else:
                    error_message = data.get("message", data["Message"][0]["AlertMessage"])
                    QMessageBox.warning(self, "Error", error_message)
            else:
                QMessageBox.warning(self, "Error", "Somthing went wrong!")
        except requests.exceptions.RequestException as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {e}")

    

    