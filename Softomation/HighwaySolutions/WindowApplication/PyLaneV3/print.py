from __future__ import unicode_literals
import datetime
from escpos import printer

class TollReceiptPrinter:
    def __init__(self, vendor_id=0x154f, product_id=0x154f, header1="", header2="", header3=""):
        self.p = printer.Usb(vendor_id, product_id)
        self.header1 = header1
        self.header2 = header2
        self.header3 = header3
        self.set_default()

    def set_left(self):  
        self.p.set(align="left")

    def set_default(self):
        self.p.set(align='center') 

    def generate_receipt(self, 
                          ref_no,
                         date, toll_plaza, lane, collector, vehicle_class, transaction_no, 
                         journey_type, payment_mode, toll_fare, penalty=0, overload=0):

        self.set_default()
        self.p.text(f"{self.header1}\n")
        self.p.text(f"{self.header2}\n")
        self.p.text(f"{self.header3}\n")
        self.p.text(f"{ref_no}\n")
        self.p.text("----------------------------------------\n")
        self.set_left()
        self.p.text(f"Date         : {date}\n")
        self.p.text(f"Plaza        : {toll_plaza}\n")
        self.p.text(f"Lane         : {lane}\n")
        self.p.text(f"TC ID        : {collector}\n")
        self.p.text(f"Class        : {vehicle_class}\n")
        self.p.text(f"Trans. No.   : {transaction_no}\n")
        self.p.text(f"Journey Type : {journey_type}\n")
        self.p.text(f"Payment Mode : {payment_mode}\n")
        self.p.text(f"Toll Fare    : Rs. {toll_fare}/-\n")
        self.p.text(f"Penalty      : Rs. {penalty}/-\n")
        self.p.text(f"Overload     : Rs. {overload}/-\n")
        total_fare = toll_fare + penalty + overload
        self.p.text(f"Total Fare   : Rs. {total_fare}/-\n")

        self.p.text("--------------------------------------------\n")

        barcode_data = str(transaction_no)  
        self.p.barcode(barcode_data, "EAN13", 60, 5, "")
        #self.p.text("221292#221292#221292\n")
        self.set_default()
        self.p.cut()

if __name__ == "__main__":
    printer = TollReceiptPrinter(header1="National Highways Authority of India",
        header2="ABC Expressway",
        header3="XYZ TOLL RECEIPT")
    


    printer.generate_receipt(
        
        ref_no=f"PSP.2000/CR-106(II)/Road-8 dt.{datetime.datetime.now().date()}",
        date=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        toll_plaza="XYZ TOLL PLAZA", 
        lane="E10", 
        collector="022898", 
        vehicle_class="CAR", 
        transaction_no="180520012100",
        journey_type="Single", 
        payment_mode="CASH", 
        toll_fare=2300,
        penalty=25000000,
        overload=25000
    )