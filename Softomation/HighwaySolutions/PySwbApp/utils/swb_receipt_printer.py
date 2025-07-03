from __future__ import unicode_literals
from escpos.printer import Serial,Usb
import platform

class SwbReceiptPrinter:
    def __init__(self,project_config_data,plaza_config):
        self.project_config_data = project_config_data
        self.plaza_config=plaza_config
        self.printer_setup()

    def test_printer(slef):
        try:
            printer = Usb(0x154f, 0x1300)  # Your correct Vendor ID and Product ID
            printer.set(align='center')
            printer.text("USB printer test successful!\n")
            printer.cut()
        except Exception as e:
            print("Printer error:", e)

    def printer_setup(self):
        try:
            #self.test_printer()
            # if self.printer_detail:
            #     if self.printer_detail is not None and self.printer_detail["ProtocolTypeId"]==3:
            #         if platform.system()=='Linux':
            #             comport=self.printer_detail["IpAddress"].replace("COM", "/dev/ttyS")
            #         else:
            #             comport=self.printer_detail["IpAddress"]
            #         self.p=Serial(devfile=comport,baudrate=self.printer_detail["PortNumber"])
            #     elif self.printer_detail is not None and self.printer_detail["ProtocolTypeId"]==9:
            #         d=self.printer_detail["UrlAddress"]
            #         vendor_id = 0x154f
            #         product_id = 0x154f
            #         self.p = Usb(vendor_id,product_id)
            #     else:
            #         #0x154f,0x154f
            #         #vendor_id=0x0fe6, product_id=0x811e  Rugtek model RP80
            #         d=self.printer_detail["UrlAddress"]
            #         rc=d.split(',')
            #         hex_values = [int(value, 16) for value in rc]
            #         self.p = Usb(*hex_values)
            if self.plaza_config:
                if self.plaza_config["printer_type"]=='usb':
                    #vendor_id = hex(self.plaza_config["vendor_id"])
                    #product_id = hex(self.plaza_config["product_id"])
                    vendor_id = int(self.plaza_config["vendor_id"], 16)
                    product_id = int(self.plaza_config["product_id"], 16)
                    
                    
                    
                    #vendor_id = 0x154f
                    #product_id = 0x154f
                    self.p = Usb(vendor_id,product_id)
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
            self.p.text("----------------------------------------\n")
            self.set_left()
            self.p.text(f"Date         : {printData['TransactionDateTime']}\n")
            self.p.text(f"Plaza        : {printData['PlazaName']}\n")
            self.p.text(f"SWB          : {printData['SWBName']}\n")
            self.p.text(f"TC ID        : {printData['LoginId']}\n")
            self.p.text(f"Class        : {printData['VehicleClassName']}\n")
            self.p.text(f"Sub Class    : {printData['VehicleSubClassName']}\n")
            self.p.text(f"Trans. No.   : {printData['LaneTransactionId']}\n")
            self.p.text(f"Payment Mode : {printData['PaymentTypeName']}\n")
            self.p.text(f"Overload     : Rs. {printData['OverWeightAmount']}/-\n")
            self.p.text(f"Allow Weight : kg. {printData['PermissibleVehicleWeight']}\n")
            self.p.text(f"Actual Weight: kg. {printData['ActualVehicleWeight']}\n")
            self.p.text(f"Excess Weight: kg. {printData['ExcessWeight']}\n")
            self.p.text("--------------------------------------------\n")
            self.set_default()
            self.p.cut()
        except Exception as e:
            raise e