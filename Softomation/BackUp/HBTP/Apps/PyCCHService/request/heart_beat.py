import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import Element, SubElement, register_namespace
from database.send_request import SendRequest
from utils.xml_Signer import XmlSigner


class RequestHeartBeat(threading.Thread):
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
        self.set_logger(default_directory,"icd_HeartBeat_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def run(self):
        counter = 60
        while self.flag:
            try:
                if counter >= 60:
                    self.generate_xml()
                    counter = 0 
                time.sleep(0.100)
                counter += 0.1  
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")


    def generate_xml(self):
        try:
            data = self.dbConnectionObj.execute_stored_procedure("USP_LaneGetActive")
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            file_name=Utilities.generate_file_path(self.default_directory,None,"TollplazaHbeatReq",MessageId)
            namespace = "http://npci.org/etc/schema/"
            register_namespace("etc", namespace)
            root = Element("{http://npci.org/etc/schema/}TollplazaHbeatReq")
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
            txn.set("type", "Hbt")    
            txn.set("orgTxnId", "")
            meta=SubElement(txn, "Meta")
            #submeta=SubElement(meta, "Meta1")
            hbt_msg = SubElement(txn, 'HbtMsg', type="ALIVE", acquirerId=str(self.plaza_details["PlazaAcquirerId"]))
            plaza = SubElement(txn, "Plaza")
            plaza.set("geoCode", f"{str(self.plaza_details['Latitude'])},{str(self.plaza_details['Longitude'])}")
            plaza.set("id", str(self.plaza_details["PlazaZoneId"]))
            plaza.set("name", str(self.plaza_details["PlazaName"]))
            plaza.set("subtype", str(self.plaza_details["PlazaSubType"]))
            plaza.set("type", str(self.plaza_details["PlazaType"]))
            plaza.set("address", "")
            plaza.set("fromDistrict", "")
            plaza.set("toDistrict", "")
            plaza.set("agencyCode", str(self.plaza_details["PlazaAgencyCode"]))
            for d in data:
                lane = SubElement(plaza, "Lane")
                lane.set("id", str(d["LaneId"]))
                lane.set("direction", str(d["LaneDirectionCode"]))
                lane.set("readerId", str(d["LaneId"]))
                lane.set("Status", str(d["LaneStatusName"]).upper())
                lane.set("Mode", str(d["LaneModeName"]))
                lane.set("laneType", str(d["LaneTypeName"]).replace("Booth Less","Hybrid"))
            xml_string = Utilities.prettify_xml(root)
            signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            if signed_xml:    
                try:
                    self.insert_request(MessageId,req_time)
                    response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['TollPlazaHeartBeatURL']}",certificate_validation=1)
                    if response.ok:
                        self.update_request(MessageId,"1")
                    else:
                        self.update_request(MessageId,"2") 
                        self.logger.logError(f"Error: txn {MessageId} failed with StatusCode {response.status_code}, StatusDescription: {response.text}")
                except Exception as e:
                    self.logger.logError(f"Error send RequestHeartBeat {MessageId}: {e}")
                    self.update_request(MessageId,"3") 
        except Exception as e:
            self.logger.logError(f"Error in process loop: {e}")
            

    def update_request(self,MessageId,statusId):
        try:
            self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestHeartBeatUpdateRequest",params=[MessageId, statusId])
        except Exception as e:
            self.logger.logError(f"Error send update_request {MessageId}: {e}")

    def insert_request(self,MessageId,req_time):
        try:
            formatted_date = Utilities.icd_to_mssql_datetime_format(req_time)
            self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestHeartBeatInsert",params=[MessageId,formatted_date])
        except Exception as e:
            self.logger.logError(f"Error send update_request {MessageId}: {e}")     