import time
import threading
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import Element, SubElement, register_namespace
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner


class RequestCheckStatus(threading.Thread):
    def __init__(self, dbConnectionObj,default_directory,plaza_details,icd_api_detail,currecy_code,private_key, certificate, additional_certificates):
        super().__init__()
        self.flag = True
        self.dbConnectionObj = dbConnectionObj
        self.default_directory=default_directory
        self.plaza_details=plaza_details
        self.icd_api_detail=icd_api_detail
        self.currecy_code=currecy_code
        self.private_key=private_key
        self.certificate=certificate
        self.additional_certificates=additional_certificates
        self.set_logger(default_directory,"icd_requestPay_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def create_payment(self,payment,row):
        try:
            amount = SubElement(payment, "Amount")
            amount.set("curr", self.currecy_code) 
            amount.set("value", str(row["TransactionAmount"]))
            amount.set("PriceMode", "POINT") #DISTANCE/POINT/CUSTOM
            amount.set("IsOverWeightCharged", str(row["IsOverWeightCharged"])) #TRUE/FALSE
            amount.set("PaymentMode", str(row["PaymentMode"])) #Tag/Cash/Card/QRCode/Other
            return amount
        except Exception as e:
            raise e

    def create_overweight_payment(self,amount,row):
        try:
            overweight_amount = SubElement(amount, "OverwightAmount")
            overweight_amount.set("curr", self.currecy_code)
            overweight_amount.set("value", str(row["OverWeightAmount"]))
            overweight_amount.set("PaymentMode", str(row["OverwightPaymentMode"])) #Tag/Cash/Card/QRCode/Other
        except Exception as e:
            raise e

    def generate_xml(self, data):
        try:
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            file_name=Utilities.generate_file_path(self.default_directory,None,"CheckStatus",MessageId)
            namespace = "http://npci.org/etc/schema/"
            register_namespace("etc", namespace)

            root = Element("{http://npci.org/etc/schema/}ReqChkTxn")
            
            # Head Section
            head = SubElement(root, "Head")
            head.set("msgId", str(MessageId))
            head.set("orgId", str(self.plaza_details['OrganizationId']))
            head.set("ts", str(req_time))
            head.set("ver", self.icd_api_detail["Version"])

            txn = SubElement(root, "Txn")
            txn.set("id", str(MessageId))    
            txn.set("note", "")    
            txn.set("refId", "")    
            txn.set("refUrl", "")    
            txn.set("ts", str(req_time))    
            txn.set("type", "ChkTxn")    
            txn.set("orgTxnId", "")
            
            TxnStatusReqList = SubElement(txn, "TxnStatusReqList")
            
            for row in data:
                TxnStatus = SubElement(TxnStatusReqList, "Status")
                TxnStatus.set("txnId", str(row["TransactionId"]))
                TxnStatus.set("txnDate", Utilities.icd_datetime_format(row["TransactionDateTime"]))
                TxnStatus.set("plazaId", str(row["PlazaZoneId"]))
                TxnStatus.set("laneId", str(row["LaneCode"]))
            
            xml_string = Utilities.prettify_xml(root)
            
            signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            if signed_xml:    
                try:
                    response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['CheckTransactionStatusRequestURL']}")
                    if response.ok:
                        txn_status_req_list=XmlSigner.parse_xml_check_status_xml(response.text)
                        if txn_status_req_list:
                            self.update_status(txn_status_req_list)
                except Exception as e:
                    self.logger.logError(f"Error send RequestCheckStatus {row['MessageId']}: {e}")
                    
        except Exception as e:
            self.logger.logError(f"Error generating XML RequestCheckStatus {row['MessageId']}: {e}")

    def update_status(self,txn_status_req_list):
        try:
            data = self.dbConnectionObj.execute_stored_procedure("USP_ICDTransactionStatusUpdate",params=[txn_status_req_list])
        except Exception as e:
            self.logger.logError(f"Error send update_status: {e}")

    def run(self):
        while self.flag:
            try:
                data = self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestPayGetPendingStatus")
                if data:
                    self.generate_xml(data)
                    time.sleep(0.100)
                time.sleep(0.100)
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")