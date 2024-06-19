from datetime import datetime
import json
import os
import threading
from PySide6.QtCore import Signal,QDateTime
from PySide6.QtWidgets import QMainWindow
from PySide6.QtWidgets import QWidget,QHBoxLayout, QVBoxLayout
from PySide6.QtCore import Qt
from GUI.dialog.FloatDialog import CurrencyDialog
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
    def __init__(self,bg_service,screen_width,screen_height,logger,image_dir,user_Details):
        super(MainWindow, self).__init__()
        try:
            self.setStyleSheet("background-color: rgb(1, 27, 65);")
            self.setWindowTitle("TMS Lane V1")
            self.image_dir=image_dir
            self.bg_service=bg_service
            self.dbConnectionObj=bg_service.dbConnectionObj
            self.default_directory=bg_service.default_directory
            self.systemSetting=bg_service.systemSetting
            self.lane_detail=bg_service.lane_detail
            self.default_plaza_Id=bg_service.default_plaza_Id
            self.equipment_detail=bg_service.equipment_detail
            self.shiftDetails=bg_service.shiftDetails
            self.vehicle_class=bg_service.vehicle_class
            self.toll_fare=bg_service.toll_fare
            self.screen_width=screen_width
            self.screen_height=screen_height
            self.resize(screen_width, screen_height)
            self.showFullScreen()
            self.userDetails = json.loads(user_Details) if user_Details else None
            self.logger=logger
            self.recipt_printer=None
            self.right_frame=None
            self.footer_widget=None
            self.current_shift=None
            self.initUI()
            self.initThreads()
            self.isTransactionPending=False
            self.tow_status=False
            self.fleet_status=False
            self.get_current_shift()
            self.updateTollFareDetails()
            self.get_plaza_url()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  __init__: {e}")

    def get_plaza_url(self):
        try:
            plaza_config_path=os.path.join(self.default_directory, 'MasterConfig', 'plazaConfig.json')
            plaza_config = Utilities.read_json_file(plaza_config_path)
            self.api_base_url=plaza_config["plaza_api_p"]
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_plaza_url: {str(e)}")

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
            
            self.left_frame = LeftFrame(left_frame_width, frames_height,self.logger,self.systemSetting,self.vehicle_class)
            self.left_frame.setContentsMargins(0, 0, 0, 0)
            self.left_frame.vc_list.itemSelectionChanged.connect(self.onVCSelectionChanged)
            frames_layout.addWidget(self.left_frame)

            self.right_frame = RightFrame(right_frame_width, frames_height,self.default_directory,self.logger)
            self.right_frame.setContentsMargins(0, 0, 0, 0)
            self.right_frame.transaction_type_box.update_ss(self.systemSetting)
            self.right_frame.transaction_type_box.tt_list.itemSelectionChanged.connect(self.onTransactionTypeSelect)
            self.right_frame.transaction_type_box.pt_list.itemSelectionChanged.connect(self.onPaymentTypeSelect)
            self.right_frame.transaction_type_box.et_list.itemSelectionChanged.connect(self.onExemptTypeSelect)
            self.right_frame.current_transaction_box.update_ss(self.systemSetting,self.userDetails,self.lane_detail,self.default_directory)
            self.right_frame.current_transaction_box.btnSubmit.clicked.connect(self.save_transctions)
            self.right_frame.current_transaction_box.btnReset.clicked.connect(self.reset_transctions)
            self.right_frame.wim_data_queue_box.tblWim.itemDoubleClicked.connect(self.remove_wim_Row)
            self.right_frame.rfid_data_queue_box.tblRfid.itemDoubleClicked.connect(self.remove_rfid_Row)
            
            self.right_frame.transaction_type_box.btnMid.clicked.connect(self.mid_declare)
            self.right_frame.transaction_type_box.btnBleed.clicked.connect(self.end_declare)
            self.right_frame.transaction_type_box.btnFleet.clicked.connect(self.fleet_manage)
            self.right_frame.transaction_type_box.btnTow.clicked.connect(self.tow_manage)
            
            
            frames_layout.addWidget(self.right_frame)
            main_layout.addLayout(frames_layout)

            self.footer_widget = Footer(main_window_width, 50,self.image_dir,self.bg_service,self.logger,self.equipment_detail)
            main_layout.addWidget(self.footer_widget)
            self.setLayout(main_layout)
            self.set_equipment_printer()
            pub.subscribe(self.get_RFID_detail, "rfid_processed")
            pub.subscribe(self.lane_process_end, "lane_process_end")
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  initUI: {e}")
    
    def set_equipment_printer(self):
        try:
            if self.recipt_printer is None:
                if self.equipment_detail is not None and len(self.equipment_detail)>0:
                    filtered_item = next(filter(lambda item: item['EquipmentTypeId'] == 10, self.equipment_detail), None)
                    if filtered_item is not None:
                        self.recipt_printer=filtered_item
                        res=self.right_frame.current_transaction_box.update_printer(filtered_item)
                        self.footer_widget.update_printer(res)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  set_equipment_printer: {e}")

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
                self.createThread(self.updateTransactionTypeDetails),
                self.createThread(self.updatePaymentTypeDetails),
                self.createThread(self.updateExemptTypeDetails),
                self.createThread(self.updateLatestLaneTransaction),
                self.createThread(self.GetDenominationMaster)
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
            self.right_frame.current_transaction_box.update_tf(self.toll_fare)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateTollFareDetails: {e}")

    def updateLatestLaneTransaction(self):
        try:
            self.latest_lane_txn=CommonManager.GetLatestLaneTransaction(self.dbConnectionObj)
            if self.latest_lane_txn is not None and len(self.latest_lane_txn)>0:
                self.right_frame.recent_transaction_box.update_lt(self.latest_lane_txn)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow  updateLatestLaneTransaction: {e}")

    def GetDenominationMaster(self):
        try:
            self.denomination_master=CommonManager.GetDenominationMaster(self.dbConnectionObj)
        except Exception as e:
            self.denomination_master=None
            self.logger.logError(f"Error in MainWindow  GetDenominationMaster: {e}")

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
                        current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                        if TransactionTypeId !=1:
                            current_Transaction["RCTNumber"]=Utilities.receipt_number(self.lane_detail["PlazaId"],self.lane_detail["LaneId"],vc,ct)
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
                if self.systemSetting['SubClassRequired']==1:
                    filtered_data = list(filter(lambda item: item['SystemVehicleSubClassId'] == item_id, self.vehicle_class))
                    if filtered_data is not None and len(filtered_data) > 0:
                        filtered_data=filtered_data[0]
                    self.right_frame.current_transaction_box.update_svc(item_id, item_name,filtered_data)
                else:
                    filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == item_id, self.vehicle_class))
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

    def mid_declare(self):
        try:
             dialog = CurrencyDialog(self.dbConnectionObj,self.api_base_url,self.denomination_master,self.lane_detail,self.userDetails,self.current_shift,4,'mid-shift Float Process')
             dialog.exec()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow mid_declare: {e}")
            show_custom_message_box("MID decalre", "Somthing went wrong!", 'cri')

    def end_declare(self):
        try:
             dialog = CurrencyDialog(self.dbConnectionObj,self.api_base_url,self.denomination_master,self.lane_detail,self.userDetails,self.current_shift,5,'end-shift Float Process')
             dialog.exec()
        except Exception as e:
            self.logger.logError(f"Error in MainWindow end_declare: {e}")
            show_custom_message_box("END decalre", "Somthing went wrong!", 'cri') 

    def fleet_manage(self):
        try:
            if self.fleet_status:
                self.fleet_status=False
                self.right_frame.transaction_type_box.btnFleet.setText("Fleet-Start")
                self.right_frame.transaction_type_box.btnFleet.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
            else:
                self.fleet_status=True
                self.right_frame.transaction_type_box.btnFleet.setText("Fleet-Started")
                self.right_frame.transaction_type_box.btnFleet.setStyleSheet("background-color: red; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
                self.bg_service.handel_fleet_trans(False)
        except Exception as e:
            self.logger.logError(f"Error in MainWindow fleet_manage: {e}")
            show_custom_message_box("Fleet", "Somthing went wrong!", 'cri') 

    def tow_manage(self):
        try:
            if self.tow_status:
                self.tow_status=False
                self.right_frame.transaction_type_box.btnTow.setText("Tow-Start")
                self.right_frame.transaction_type_box.btnTow.setStyleSheet("background-color: darkgreen; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
            else:
                self.tow_status=True
                self.right_frame.transaction_type_box.btnTow.setText("Tow-Started")
                self.right_frame.transaction_type_box.btnTow.setStyleSheet("background-color: red; color: white; font-weight: bold;border: none;border-right: 1px solid white;")
        except Exception as e:
            self.logger.logError(f"Error in MainWindow tow_manage: {e}")
            show_custom_message_box("Tow", "Somthing went wrong!", 'cri') 
    
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
                    self.current_shift=shift
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