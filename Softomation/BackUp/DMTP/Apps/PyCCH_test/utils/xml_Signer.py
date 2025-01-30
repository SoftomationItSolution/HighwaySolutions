from datetime import datetime
from lxml import etree
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading
import xml.etree.ElementTree as ET
from utils.constants import Utilities

class XmlSigner:
    _lock = threading.Lock()  # Class-level lock for thread safety

    @staticmethod
    def sign_xml_file(xml_string, file_name, private_key, certificate):
        try:
            with XmlSigner._lock:
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
            
                with open(file_name, "wb") as signed_file:
                    signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))
                return etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8").decode('utf-8')
        except Exception as e:
            raise Exception(f"Error signing XML: {e}")
        

    @staticmethod
    def parse_xml_response_tag(xml_data,MessageId):
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
            # data = {
            #     "Resp": {
            #         "MessageId":MessageId,
            #         "ResponseCode": resp_code,
            #         "RequestStatusId":RequestStatusId,
            #         "ResponseResult": 2 if resp.attrib.get('result') == 'FAILURE' else 1,
            #         "ResponseDateTime": ''#Utilities.icd_to_mssql_datetime_format(resp.attrib.get('ts'))
            #     },
            #     "Vehicle": {
            #         "VehicleErrorCode": int(vehicle.attrib.get('errCode')),
            #         "VehicleDetails": details
            #     }
            # }
           
            return details
        except Exception as e:
            raise e
        
    @staticmethod    
    def parse_xml_response_tags(xml_data):
        try:
            vehicles = []
            root = ET.fromstring(xml_data)
            resp = root.find('.//Resp')
            if resp is not None:
                vehicle = resp.find('.//Vehicle')
                if vehicle is not None:
                    vehicle_details_list = vehicle.findall('.//VehicleDetails')
                    for vehicle_details in vehicle_details_list:
                        details = {
                            "TAGID": "",
                            "REGNUMBER": "",
                            "TID": "",
                            "VEHICLECLASS": 0,
                            "TAGSTATUS": 0,
                            "EXCCODE": "09",
                            "Allowed": False,
                            "COMVEHICLE": 0
                        }
                        for detail in vehicle_details.findall('.//Detail'):
                            name = detail.attrib.get('name')
                            value = detail.attrib.get('value')
                            if name == "VEHICLECLASS":
                                details[name] = int(value[-1])
                            elif name == "TAGSTATUS":
                                details["Allowed"] = value == "A"
                                details[name] = value
                            elif name == "COMVEHICLE":
                                details[name] = value == "T"
                            elif name == "ISSUEDATE":
                                details[name] = datetime.strptime(value, '%Y-%m-%d')
                            else:
                                details[name] = value
                        details["Allowed"] = Utilities.check_values(details["EXCCODE"])
                        vehicles.append(details)
            return vehicles
        except Exception as e:
            raise e
    
    @staticmethod
    def parse_xml_response_time(xml_data,MessageId):
        try:
            root = ET.fromstring(xml_data)
            resp = root.find('.//Resp')
            resp_code = int(resp.get('respCode'))
            result = resp.get('result')
            ts = Utilities.icd_to_mssql_datetime_format(resp.get('ts'))
            if resp_code==0:
                RequestStatusId=1
                server_time = Utilities.icd_to_mssql_datetime_format(resp.find('.//Time').get('serverTime'))
            else:
                RequestStatusId=2
                server_time=None
            return {"MessageId":MessageId,"RequestStatusId":RequestStatusId,"ResponseCode":resp_code,"ResponseResult":result,"ResponseDateTime":ts,"BankServerDateTime":server_time}
        except Exception as e:
            raise e

    @staticmethod
    def parse_xml_check_status_json(xml_data):
        try:
            root = ET.fromstring(xml_data)
            txn_status_req_list = []
            namespace = {'etc': 'http://npci.org/etc/schema/'}
            statuses = root.findall('.//TxnStatusReqList/Status', namespace)
            if statuses:
                for status in statuses:
                    txn_data = {
                        "txnId": status.get('txnId'),
                        "txnDate": status.get('txnDate'),
                        "plazaId": status.get('plazaId'),
                        "laneId": status.get('laneId'),
                        "result": status.get('result'),
                        "errCode": status.get('errCode', ''),
                        "settleDate": status.get('settleDate'),
                        "TxnList": []
                    }
                    for txn_list in status.findall('TxnList'):
                        txn_list_data = {
                            "txnStatus": txn_list.get('txnStatus'),
                            "txnReaderTime": txn_list.get('txnReaderTime'),
                            "txnType": txn_list.get('txnType', ''),
                            "txnReceivedTime": txn_list.get('txnReceivedTime'),
                            "TollFare": txn_list.get('TollFare', ''),
                            "FareType": txn_list.get('FareType', ''),
                            "VehicleClass": txn_list.get('VehicleClass'),
                            "RegNumber": txn_list.get('RegNumber', ''),
                            "errCode": txn_list.get('errCode', '')
                        }
                        txn_data['TxnList'].append(txn_list_data)
                    txn_status_req_list.append(txn_data)
            return txn_status_req_list
        except Exception as e:
            raise e

    @staticmethod
    def parse_xml_check_status_xml(xml_data):
        try:
            root = ET.fromstring(xml_data)
            txn_status_req_list = root.find('.//TxnStatusReqList')
            if txn_status_req_list is not None:
                return ET.tostring(txn_status_req_list, encoding='unicode')
            else:
                return None
        except Exception as e:
            raise e
