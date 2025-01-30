import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi.responses import JSONResponse
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner

class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

class TagRequestApi1:
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

    def check_tag(self,data,TagId):
        try:
            data=data[0]
            alloowed=False
            if data["RequestCode"]=='00':
                alloowed=True
            resp_code ={
                    "TAGID": TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
                    "EXCCODE": data["RequestCode"],"Allowed":alloowed,"COMVEHICLE": 0}
            response_data = {"status": "success","VehicleDetails": resp_code}
            return JSONResponse(content=response_data)
        except Exception as e:
            self.logger.logError(f"Exception check_tag: {str(e)}")
    
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
        vehicle.set("TID", item.TID)
        vehicle.set("vehicleRegNo", item.VRN)
        vehicle.set("tagId", item.TagId)

        return Utilities.prettify_xml(root)
    
    def _add_routes(self):
        @self.app.post("/tagRequest")
        def process_item(item: Item):
            try:
                data = self.dbConnectionObj.execute_stored_procedure("USP_CheacTagStatus",params=[item.TagId])
                if data:
                    return self.check_tag(data,item.TagId)
            except Exception as e:
                data = self.dbConnectionObj.execute_stored_procedure("USP_CheacTagStatus",params=[item.TagId])
                if data:
                    return self.check_tag(data,item.TagId)
                else:
                    self.logger.logError(f"Exception process_tag: {str(e)}")
                    error_message = f"Error processing item: {str(e)}"
                    response_data = {"status": "error","message": error_message}
                    return JSONResponse(content=response_data, status_code=500)

    def run(self):
        try:
            uvicorn.run(self.app, host="0.0.0.0", port=5003)
        except Exception as e:
            self.logger.logError(f"Error running API: {str(e)}")

    def stop(self):
        self.logger.logInfo("Shutting down the API server...")
        self.shutdown_flag.set()
        sys.exit(0)