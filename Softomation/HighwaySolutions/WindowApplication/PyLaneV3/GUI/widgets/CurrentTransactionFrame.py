from datetime import datetime
import decimal
import os
from PySide6.QtWidgets import QFrame,QGroupBox, QVBoxLayout, QLabel, QPushButton, QWidget, QGridLayout, QLineEdit, QHBoxLayout,QRadioButton
from PySide6.QtCore import Qt, Signal
from GUI.ui.messBox import show_custom_message_box
from utils.constants import Utilities
from utils.toll_receipt_printer import TollReceiptPrinter

class HorizontalLine(QFrame):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFrameShape(QFrame.HLine)
        self.setFrameShadow(QFrame.Sunken)

class CurrentTransactionBox(QFrame):
    message_window = Signal(str)
    def __init__(self, width, height,logger):
        super().__init__()
        self.logger=logger
        self.layout_height = height-25
        self.layout_width = width
        self.toll_fare=None
        self.LaneDetail=None
        self.current_shift=None
        self.initUI(width, height)

    def initUI(self, width, height):
        try:
            self.setStyleSheet("QPushButton{font-weight: bold;border: none;}"
                            "QPushButton#btnReset{background-color: red; border-right: 1px solid black;}"
                            "QPushButton#btnSubmit{background-color: green;}"
                            "QPushButton#btnSubmit:disabled{ background-color: #aaaaaa;color: #666666;}"
                            "QPushButton:disabled {background-color: #aaaaaa;color: #666666;}")

            self.setFixedWidth(width)
            self.setFixedHeight(height)

            self.group_box = QGroupBox("Current Transaction")
            self.group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; ; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            self.group_box.setFixedHeight(height)

            main_layout = QVBoxLayout(self)
            main_layout.setContentsMargins(0, 0, 0, 0)
            main_layout.setSpacing(0)

            self.central_layout = QVBoxLayout()
            self.central_layout.setContentsMargins(0, 0, 0, 0)
            self.central_layout.setSpacing(0)
            self.group_box.setLayout(self.central_layout)
            
            self.ct_layout = QGridLayout()
            self.ct_layout.setContentsMargins(0, 10, 0, 5)
            self.ct_layout.setSpacing(0)
            self.row_height=self.layout_height/8
            #self.ct_layout.addWidget(HorizontalLine(self), 0, 0, 1, 4)
            
            self.add_label_field("Transaction Type:", "txtTransactionType","N/A", 0, 0)
            self.add_label_field("Tag Status:", "txtTagId","N/A", 0, 2)
            
            self.add_label_field("Vehicle Class:", "txtVehicleClass","N/A", 1, 0)
            self.add_label_field("Overweight(₹):", "txtOverweight","0.00", 1, 2)
            
            self.add_label_field("Payment Type:", "txtPaymentType","N/A", 2, 0)
            self.add_label_field("Tag Penalty(₹):", "txtTagPenalty","0.00", 2, 2)
            
            self.add_label_field("Exempt Type:", "txtExemptType","N/A", 3, 0)
            self.add_label_field("Fare(₹):", "txtTollFare","0.00", 3, 2)

            self.add_label_field("Weight (kg):", "txtWimWeight","0", 4, 0)
            self.add_label_field("Amount Paid(₹):", "txtTotalAmount","0.00", 4, 2)

            lblReceipt=QLabel("Receipt Number:")
            lblReceipt.setStyleSheet("color: white;border: none;")
            self.txtReceipt=QLineEdit()
            self.txtReceipt.setPlaceholderText("Receipt Number")
            self.txtReceipt.setStyleSheet("border: none;background-color: white;")
            
            lblVRN=QLabel("Plate Number:")
            lblVRN.setStyleSheet("color: white;border: none;")
            self.txtVRN=QLineEdit()
            self.txtVRN.setPlaceholderText("Plate Number")
            self.txtVRN.setStyleSheet("background-color: white;")

            self.rblS = QRadioButton("Single")
            self.rblR = QRadioButton("Retrun")
            self.rblS.setStyleSheet("color: white;border: none;")
            self.rblR.setStyleSheet("color: white;border: none;")
            self.rblS.setFixedHeight(int(self.row_height))
            self.rblR.setFixedHeight(int(self.row_height))
            self.rblS.toggled.connect(self.on_jureny_change)
            self.rblR.toggled.connect(self.on_jureny_change)

            lblJourneyType=QLabel("Journey Type:")
            lblJourneyType.setStyleSheet("color: white;border: none;")

            self.ct_layout.addWidget(lblJourneyType, 5, 0)
            self.ct_layout.addWidget(self.rblS, 5, 1)
            self.ct_layout.addWidget(self.rblR, 5, 2)
            self.ct_layout.setRowMinimumHeight(5, int(self.row_height))

            self.ct_layout.addWidget(lblReceipt, 6, 0)
            self.ct_layout.addWidget(self.txtReceipt, 6, 1,1,2)
            self.ct_layout.setRowMinimumHeight(6, int(self.row_height))
            
            self.ct_layout.addWidget(lblVRN, 7, 0)
            self.ct_layout.addWidget(self.txtVRN, 7, 1,1,2)
            self.ct_layout.setRowMinimumHeight(7, int(self.row_height))

            lblRemark=QLabel("TC Remark:")
            lblRemark.setStyleSheet("color: white;border: none;")
            self.txtRemark=QLineEdit()
            self.txtRemark.setPlaceholderText("Remark")
            self.txtRemark.setStyleSheet("background-color: white;")

            self.ct_layout.addWidget(lblRemark, 8, 0)
            self.ct_layout.addWidget(self.txtRemark, 8, 1,1,2)
            self.ct_layout.setRowMinimumHeight(8, int(self.row_height))
            

            colWidth=self.layout_width-40
            self.ct_layout.setColumnMinimumWidth(0, 20)
            self.ct_layout.setColumnMinimumWidth(1, int(colWidth/2))
            self.ct_layout.setColumnMinimumWidth(2, 20)
            self.ct_layout.setColumnMinimumWidth(3, int(colWidth/2))

            button_layout = QHBoxLayout()
            button_layout.setContentsMargins(0, 5, 0, 5)
            self.btnReset = QPushButton("Reset")
            self.btnSubmit = QPushButton("Submit")
            self.btnReset.setStyleSheet("background-color: red; font-weight: bold;border: none;border-right: 1px solid black;")
            self.btnSubmit.setStyleSheet("background-color: green; font-weight: bold;border: none;")
            self.btnReset.setFixedHeight(30)
            self.btnSubmit.setFixedHeight(30)
            button_layout.addWidget(self.btnReset)
            button_layout.addWidget(self.btnSubmit)

            self.central_layout.addLayout(self.ct_layout)
            self.central_layout.addLayout(button_layout)
            main_layout.addWidget(self.group_box)

            self.message_window.connect(self.message_window_display)
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox __init__: {e}")

    def add_label_field(self, label_text, field_name,default, row_index, column_index, field_widget=None):
        try:
            label = QLabel(label_text)
            label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
            field = field_widget if field_widget else QLabel(default)
            self.ct_layout.addWidget(label, row_index, column_index)
            self.ct_layout.addWidget(field, row_index, column_index+1)

            label.setStyleSheet("color: white;border: none;")
            field.setStyleSheet("color: white;border: none;")
            self.ct_layout.setRowMinimumHeight(row_index, int(self.row_height))
        
            setattr(self, field_name, field)
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox add_label_field: {e}")

    def update_field(self, field_name, value):
        try:
            getattr(self, field_name).setText(str(value))
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_field: {e}")

    def update_wt(self, wt):
        try:
            wt_decimal = decimal.Decimal(str(wt))
            self.current_Transaction["ActualVehicleWeight"] = wt_decimal
            self.update_field("txtWimWeight", wt)
            self.get_toll_fare()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_wt: {e}")    

    def update_tt(self, item_id, item_name):
        try:
            self.current_Transaction["TransactionTypeId"] = item_id
            self.current_Transaction["TransactionTypeName"] = item_name
            self.update_field("txtTransactionType", item_name)
            self.rblS.setChecked(True)
            self.rblS.setEnabled(False)
            self.rblR.setEnabled(False)
            if item_id==2:
                self.rblS.setEnabled(True)
                self.rblR.setEnabled(True)
                self.get_toll_fare()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_tt: {e}")  

    def update_vc(self, item_id, item_name,item):
        try:
            self.update_field("txtVehicleClass", item_name)
            self.current_Transaction["VehicleClassId"] = item_id
            if item is not None:
                self.current_Transaction["VehicleClassId"] = item["SystemVehicleClassId"]
                self.current_Transaction["VehicleClassName"] = item["SystemVehicleClassName"]
                self.current_Transaction["PermissibleVehicleWeight"] = item["PermissibleWeight"]
            self.get_toll_fare()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_vc: {e}") 

    def update_svc(self, item_id, item_name,item):
        try:
            self.update_field("txtVehicleClass", item_name)
            self.current_Transaction["VehicleSubClassId"] = item_id
            self.current_Transaction["VehicleSubClassName"] = item_name
            if item is not None:
                self.current_Transaction["VehicleClassId"] = item["SystemVehicleClassId"]
                self.current_Transaction["VehicleClassName"] = item["SystemVehicleClassName"]
                self.current_Transaction["PermissibleVehicleWeight"] = item["PermissibleWeight"]
            self.get_toll_fare()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_svc: {e}") 

    def update_et(self, item_id, item_name):
        try:
            self.current_Transaction["ExemptTypeId"] = item_id
            self.update_field("txtExemptType", item_name)
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_et: {e}") 

    def update_pt(self, item_id, item_name):
        try:
            self.current_Transaction["PaymentTypeId"] = item_id
            self.current_Transaction["PaymentTypeName"] = item_name
            self.update_field("txtPaymentType", item_name)
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_pt: {e}") 

    def update_tf(self, json_data):
        try:
            if json_data is not None and len(json_data)>0:
                self.toll_fare = json_data
            else:
                self.logger.logError(f"No toll fare found in update_tf")
                show_custom_message_box("Toll Fare","No toll fare found","inf")
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_tf: {e}") 

    def update_printer(self, json_data):
        if json_data is not None and len(json_data)>0:
            self.PrinterDetail = json_data
        else:
            self.PrinterDetail=None
            self.logger.logError(f"No printer detail found in update_printer")
            self.message_window.emit('printer Detail,No printer detail found,inf')
        try:
            self.printer=TollReceiptPrinter(self.project_config_data,self.PrinterDetail)
        except Exception as e:
            self.printer=None
            raise e
        
    def get_toll_fare(self):
        try:
            filtered_data = None
            if self.toll_fare is not None:
                if int(self.current_Transaction["TransactionTypeId"]) > 0 and len(self.toll_fare) > 0 and (int(self.current_Transaction["VehicleClassId"]) > 0 or int(self.current_Transaction["VehicleSubClassId"]) > 0):
                    if int(self.current_Transaction["VehicleClassId"]) > 0:
                        filtered_data = list(filter(
                            lambda item: int(item['SystemVehicleClassId']) == int(self.current_Transaction["VehicleClassId"]), self.toll_fare))
                    elif int(self.current_Transaction["VehicleSubClassId"]) > 0:
                        filtered_data = list(filter(
                            lambda item: int(item['SubVehicleClassId']) == int(self.current_Transaction["VehicleSubClassId"]), self.toll_fare))
                    if filtered_data is not None and len(filtered_data) > 0:
                        self.calulate_fare(filtered_data[0])
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox get_toll_fare: {e}") 

    def calulate_fare(self, filtered_data):
        try:
            if int(self.current_Transaction["TransactionTypeId"])==1:
                self.update_field("txtTollFare", str(filtered_data['TollFare']))
                self.update_field("txtTagPenalty", "0.00")
                self.update_field("txtOverweight", "0.00")
                self.current_Transaction["TransactionAmount"]=filtered_data['TollFare']
                if int(self.current_Transaction["ActualVehicleWeight"])>int(self.current_Transaction["PermissibleVehicleWeight"]):
                    self.update_field("txtOverweight", str(filtered_data['OverweightPenalty']))
                    self.current_Transaction["OverWeightAmount"]=filtered_data['OverweightPenalty']
            elif self.current_Transaction["TransactionTypeId"]==2:
                self.update_field("txtTagPenalty", str(filtered_data['FasTagPenalty']))
                if self.current_Transaction["IsReturnJourney"]==True:
                    self.current_Transaction["TransactionAmount"]=filtered_data['TollFare']+filtered_data['ReturnFare']
                else:
                    self.current_Transaction["TransactionAmount"]=filtered_data['TollFare']
                
                self.update_field("txtTollFare", str(self.current_Transaction["TransactionAmount"]))
                self.current_Transaction["TagPenaltyAmount"]=filtered_data['FasTagPenalty']
                
                if int(self.current_Transaction["ActualVehicleWeight"])>int(self.current_Transaction["PermissibleVehicleWeight"]):
                    self.update_field("txtOverweight", str(filtered_data['OverweightPenalty']))
                    self.current_Transaction["OverWeightAmount"]=filtered_data['OverweightPenalty']
            elif self.current_Transaction["TransactionTypeId"]==3:
                self.update_field("txtTollFare", "0.00")
                self.update_field("txtTagPenalty", "0.00")
                self.current_Transaction["TransactionAmount"]=0.00
                self.current_Transaction["TagPenaltyAmount"]=0.00
                self.update_field("txtOverweight", "0.00")
                self.current_Transaction["OverWeightAmount"]=0.00
            elif self.current_Transaction["TransactionTypeId"]==4:
                self.update_field("txtTollFare", "0.00")
                self.update_field("txtTagPenalty", "0.00")
                self.current_Transaction["TransactionAmount"]=0.00
                self.current_Transaction["TagPenaltyAmount"]=0.00
                self.update_field("txtOverweight", "0.00")
                self.current_Transaction["OverWeightAmount"]=0.00
            else:
                self.update_field("txtTollFare", "0.00")
                self.update_field("txtTagPenalty", "0.00")
                self.current_Transaction["TransactionAmount"]=0.00
                self.current_Transaction["TagPenaltyAmount"]=0.00
                self.update_field("txtOverweight", "0.00")
                self.current_Transaction["OverWeightAmount"]=0.00
            total=self.current_Transaction["TransactionAmount"]+self.current_Transaction["TagPenaltyAmount"]+self.current_Transaction["OverWeightAmount"]
            self.update_field("txtTotalAmount", str(total))
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox calulate_fare: {e}") 

    def update_ss(self, json_data,user_Details,LaneDetail,default_directory):
        try:
            project_config_path=os.path.join(default_directory, 'MasterConfig', 'ProjectConfiguration.json')
            self.project_config_data = Utilities.read_json_file(project_config_path)    
            self.systemSettingDetails=json_data
            self.user_Details=user_Details
            self.LaneDetail=LaneDetail
            self.on_reset()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_ss: {e}")

    def update_shift(self, json_data):    
        try:
            self.current_shift=json_data
            self.current_Transaction["ShiftId"] = self.current_shift["ShiftId"]
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox update_ss: {e}")
    
    def on_jureny_change(self):
        try:
            sender = self.sender()
            if sender.isChecked():
                if sender.text()=="Retrun":
                    self.current_Transaction["IsReturnJourney"]=True
                else:
                    self.current_Transaction["IsReturnJourney"]=False
            self.get_toll_fare()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox on_jureny_change: {e}")
    
    def on_print(self,current_Transaction):
        try:
            if self.printer is not None:
                self.printer.generate_receipt(current_Transaction)
        except Exception as e:
            raise e
        
    def on_reset(self):
        try:
            self.btnSubmit.setEnabled(True)
            self.current_trans()
            self.update_field("txtTransactionType", "N/A")
            self.update_field("txtVehicleClass", "N/A")
            self.update_field("txtPaymentType", "N/A")
            self.update_field("txtExemptType", "N/A")
            self.update_field("txtReceipt", "")
            self.update_field("txtRemark", "")
            self.update_field("txtTagId", "N/A")
            self.update_field("txtVRN", "")
            self.update_field("txtWimWeight", "0.000")
            self.update_field("txtTollFare", "0.00")
            self.update_field("txtOverweight", "0.00")
            self.update_field("txtTagPenalty", "0.00")
            self.update_field("txtTotalAmount", "0.00")
            self.rblS.setChecked(True)
            self.rblS.setEnabled(False)
            self.rblR.setEnabled(False)
            self.current_trans()
            if self.LaneDetail is not None:
                self.setDefaultValue()
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox on_reset: {e}")
    
    def current_trans(self):
        try:
            current_date_time=datetime.now()
            self.current_Transaction = {
                "LaneTransactionId": "0",
                "SystemIntegratorId": 0,
                "JourneyId": 0,
                "PlazaId": self.systemSettingDetails["DefaultPlazaId"],
                "LaneId": 0,
                "LaneStatusId": True,
                "LaneModeId": True,
                "LaneDirectionId":0,
                "ShiftId": 0,
                "TransactionTypeId": 0,
                "PaymentTypeId": 0,
                "ExemptTypeId": 0,
                "ExemptSubTypeId": 0,
                "VehicleClassId": 0,
                "VehicleSubClassId": 0,
                "VehicleAvcClassId": 0,
                "PlateNumber": "",
                "RCTNumber": "",
                "TagEPC": "",
                "TagClassId": 0,
                "TagPlateNumber": "",
                "TagReadDateTime": Utilities.current_date_time_json(),
                "TagReadCount": 0,
                "IsReadByReader": False,
                "PermissibleVehicleWeight": 0.00,
                "ActualVehicleWeight": 0.00,
                "IsVehicleOverWeight": False,
                "IsOverWeightCharged": False,
                "OverWeightAmount": 0.00,
                "TagPenaltyAmount": 0.00,
                "TransactionAmount": 0.00,
                "TransactionDateTime": Utilities.current_date_time_json(),
                "TransactionFrontImage": "",
                "TransactionBackImage": "",
                "TransactionAvcImage": "",
                "TransactionVideo": "",
                "ExemptionProofImage": "",
                "DestinationPlazaId": 0,
                "UserId": self.user_Details["UserId"],
                "LoginId": self.user_Details["LoginId"],
                "IsReturnJourney": False,
                "IsExcessJourney": False,
                "IsBarrierAutoClose": True,
                "IsTowVehicle": False,
                "IsFleetTranscation": False,
                "FleetCount": 0,
                "TCRemark": "",
                "PlazaName": "",
                "LaneName":"",
                "TransactionTypeName": "",
                "PaymentTypeName": "",
                "ExemptTypeName":"",
                "ExemptSubTypeName":"",
                "VehicleClassName": "",
                "VehicleSubClassName": "",
                "TagClassName": "",
                "SystemDateTime":current_date_time.isoformat()
            }
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox current_trans: {e}")

    def setDefaultValue(self):
        try:
            self.current_Transaction["LaneId"] = self.LaneDetail["LaneId"]
            self.current_Transaction["LaneName"] = self.LaneDetail["LaneName"]
            self.current_Transaction["PlazaName"] = self.LaneDetail["PlazaName"]
            self.current_Transaction["LaneStatusId"] = self.LaneDetail["LaneStatusId"]
            self.current_Transaction["LaneModeId"] = self.LaneDetail["LaneModeId"]
            self.current_Transaction["SystemIntegratorId"] = self.LaneDetail["SystemIntegratorId"]
            self.current_Transaction["LaneDirectionId"] = self.LaneDetail["LaneDirectionId"]
            if self.current_shift is not None:
                self.current_Transaction["ShiftId"] = self.current_shift["ShiftId"]
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox setDefaultValue: {e}")
    
    def message_window_display(self,msg):
        try:
            msg=msg.split(',')
            show_custom_message_box(msg[0], msg[1], msg[2])
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox message_window_display: {e}")

    def create_fasTag_trans(self,transData,IsReadByReader,TagStatus,FasTagClassName):
        try:
            self.current_trans()
            if self.LaneDetail is not None:
                self.setDefaultValue()
                self.current_Transaction["TagEPC"]= transData["EPC"]
                self.current_Transaction["RCTNumber"]= transData["TID"]
                self.current_Transaction["TagClassId"]=  transData["Class"]
                self.current_Transaction["TagPlateNumber"]= transData["Plate"]
                self.current_Transaction["TagReadDateTime"]= transData["TransactionDateTime"]
                self.current_Transaction["TagReadCount"]=  0
                self.current_Transaction["IsReadByReader"]= IsReadByReader
                self.current_Transaction["TransactionTypeId"]= 1
                self.current_Transaction["TransactionTypeName"]= "FasTag"
                self.current_Transaction["VehicleClassId"]= transData["Class"]
                self.current_Transaction["VehicleSubClassId"]= transData["Class"]
                self.current_Transaction["TagClassName"]= FasTagClassName
                self.update_field("txtTagId", TagStatus)
                self.txtReceipt.setText(transData["TID"])
        except Exception as e:
            self.logger.logError(f"Error in CurrentTransactionBox create_fasTag_trans: {e}")