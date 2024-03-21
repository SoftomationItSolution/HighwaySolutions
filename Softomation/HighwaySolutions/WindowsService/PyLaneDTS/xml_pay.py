import xml.etree.ElementTree as ET

class NpciReqPay:
    def __init__(self):
        self.root = ET.Element("etc:ReqPay", attrib={"xmlns:etc": "http://npci.org/etc/schema/"})
        

    def add_transaction(self, txn_id, note, org_txn_id, ref_id, ref_url, txn_ts, txn_type):
        self.txn_ts=txn_ts
        self.head = ET.SubElement(self.root, "Head", msgId=txn_id, orgId="IRBL", ts=txn_ts, ver="1.0")
        self.meta = ET.SubElement(self.root, "Meta")
        self.meta.text = " "
        txn = ET.SubElement(self.root, "Txn", id=txn_id, note=note, orgTxnId=org_txn_id, refId=ref_id, refUrl=ref_url, ts=txn_ts, type=txn_type)
        entry_txn = ET.SubElement(txn, "EntryTxn", id=txn_id, tsRead=txn_ts, ts=txn_ts, type=txn_type)

    def add_plaza(self, geo_code, plaza_id, name, subtype, plaza_type, direction, reader_id, status, mode, lane_type):
        self.plaza = ET.SubElement(self.root, "Plaza", geoCode=geo_code, id=plaza_id, name=name, subtype=subtype, type=plaza_type)
        entry_plaza = ET.SubElement(self.plaza, "EntryPlaza", geoCode=geo_code, id=plaza_id, name=name, subtype=subtype, type=plaza_type)
        lane = ET.SubElement(self.plaza, "Lane", direction=direction, id="a", readerId=reader_id, Status=status, Mode=mode, laneType=lane_type)
        self.add_entry_lane(direction, reader_id, status, mode, lane_type)

    def add_entry_lane(self, direction, reader_id, status, mode, lane_type):
        entry_lane = ET.SubElement(self.plaza, "EntryLane", direction=direction, id="a", readerId=reader_id, Status=status, Mode=mode, laneType=lane_type, EntryGate="", Floor="")

    def add_reader_verification_result(self):
        reader_verification_result = ET.SubElement(self.plaza, "ReaderVerificationResult", publicKeyCVV="", procRestrictionResult="", signAuth="NOT_VERIFIED", tagVerified="NETC TAG", ts=self.txn_ts, txnCounter="1234", txnStatus="SUCCESS", vehicleAuth="UNKNOWN")
        tag_user_memory = ET.SubElement(reader_verification_result, "TagUserMemory")
        detail1 = ET.SubElement(tag_user_memory, "Detail", name="TagSignature", value="")
        detail2 = ET.SubElement(tag_user_memory, "Detail", name="TagVRN", value="XXXXXXXXXXXX")
        detail3 = ET.SubElement(tag_user_memory, "Detail", name="TagVC", value="04")

    def add_vehicle(self, tid, tag_id, wim, static_weight, AVCValue,LPNumber):
        vehicle = ET.SubElement(self.root, "Vehicle", TID=tid, tagId=tag_id, wim=wim, staticweight=static_weight)
        vehicle_details = ET.SubElement(vehicle, "VehicleDetails")
        detail4 = ET.SubElement(vehicle_details, "Detail", name="AVC", value=AVCValue)
        detail5 = ET.SubElement(vehicle_details, "Detail", name="LPNumber", value=LPNumber)

    def add_payment(self, curr, value, price_mode, is_overweight_charged,overweight_value, payment_mode):
        payment = ET.SubElement(self.root, "Payment")
        amount = ET.SubElement(payment, "Amount", curr=curr, value=value, PriceMode=price_mode, IsOverWeightCharged=is_overweight_charged, PaymentMode=payment_mode)
        overweight_amount = ET.SubElement(amount, "OverwightAmount", curr=curr, value=overweight_value, PaymentMode=payment_mode)

    def add_signature(self):
        signature = ET.SubElement(self.root, "Signature")
        signature.text = " "


    def generate_xml(self, filename="example1.xml"):
        def indent(elem, level=0):
            indent_size = 4
            i = "\n" + level * " " * indent_size
            if len(elem):
                if not elem.text or not elem.text.strip():
                    elem.text = i + " " * indent_size
                if not elem.tail or not elem.tail.strip():
                    elem.tail = i
                for subelem in elem:
                    indent(subelem, level + 1)
                if not subelem.tail or not subelem.tail.strip():
                    subelem.tail = i
            else:
                if level and (not elem.tail or not elem.tail.strip()):
                    elem.tail = i

        tree = ET.ElementTree(self.root)
        indent(self.root)
        print(tree)
        tree.write(filename, encoding="utf-8", xml_declaration=True, method="xml")
        print(ET.tostring(self.root, encoding='utf-8').decode('utf-8'))


req_pay = NpciReqPay()
req_pay.add_transaction("0000000000000AB1002", "", "", "", "", "2016-08-10T12:25:00", "DEBIT/CREDIT/NON_FIN")
req_pay.add_plaza("11.00,11.00", "1234", "", "State", "Toll", "N", "12", "OPEN/CLOSE", "Maintenance/Normal", "Dedicated/Hybrid/Handheld")
req_pay.add_reader_verification_result()
req_pay.add_vehicle("34161FA82032D698020078E0", "34161FA82032D698020078E0", "", "","1001","MH04BY13")
req_pay.add_payment("INR", "100", "DISTANCE/POINT/CUSTOM", "TRUE/FALSE", "50","Tag/Cash/Card/QRCode/Other")
req_pay.add_signature()
req_pay.generate_xml()
