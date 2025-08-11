import json
import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi.responses import JSONResponse
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel
import requests
from database.ms_sql import MSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger


class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

class TagRequestApi:
    def __init__(self,dbConnectionObj:MSSQLConnectionManager, default_directory,icd_api_detail,plaza_details,private_key,certificate,app: FastAPI):
        self.icd_api_detail=icd_api_detail
        self.default_port=5004
        self.certificate_validation=1
        self.other_bank_url="http://115.247.183.246:5003/tagRequest_bank"
        self.request_url=F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}"
        self.headers={"Content-Type": "application/json"}
        self.dbConnectionObj=dbConnectionObj
        self.default_directory=default_directory
        self.plaza_details=plaza_details
        self.private_key=private_key
        self.certificate=certificate
        self.app = app
        self.shutdown_flag = threading.Event()
        self.set_logger(default_directory,"icd_api_service_UAT")
        self._add_routes()
        self.testingTags=["34161FA820355CBE02004B00","34161FA820355CBEA60001C0","34161FA8203289A60355E380","34161FA820355CBE02000B60",
                          "34161FA8203289721E3A4220","34161FA8203289A605561020","34161FA820355CBE02003420","34161FA820355CBE02005000",
                          "34161FA820328726C808B3A0","34161FA8203289A604F91760","34161FA820328972040EAB80","34161FA820355CBE02003440",
                          "34161FA820355CBE1E0037A0","34161FA820355CBE02000CE0","34161FA820328F1C040AFBC0","34161FA8203289720F55F6A0",
                          "34161FA8203289720A14F8E0","34161FA820355CE219ED49C0"]

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")
    
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

    def process_tag_id(self,tag_id:str):
        if tag_id.startswith('3400') and len(tag_id)>24:
            return tag_id[4:] 
        return tag_id

    def by_bank(self,item):
        try:
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            file_name=""
            xml_string = self._generate_xml(item, req_time, MessageId)
            signed_xml = Utilities.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            self.logger.logInfo(f"Tag Request : {signed_xml}")
            response=Utilities.upload_request(signed_xml,self.request_url,certificate_validation=self.certificate_validation)
            self.logger.logInfo(f"Tag Response : {response.text}")
            resp_code=Utilities.parse_xml_response_tags(response.text)
            if len(resp_code)>0:
                resp_code.sort(key=lambda x: x['ISSUEDATE'], reverse=True)
                allowed_entries = [entry for entry in resp_code if entry['Allowed']]
                if len(allowed_entries)>0:
                    result = allowed_entries[0] if allowed_entries else max(resp_code, key=lambda x: x['ISSUEDATE'])
                    result['ISSUEDATE'] = result['ISSUEDATE'].strftime('%Y-%m-%d')
                    return {"status": "success", "VehicleDetails": result}
                else:
                    return {"status": "false", "VehicleDetails": None}
            else:
                 return {"status": "false", "VehicleDetails": None}
        except Exception as e:
            raise e
        
    def tag_validate(self,item):
        try:
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            file_name=""
            xml_string = self._generate_xml(item, req_time, MessageId)
            
            signed_xml = Utilities.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
            
            response=Utilities.upload_request(signed_xml,self.request_url,certificate_validation=self.certificate_validation)
            
            resp_code=Utilities.parse_xml_response_tags(response.text)
            
            resp_code.sort(key=lambda x: x['ISSUEDATE'], reverse=True)
            for item in resp_code:
                item['ISSUEDATE'] = item['ISSUEDATE'].strftime('%Y-%m-%d')
            # allowed_entries = [entry for entry in resp_code if entry['Allowed']]
            
            # result = allowed_entries[0] if allowed_entries else max(resp_code, key=lambda x: x['ISSUEDATE'])
            
            # result['ISSUEDATE'] = result['ISSUEDATE'].strftime('%Y-%m-%d')
            
            return {"status": "success", "VehicleDetails": resp_code}
        except Exception as e:
            raise e
        
    def by_other_bank(self,item):
        try:
            item_dict = item.dict() if hasattr(item, 'dict') else item.__dict__
            json_payload = json.dumps(item_dict)
            response = requests.post(self.other_bank_url,data=json_payload,headers=self.headers)
            return json.loads(response.text)
        except Exception as e:
            raise e
        
    def by_pass(self,item):
        try:
            resp_code ={"TAGID": item.TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
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
        @self.app.get("/")
        def read_root():
            return {"message": "Welcome to the Tag Request API"}

        @self.app.post("/tagRequest")
        def process_item(item: Item):
            try:
                response_data=self.by_bank(item)
                
                return JSONResponse(response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_item: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)
            

        @self.app.get("/tagRequest_testing")
        def tagRequest_testing():
            try:
                for tag in self.testingTags:
                    item = Item(TagId=tag, TID="", VRN="")
                    response_data=self.by_bank(item)
                    json_string = json.dumps(response_data)
                    self.logger.logInfo(f" final status: {json_string}")
                return JSONResponse(response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_item: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)
                    

        @self.app.post("/tagRequest_bank")
        def process_item_bank(item: Item):
            try:
                response_data=self.by_bank(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_item_bank: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)

        @self.app.post("/tag_validate")
        def process_tag_validatek(item: Item):
            try:
                response_data=self.tag_validate(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag_validatek: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)
        
        @self.app.post("/tagRequest_db")
        def process_item_bank(item: Item):
            try:
                response_data=self.by_db(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_item_bank: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error","message": error_message}
                return JSONResponse(content=response_data, status_code=500)

    def run(self):
        try:
            uvicorn.run(self.app, host="0.0.0.0", port=self.default_port)
        except Exception as e:
            print(f"Error running API: {str(e)}")

    def stop(self):
        print("Shutting down the API server...")
        self.shutdown_flag.set()
        sys.exit(0)
