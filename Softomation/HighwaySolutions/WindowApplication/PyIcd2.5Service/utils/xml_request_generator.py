import xml.etree.ElementTree as ET
from datetime import datetime

class XMLRequestGenerator:
    @staticmethod
    def generate_violation_audit_details():
        root = ET.Element('etc:ViolationAuditDetails', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="1", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        ET.SubElement(root, 'Meta')
        violations = ET.SubElement(root, 'Violations')
        violation = ET.SubElement(violations, 'Violation')
        ET.SubElement(violation, 'Detail', name="AuditTime", value="")
        ET.SubElement(violation, 'Detail', name="AuditResult", value="")
        avc_profile = ET.SubElement(violation, 'Detail', name="AVCProfile", value="Inline")
        ET.SubElement(avc_profile, 'Item', name="ProfileData", value="")
        ET.SubElement(avc_profile, 'Item', name="NumberAxles", value="")
        ET.SubElement(avc_profile, 'Item', name="InterAxleDistance", value="")
        ET.SubElement(avc_profile, 'Item', name="VehicleHeight", value="")
        ET.SubElement(avc_profile, 'Item', name="DoubleWheelDetected", value="")
        ET.SubElement(avc_profile, 'Item', name="VehicleLength", value="")
        transaction_details = ET.SubElement(violation, 'Detail', name="TransactionDetails", value="Inline")
        ET.SubElement(transaction_details, 'Item', name="PlazaId", value="")
        ET.SubElement(transaction_details, 'Item', name="ReaderReadTime", value="")
        ET.SubElement(transaction_details, 'Item', name="TransactionTime", value="")
        ET.SubElement(transaction_details, 'Item', name="TransactionId", value="")
        ET.SubElement(transaction_details, 'Item', name="LaneId", value="")
        image_details = ET.SubElement(violation, 'ImageDetails')
        ET.SubElement(image_details, 'Image1', name="", refPath="")
        ET.SubElement(image_details, 'Image2', name="", refPath="")
        avc_profile = ET.SubElement(violation, 'AVCProfile')
        ET.SubElement(avc_profile, 'Image1', name="", refPath="")
        ET.SubElement(avc_profile, 'Image2', name="", refPath="")
        ET.SubElement(root, 'Signature')
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_req_pay():
        root = ET.Element('etc:ReqPay', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        ET.SubElement(root, 'Meta')
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", orgTxnId="", refId="", refUrl="", ts=datetime.now().isoformat(), type="DEBIT")
        ET.SubElement(txn, 'EntryTxn', id="0000000000000AB1002", tsRead=datetime.now().isoformat(), ts=datetime.now().isoformat(), type="DEBIT")
        plaza = ET.SubElement(root, 'Plaza', geoCode="11.00,11.00", id="1234", name="", subtype="State", type="Toll")
        ET.SubElement(plaza, 'EntryPlaza', geoCode="11", id="1234", name="", subtype="State", type="Toll")
        ET.SubElement(plaza, 'Lane', direction="N", id="a", readerId="12", Status="OPEN", Mode="Maintenance", laneType="Dedicated", ExitGate="", Floor="")
        ET.SubElement(plaza, 'EntryLane', direction="N", id="a", readerId="12", Status="OPEN", Mode="Maintenance", laneType="Dedicated", EntryGate="", Floor="")
        reader_verification = ET.SubElement(plaza, 'ReaderVerificationResult', publicKeyCVV="", procRestrictionResult="", signAuth="NOT_VERIFIED", tagVerified="NETC TAG", ts=datetime.now().isoformat(), txnCounter="1234", txnStatus="SUCCESS", vehicleAuth="UNKNOWN")
        tag_user_memory = ET.SubElement(reader_verification, 'TagUserMemory')
        ET.SubElement(tag_user_memory, 'Detail', name="TagSignature", value="")
        ET.SubElement(tag_user_memory, 'Detail', name="TagVRN", value="XXXXXXXXXXXX")
        ET.SubElement(tag_user_memory, 'Detail', name="TagVC", value="04")
        vehicle = ET.SubElement(root, 'Vehicle', TID="34161FA82032D698020078E0", tagId="34161FA82032D698020078E0", wim="", staticweight="")
        vehicle_details = ET.SubElement(vehicle, 'VehicleDetails')
        ET.SubElement(vehicle_details, 'Detail', name="AVC", value="1001")
        ET.SubElement(vehicle_details, 'Detail', name="LPNumber", value="MH04BY13")
        payment = ET.SubElement(root, 'Payment')
        amount = ET.SubElement(payment, 'Amount', curr="INR", value="100", PriceMode="DISTANCE", IsOverWeightCharged="FALSE", PaymentMode="Tag")
        ET.SubElement(amount, 'OverweightAmount', curr="INR", value="100", PaymentMode="Tag")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_plaza_details():
        root = ET.Element('etc:RequestPlazaDetails', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="DCBX", ts=datetime.now().isoformat(), ver="1.0")
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="FETCH")
        plaza = ET.SubElement(root, 'Plaza', id="")
        request_type = ET.SubElement(plaza, 'RequestType')
        ET.SubElement(request_type, 'Item', name="BankDetails")
        ET.SubElement(request_type, 'Item', name="LaneDetails")
        ET.SubElement(request_type, 'Item', name="PlazaVehicleClass")
        ET.SubElement(request_type, 'Item', name="TollFareRules")
        ET.SubElement(request_type, 'Item', name="PassSchemes")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_tag_details():
        root = ET.Element('etc:ReqTagDetails', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', ver="1.0", ts=datetime.now().isoformat(), orgId="IRBL", msgId="00000000000000000314")
        txn = ET.SubElement(root, 'Txn', id="00000000000000000314", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="FETCH", orgTxnId="")
        ET.SubElement(txn, 'Vehicle', TID="", vehicleRegNo="", tagId="34161FA82032D69802008A60")
        ET.SubElement(root, 'Signature')
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_request_sync_time():
        root = ET.Element('etc:ReqSyncTime', xmlns="http://npci.org/etc/schema/")
        ET.SubElement(root, 'Head', ver="1.0", ts=datetime.now().isoformat(), orgId="IRBL", msgId="0001")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_toll_plaza_heartbeat():
        root = ET.Element('etc:TollplazaHbeatReq', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="NON_FIN")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_check_transaction_status():
        root = ET.Element('etc:ReqTxnStatus', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="DEBIT/CREDIT/NON_FIN")
        ET.SubElement(root, 'Signature')
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_get_exception():
        root = ET.Element('etc:ReqGetException', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        ET.SubElement(root, 'Signature')
        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_query_exception_list():
        root = ET.Element('etc:ReqQueryExceptionList', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="FETCH")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_set_pass_scheme():
        root = ET.Element('etc:ReqSetPassScheme', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', msgId="0000000000000AB1002", orgId="IRBL", ts=datetime.now().isoformat(), ver="1.0")
        txn = ET.SubElement(root, 'Txn', id="0000000000000AB1002", note="", refId="", refUrl="", ts=datetime.now().isoformat(), type="SET")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')

    @staticmethod
    def generate_list_participants():
        root = ET.Element('etc:ReqListParticipants', xmlns="http://npci.org/etc/schema/")
        head = ET.SubElement(root, 'Head', ver="1.0", ts=datetime.now().isoformat(), orgId="IRBL", msgId="0001")
        ET.SubElement(root, 'Signature')

        return ET.tostring(root, encoding='unicode')
