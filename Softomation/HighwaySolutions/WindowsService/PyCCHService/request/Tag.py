import time
import threading
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import Element, SubElement, register_namespace


class RequestTagAPI(threading.Thread):
    def __init__(self, db_manager,default_directory,api_detail,api_version,currecy_code):
        super().__init__()
        self.flag = True
        self.db_manager = db_manager
        self.default_directory=default_directory
        self.api_detail=api_detail
        self.api_version=api_version
        self.currecy_code=currecy_code
        self.set_logger(default_directory,"cch_requestTag_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def fetch_data(self, procedure_name):
        try:
            # Get the connection from MSSQLConnectionManager
            connection = self.db_manager.get_connection()
            cursor = connection.cursor(dictionary=True)
            cursor.callproc(procedure_name)

            data = []
            for result in cursor.stored_results():
                data.extend(result.fetchall())

            return data

        except Exception as e:
            self.logger.error(f"Error fetching data: {e}")
            return []

        finally:
            cursor.close()
            connection.close()

    def create_Txn(self,parent,row):
        try:
            txn = SubElement(parent, "Txn")
            txn.set("id", str(row["TransactionId"]))
            txn.set("note", str(row["Note"]))
            txn.set("refId", str(row["RefId"]))
            txn.set("refUrl", str(row["RefUrl"]))
            txn.set("ts", Utilities.icd_datetime_format(row["TransactionDateTime"])) #YYYY-MM-DDThh:mm:ss
            txn.set("type", str(row["TransactionTypeName"]))
            txn.set("orgTxnId", str(row["OrganizationId"]))
            return txn
        except Exception as e:
            raise e
    

    def create_vehicle(self,root,row):
        try:
            vehicle = SubElement(root, "Vehicle")
            vehicle.set("TID", str(row["TID"]).upper())
            vehicle.set("vehicleRegNo", str(row["VRN"].upper()))
            vehicle.set("tagId", str(row["TagEPC"]).upper())
            return vehicle
        except Exception as e:
            raise e

    
    def generate_xml(self, row):
        try:
            namespace = "http://npci.org/etc/schema/"
            register_namespace("etc", namespace)

            root = Element("{http://npci.org/etc/schema/}ReqTag")
            req_time=Utilities.get_date_time()['CurrentDateTime_s']
            # Head Section
            head = SubElement(root, "Head")
            head.set("msgId", str(row['MessageId']))
            head.set("orgId", str(row['OrganizationId']))
            head.set("ts", str(req_time))
            head.set("ver", self.api_version)
            txn=self.create_Txn(root,row)

            xml_string = Utilities.prettify_xml(root)
            file_name=Utilities.generate_file_path(self.default_directory,row["TagReadDateTime"],self.api_detail["apiName"],row['MessageId'])
            # with open(file_name, "w") as f:
            #     f.write(xml_string)
            # print(file_name)
            #XmlSigner.sign_xml_file(xml_string, file_name)
            #SendXMLFile_requesttag(SignedFileName, ReqTagUrl, 1000, _Txnnumbertoupdate, FileName, MsgId);       

        except Exception as e:
            self.logger.logError(f"Error generating XML RequestTagAPI: {e}")

    def run(self):
        while self.flag:
            try:
                data = self.db_manager.execute_stored_procedure("USP_ICDTagDetailsPendingRequest")
                if data:
                    for row in data:
                        self.generate_xml(row)
                        time.sleep(0.100)
                time.sleep(0.100)
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.info("Stopping the thread.") 
