from datetime import datetime
import json
import os
import uuid
from xml.dom import minidom
from lxml import etree
import psutil
import requests
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading
import xml.etree.ElementTree as ET

class Utilities:
    _lock = threading.Lock()
    anual_not_allowed = ["05", "06", "08"]
    not_allowed = ["01", "03", "05", "06"]
    allowed = ["00", "02", "04", "07"]
    
    @staticmethod
    def pid_exists(pid):
        return psutil.pid_exists(pid)
    
    @staticmethod
    def kill_process(pid):
        try:
            process = psutil.Process(pid)
            process.terminate()
            return True
        except psutil.NoSuchProcess:
            return True
    
    # @staticmethod
    # def check_values(values):
    #     values=values.split(',')
    #     for value in values:
    #         if value in Utilities.not_allowed:
    #             return False
    #         if value in Utilities.allowed:
    #             continue
    #         return False
    #     return True

    @staticmethod
    def check_values(values):
        values = values.split(',')
        if "07" in values:
            for value in values:
                if value in Utilities.anual_not_allowed:
                    return False
            return True
        else:
            for value in values:
                if value in Utilities.not_allowed:
                    return False
                if value in Utilities.allowed:
                    continue
                return False  
        return True

    
    @staticmethod
    def read_json_file(file_path):
        try:
            if os.path.exists(file_path):
                with open(file_path, 'r') as file:
                    return json.load(file)
            return None
        except FileNotFoundError:
            print(f"Error: File not found at {file_path}")
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON in {file_path}: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    @staticmethod    
    def generate_txn_id():
        unique_id = str(uuid.uuid4())
        message_id = unique_id.replace('-', '')[:22].upper()
        return message_id

    @staticmethod    
    def generate_message_id(PlazaZoneId):
        current_datetime = datetime.now()
        formatted_date_str = current_datetime.strftime("%d%m%y%H%M%S")
        return f'{PlazaZoneId}{formatted_date_str}'
    
    @staticmethod
    def get_date_time():
        CurrentDateTime = datetime.now()
        CurrentDateTime_s = CurrentDateTime.strftime("%Y-%m-%dT%H:%M:%S")
        CurrentDateTime_ms = CurrentDateTime.strftime("%Y-%m-%dT%H:%M:%S.%MS")
        return {
            "CurrentDateTime_ms": CurrentDateTime_ms,
            "CurrentDateTime_s": CurrentDateTime_s
        }
    
    @staticmethod
    def folder_datetime_format(timestamp_ms):
        timestamp_s = timestamp_ms / 1000
        dt = datetime.utcfromtimestamp(timestamp_s)
        formatted_dt = dt.strftime('%Y_%m_%d')
        return formatted_dt

    
    @staticmethod
    def generate_file_path(default_directory,timestamp_ms,apiName,MessageId):
        try:
            apiName=apiName.replace(' ', '')
            if timestamp_ms is None:
                current_utc = datetime.utcnow()
                timestamp_ms = int(current_utc.timestamp() * 1000)
            directory_path = os.path.join(default_directory,"Request",Utilities.folder_datetime_format(timestamp_ms),apiName)
            os.makedirs(directory_path, exist_ok=True)
            return os.path.join(directory_path, f"{MessageId}.xml")
        except Exception as e:
            raise e

    @staticmethod
    def upload_request(xml_data, uri, timeout=3000, certificate_validation=0):
        try:
            session = requests.Session()
            session.headers.update({'Content-Type': 'application/xml'})
            if certificate_validation == 1:
                session.verify = False
            response = session.post(uri, data=xml_data, timeout=timeout)
            return response
        except requests.RequestException as ex:
            raise ex


    
    @staticmethod
    def prettify_xml(elem):
        try:
            rough_string = ET.tostring(elem, 'utf-8')
            reparsed = minidom.parseString(rough_string)
            return reparsed.toprettyxml(indent="  ")
        except Exception as e:
            print(f"Error prettifying XML: {e}")
            raise

    
    @staticmethod
    def sign_xml_file(xml_string, file_name, private_key, certificate):
        try:
            with Utilities._lock:
                parser = etree.XMLParser(remove_blank_text=True)
                doc = etree.fromstring(xml_string, parser)
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
                
                if file_name!='':
                    with open(file_name, "wb") as signed_file:
                        signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))
                return etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8").decode('utf-8')
        except Exception as e:
            raise Exception(f"Error signing XML: {e}")

    
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
                        details = {"TAGID": "","REGNUMBER": "","TID": "","VEHICLECLASS": 0,
                                   "TAGSTATUS": 0,"EXCCODE": "09","Allowed": False,"COMVEHICLE": 0}
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