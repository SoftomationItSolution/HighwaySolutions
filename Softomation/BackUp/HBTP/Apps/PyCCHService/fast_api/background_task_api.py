import json
import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi.responses import JSONResponse
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel
from utils.constants import Utilities
from utils.log_master import CustomLogger
import requests
from utils.xml_Signer import XmlSigner

class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

class TagRequestApi:
    def __init__(self,dbConnectionObj, default_directory,icd_api_detail,plaza_details,private_key,certificate,app: FastAPI):
        self.dbConnectionObj=dbConnectionObj
        self.default_directory=default_directory
        self.icd_api_detail=icd_api_detail
        self.plaza_details=plaza_details
        self.private_key=private_key
        self.certificate=certificate
        self.app = app
        self.shutdown_flag = threading.Event()
        self.set_logger(default_directory,"icd_api_service")
        self._add_routes()
        

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")
    
    def upload_request(self,xml_data, uri, timeout=3000, certificate_validation=0):
        try:
            session = requests.Session()
            session.headers.update({'Content-Type': 'application/xml'})
            if certificate_validation == 1:
                session.verify = False
            response = session.post(uri, data=xml_data, timeout=timeout)
            return response
        except requests.RequestException as ex:
            raise ex
    
    def _generate_xml(self, item, req_time, message_id):
        namespace = "http://npci.org/etc/schema/"
        register_namespace("etc", namespace)
        root = Element("{http://npci.org/etc/schema/}ReqTagDetails")
        head = SubElement(root, "Head")
        head.set("ver", self.icd_api_detail["Version"])
        head.set("ts", str(req_time))
        head.set("orgId", str(self.plaza_details['OrganizationId']))
        head.set("msgId", str(message_id))

        txn = SubElement(root, "Txn")
        txn.set("id", Utilities.generate_txn_id())
        txn.set("note", "")
        txn.set("refId", "")
        txn.set("refUrl", "")
        txn.set("ts", str(req_time))
        txn.set("type", "FETCH")
        txn.set("orgTxnId", "")

        vehicle = SubElement(txn, "Vehicle")
        vehicle.set("TID", self.process_tag_id(item.TID))
        vehicle.set("vehicleRegNo", item.VRN)
        vehicle.set("tagId", self.process_tag_id(item.TagId))

        return Utilities.prettify_xml(root)

    def process_tag_id(self,tag_id):
        if tag_id.startswith('3400') and len(tag_id)>24:
            return tag_id[4:] 
        return tag_id

    def by_bank(self,item):
        try:
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            file_name=Utilities.generate_file_path(self.default_directory,None,"RequestTagDetail",MessageId)
            
            xml_string = self._generate_xml(item, req_time, MessageId)
            signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            response=self.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}",certificate_validation=1)
            resp_code=XmlSigner.parse_xml_response_tag(response.text,MessageId)
            return {"status": "success","VehicleDetails": resp_code}
        except Exception as e:
            raise e
        
    def by_other_bank(self,item):
        try:
            item_dict = item.dict() if hasattr(item, 'dict') else item.__dict__
            json_payload = json.dumps(item_dict)
            response = requests.post(
                "http://115.247.183.246:5003/tagRequest_other", 
                data=json_payload, 
                headers={"Content-Type": "application/json"}
            )
            return json.loads(response.text)
        except Exception as e:
            raise e
        
    def by_pass(self,item):
        try:
            resp_code ={
                    "TAGID": item.TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
                    "EXCCODE": "00","Allowed":True,"COMVEHICLE": 0}
            return {"status": "success","VehicleDetails": resp_code}
        except Exception as e:
            raise e

    def check_tag(self,data,TagId):
        try:
            data=data[0]
            alloowed=False
            if data["RequestCode"]=='00':
                alloowed=True
            resp_code ={
                    "TAGID": TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
                    "EXCCODE": data["RequestCode"],"Allowed":alloowed,"COMVEHICLE": 0}
            return {"status": "success","VehicleDetails": resp_code}
            #return JSONResponse(content=response_data)
        except Exception as e:
            self.logger.logError(f"Exception check_tag: {str(e)}")
            raise e
    
    def by_db(self,item):
        try:
            data = self.dbConnectionObj.execute_stored_procedure("USP_CheacTagStatus",params=[self.process_tag_id(item.TagId)])
            if data:
                return self.check_tag(data,self.process_tag_id(item.TagId))
            else:
                self.logger.logError(f"Exception process_tag")
                error_message = f"Error processing item:"
                return {"status": "error","message": error_message}
        except Exception as e:
            raise e
    
    def _add_routes(self):
        @self.app.post("/tagRequest")
        def process_item(item: Item):
            try:
                response_data=self.by_other_bank(item)
                #response_data=self.by_db(item)
                #response_data=self.by_pass(item)
                return JSONResponse(response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)
                    

        @self.app.post("/tagRequest_bank")
        def process_item_bank(item: Item):
            try:
                response_data=self.by_bank(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)
        
        @self.app.post("/tagRequest_db")
        def process_item_bank(item: Item):
            try:
                response_data=self.by_db(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)

    def run(self):
        try:
            uvicorn.run(self.app, host="0.0.0.0", port=5003)
        except Exception as e:
            print(f"Error running API: {str(e)}")

    def stop(self):
        print("Shutting down the API server...")
        self.shutdown_flag.set()
        sys.exit(0)