from __future__ import unicode_literals
from escpos import *

class TollReceiptPrinter:
    def __init__(self,project_config_data,config_manager):
        self.config_manager = config_manager
        self.project_config_data = project_config_data
        self.printer_setup()

    def printer_setup(self):
        try:
            self.p = printer.Usb(self.config_manager.get_setting('Settings', 'vendor_id'), self.config_manager.get_setting('Settings', 'product_id'))
            self.set_default()
        except Exception as e:
            raise e
        
    def set_left(self):
        self.p.set(align="left")

    def set_default(self):
        self.p.set(align='center')

    def generate_receipt(self,prinDate):
        try:
            self.set_default()
            self.p.text(f"{self.project_config_data['Authority']}\n")
            self.p.text(f"{self.project_config_data['ProjectName']}\n")
            self.p.text(f"{self.project_config_data['self.ControlRoomName']}\n")
            self.p.text("----------------------------------------\n")
            self.set_left()
            self.p.text(f"Date         : {prinDate['TransactionDateTime']}\n")
            self.p.text(f"Plaza        : {self.PlazaName}\n")
            self.p.text(f"Lane         : {self.LaneName}\n")
            self.p.text(f"TC ID        : {self.LoginId}\n")
            if self.current_Transaction["VehicleClassName"]=="":
                self.p.text(f"Class        : {self.current_Transaction['VehicleSubClassName']}\n")
            else:
                self.p.text(f"Class        : {self.current_Transaction['VehicleClassName']}\n")
            self.p.text(f"Trans. No.   : {prinDate['RCTNumber']}\n")
            if self.current_Transaction["IsReturnJourney"]==True:
                self.p.text(f"Journey Type : Retrun\n")
            else:
                self.p.text(f"Journey Type : Single\n")
            self.p.text(f"Payment Mode : {prinDate['PaymentTypeName']}\n")
            self.p.text(f"Toll Fare    : ₹ {prinDate['TransactionAmount']}/-\n")
            self.p.text(f"Penalty      : ₹ {prinDate['TagPenaltyAmount']}/-\n")
            self.p.text(f"Overload     : ₹ {prinDate['OverWeightAmount']}/-\n")
            total_fare = prinDate["TransactionAmount"] + prinDate["TagPenaltyAmount"] + prinDate["OverWeightAmount"]
            self.p.text(f"Total Fare   : ₹ {total_fare}/-\n")

            self.p.text("--------------------------------------------\n")

            barcode_data = str(prinDate["RCTNumber"])
            self.p.barcode(barcode_data, "EAN13", 60, 5, "")
            self.set_default()
            self.p.cut()
        except Exception as e:
            raise e