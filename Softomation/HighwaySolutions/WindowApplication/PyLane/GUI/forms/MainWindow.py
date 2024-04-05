from datetime import datetime
import json
import threading
from PySide6.QtCore import Signal,QDateTime
from PySide6.QtWidgets import QMainWindow
from PySide6.QtWidgets import QWidget,QHBoxLayout, QVBoxLayout
from gui.ui.messBox import confirmation_box, show_custom_message_box
from gui.widgets.Header import Header
from gui.widgets.LeftFrame import LeftFrame
from gui.widgets.RightFrame import RightFrame
from gui.widgets.Footer import Footer
from models.CommonManager import CommonManager
from models.LaneManager import LaneManager
from utils.constants import Utilities

class MainWindow(QMainWindow):
    switch_window = Signal(str)
    def __init__(self,dbConnectionObj,config_manager,user_Details,systemSettingDetails,project_config_data,logger,default_plaza_Id,system_ip):
        super(MainWindow, self).__init__()
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        self.setWindowTitle("TMS Lane V1")
        self.dbConnectionObj=dbConnectionObj
        self.config_manager=config_manager
        self.project_config_data=project_config_data
        self.showFullScreen()
        self.userDetails = json.loads(user_Details) if user_Details else None
        self.logger=logger
        self.systemSettingDetails=systemSettingDetails
        self.default_plaza_Id=default_plaza_Id
        self.system_ip=system_ip
        self.initUI()
        self.initThreads()
    
    def initUI(self):
        main_window_height = self.height()
        main_window_width = self.width()
        
        central_widget = QWidget() 
        self.setCentralWidget(central_widget)

        main_layout = QVBoxLayout(central_widget)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0) 
        
        self.header_widget = Header(main_window_width, 50,self.userDetails)
        self.header_widget.logout_button.clicked.connect(self.logout)
        self.header_widget.auto_logout.connect(self.shift_auto_logout)
        main_layout.addWidget(self.header_widget)
        
        frames_height=main_window_height-100
        left_frame_width=200
        right_frame_width=main_window_width-left_frame_width
        
        frames_layout = QHBoxLayout()
        frames_layout.setContentsMargins(0, 0, 0, 0)
        
        self.left_frame = LeftFrame(left_frame_width, frames_height,self.logger)
        self.left_frame.setContentsMargins(0, 0, 0, 0)
        self.left_frame.vc_list.itemSelectionChanged.connect(self.onVCSelectionChanged)
        self.left_frame.update_ss(self.systemSettingDetails)
        frames_layout.addWidget(self.left_frame)

        self.right_frame = RightFrame(right_frame_width, frames_height,self.logger)
        self.right_frame.setContentsMargins(0, 0, 0, 0)
        self.right_frame.transaction_type_box.update_ss(self.systemSettingDetails)
        self.right_frame.transaction_type_box.tt_list.itemSelectionChanged.connect(self.onTransactionTypeSelect)
        self.right_frame.transaction_type_box.pt_list.itemSelectionChanged.connect(self.onPaymentTypeSelect)
        self.right_frame.transaction_type_box.et_list.itemSelectionChanged.connect(self.onExemptTypeSelect)
        self.right_frame.current_transaction_box.update_ss(self.systemSettingDetails,self.userDetails,self.project_config_data,self.config_manager)
        self.right_frame.current_transaction_box.btnSubmit.clicked.connect(self.save_transctions)
        self.right_frame.current_transaction_box.btnReset.clicked.connect(self.reset_transctions)
        frames_layout.addWidget(self.right_frame)
       
        main_layout.addLayout(frames_layout)

        self.footer_widget = Footer(main_window_width, 50,self.config_manager)
        main_layout.addWidget(self.footer_widget)

        self.setLayout(main_layout)
        
    def initThreads(self):
        threads = [
            self.createThread(self.updateShiftDetails),
            self.createThread(self.updateVSDetails),
            self.createThread(self.updateTransactionTypeDetails),
            self.createThread(self.updatePaymentTypeDetails),
            self.createThread(self.updateExemptTypeDetails),
            self.createThread(self.updateTollFareDetails),
            self.createThread(self.updateLaneDetails),
            self.createThread(self.updateLatestLaneTransaction)
        ]
        for thread in threads:
            thread.start()

    def createThread(self, target):
        return threading.Thread(target=target)

    def updateShiftDetails(self):
        try:
            self.shiftDetails=CommonManager.GetShiftTimining(self.dbConnectionObj)
            self.get_current_shift()
            
        except Exception as e:
                self.logger.logError(f"Error in updateShiftDetails: {e}")
   
    def updateTransactionTypeDetails(self):
        try:
            self.TransactionTypeDetails=CommonManager.GetTransactionType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_tt(self.TransactionTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updateTransactionTypeDetails: {e}")

    def updatePaymentTypeDetails(self):
        try:
            self.PaymentTypeDetails=CommonManager.GetPaymentType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_pt(self.PaymentTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updatePaymentTypeDetails: {e}")
        
    def updateExemptTypeDetails(self):
        try:
            self.ExemptTypeDetails=CommonManager.GetExemptType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_et(self.ExemptTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updateExemptTypeDetails: {e}")

    def updateTollFareDetails(self):
        try:
            current_date = datetime.now().date()
            self.toll_fare=CommonManager.GetTollfare(self.dbConnectionObj,current_date)
            self.right_frame.current_transaction_box.update_tf(self.toll_fare)
        except Exception as e:
            self.logger.logError(f"Error in updateTollFareDetails: {e}")

    def updateLaneDetails(self):
        try:
            self.LaneDetail=CommonManager.GetLaneDetails(self.dbConnectionObj,self.system_ip)
            if self.LaneDetail is not None:
                self.right_frame.current_transaction_box.update_ld(self.LaneDetail)
                eq_thread = threading.Thread(target=self.updateEqDetails)
                eq_thread.start()
        except Exception as e:
            self.logger.logError(f"Error in updateLaneDetails: {e}")

    def updateEqDetails(self):
        try:
            self.equipments=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.LaneDetail["LaneId"])
            if self.equipments is not None and len(self.equipments)>0:
                filtered_data = list(filter(lambda item: item['EquipmentTypeId'] == 16, self.equipments))
                if filtered_data is not None and len(filtered_data)>0:
                    self.right_frame.lane_view_box.set_cam_details(filtered_data[0])
                    self.right_frame.lane_view_box.updateFinished.emit(True)
                self.footer_widget.update_el(self.equipments)
                self.footer_widget.updateFinished.emit(True)
                filtered_data = list(filter(lambda item: item['EquipmentTypeId'] == 10, self.equipments))    
                if filtered_data is not None and len(filtered_data)>0:
                    self.right_frame.current_transaction_box.update_printer(filtered_data[0])
                else:
                    self.right_frame.current_transaction_box.update_printer(None)
            else:
                self.right_frame.current_transaction_box.update_printer(None)

        except Exception as e:
            self.logger.logError(f"Error in updateEqDetails: {e}")

    def updateVSDetails(self):
        try:
            if self.systemSettingDetails['SubClassRequired']==1:
                self.vc=CommonManager.GetsystemVehicleSubClass(self.dbConnectionObj)
            else:
                self.vc=CommonManager.GetsystemVehicleClass(self.dbConnectionObj)
            self.left_frame.update_vc(self.vc)
        except Exception as e:
            self.logger.logError(f"Error in updateVSDetails: {e}")

    def updateLatestLaneTransaction(self):
        try:
            self.latest_lane_txn=CommonManager.GetLatestLaneTransaction(self.dbConnectionObj)
            if self.latest_lane_txn is not None and len(self.latest_lane_txn)>0:
                self.right_frame.recent_transaction_box.update_lt(self.latest_lane_txn)
        except Exception as e:
            self.logger.logError(f"Error in updateLatestLaneTransaction: {e}")

    def save_transctions(self):
        try:
            ct=datetime.now()
            current_Transaction=self.right_frame.current_transaction_box.current_Transaction
            vc=current_Transaction["VehicleClassId"]
            current_Transaction["PlateNumber"]=self.right_frame.current_transaction_box.txtVRN.text()
            current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.LaneDetail["LaneId"],ct)
            current_Transaction["RCTNumber"]=Utilities.receipt_number(self.LaneDetail["PlazaId"],self.LaneDetail["LaneId"],vc,ct)
            current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
            self.print_receipt()
            resultData=LaneManager.lane_data_insert(self.dbConnectionObj,current_Transaction)
            if(resultData is not None and len(resultData)>0):
                if resultData[0]["AlertMessage"]=="successfully":
                    self.right_frame.recent_transaction_box.update_row_data(self.right_frame.current_transaction_box.current_Transaction)
                    show_custom_message_box("Save Transactions", "Transactions saved successfully!", 'inf')
                    self.reset_transctions()
                   
                else:
                    show_custom_message_box("Save Transactions", resultData[0]["AlertMessage"], 'cri')
        except Exception as e:
            self.logger.logError(f"Error in save_transctions: {e}")
            show_custom_message_box("Save Transactions", "Somthing went wrong!", 'cri')

    def print_receipt(self):
        try:
            self.right_frame.current_transaction_box.on_print()
        except Exception as e:
            self.logger.logError(f"Error in print_receipt: {e}")
            show_custom_message_box("Printer", "Somthing went wrong!", 'cri')

    def reset_transctions(self):
        try:
            self.right_frame.current_transaction_box.on_reset()
            self.right_frame.transaction_type_box.tt_list.clearSelection()
            self.right_frame.transaction_type_box.pt_list.clearSelection()
            self.right_frame.transaction_type_box.et_list.clearSelection()
            self.left_frame.vc_list.clearSelection()
        except Exception as e:
            self.logger.logError(f"Error in reset_transctions: {e}")
            show_custom_message_box("Reset Transactions", "Somthing went wrong!", 'cri')

    def onVCSelectionChanged(self):
        try:
            selected_items = self.left_frame.vc_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                if self.systemSettingDetails['SubClassRequired']==1:
                    filtered_data = list(filter(lambda item: item['SystemSubClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        filtered_data=filtered_data[0]
                    self.right_frame.current_transaction_box.update_svc(item_id, item_name,filtered_data)
                else:
                    filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        filtered_data=filtered_data[0]
                    self.right_frame.current_transaction_box.update_vc(item_id, item_name,filtered_data)
        except Exception as e:
            self.logger.logError(f"Error in onVCSelectionChanged: {e}")
            show_custom_message_box("Vehicle Class", "Somthing went wrong!", 'cri')

    def onTransactionTypeSelect(self):
        try:
            selected_items = self.right_frame.transaction_type_box.tt_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                if item_id==2:
                    self.right_frame.transaction_type_box.pt_list.clearSelection()
                    self.right_frame.transaction_type_box.show_pt(True)
                elif item_id==3:
                    self.right_frame.transaction_type_box.et_list.clearSelection()
                    self.right_frame.transaction_type_box.show_et(True)
                else:
                    self.right_frame.current_transaction_box.update_pt(0,"N/A")
                    self.right_frame.current_transaction_box.update_et(0,"N/A")
                self.right_frame.current_transaction_box.update_tt(item_id, item_name)
        except Exception as e:
            self.logger.logError(f"Error in onTransactionTypeSelect: {e}")
            show_custom_message_box("Transaction Type", "Somthing went wrong!", 'cri')    

    def onPaymentTypeSelect(self):
        try:
            selected_items = self.right_frame.transaction_type_box.pt_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                self.right_frame.transaction_type_box.show_pt(False)
                self.right_frame.current_transaction_box.update_pt(item_id, item_name)
        except Exception as e:
            self.logger.logError(f"Error in onPaymentTypeSelect: {e}")
            show_custom_message_box("Payment Type", "Somthing went wrong!", 'cri') 

    def onExemptTypeSelect(self):
        try:
            selected_items = self.right_frame.transaction_type_box.et_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                self.right_frame.transaction_type_box.show_et(False)
                self.right_frame.current_transaction_box.update_et(item_id, item_name)
        except Exception as e:
            self.logger.logError(f"Error in onExemptTypeSelect: {e}")
            show_custom_message_box("Exempt Type", "Somthing went wrong!", 'cri') 

    def get_current_shift(self):
        try:
            current_datetime = QDateTime.currentDateTime()
            current_date = current_datetime.toString('dd-MMM-yyyy')
            current_date_time = current_datetime.toString('dd-MMM-yyyy HH:mm:ss')
            date_format = "%d-%b-%Y %H:%M:%S"
            if self.shiftDetails is None or len(self.shiftDetails) == 0:
                return
            for shift in self.shiftDetails:
                start_datetime = datetime.strptime(current_date + ' ' + shift['StartTimmng'], date_format)
                end_datetime = datetime.strptime(current_date + ' ' + shift['EndTimming'], date_format)
                formatted_datetime = datetime.strptime(current_date_time, date_format)
                if start_datetime <= formatted_datetime <= end_datetime:
                    self.right_frame.current_transaction_box.update_shift(shift)
                    self.header_widget.update_shift(shift)
                    sh="<b>Shift: " + str(shift['ShiftId']) + " " + shift['StartTimmng'] + "-" + shift['EndTimming']+"</b>"
                    self.header_widget.update_label_signal.emit(sh)
                    break
        except Exception as e:
            self.logger.logError(f"Error in get_current_shift: {e}")
            
    def logout(self):
        confirmation=confirmation_box("Logout","Are you sure you want to logout?")
        if confirmation == True:
            self.switch_window.emit(json.dumps(self.userDetails))

    def shift_auto_logout(self, auto_logout):
        if auto_logout:
            self.switch_window.emit(json.dumps(self.userDetails))