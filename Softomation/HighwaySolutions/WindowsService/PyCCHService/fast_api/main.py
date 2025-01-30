import sys
import threading
from xml.etree.ElementTree import Element, SubElement, register_namespace
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import uvicorn
from utils.constants import Utilities
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner
from lxml import etree
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading
import xml.etree.ElementTree as ET
from utils.constants import Utilities
import requests

class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str


# Main API Class
class TagRequestApi:
    def __init__(self, default_directory, icd_api_detail, plaza_details, private_key, certificate):
        self.default_directory = default_directory
        self.icd_api_detail = icd_api_detail
        self.plaza_details = plaza_details
        self.private_key = private_key
        self.certificate = certificate
        self.certificate_validation=False
        self.shutdown_flag = threading.Event()
        self.app = FastAPI()
        self._add_routes()

    def upload_request(self,xml_data, uri, timeout=3000):
        try:
            session = requests.Session()
            session.headers.update({'Content-Type': 'application/xml'})
            if self.certificate_validation == False:
                session.verify = False
            response = session.post(uri, data=xml_data, timeout=timeout)
            return response
        except requests.RequestException as ex:
            raise ex

    def sign_xml_file(self,xml_string, private_key, certificate):
        try:
            with XmlSigner._lock:
                parser = etree.XMLParser(remove_blank_text=True)
                doc = etree.fromstring(xml_string, parser)
                signature_node = xmlsec.template.create(doc,xmlsec.Transform.EXCL_C14N,xmlsec.Transform.RSA_SHA256)
                doc.append(signature_node)
                ref = xmlsec.template.add_reference(signature_node,xmlsec.Transform.SHA256,uri="")
                xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)
                key_info = xmlsec.template.ensure_key_info(signature_node)
                x509_data = xmlsec.template.add_x509_data(key_info)
                x509_subject_name = certificate.subject.rfc4514_string()
                x509_subject_name_node = xmlsec.template.x509_data_add_subject_name(x509_data)
                x509_subject_name_node.text = x509_subject_name

                x509_certificate_node = xmlsec.template.x509_data_add_certificate(x509_data)
                x509_certificate_node.text = certificate.public_bytes(encoding=serialization.Encoding.DER).hex()

                signing_ctx = xmlsec.SignatureContext()
                signing_ctx.key = xmlsec.Key.from_memory(private_key.private_bytes(encoding=serialization.Encoding.PEM,format=serialization.PrivateFormat.PKCS8,encryption_algorithm=serialization.NoEncryption()),xmlsec.KeyFormat.PEM)
                signing_ctx.key.load_cert_from_memory(certificate.public_bytes(encoding=serialization.Encoding.PEM),xmlsec.KeyFormat.PEM)
                signing_ctx.sign(signature_node)

                if isinstance(doc.getroottree().getroot(), etree._ProcessingInstruction):
                    doc.remove(doc.getroottree().getroot())
                return etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8").decode('utf-8')
        except Exception as e:
            raise Exception(f"Error signing XML: {e}")

    def parse_xml_response_tag(self,xml_data):
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
            resp_code = int(resp.get('respCode'))
            if resp_code==0:
                RequestStatusId=1
            else:
                RequestStatusId=2
            if vehicle_details:
                details = dict(map(lambda d: (
                    d.attrib['name'],
                    int(d.attrib['value'][-1]) if d.attrib['name'] == "VEHICLECLASS" else
                    True if d.attrib['name'] == "TAGSTATUS" and d.attrib['value'] == "A" else
                    False if d.attrib['name'] == "COMVEHICLE" and d.attrib['value'] == "F" else
                    d.attrib['value']
                ), vehicle_details.findall('.//Detail')))
            details["Allowed"]=Utilities.check_values(details["EXCCODE"])
            data={
                "VehicleErrorCode": int(vehicle.attrib.get('errCode')),
                "VehicleDetails": details
            }
            return details
        except Exception as e:
            raise e
    
    def _add_routes(self):
        @self.app.post("/tagRequest")
        def process_item(item: Item):
            try:
                req_time = Utilities.get_date_time()['CurrentDateTime_s']
                message_id = Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
                file_name = Utilities.generate_file_path(self.default_directory, None, "RequestTagDetail", message_id)
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

                xml_string = Utilities.prettify_xml(root)
                signed_xml = self.sign_xml_file(xml_string, file_name, self.private_key, self.certificate)

                response = self.upload_request(signed_xml,f"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}",certificate_validation=1)
                resp_code = self.parse_xml_response_tag(response.text)
                response_data = {"status": "success", "VehicleDetails": resp_code}
                return JSONResponse(content=response_data)

            except Exception as e:
                resp_code = {
                    "TAGID": item.TagId,
                    "REGNUMBER": "XXXXXXXXXX",
                    "TID": "",
                    "VEHICLECLASS": 0,
                    "TAGSTATUS": 0,
                    "EXCCODE": "00",
                    "Allowed": True,
                    "COMVEHICLE": 0
                }
                response_data = {"status": "success", "VehicleDetails": resp_code}
                return JSONResponse(content=response_data)

    def run(self):
        try:
            uvicorn.run(self.app, host="0.0.0.0", port=5003)
        except Exception as e:
            print(f"Error running API: {str(e)}")

    def stop(self):
        print("Shutting down the API server...")
        self.shutdown_flag.set()
        sys.exit(0)



class ApiServer:
    def __init__(self, default_directory, icd_api_detail, plaza_details, private_key, certificate):
        self.shutdown_flag = threading.Event()
        self.api_thread = TagRequestApi(default_directory, icd_api_detail, plaza_details, private_key, certificate)
        self.thread = threading.Thread(target=self.api_thread.run, daemon=True)

    def start(self):
        print("Starting the FastAPI server...")
        self.thread.start()

    def stop(self):
        print("Stopping the FastAPI server...")
        self.api_thread.stop()


if __name__ == "__main__":
    default_directory = "/path/to/directory"
    icd_api_detail = {
        "BaseUrl": "https://api.example.com/",
        "RequestTagDetailsURL": "fetchTag",
        "Version": "1.0"
    }
    plaza_details = {
        "PlazaZoneId": "12345",
        "OrganizationId": "ORG001"
    }
    private_key = "/path/to/private_key.pem"
    certificate = "/path/to/certificate.pem"

    server = ApiServer(default_directory, icd_api_detail, plaza_details, private_key, certificate)
    try:
        server.start()
        while True:
            pass  # Keep the main thread alive
    except KeyboardInterrupt:
        server.stop()
