from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QPushButton, QWidget, QGridLayout, QLineEdit, QHBoxLayout,QRadioButton
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
        self.layout_height = height - 60
        self.layout_width = width
        self.toll_fare=None
        self.LaneDetail=None
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setStyleSheet("QFrame{border: none;border-bottom: 1px solid white;border-right: 1px solid white;}"
                           "QLabel{color: white;}"
                           "QPushButton{font-weight: bold;border: none;}"
                           "QPushButton#btnReset{background-color: red; border-right: 1px solid black;}"
                           "QPushButton#btnSubmit{background-color: green;}")

        self.setFixedWidth(width)
        self.setFixedHeight(height)

        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Current Transaction</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setStyleSheet("color: white;border: none;")
        box_heading.setFixedHeight(30)
        box_layout.addWidget(
            box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)

        self.ct_layout = QGridLayout()
        self.ct_layout.setContentsMargins(0, 5, 0, 5)
        self.ct_layout.setSpacing(0)
        self.row_height=self.layout_height/7
        
        # self.line = QFrame()
        # self.line.setFrameShape(QFrame.HLine)
        # self.line.setFrameShadow(QFrame.Sunken)
        
        self.ct_layout.addWidget(HorizontalLine(self), 0, 0, 1, 4)
        
        self.add_label_field("Transaction Type:", "txtTransactionType","N/A", 1, 0)
        self.add_label_field("Tag Status:", "txtTagId","N/A", 1, 2)
        
        self.ct_layout.addWidget(HorizontalLine(self), 2, 0, 1, 4)

        self.add_label_field("Vehicle Class:", "txtVehicleClass","N/A", 3, 0)
        self.add_label_field("Overweight(₹):", "txtOverweight","0.00", 3, 2)
        
        self.ct_layout.addWidget(HorizontalLine(self), 4, 0, 1, 4)

        self.add_label_field("Payment Type:", "txtPaymentType","N/A", 5, 0)
        self.add_label_field("Tag Penalty(₹):", "txtTagPenalty","0.00", 5, 2)
        
        self.ct_layout.addWidget(HorizontalLine(self), 6, 0, 1, 4)

        self.add_label_field("Exempt Type:", "txtExemptType","N/A", 7, 0)
        self.add_label_field("Fare(₹):", "txtTollFare","0.00", 7, 2)

        self.ct_layout.addWidget(HorizontalLine(self), 8, 0, 1, 4)

        self.add_label_field("Weight (kg):", "txtWimWeight","0", 9, 0)
        self.add_label_field("Amount Paid(₹):", "txtTotalAmount","0.00", 9, 2)
        
        self.ct_layout.addWidget(HorizontalLine(self), 10, 0, 1, 4)
        
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

        self.ct_layout.addWidget(lblJourneyType, 11, 0)
        self.ct_layout.addWidget(self.rblS, 11, 1)
        self.ct_layout.addWidget(self.rblR, 11, 2)
        
        self.ct_layout.setRowMinimumHeight(11, int(self.row_height))
        self.ct_layout.addWidget(HorizontalLine(self), 12, 0, 1, 4)


        self.ct_layout.addWidget(lblReceipt, 13, 0)
        self.ct_layout.addWidget(self.txtReceipt, 13, 1)
        self.ct_layout.addWidget(lblVRN, 13, 2)
        self.ct_layout.addWidget(self.txtVRN, 13, 3)
        self.ct_layout.setRowMinimumHeight(13, int(self.row_height))
        self.ct_layout.addWidget(HorizontalLine(self), 14, 0, 1, 4)
        
        colWidth=self.layout_width-40
        self.ct_layout.setColumnMinimumWidth(0, 20)
        self.ct_layout.setColumnMinimumWidth(1, int(colWidth/2))
        self.ct_layout.setColumnMinimumWidth(2, 20)
        self.ct_layout.setColumnMinimumWidth(3, int(colWidth/2))

        self.ct_widget = QWidget()
        self.ct_widget.setLayout(self.ct_layout)
        self.ct_widget.setStyleSheet("border: none;border-top: 1px solid white;")
        self.ct_widget.setFixedHeight(self.layout_height)
        box_layout.addWidget(self.ct_widget)

        button_layout = QHBoxLayout()
        button_layout.setContentsMargins(0, 0, 0, 0)
        self.btnReset = QPushButton("Reset")
        self.btnSubmit = QPushButton("Submit")
        self.btnReset.setStyleSheet("background-color: red; font-weight: bold;border: none;border-right: 1px solid black;")
        self.btnSubmit.setStyleSheet("background-color: green; font-weight: bold;border: none;")
        self.btnReset.setFixedHeight(30)
        self.btnSubmit.setFixedHeight(30)
        button_layout.addWidget(self.btnReset)
        button_layout.addWidget(self.btnSubmit)
        box_layout.addLayout(button_layout)
        self.message_window.connect(self.message_window_display)

    def add_label_field(self, label_text, field_name,default, row_index, column_index, field_widget=None):
        label = QLabel(label_text)
        #if column_index == 0:
        label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        #else:
            #label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
        field = field_widget if field_widget else QLabel(default)
        self.ct_layout.addWidget(label, row_index, column_index)
        self.ct_layout.addWidget(field, row_index, column_index+1)

        label.setStyleSheet("color: white;border: none;")
        field.setStyleSheet("color: white;border: none;")
        self.ct_layout.setRowMinimumHeight(row_index, int(self.row_height))
       
        setattr(self, field_name, field)

    def update_field(self, field_name, value):
        getattr(self, field_name).setText(value)

    def update_tt(self, item_id, item_name):
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

    def update_vc(self, item_id, item_name,item):
        self.update_field("txtVehicleClass", item_name)
        self.current_Transaction["VehicleClassId"] = item_id
        if item is not None:
            self.current_Transaction["VehicleClassId"] = item["FasTagSystemVehicleClassId"]
            self.current_Transaction["VehicleClassName"] = item["SystemVehicleClassName"]
            self.current_Transaction["PermissibleVehicleWeight"] = item["PermissibleWeight"]
        self.get_toll_fare()

    def update_svc(self, item_id, item_name,item):
        self.update_field("txtVehicleClass", item_name)
        self.current_Transaction["VehicleSubClassId"] = item_id
        self.current_Transaction["VehicleSubClassName"] = item_name
        if item is not None:
            self.current_Transaction["VehicleClassId"] = item["FasTagSystemVehicleClassId"]
            self.current_Transaction["VehicleClassName"] = item["SystemVehicleClassName"]
            self.current_Transaction["PermissibleVehicleWeight"] = item["PermissibleWeight"]
        self.get_toll_fare()

    def update_et(self, item_id, item_name):
        self.current_Transaction["ExemptTypeId"] = item_id
        self.update_field("txtExemptType", item_name)

    def update_pt(self, item_id, item_name):
        self.current_Transaction["PaymentTypeId"] = item_id
        self.current_Transaction["PaymentTypeName"] = item_name
        self.update_field("txtPaymentType", item_name)

    def update_tf(self, json_data):
        if json_data is not None and len(json_data)>0:
            self.toll_fare = json_data
        else:
            self.logger.logError(f"No toll fare found in update_tf")
            show_custom_message_box("Toll Fare","No toll fare found","inf")

    def update_printer(self, json_data):
        if json_data is not None and len(json_data)>0:
            self.PrinterDetail = json_data
           
        else:
            self.PrinterDetail=None
            self.logger.logError(f"No printer detail found in update_printer")
            self.message_window.emit('printer Detail,No printer detail found,inf')

        try:
            self.printer=TollReceiptPrinter(self.project_config_data,self.config_manager,self.PrinterDetail)
        except Exception as e:
            self.printer=None
            self.logger.logError(f"Error in printer: {e}")
        

    def update_ld(self, json_data):
        if json_data is not None and len(json_data)>0:
            self.LaneDetail = json_data
            self.current_Transaction["LaneId"] = self.LaneDetail["LaneId"]
            self.current_Transaction["LaneName"] = self.LaneDetail["LaneName"]
            self.current_Transaction["PlazaName"] = self.LaneDetail["PlazaName"]
            self.current_Transaction["LaneStatusId"] = self.LaneDetail["LaneStatusId"]
            self.current_Transaction["LaneModeId"] = self.LaneDetail["LaneModeId"]
            self.current_Transaction["SystemIntegratorId"] = self.LaneDetail["SystemIntegratorId"]
            self.current_Transaction["LaneDirectionId"] = self.LaneDetail["LaneDirectionId"]
        else:
            self.logger.logError(f"No lane detail found in update_ld")
            self.message_window.emit('Lane Detail,No lane detail found,inf')
            #show_custom_message_box("Lane Detail", "No lane detail found", "inf")

    def get_toll_fare(self):
        filtered_data = None
        if self.toll_fare is not None:
            if self.current_Transaction["TransactionTypeId"] > 0 and len(self.toll_fare) > 0 and (self.current_Transaction["VehicleClassId"] > 0 or self.current_Transaction["VehicleSubClassId"] > 0):
                if self.current_Transaction["VehicleClassId"] > 0:
                    filtered_data = list(filter(
                        lambda item: item['SystemVehicleClassId'] == self.current_Transaction["VehicleClassId"], self.toll_fare))
                elif self.current_Transaction["VehicleSubClassId"] > 0:
                    filtered_data = list(filter(
                        lambda item: item['SubVehicleClassId'] == self.current_Transaction["VehicleSubClassId"], self.toll_fare))
                if filtered_data is not None and len(filtered_data) > 0:
                    self.calulate_fare(filtered_data[0])

    def calulate_fare(self, filtered_data):
        if self.current_Transaction["TransactionTypeId"]==1:
            self.update_field("txtTollFare", str(filtered_data['TollFare']))
            self.update_field("txtTagPenalty", "0.00")
            self.update_field("txtOverweight", "0.00")
            self.current_Transaction["TransactionAmount"]=filtered_data['TollFare']
            if self.current_Transaction["ActualVehicleWeight"]>self.current_Transaction["PermissibleVehicleWeight"]:
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
            
            if self.current_Transaction["ActualVehicleWeight"]>self.current_Transaction["PermissibleVehicleWeight"]:
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

    def update_ss(self, json_data,user_Details,project_config_data,config_manager):    
        self.systemSettingDetails=json_data
        self.user_Details=user_Details
        self.project_config_data=project_config_data
        self.config_manager=config_manager
        self.on_reset()

    def update_shift(self, json_data):    
        self.current_shift=json_data
        self.current_Transaction["ShiftId"] = self.current_shift["ShiftId"]
    
    def on_jureny_change(self):
        sender = self.sender()
        if sender.isChecked():
            if sender.text()=="Retrun":
                self.current_Transaction["IsReturnJourney"]=True
            else:
                self.current_Transaction["IsReturnJourney"]=False
        self.get_toll_fare()
    
    def on_print(self):
        try:
            self.printer.generate_receipt(self.current_Transaction)
        except Exception as e:
            raise e
        # finally:
        #     self.on_reset()
        
    def on_reset(self):
        self.current_trans()
        self.update_field("txtTransactionType", "N/A")
        self.update_field("txtVehicleClass", "N/A")
        self.update_field("txtPaymentType", "N/A")
        self.update_field("txtExemptType", "N/A")
        self.update_field("txtReceipt", "")
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
    
    def current_trans(self):
        self.current_Transaction = {
            "LaneTransactionId": 0,
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
            "PlazaName": "",
            "LaneName":"",
            "TransactionTypeName": "",
            "PaymentTypeName": "",
            "ExemptTypeName":"",
            "ExemptSubTypeName":"",
            "VehicleClassName": "",
            "VehicleSubClassName": "",
        }

    def setDefaultValue(self):
        self.current_Transaction["LaneId"] = self.LaneDetail["LaneId"]
        self.current_Transaction["LaneName"] = self.LaneDetail["LaneName"]
        self.current_Transaction["PlazaName"] = self.LaneDetail["PlazaName"]
        self.current_Transaction["LaneStatusId"] = self.LaneDetail["LaneStatusId"]
        self.current_Transaction["LaneModeId"] = self.LaneDetail["LaneModeId"]
        self.current_Transaction["SystemIntegratorId"] = self.LaneDetail["SystemIntegratorId"]
        self.current_Transaction["LaneDirectionId"] = self.LaneDetail["LaneDirectionId"]
        self.current_Transaction["ShiftId"] = self.current_shift["ShiftId"]
        

    
    def message_window_display(self,msg):
        msg=msg.split(',')
        show_custom_message_box(msg[0], msg[1], msg[2])
