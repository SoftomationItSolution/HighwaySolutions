from datetime import datetime, timedelta
import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import Element, SubElement, register_namespace
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner


class RequestExceptionList(threading.Thread):
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
        self.set_logger(default_directory,"icd_exception_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def run(self):
        counter = 0
        last_run_date = None
        last_dif_run = None
        while self.flag:
            try:
                today = datetime.now()
                if today.weekday() == 0:  # Monday is represented as 0
                    if not last_run_date or last_run_date.date() != today.date():
                        self.generate_xml_init()
                        last_run_date = today
                        self.logger.logInfo("Task executed successfully on Monday.")
                
                # Execute generate_xml_dif every 3 minutes
                if last_dif_run is None or today - last_dif_run >= timedelta(minutes=3):
                    self.generate_xml_dif()
                    last_dif_run = today
                    self.logger.logInfo("Task executed successfully every 3 minutes.")
                    
                time.sleep(0.100)  # Sleep for 100ms (to control the loop speed)
                counter += 0.1  # Increment counter by 0.1 seconds (adjusting for the loop delay)
                
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")


    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")


    def generate_xml_init(self):
        try:
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            file_name=Utilities.generate_file_path(self.default_directory,None,"ReqGetExceptionList",MessageId)
            namespace = "http://npci.org/etc/schema/"
            register_namespace("etc", namespace)
            root = Element("{http://npci.org/etc/schema/}ReqGetExceptionList")
            head = SubElement(root, "Head")
            head.set("ver", self.icd_api_detail["Version"])
            head.set("ts", str(req_time))
            head.set("orgId", str(self.plaza_details['OrganizationId']))
            head.set("msgId", str(MessageId))

            txn = SubElement(root, "Txn")
            txn.set("id", str(MessageId))    
            txn.set("note", "")    
            txn.set("refId", "")    
            txn.set("refUrl", "")    
            txn.set("ts", str(req_time))    
            txn.set("type", "FETCHEXCEPTION")    
            txn.set("orgTxnId", "")
           
            ExceptionList = SubElement(txn, "ExceptionList")
            exceptions = ["01", "02"]
            for exc_code in exceptions:
                Exception = SubElement(ExceptionList, "Exception")
                Exception.set("excCode",exc_code)
            xml_string = Utilities.prettify_xml(root)
            signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            if signed_xml:    
                try:
                    self.insert_request(MessageId,req_time,True,0)
                    response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['GetExceptionRequestURL']}")
                    if response.ok:
                        self.update_request(MessageId,"1")
                    else:
                        self.update_request(MessageId,"2") 
                        self.logger.logError(f"Error: txn {MessageId} failed with StatusCode {response.status_code}, StatusDescription: {response.text}")
                except Exception as e:
                    self.logger.logError(f"Error send GetExceptionRequest {MessageId}: {e}")
                    self.update_request(MessageId,"3") 
        except Exception as e:
            self.logger.logError(f"Error in generate_xml_init: {e}")

   
    def generate_xml_dif(self):
            try:
                data = self.dbConnectionObj.execute_stored_procedure_single("USP_ICDRequestExceptionDetailGetLastRequest")
                if data:
                    MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
                    req_time=Utilities.get_date_time()['CurrentDateTime_s']
                    file_name=Utilities.generate_file_path(self.default_directory,None,"ReqQueryExceptionList",MessageId)
                    namespace = "http://npci.org/etc/schema/"
                    register_namespace("etc", namespace)
                    root = Element("{http://npci.org/etc/schema/}ReqQueryExceptionList")
                    head = SubElement(root, "Head")
                    head.set("ver", self.icd_api_detail["Version"])
                    head.set("ts", str(req_time))
                    head.set("orgId", str(self.plaza_details['OrganizationId']))
                    head.set("msgId", str(MessageId))

                    txn = SubElement(root, "Txn")
                    txn.set("id", str(MessageId))    
                    txn.set("note", "")    
                    txn.set("refId", "")    
                    txn.set("refUrl", "")    
                    txn.set("ts", str(req_time))    
                    txn.set("type", "Query")    
                    txn.set("orgTxnId", "")
                    ExceptionList = SubElement(txn, "ExceptionList")
                    exceptions = ["01", "02"]
                    for exc_code in exceptions:
                        Exception = SubElement(ExceptionList, "Exception")
                        Exception.set("excCode",exc_code)
                        if exc_code=="01":
                            Exception.set("lastFetchTime",Utilities.mssql_to_icd_datetime_format(data["BlacklistLastUpdatedTime"]))
                        else:
                            Exception.set("lastFetchTime",Utilities.mssql_to_icd_datetime_format(data["ExemptedLastUpdatedTime"]))
                    xml_string = Utilities.prettify_xml(root)
                    signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
                    if signed_xml:    
                        try:
                            self.insert_request(MessageId,req_time,False,0)
                            response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestQueryExceptionListURL']}",certificate_validation=1)
                            if response.ok:
                                self.update_request(MessageId,"1")
                            else:
                                self.update_request(MessageId,"2") 
                                self.logger.logError(f"Error: txn {MessageId} failed with StatusCode {response.status_code}, StatusDescription: {response.text}")
                        except Exception as e:
                            self.logger.logError(f"Error send RequestQueryException {MessageId}: {e}")
                            self.update_request(MessageId,"3") 
            except Exception as e:
                self.logger.logError(f"Error in generate_xml_diff: {e}")


   
    def update_request(self,MessageId,statusId):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestExceptionDetailUpdateRequest",params=[MessageId, statusId])
        except Exception as e:
            self.logger.logError(f"Error send update_request {MessageId}: {e}")

    def insert_request(self,MessageId,req_time,IsInitRequest,statusId):
        try:
            formatted_date = Utilities.icd_to_mssql_datetime_format(req_time)
            self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestExceptionDetailInsert",params=[MessageId,formatted_date,IsInitRequest,statusId])
        except Exception as e:
            self.logger.logError(f"Error send update_request {MessageId}: {e}")     