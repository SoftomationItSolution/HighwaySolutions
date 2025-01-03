import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi.responses import JSONResponse
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel
from utils.constants import Utilities
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner

class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

class TagRequestApi:
    def __init__(self, default_directory,icd_api_detail,plaza_details,private_key,certificate,app: FastAPI):
        self.default_directory=default_directory
        self.icd_api_detail=icd_api_detail
        self.plaza_details=plaza_details
        self.private_key=private_key
        self.certificate=certificate
        self.app = app
        self.shutdown_flag = threading.Event()
        self._add_routes()

    def _add_routes(self):
        @self.app.post("/tagRequest")
        def process_item(item: Item):
            try:
                req_time=Utilities.get_date_time()['CurrentDateTime_s']
                MessageId=Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
                file_name=Utilities.generate_file_path(self.default_directory,None,"RequestTagDetail",MessageId)
                namespace = "http://npci.org/etc/schema/"
                register_namespace("etc", namespace)
                root = Element("{http://npci.org/etc/schema/}ReqTagDetails")
                head = SubElement(root, "Head")
                head.set("ver", self.icd_api_detail["Version"])
                head.set("ts", str(req_time))
                head.set("orgId", str(self.plaza_details['OrganizationId']))
                head.set("msgId", str(MessageId))
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
                xml_string = Utilities.prettify_xml(root)
                signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
                response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}",certificate_validation=1)
                resp_code=XmlSigner.parse_xml_response_tag(response.text,MessageId)
                #signed_xml, 
                response_data = {
                            "status": "success",
                            "signed_xml": resp_code,
                            "url": F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}"
                        }
                return JSONResponse(content=response_data)
            except Exception as e:
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
        self.shutdown_flag.set()  # Set the shutdown flag
        sys.exit(0)  # Exit the process to stop the FastAPI server

# app = FastAPI()
# api = TagRequestApi(app)
# shutdown_flag = threading.Event()
# def run_api_in_thread():
#     api.run()
# api_thread = threading.Thread(target=run_api_in_thread)
# api_thread.start()
# print("Main application is running...")
# def stop_api():
#     print("Stopping FastAPI server...")
#     shutdown_flag.set()  # Set the flag to stop the server
#     sys.exit(0)  # Exit the main thread