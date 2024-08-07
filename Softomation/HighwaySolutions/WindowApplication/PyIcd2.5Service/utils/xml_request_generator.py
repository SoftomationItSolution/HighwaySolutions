import xml.etree.ElementTree as ET
from datetime import datetime

class XMLRequestGenerator:
    #orgId: fixed value singe for each plaza
    #msgId:unique id that identify the request and response (Alphanumeric upto 35)
    #txn_type:CREDIT/DEBIT/NON_FIN
    #ts:transcation date time
    #tsRead:tag read date time
    #txn_id is unique Alphanumeric that is upto 22
    #lanestatus:Open or Close
    #laneMode:Maintenance/Normal 
    #laneType:Dedicated/Hybrid/Handheld 
    #ExitGate:Parking Only
    #Floor:Parking Only
    #signAuth:VALID/INVALID/NOT_VERIFIED
    #tagVerified:NETC TAG or NON NETC TAG
    #vehicleAuth:YES/NO/UNKNOWN
    #txnStatus:SUCCESS/FAILED
    #TagSignature:Value of specific tag user memory(Hexadecimal 1-256)
    #PriceMode:DISTANCE/POINT/CUSTOM
    #IsOverWeightCharged:TRUE/FALSE
    #PaymentMode:Tag/Cash/Card/QRCode/Other       
        
    @staticmethod
    def create_root_element(etc, xmlns="http://npci.org/etc/schema/"):
        return ET.Element(f'etc:{etc}', xmlns=xmlns)

    @staticmethod
    def create_head_element(root, orgId,msg_id, version="1.0"):
        return ET.SubElement(root, 'Head', msgId=msg_id, orgId=orgId, ts=datetime.now().isoformat(), ver=version)

    @staticmethod
    def create_txn_element(root, txn_id,ts, txn_type, note="", ref_id="", ref_url="", org_txn_id=""):
        return ET.SubElement(root, 'Txn', id=txn_id, note=note, refId=ref_id, refUrl=ref_url, ts=ts, type=txn_type, orgTxnId=org_txn_id)

    @staticmethod
    def add_signature(root):
        ET.SubElement(root, 'Signature')

    @staticmethod
    def generate_violation_audit_details():
        root = XMLRequestGenerator.create_root_element('ViolationAuditDetails')
        XMLRequestGenerator.create_head_element(root, "1", "IRBL")
        ET.SubElement(root, 'Meta')
        violations = ET.SubElement(root, 'Violations')
        violation = ET.SubElement(violations, 'Violation')
        
        details = [
            ("AuditTime", ""),
            ("AuditResult", ""),
        ]
        avc_profile_details = [
            ("ProfileData", ""),
            ("NumberAxles", ""),
            ("InterAxleDistance", ""),
            ("VehicleHeight", ""),
            ("DoubleWheelDetected", ""),
            ("VehicleLength", "")
        ]
        transaction_details = [
            ("PlazaId", ""),
            ("ReaderReadTime", ""),
            ("TransactionTime", ""),
            ("TransactionId", ""),
            ("LaneId", "")
        ]
        
        for name, value in details:
            ET.SubElement(violation, 'Detail', name=name, value=value)
        
        avc_profile = ET.SubElement(violation, 'Detail', name="AVCProfile", value="Inline")
        for name, value in avc_profile_details:
            ET.SubElement(avc_profile, 'Item', name=name, value=value)
        
        transaction = ET.SubElement(violation, 'Detail', name="TransactionDetails", value="Inline")
        for name, value in transaction_details:
            ET.SubElement(transaction, 'Item', name=name, value=value)

        image_details = ET.SubElement(violation, 'ImageDetails')
        for i in range(1, 3):
            ET.SubElement(image_details, f'Image{i}', name="", refPath="")
        
        avc_profile = ET.SubElement(violation, 'AVCProfile')
        for i in range(1, 3):
            ET.SubElement(avc_profile, f'Image{i}', name="", refPath="")
        
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_req_pay(orgId,TransactionDetail,EntryTransactionDetail,PlazaDetail,EntryPlazaDetail,LaneDetail,EntryLaneDetail):  
        
        root = XMLRequestGenerator.create_root_element('ReqPay')
        XMLRequestGenerator.create_head_element(root, orgId,TransactionDetail["msgId"])
        ET.SubElement(root, 'Meta')
        
        txn = XMLRequestGenerator.create_txn_element(root, TransactionDetail["txn_id"],TransactionDetail["ts"],TransactionDetail["txn_type"],orgTxnId=TransactionDetail["orgTxnId"])
        ET.SubElement(txn, 'EntryTxn', id=EntryTransactionDetail["txn_id"], tsRead=EntryTransactionDetail["tsRead"], ts=EntryTransactionDetail["ts"], type=EntryTransactionDetail["txn_type"])
        
        plaza = ET.SubElement(root, 'Plaza', geoCode=PlazaDetail["geoCode"], id=PlazaDetail["plaza_id"], name=PlazaDetail["name"], subtype=PlazaDetail["subtype"], type=PlazaDetail["type"])
        ET.SubElement(plaza, 'EntryPlaza', geoCode=EntryPlazaDetail["geoCode"], id=EntryPlazaDetail["plaza_id"], name=EntryPlazaDetail["name"], subtype=EntryPlazaDetail["subtype"], type=EntryPlazaDetail["type"])
        ET.SubElement(plaza, 'Lane', direction=LaneDetail["direction"], id=LaneDetail["id"], readerId=LaneDetail["readerId"], Status=LaneDetail["Status"], Mode=LaneDetail["Mode"], laneType=LaneDetail["laneType"], ExitGate=LaneDetail["ExitGate"], Floor=LaneDetail["Floor"])
        ET.SubElement(plaza, 'EntryLane', direction=EntryLaneDetail["direction"], id=EntryLaneDetail["id"], readerId=EntryLaneDetail["readerId"], Status=EntryLaneDetail["Status"], Mode=EntryLaneDetail["Mode"], laneType=EntryLaneDetail["laneType"], EntryGate=EntryLaneDetail["EntryGate"], Floor=EntryLaneDetail["Floor"])
        
        reader_verification = ET.SubElement(plaza, 'ReaderVerificationResult',ts=TransactionDetail["tsRead"], signAuth="NOT_VERIFIED",tagVerified="NETC TAG", procRestrictionResult="",vehicleAuth="UNKNOWN",txnCounter=TransactionDetail["txnCounter"], txnStatus="SUCCESS", publicKeyCVV="")
        tag_user_memory = ET.SubElement(reader_verification, 'TagUserMemory')
        tag_details = [
            ("TagSignature", TransactionDetail["TagUserMemory"]),
            ("TagVRN", TransactionDetail["TagVRN"]),
            ("TagVC", TransactionDetail["TagVC"])
        ]
        for name, value in tag_details:
            ET.SubElement(tag_user_memory, 'Detail', name=name, value=value)
        
        vehicle = ET.SubElement(root, 'Vehicle', TID=TransactionDetail["TID"], tagId=TransactionDetail["tagId"], wim="", staticweight="")
        vehicle_details = ET.SubElement(vehicle, 'VehicleDetails')
        vehicle_details_data = [
            ("AVC", TransactionDetail["AVCClassId"]),
            ("LPNumber", TransactionDetail["LPNumber"])
        ]
        for name, value in vehicle_details_data:
            ET.SubElement(vehicle_details, 'Detail', name=name, value=value)
        
        payment = ET.SubElement(root, 'Payment')
        amount = ET.SubElement(payment, 'Amount', curr="INR", value=TransactionDetail["TollFare"], PriceMode=TransactionDetail["PriceMode"], IsOverWeightCharged=TransactionDetail["IsOverWeightCharged"], PaymentMode="Tag")
        ET.SubElement(amount, 'OverweightAmount', curr="INR", value=TransactionDetail["OverweightAmount"], PaymentMode="Tag")
        
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_plaza_details():
        root = XMLRequestGenerator.create_root_element('RequestPlazaDetails')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "DCBX")
        XMLRequestGenerator.create_txn_element(root, "0000000000000AB1002", "FETCH")
        
        plaza = ET.SubElement(root, 'Plaza', id="")
        request_type = ET.SubElement(plaza, 'RequestType')
        items = [
            "BankDetails",
            "LaneDetails",
            "PlazaVehicleClass",
            "TollFareRules",
            "PassSchemes"
        ]
        for item in items:
            ET.SubElement(request_type, 'Item', name=item)
        
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_tag_details():
        root = XMLRequestGenerator.create_root_element('ReqTagDetails')
        XMLRequestGenerator.create_head_element(root, "00000000000000000314", "IRBL")
        XMLRequestGenerator.create_txn_element(root, "00000000000000000314", "FETCH")
        
        ET.SubElement(root.find('Txn'), 'Vehicle', TID="", vehicleRegNo="", tagId="34161FA82032D69802008A60")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_sync_time():
        root = XMLRequestGenerator.create_root_element('ReqSyncTime')
        XMLRequestGenerator.create_head_element(root, "0001", "IRBL")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_toll_plaza_heartbeat():
        root = XMLRequestGenerator.create_root_element('TollplazaHbeatReq')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "IRBL")
        XMLRequestGenerator.create_txn_element(root, "0000000000000AB1002", "NON_FIN")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_check_transaction_status():
        root = XMLRequestGenerator.create_root_element('ReqTxnStatus')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "IRBL")
        XMLRequestGenerator.create_txn_element(root, "0000000000000AB1002", "DEBIT/CREDIT/NON_FIN")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_get_exception():
        root = XMLRequestGenerator.create_root_element('ReqGetException')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "IRBL")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_query_exception_list():
        root = XMLRequestGenerator.create_root_element('ReqQueryExceptionList')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "IRBL")
        XMLRequestGenerator.create_txn_element(root, "0000000000000AB1002", "FETCH")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_set_pass_scheme():
        root = XMLRequestGenerator.create_root_element('ReqSetPassScheme')
        XMLRequestGenerator.create_head_element(root, "0000000000000AB1002", "IRBL")
        XMLRequestGenerator.create_txn_element(root, "0000000000000AB1002", "SET")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_list_participants():
        root = XMLRequestGenerator.create_root_element('ReqListParticipants')
        XMLRequestGenerator.create_head_element(root, "0001", "IRBL")
        XMLRequestGenerator.add_signature(root)
        return ET.tostring(root, encoding='unicode')
