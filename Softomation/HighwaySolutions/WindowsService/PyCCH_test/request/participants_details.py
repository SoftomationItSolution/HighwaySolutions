import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import Element, SubElement, register_namespace
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner


class ParticipantsDetails(threading.Thread):
    def __init__(self, dbConnectionObj,default_directory,plaza_details,icd_api_detail,private_key, certificate, additional_certificates):
        super().__init__()
        self.flag = True
        self.dbConnectionObj = dbConnectionObj
        self.default_directory=default_directory
        self.plaza_details=plaza_details
        self.icd_api_detail=icd_api_detail
        self.private_key=private_key
        self.certificate=certificate
        self.additional_certificates=additional_certificates
        self.set_logger(default_directory,"icd_Participants_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def run(self):
        try:
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            file_name=Utilities.generate_file_path(self.default_directory,None,"SyncTime",MessageId)
            namespace = "http://npci.org/etc/schema/"
            register_namespace("etc", namespace)
            root = Element("{http://npci.org/etc/schema/}RespListParticipant")
            head = SubElement(root, "Head")
            head.set("ts", str(req_time))
            head.set("ver", self.icd_api_detail["Version"])
            head.set("orgId", str(self.plaza_details['OrganizationId']))
            head.set("msgId", str(MessageId))
            
            txn = SubElement(root, "Txn")
            txn.set("id", str(MessageId))    
            txn.set("note", "")    
            txn.set("refId", "")    
            txn.set("refUrl", "")    
            txn.set("ts", str(req_time))    
            txn.set("type", "ListParticipant")    
            txn.set("orgTxnId", "")

            ParticipantList = SubElement(txn, "ParticipantList")
            Participant = SubElement(ParticipantList, "Participant")
            Participant.set("BankCode", "ALL")

            xml_string = Utilities.prettify_xml(root)
            signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            if signed_xml:    
                try:
                    response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestListParticipantURL']}",certificate_validation=1)
                    if response.text!='':
                        response_res=XmlSigner.parse_xml_response_time(response.text,MessageId)
                    #self.update_status(response_res)
                    #self.logger.logError(f"Error: txn {MessageId} failed with StatusCode {response.status_code}, StatusDescription: {response.text}")
                except Exception as e:
                    self.logger.logError(f"Error send RequestPayAPI {MessageId}: {e}")
                    #self.update_status(MessageId, 3,999) 
        except Exception as e:
            self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")