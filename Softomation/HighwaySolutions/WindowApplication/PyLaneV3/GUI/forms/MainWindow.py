from datetime import datetime
import json
import threading
from PySide6.QtCore import Signal,QDateTime
from PySide6.QtWidgets import QMainWindow
from PySide6.QtWidgets import QWidget,QHBoxLayout, QVBoxLayout
from PySide6.QtCore import Qt
from GUI.ui.messBox import confirmation_box, show_custom_message_box
from GUI.widgets.Header import Header
from GUI.widgets.LeftFrame import LeftFrame
from GUI.widgets.RightFrame import RightFrame
from GUI.widgets.Footer import Footer
from models.CommonManager import CommonManager
from utils.constants import Utilities
from pubsub import pub

class MainWindow(QMainWindow):
    switch_window = Signal(str)
    def __init__(self,bg_service,dbConnectionObj,default_directory,image_dir,user_Details,systemSettingDetails,LaneDetail,logger,default_plaza_Id,screen_width,screen_height):
        super(MainWindow, self).__init__()
        try:
            self.setStyleSheet("background-color: rgb(1, 27, 65);")
            self.setWindowTitle("TMS Lane V1")
            self.bg_service=bg_service
            self.dbConnectionObj=dbConnectionObj
            self.default_directory=default_directory
            self.image_dir=image_dir
            self.systemSettingDetails=systemSettingDetails
            self.LaneDetail=LaneDetail
            self.screen_width=screen_width
            self.screen_height=screen_height
            self.resize(screen_width, screen_height)
            self.showFullScreen()
            self.userDetails = json.loads(user_Details) if user_Details else None
            self.logger=logger
            self.default_plaza_Id=default_plaza_Id
            self.initUI()
            self.initThreads()
            self.isTransactionPending=False
            pub.subscribe(self.lane_process_end, "lane_process_end")
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  __init__: {e}")
    
    def initUI(self):
        try:
            main_window_height = self.screen_height
            main_window_width = self.screen_width
            
            central_widget = QWidget() 
            self.setCentralWidget(central_widget)

            main_layout = QVBoxLayout(central_widget)
            main_layout.setContentsMargins(0, 0, 0, 0)
            main_layout.setSpacing(0) 
            
            self.header_widget = Header(main_window_width, 50,self.userDetails,self.image_dir)
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

            self.right_frame = RightFrame(right_frame_width, frames_height,self.default_directory,self.logger)
            self.right_frame.setContentsMargins(0, 0, 0, 0)
            self.right_frame.transaction_type_box.update_ss(self.systemSettingDetails)
            self.right_frame.transaction_type_box.tt_list.itemSelectionChanged.connect(self.onTransactionTypeSelect)
            self.right_frame.transaction_type_box.pt_list.itemSelectionChanged.connect(self.onPaymentTypeSelect)
            self.right_frame.transaction_type_box.et_list.itemSelectionChanged.connect(self.onExemptTypeSelect)
            self.right_frame.current_transaction_box.update_ss(self.systemSettingDetails,self.userDetails,self.LaneDetail,self.default_directory)
            self.right_frame.current_transaction_box.btnSubmit.clicked.connect(self.save_transctions)
            self.right_frame.current_transaction_box.btnReset.clicked.connect(self.reset_transctions)
            self.right_frame.wim_data_queue_box.tblWim.itemDoubleClicked.connect(self.remove_wim_Row)
            self.right_frame.rfid_data_queue_box.tblRfid.itemDoubleClicked.connect(self.remove_rfid_Row)
            frames_layout.addWidget(self.right_frame)
        
            main_layout.addLayout(frames_layout)

            self.footer_widget = Footer(main_window_width, 50,self.image_dir,self.bg_service,self.logger)
            main_layout.addWidget(self.footer_widget)

            self.setLayout(main_layout)
            pub.subscribe(self.get_RFID_detail, "rfid_processed")
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  initUI: {e}")

    def keyPressEvent(self, event):
        try:
            if event.key() == Qt.Key_F11:
                if self.isFullScreen():
                    self.showNormal()
                else:
                    self.showFullScreen()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  keyPressEvent: {e}")
    
    def initThreads(self):
        try:
            threads = [
                self.createThread(self.updateShiftDetails),
                self.createThread(self.updateVSDetails),
                self.createThread(self.updateTransactionTypeDetails),
                self.createThread(self.updatePaymentTypeDetails),
                self.createThread(self.updateExemptTypeDetails),
                self.createThread(self.updateTollFareDetails),
                self.createThread(self.updateEqDetails),
                self.createThread(self.updateLatestLaneTransaction)
            ]
            for thread in threads:
                thread.start()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  initThreads: {e}")

    def createThread(self, target):
        try:
            return threading.Thread(target=target)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  createThread: {e}")

    def updateShiftDetails(self):
        try:
            self.shiftDetails=CommonManager.GetShiftTimining(self.dbConnectionObj)
            self.get_current_shift()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateShiftDetails: {e}")
   
    def updateTransactionTypeDetails(self):
        try:
            self.TransactionTypeDetails=CommonManager.GetTransactionType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_tt(self.TransactionTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateTransactionTypeDetails: {e}")

    def updatePaymentTypeDetails(self):
        try:
            self.PaymentTypeDetails=CommonManager.GetPaymentType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_pt(self.PaymentTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updatePaymentTypeDetails: {e}")
        
    def updateExemptTypeDetails(self):
        try:
            self.ExemptTypeDetails=CommonManager.GetExemptType(self.dbConnectionObj)
            self.right_frame.transaction_type_box.update_et(self.ExemptTypeDetails)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateExemptTypeDetails: {e}")

    def updateTollFareDetails(self):
        try:
            current_date = datetime.now().date()
            self.toll_fare=CommonManager.GetTollfare(self.dbConnectionObj,current_date)
            self.right_frame.current_transaction_box.update_tf(self.toll_fare)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateTollFareDetails: {e}")

    def updateEqDetails(self):
        try:
            self.equipments=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.LaneDetail["LaneId"])
            if self.equipments is not None and len(self.equipments)>0:
                self.footer_widget.update_el(self.equipments)
                self.footer_widget.updateFinished.emit(True)
                filtered_item = next(filter(lambda item: item['EquipmentTypeId'] == 10, self.equipments), None)    
                if filtered_item is not None:
                    self.printer_setup(filtered_item)
                else:
                    self.printer_setup(None)
            else:
                self.printer_setup(None)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateEqDetails: {e}")

    def updateVSDetails(self):
        try:
            if self.systemSettingDetails['SubClassRequired']==1:
                self.vc=CommonManager.GetsystemVehicleSubClass(self.dbConnectionObj)
            else:
                self.vc=CommonManager.GetsystemVehicleClass(self.dbConnectionObj)
            self.left_frame.update_vc(self.vc)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateVSDetails: {e}")

    def updateLatestLaneTransaction(self):
        try:
            self.latest_lane_txn=CommonManager.GetLatestLaneTransaction(self.dbConnectionObj)
            if self.latest_lane_txn is not None and len(self.latest_lane_txn)>0:
                self.right_frame.recent_transaction_box.update_lt(self.latest_lane_txn)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateLatestLaneTransaction: {e}")

    def get_RFID_detail(self,transactionInfo):
        try:
            if self.isTransactionPending==False:
                self.isTransactionPending=True
                FasTagClassName=self.left_frame.set_vc(transactionInfo['Class'])
                self.right_frame.transaction_type_box.set_tt_value(1)
                self.right_frame.current_transaction_box.create_fasTag_trans(transactionInfo,True,"Active",FasTagClassName)
                d=self.right_frame.wim_data_queue_box.get_top_wim()
                if d is not None:
                    self.right_frame.current_transaction_box.update_wt(d.get('TotalWeight'))
            else:
                self.right_frame.rfid_data_queue_box.rfid_transaction_info(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  get_RFID_detail: {e}")

    def save_transctions(self):
        try:
            ct=datetime.now()
            current_Transaction=self.right_frame.current_transaction_box.current_Transaction
            vc=Utilities.is_integer(current_Transaction["VehicleClassId"])
            svc=Utilities.is_integer(current_Transaction["VehicleSubClassId"])
            TransactionTypeId=Utilities.is_integer(current_Transaction["TransactionTypeId"])
            vrn=self.right_frame.current_transaction_box.txtVRN.text()
            remark=self.right_frame.current_transaction_box.txtRemark.text()
            current_Transaction["TCRemark"]=remark
            if TransactionTypeId>0:
                if vc>0 or svc>0:
                    if TransactionTypeId==1:
                        if current_Transaction["TagEPC"]=='':
                            show_custom_message_box("Save Transactions", "FasTag epc is required", 'cri')
                            return
                    elif TransactionTypeId==3:
                        if remark=='':
                            show_custom_message_box("Save Transactions", "Remark is required", 'cri')
                            return
                    if len(vrn)>=4 and len(vrn)<11:
                        self.right_frame.current_transaction_box.btnSubmit.setEnabled(False)
                        current_Transaction["PlateNumber"]=vrn
                        current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.LaneDetail["LaneId"],ct)
                        if TransactionTypeId !=1:
                            current_Transaction["RCTNumber"]=Utilities.receipt_number(self.LaneDetail["PlazaId"],self.LaneDetail["LaneId"],vc,ct)
                        current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
                        current_Transaction["SystemDateTime"]=ct.isoformat()
                        resultData=self.bg_service.lane_trans_start(current_Transaction)
                        if resultData:
                            if TransactionTypeId ==2:
                                self.print_receipt(current_Transaction)
                        else:
                            show_custom_message_box("Save Transactions", "Somthing went wrong", 'cri')  
                    else:
                        show_custom_message_box("Save Transactions", "Valid plate number is required", 'cri')
                else:
                    show_custom_message_box("Save Transactions", "Vehicle class is required", 'cri')
            else:
                show_custom_message_box("Save Transactions", "Transaction Type is required", 'cri')
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  save_transctions: {e}")
            show_custom_message_box("Save Transactions", "Somthing went wrong!", 'cri')

    def lane_process_end(self,transactionInfo):
        try:
            if self.isTransactionPending== True:
                self.reset_transctions()
                rfdata=self.right_frame.rfid_data_queue_box.get_top_rfid()
                if rfdata is not None:
                    FasTagClassName=self.left_frame.set_vc(rfdata['Class'])
                    self.right_frame.transaction_type_box.set_tt_value(1)
                    self.right_frame.current_transaction_box.create_fasTag_trans(rfdata,True,"Active",FasTagClassName)
                    d=self.right_frame.wim_data_queue_box.get_top_wim()
                    if d is not None:
                        self.right_frame.current_transaction_box.update_wt(d.get('TotalWeight')) 
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  lane_process_end: {e}")
        
    def printer_setup(self,data):
        try:
            self.right_frame.current_transaction_box.update_printer(data)
            self.footer_widget.update_printer(True)
            if data is None:
                self.footer_widget.update_printer(False)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  printer_setup: {e}")
            self.footer_widget.update_printer(False)

    def print_receipt(self,current_Transaction):
        try:
            self.right_frame.current_transaction_box.on_print(current_Transaction)
            self.footer_widget.update_printer(True)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  print_receipt: {e}")
            self.footer_widget.update_printer(False)
            show_custom_message_box("Printer", "printer not working!", 'cri')

    def reset_transctions(self):
        try:
            self.right_frame.current_transaction_box.btnSubmit.setEnabled(True)
            self.right_frame.current_transaction_box.on_reset()
            self.right_frame.transaction_type_box.tt_list.clearSelection()
            self.right_frame.transaction_type_box.pt_list.clearSelection()
            self.right_frame.transaction_type_box.et_list.clearSelection()
            self.right_frame.transaction_type_box.reset_tt_value()
            self.left_frame.vc_list.clearSelection()
            self.isTransactionPending=False
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  reset_transctions: {e}")
            show_custom_message_box("Reset Transactions", "Somthing went wrong!", 'cri')

    def on_weight_selection(self):
        try:
            selected_rows = set(item.row() for item in self.right_frame.wim_data_queue_box.tblWim.selectedItems())
            for row in sorted(selected_rows, reverse=True):
                item = self.right_frame.wim_data_queue_box.tblWim.item(row, 1)
                if item:
                    self.right_frame.current_transaction_box.update_wt(item.text())
                self.right_frame.wim_data_queue_box.tblWim.removeRow(row)
                del self.right_frame.wim_data_queue_box.wim_q[row]
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  on_weight_selection: {e}")
            show_custom_message_box("WIM Weight", "Somthing went wrong!", 'cri')

    def remove_wim_Row(self, item):
        try:
            row = item.row()
            self.right_frame.wim_data_queue_box.tblWim.removeRow(row)
            del self.right_frame.wim_data_queue_box.wim_q[row]
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  remove_wim_Row: {e}")
            show_custom_message_box("WIM Weight", "Somthing went wrong!", 'cri') 

    def remove_rfid_Row(self, item):
        try:
            row = item.row()
            self.right_frame.rfid_data_queue_box.tblRfid.removeRow(row)
            del self.right_frame.rfid_data_queue_box.rfid_q[row]
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  remove_rfid_Row: {e}")
            show_custom_message_box("RFID", "Somthing went wrong!", 'cri')          

    def onVCSelectionChanged(self):
        try:
            selected_items = self.left_frame.vc_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                if self.systemSettingDetails['SubClassRequired']==1:
                    filtered_data = list(filter(lambda item: item['SystemVehicleSubClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        filtered_data=filtered_data[0]
                    self.right_frame.current_transaction_box.update_svc(item_id, item_name,filtered_data)
                else:
                    filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == item_id, self.vc))
                    if filtered_data is not None and len(filtered_data) > 0:
                        filtered_data=filtered_data[0]
                    self.right_frame.current_transaction_box.update_vc(item_id, item_name,filtered_data)
                    self.isTransactionPending=True
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  onVCSelectionChanged: {e}")
            show_custom_message_box("Vehicle Class", "Somthing went wrong!", 'cri')

    def onTransactionTypeSelect(self):
        try:
            self.isTransactionPending=True
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
                self.isTransactionPending=True
                d=self.right_frame.wim_data_queue_box.get_top_wim()
                if d is not None:
                    self.right_frame.current_transaction_box.update_wt(d.get('TotalWeight'))
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  onTransactionTypeSelect: {e}")
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
            self.logger.logError(f"Error in MainWindow onPaymentTypeSelect: {e}")
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
            self.logger.logError(f"Error in MainWindow onExemptTypeSelect: {e}")
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
            self.logger.logError(f"Error in MainWindow get_current_shift: {e}")
            
    def logout(self):
        try:
            confirmation=confirmation_box("Logout","Are you sure you want to logout?")
            if confirmation == True:
                self.switch_window.emit(json.dumps(self.userDetails))
                self.bg_service.app_log_status(False)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow logout: {e}")

    def shift_auto_logout(self, auto_logout):
        try:
            if auto_logout:
                self.switch_window.emit(json.dumps(self.userDetails))
        except Exception as e:
            self.logger.logError(f"Error in MainWindow shift_auto_logout: {e}")
