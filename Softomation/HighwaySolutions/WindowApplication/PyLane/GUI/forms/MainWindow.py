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
from utils.constants import current_date_time_JSON, lane_txn_Number, receipt_Number


class MainWindow(QMainWindow):
    switch_window = Signal(str)
    
    #update_label_signal = Signal(str)
    def __init__(self,dbConnectionObj,config_manager,user_Details,systemSettingDetails,project_config_data,logger,default_plaza_Id,system_ip):
        super(MainWindow, self).__init__()
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        self.setWindowTitle("TMS Lane V1")
        self.dbConnectionObj=dbConnectionObj
        self.config_manager=config_manager
        self.project_config_data=project_config_data
        self.showFullScreen()
        self.userDetails=None
        self.logger=logger
        self.systemSettingDetails=systemSettingDetails
        self.db_cm = CommonManager(dbConnectionObj)
        self.db_lm = LaneManager(dbConnectionObj)
        self.default_plaza_Id=default_plaza_Id
        self.system_ip=system_ip
        main_window_height = self.height()
        main_window_width = self.width()

        if user_Details is not None:
            self.userDetails=json.loads(user_Details)
        
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

        footer_widget = Footer(main_window_width, 50)
        main_layout.addWidget(footer_widget)

        self.setLayout(main_layout)
        sh_thread = threading.Thread(target=self.updateShiftDetails)
        vc_thread = threading.Thread(target=self.updateVSDetails)
        tt_thread = threading.Thread(target=self.updateTransactionTypeDetails)
        pt_thread = threading.Thread(target=self.updatePaymentTypeDetails)
        et_thread = threading.Thread(target=self.updateExemptTypeDetails)
        tf_thread = threading.Thread(target=self.updateTollFareDetails)
        ld_thread = threading.Thread(target=self.updateLaneDetails)
        lt_thread = threading.Thread(target=self.updateLatestLaneTransaction)
        
        sh_thread.start()
        tf_thread.start()
        vc_thread.start()
        tt_thread.start()
        pt_thread.start()
        et_thread.start()
        ld_thread.start()
        lt_thread.start()
        
    def updateShiftDetails(self):
        try:
            self.shiftDetails=self.db_cm.GetShiftTimining()
            self.get_current_shift()
            
        except Exception as e:
                self.logger.logError(f"Error in updateShiftDetails: {e}")
   
    def updateTransactionTypeDetails(self):
        try:
            self.TransactionTypeDetails=self.db_cm.GetTransactionType()
            self.right_frame.transaction_type_box.update_tt(self.TransactionTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updateTransactionTypeDetails: {e}")
        

    def updatePaymentTypeDetails(self):
        try:
            self.PaymentTypeDetails=self.db_cm.GetPaymentType()
            self.right_frame.transaction_type_box.update_pt(self.PaymentTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updatePaymentTypeDetails: {e}")
        
    def updateExemptTypeDetails(self):
        try:
            self.ExemptTypeDetails=self.db_cm.GetExemptType()
            self.right_frame.transaction_type_box.update_et(self.ExemptTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in updateExemptTypeDetails: {e}")

    def updateTollFareDetails(self):
        try:
            current_date = datetime.now().date()
            self.toll_fare=self.db_cm.GetTollfare(current_date)
            self.right_frame.current_transaction_box.update_tf(self.toll_fare)
        except Exception as e:
            self.logger.logError(f"Error in updateTollFareDetails: {e}")

    def updateLaneDetails(self):
        try:
            self.LaneDetail=self.db_cm.GetLaneDetails(self.system_ip)
            if self.LaneDetail is not None and len(self.LaneDetail)>0:
                self.LaneDetail=self.LaneDetail[0]
                self.right_frame.current_transaction_box.update_ld(self.LaneDetail)
                eq_thread = threading.Thread(target=self.updateEqDetails)
                eq_thread.start()
        except Exception as e:
            self.logger.logError(f"Error in updateLaneDetails: {e}")

    def updateEqDetails(self):
        try:
            self.equipments=self.db_cm.GetEquipmentDetails( self.LaneDetail["LaneId"])
            if self.equipments is not None and len(self.equipments)>0:
                filtered_data = list(filter(lambda item: item['EquipmentTypeId'] == 16, self.equipments))
                if filtered_data is not None and len(filtered_data)>0:
                    self.right_frame.lane_view_box.set_cam_details(filtered_data[0])
        except Exception as e:
            self.logger.logError(f"Error in updateEqDetails: {e}")

    def updateVSDetails(self):
        try:
            if self.systemSettingDetails['SubClassRequired']==1:
                self.vc=self.db_cm.GetsystemVehicleSubClass()
            else:
                self.vc=self.db_cm.GetsystemVehicleClass()
            self.left_frame.update_vc(self.vc)
        except Exception as e:
            self.logger.logError(f"Error in updateVSDetails: {e}")

    def updateLatestLaneTransaction(self):
        try:
            self.latest_lane_txn=self.db_cm.GetLatestLaneTransaction()
            if self.latest_lane_txn is not None and len(self.latest_lane_txn)>0:
                self.right_frame.recent_transaction_box.update_lt(self.latest_lane_txn)
                print(self.latest_lane_txn)
        except Exception as e:
            self.logger.logError(f"Error in updateLatestLaneTransaction: {e}")

    def save_transctions(self):
        try:
            ct=datetime.now()
            self.right_frame.current_transaction_box.current_Transaction["LaneTransactionId"]=lane_txn_Number(self.LaneDetail["LaneId"],ct)
            self.right_frame.current_transaction_box.current_Transaction["RCTNumber"]=receipt_Number(self.LaneDetail["PlazaId"],self.LaneDetail["LaneId"],ct)
            self.right_frame.current_transaction_box.current_Transaction["TransactionDateTime"]=current_date_time_JSON(ct)
            #self.print_receipt()
            resultData=self.db_lm.lane_data_insert(self.right_frame.current_transaction_box.current_Transaction)
            if(resultData is not None and len(resultData)>0):
                if resultData[0]["AlertMessage"]=="successfully":
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
            PermissibleWeight=0
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                if self.systemSettingDetails['SubClassRequired']==1:
                    filtered_data = list(filter(lambda item: item['SystemSubClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        PermissibleWeight=filtered_data[0]["PermissibleWeight"]
                    self.right_frame.current_transaction_box.update_svc(item_id, item_name,PermissibleWeight)
                else:
                    filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        PermissibleWeight=filtered_data[0][filtered_data]
                    self.right_frame.current_transaction_box.update_vc(item_id, item_name,PermissibleWeight)
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

    