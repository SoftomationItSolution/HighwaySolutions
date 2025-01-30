import asyncio
import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi.responses import JSONResponse
from uvicorn import Config, Server
from fastapi import FastAPI
from pydantic import BaseModel
from database.ms_sql_asy import AsyncMSSQLConnectionManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
import httpx
from lxml import etree
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading
import xml.etree.ElementTree as ET
from utils.constants import Utilities
import multiprocessing

class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

class AsynTagRequestApi:
    def __init__(self, dbConnectionObj: AsyncMSSQLConnectionManager, default_directory, icd_api_detail, plaza_details, private_key, certificate, app: FastAPI):
        self.dbConnectionObj = dbConnectionObj
        self.default_directory = default_directory
        self.icd_api_detail = icd_api_detail
        self.plaza_details = plaza_details
        self.private_key = private_key
        self.certificate = certificate
        self.app = app
        self.url=f"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}"
        self.shutdown_flag = threading.Event()
        self.set_logger(default_directory, "icd_api_service")
        self._add_routes()

    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    async def upload_request(self, xml_data, timeout=3000, certificate_validation=0, retries=3):
        for attempt in range(retries):
            try:
                timeout_in_seconds = timeout / 1000
                async with httpx.AsyncClient(verify=certificate_validation == 1) as client:
                    headers = {'Content-Type': 'application/xml'}
                    response = await client.post(self.url, data=xml_data, headers=headers, timeout=timeout_in_seconds)
                    #print(f"Response Text: {response.text}")
                    return response
            except httpx.ReadTimeout:
                self.logger.logInfo(f"ReadTimeout occurred. Attempt {attempt + 1} of {retries}. Retrying...")
                await asyncio.sleep(2 ** attempt)
        raise httpx.ReadTimeout("Max retries exceeded")

    async def sign_xml_file(self,xml_string, file_name, private_key, certificate):
        try:
            parser = etree.XMLParser(remove_blank_text=True)
            doc = etree.fromstring(xml_string, parser)

            # Create the Signature template
            signature_node = xmlsec.template.create(
                doc,
                xmlsec.Transform.EXCL_C14N,
                xmlsec.Transform.RSA_SHA256
            )
            doc.append(signature_node)

            # Add reference and transform
            ref = xmlsec.template.add_reference(
                signature_node,
                xmlsec.Transform.SHA256,
                uri=""
            )
            xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)

            key_info = xmlsec.template.ensure_key_info(signature_node)
            x509_data = xmlsec.template.add_x509_data(key_info)

            x509_subject_name = certificate.subject.rfc4514_string()
            x509_subject_name_node = xmlsec.template.x509_data_add_subject_name(x509_data)
            x509_subject_name_node.text = x509_subject_name

            x509_certificate_node = xmlsec.template.x509_data_add_certificate(x509_data)
            x509_certificate_node.text = certificate.public_bytes(encoding=serialization.Encoding.DER).hex()

            signing_ctx = xmlsec.SignatureContext()
            signing_ctx.key = xmlsec.Key.from_memory(
                private_key.private_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PrivateFormat.PKCS8,
                    encryption_algorithm=serialization.NoEncryption()
                ),
                xmlsec.KeyFormat.PEM
            )

            signing_ctx.key.load_cert_from_memory(certificate.public_bytes(encoding=serialization.Encoding.PEM),xmlsec.KeyFormat.PEM)

            signing_ctx.sign(signature_node)

            if isinstance(doc.getroottree().getroot(), etree._ProcessingInstruction):
                doc.remove(doc.getroottree().getroot())
        
            try:
                with open(file_name, "wb") as signed_file:
                    signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))
            except Exception as e:
                self.logger.logError(f"Exception in sign_xml_file Save {str(e)}")
            return etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8").decode('utf-8')
        except Exception as e:
            raise Exception(f"Error signing XML: {e}")
    
    async def parse_xml_response_tag(self,xml_data):
        try:
            details ={
                "TAGID": "",
                "REGNUMBER": "",
                "TID": "",
                "VEHICLECLASS": 0,
                "TAGSTATUS": 0,
                "EXCCODE": "09",
                "Allowed":False,
                "COMVEHICLE": 0
            }
            root = ET.fromstring(xml_data)
            resp = root.find('.//Resp')
            vehicle = resp.find('.//Vehicle')
            vehicle_details = vehicle.find('.//VehicleDetails')
            if vehicle_details:
                details = dict(map(lambda d: (
                    d.attrib['name'],
                    int(d.attrib['value'][-1]) if d.attrib['name'] == "VEHICLECLASS" else
                    True if d.attrib['name'] == "TAGSTATUS" and d.attrib['value'] == "A" else
                    False if d.attrib['name'] == "COMVEHICLE" and d.attrib['value'] == "F" else
                    d.attrib['value']
                ), vehicle_details.findall('.//Detail')))
            details["Allowed"]=Utilities.check_values(details["EXCCODE"])
            return details
        except Exception as e:
            raise e
    
    async def _generate_xml(self, item, req_time, message_id):
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
        vehicle.set("TID", Utilities.process_tag_id(item.TID))
        vehicle.set("vehicleRegNo", item.VRN)
        vehicle.set("tagId", Utilities.process_tag_id(item.TagId))

        return Utilities.prettify_xml(root)

    async def check_tag(self,data,TagId):
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
        
    async def by_bank(self, item):
        try:
            req_time = Utilities.get_date_time()['CurrentDateTime_s']
            message_id = Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
            file_name = Utilities.generate_file_path(self.default_directory, None, "RequestTagDetail", message_id)

            xml_string = await self._generate_xml(item, req_time, message_id)
            signed_xml = await self.sign_xml_file(xml_string, file_name, self.private_key, self.certificate)
            response = await self.upload_request(signed_xml,timeout=3000,certificate_validation=0)
            resp_code = await self.parse_xml_response_tag(response.text)
            return {"status": "success", "VehicleDetails": resp_code}
        except Exception as e:
            raise e

    async def by_db(self, item):
        try:
            pd=Utilities.process_tag_id(item.TagId)
            data = await self.dbConnectionObj.execute_stored_procedure("USP_CheacTagStatus",params=[pd])
            if data:
                return await self.check_tag(data, pd)
            else:
                self.logger.logError(f"Exception process_tag")
                error_message = f"Error processing item:"
                return {"status": "error", "message": error_message}
        except Exception as e:
            raise e
    
    async def by_pass(self,item):
        try:
            resp_code ={
                    "TAGID": item.TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
                    "EXCCODE": "00","Allowed":True,"COMVEHICLE": 0}
            return {"status": "success","VehicleDetails": resp_code}
        except Exception as e:
            raise e
        
    async def by_pass_bl(self,item):
        try:
            resp_code ={
                    "TAGID": item.TagId,"REGNUMBER": "XXXXXXXXXX","TID": "","VEHICLECLASS": 0,"TAGSTATUS": 0,
                    "EXCCODE": "01","Allowed":False,"COMVEHICLE": 0}
            return {"status": "success","VehicleDetails": resp_code}
        except Exception as e:
            raise e

    def _add_routes(self):
        @self.app.post("/tagRequest")
        async def process_item(item: Item):
            try:
                api_task = asyncio.create_task(self.by_bank(item))
                db_task = asyncio.create_task(self.by_db(item))

                done, pending = await asyncio.wait(
                    [api_task, db_task], timeout=3, return_when=asyncio.FIRST_COMPLETED
                )

                if db_task in done:
                    db_response = db_task.result()
                    db_task.cancel()
                    api_response = await api_task
                    return JSONResponse(api_response)

                if api_task in done:
                    try:
                        api_response = api_task.result()
                        api_task.cancel()
                        return JSONResponse(api_response)
                    except Exception as e:
                        self.logger.logError(f"api_task failed: {str(e)}")
                        if db_task in pending:
                            db_task.cancel()
                        db_response = await db_task
                        return JSONResponse(db_response)
                self.logger.logError("Both API and DB requests timed out.")
                response_data = self.by_pass_bl()
                return JSONResponse(response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_item: {str(e)}")
                response_data = self.by_pass_bl(item)
                return JSONResponse(response_data)

        @self.app.post("/tagRequest_bank")
        async def process_item_bank(item: Item):
            try:
                response_data = await self.by_bank(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error", "message": error_message}
                return JSONResponse(content=response_data, status_code=500)

        @self.app.post("/tagRequest_db")
        async def process_item_db(item: Item):
            try:
                response_data = await self.by_db(item)
                return JSONResponse(content=response_data)
            except Exception as e:
                self.logger.logError(f"Exception process_tag: {str(e)}")
                error_message = f"Error processing item: {str(e)}"
                response_data = {"status": "error", "message": error_message}
                return JSONResponse(content=response_data, status_code=500)

    def run(self):
        try:
            #uvicorn.run(self.app, host="0.0.0.0", port=5004, workers=20)
            cpu_count = multiprocessing.cpu_count()
            workers = cpu_count * 2 + 1  # Common formula for Gunicorn
            config = Config(self.app, host="0.0.0.0", port=5003, workers=workers)
            server = Server(config)
            server.run()  # Starts the server without triggering SystemExit
        except Exception as e:
            print(f"Error running API: {str(e)}")

    def stop(self):
        print("Shutting down the API server...")
        self.shutdown_flag.set()
        sys.exit(0)
