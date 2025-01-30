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
    def __init__(self, dbConnectionObj, default_directory, icd_api_detail, plaza_details, private_key, certificate, app: FastAPI):
        self.dbConnectionObj = dbConnectionObj
        self.default_directory = default_directory
        self.icd_api_detail = icd_api_detail
        self.plaza_details = plaza_details
        self.private_key = private_key
        self.certificate = certificate
        self.app = app
        self._add_routes()

    async def _generate_xml(self, item, req_time, message_id):
        """
        Generate the XML for the Tag Request API.

        Args:
            item (Item): The input data for the API.
            req_time (str): The request timestamp.
            message_id (str): The unique message ID.

        Returns:
            str: The generated XML string.
        """
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
        async def process_item(item: Item):
            """
            Process the tag request.
            """
            try:
                req_time = Utilities.get_date_time()['CurrentDateTime_s']
                message_id = Utilities.generate_message_id(str(self.plaza_details["PlazaZoneId"]))
                file_name = Utilities.generate_file_path(self.default_directory, None, "RequestTagDetail", message_id)

                # Generate XML
                xml_string = await self._generate_xml(item, req_time, message_id)
                signed_xml = XmlSigner.sign_xml_file(xml_string, file_name, self.private_key, self.certificate)

                # Asynchronous API call
                response = await SendRequest.async_upload_request(
                    signed_xml,
                    f"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestTagDetailsURL']}",
                    certificate_validation=1
                )

                resp_code = XmlSigner.parse_xml_response_tag(response.text, message_id)
                response_data = {"status": "success", "VehicleDetails": resp_code}
                return JSONResponse(content=response_data)

            except Exception as e:
                # Fallback to database stored procedure in case of error
                data = self.dbConnectionObj.execute_stored_procedure("USP_CheacTagStatus", params=[item.TagId])
                if data:
                    data = data[0]
                    allowed = data["RequestCode"] == '00'
                    resp_code = {
                        "TAGID": item.TagId,
                        "REGNUMBER": "XXXXXXXXXX",
                        "TID": "",
                        "VEHICLECLASS": 0,
                        "TAGSTATUS": 0,
                        "EXCCODE": data["RequestCode"],
                        "Allowed": allowed,
                        "COMVEHICLE": 0
                    }
                    response_data = {"status": "success", "VehicleDetails": resp_code}
                    return JSONResponse(content=response_data)
                else:
                    error_message = f"Error processing item: {str(e)}"
                    response_data = {"status": "error", "message": error_message}
                    return JSONResponse(content=response_data, status_code=500)

    def run(self):
        uvicorn.run(self.app, host="0.0.0.0", port=5003)
