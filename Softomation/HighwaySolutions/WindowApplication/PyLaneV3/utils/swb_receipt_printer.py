from __future__ import unicode_literals
from escpos.printer import Serial,Usb
import platform

class SwbReceiptPrinter:
    def __init__(self,project_config_data,printer_detail):
        self.project_config_data = project_config_data
        self.printer_detail=printer_detail
        self.printer_setup()

    def printer_setup(self):
        try:
            if self.printer_detail:
                if self.printer_detail is not None and self.printer_detail["ProtocolTypeId"]==3:
                    if platform.system()=='Linux':
                        comport=self.printer_detail["IpAddress"].replace("COM", "/dev/ttyS")
                    else:
                        comport=self.printer_detail["IpAddress"]
                    self.p=Serial(devfile=comport,baudrate=self.printer_detail["PortNumber"])
                elif self.printer_detail is not None and self.printer_detail["ProtocolTypeId"]==9:
                    d=self.printer_detail["UrlAddress"]
                    vendor_id = 0x154f
                    product_id = 0x154f
                    self.p = Usb(vendor_id,product_id)
                else:
                    #0x154f,0x154f
                    #vendor_id=0x0fe6, product_id=0x811e  Rugtek model RP80
                    d=self.printer_detail["UrlAddress"]
                    rc=d.split(',')
                    hex_values = [int(value, 16) for value in rc]
                    self.p = Usb(*hex_values)
                    #self.p = Usb(rc[0],rc[1])
            else:
                vendor_id = 0x154f
                product_id = 0x154f
                self.p = Usb(vendor_id,product_id)
            self.set_default()
        except Exception as e:
            raise e
        
    def set_left(self):
        self.p.set(align="left")

    def set_default(self):
        self.p.set(align='center')

    def generate_receipt(self,printData):
        try:
            self.set_default()
            self.p.text(f"{self.project_config_data['Authority']}\n")
            self.p.text(f"{self.project_config_data['ProjectName']}\n")
            self.p.text(f"{printData['PlazaName']}\n")
            self.p.text("----------------------------------------\n")
            self.set_left()
            self.p.text(f"Date         : {printData['TransactionDateTime']}\n")
            self.p.text(f"Plaza        : {printData['PlazaName']}\n")
            self.p.text(f"Lane         : {printData['LaneName']}\n")
            self.p.text(f"TC ID        : {printData['LoginId']}\n")
            self.p.text(f"Plate Number : {printData['PlateNumber']}\n")
            if printData["VehicleClassName"]=="":
                self.p.text(f"Class        : {printData['VehicleSubClassName']}\n")
            else:
                self.p.text(f"Class        : {printData['VehicleClassName']}\n")
            self.p.text(f"Trans. No.   : {printData['RCTNumber']}\n")
            self.p.text(f"Payment Mode : {printData['PaymentTypeName']}\n")
            self.p.text(f"Overload     : Rs. {printData['OverWeightAmount']}/-\n")
            self.p.text(f"Allow Weight : kg. {printData['PermissibleVehicleWeight']}\n")
            self.p.text(f"Actual Weight: kg. {printData['ActualVehicleWeight']}\n")
            self.p.text("--------------------------------------------\n")
            #barcode_data = str(printData["RCTNumber"])
            #self.p.barcode(barcode_data, "CODE39", 60, 2, function_type="A")
            self.set_default()
            self.p.cut()
        except Exception as e:
            raise e