import time
import threading
from utils.constants import Utilities
from utils.log_master import CustomLogger
from xml.etree.ElementTree import ElementTree,Element, SubElement, register_namespace
from utils.send_request import SendRequest
from utils.xml_Signer import XmlSigner


class RequestPayAPI(threading.Thread):
    def __init__(self, dbConnectionObj,default_directory,plaza_details,icd_api_detail,currecy_code,private_key, certificate, additional_certificates):
        super().__init__()
        self.flag = True
        self.dbConnectionObj = dbConnectionObj
        self.default_directory=default_directory
        self.plaza_details=plaza_details
        self.icd_api_detail=icd_api_detail
        self.currecy_code=currecy_code
        self.private_key=private_key
        self.certificate=certificate
        self.additional_certificates=additional_certificates
        self.set_logger(default_directory,"icd_requestPay_service")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

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

    def create_entry_Txn(self,txn,row):
        try:
            entry_txn = SubElement(txn, "EntryTxn")
            entry_txn.set("id", str(row["TransactionId"]))
            entry_txn.set("ts", Utilities.icd_datetime_format(row["TransactionDateTime"])) #YYYY-MM-DDThh:mm:ss
            entry_txn.set("tsRead", Utilities.icd_datetime_format(row["TagReadDateTime"])) #YYYY-MM-DDThh:mm:ss
            entry_txn.set("type", str(row["TransactionTypeName"]))
            return entry_txn
        except Exception as e:
            raise e

    def create_plaza(self,root,row):
        try:
            plaza = SubElement(root, "Plaza")
            plaza.set("geoCode", f"{str(row['Latitude'])},{str(row['Longitude'])}")
            plaza.set("id", str(row["PlazaZoneId"]))
            plaza.set("name", str(row["PlazaName"]))
            plaza.set("subtype", str(row["PlazaSubType"]))
            plaza.set("type", str(row["PlazaType"]))
            return plaza
        except Exception as e:
            raise e
   
    def create_entry_plaza(self,plaza,row):
        try:
            entry_plaza = SubElement(plaza, "EntryPlaza")
            entry_plaza.set("geoCode", f"{str(row['Latitude'])},{str(row['Longitude'])}")
            entry_plaza.set("id", str(row["PlazaZoneId"]))
            entry_plaza.set("name", str(row["PlazaName"]))
            entry_plaza.set("subtype", str(row["PlazaSubType"]))
            entry_plaza.set("type", str(row["PlazaType"]))
            return entry_plaza
        except Exception as e:
            raise e

    def create_lane(self,root,row):
        try:
            lane = SubElement(root, "Lane")
            lane.set("id", str(row["LaneCode"]))
            lane.set("direction", str(row["LaneDirectionCode"]))
            lane.set("readerId", str(row["ReaderId"]))
            lane.set("Status", str(row["LaneStatusName"]))
            lane.set("Mode", str(row["LaneModeName"]))
            lane.set("laneType", str(row["LaneTypeName"]))
            lane.set("ExiteGate", "")
            lane.set("Floor", "")
            return lane
        except Exception as e:
            raise e

    def create_entry_lane(self,root,row):
        try:
            entry_lane = SubElement(root, "EntryLane")
            entry_lane.set("id", str(row["LaneCode"]))
            entry_lane.set("direction", str(row["LaneDirectionCode"]))
            entry_lane.set("readerId", str(row["ReaderId"]))
            entry_lane.set("Status", str(row["LaneStatusName"]))
            entry_lane.set("Mode", str(row["LaneModeName"]))
            entry_lane.set("laneType", str(row["LaneTypeName"]))
            entry_lane.set("ExiteGate", "")
            entry_lane.set("Floor", "")
            return entry_lane
        except Exception as e:
           raise e

    def create_reader_verification(self,root,row):
        try:
            reader_verification = SubElement(root, "ReaderVerificationResult")
            reader_verification.set("ts", Utilities.icd_datetime_format(row["TagReadDateTime"])) #YYYY-MM-DDThh:mm:ss
            reader_verification.set("signAuth", str(row["ReaderSignAuth"])) #VALID/INVALID/NOT_VERIFIED
            reader_verification.set("tagVerified", str(row["ReaderTagVerified"]))
            reader_verification.set("procRestrictionResult", str(row["ReaderProcRestrictionResult"]))
            reader_verification.set("vehicleAuth", str(row["ReaderVehicleAuth"])) #YES/NO/UNKNOWN
            reader_verification.set("txnCounter", str(row["TxnCounter"])) #transaction counter for the lane controller.
            reader_verification.set("txnStatus", str(row["LaneTransactionStatus"]))
            reader_verification.set("publicKeyCVV", str(row["ReaderPublicKeyCVV"]))
            return reader_verification
        except Exception as e:
            raise e

    def create_detail_1(self,tag_user_memory,row):
        try:
            detail1 = SubElement(tag_user_memory, "Detail")
            detail1.set("name", "TagSignature")
            detail1.set("value", str(row["TagEPC"]).upper())
            return detail1
        except Exception as e:
            raise e
        
    def create_detail_2(self,tag_user_memory,row):
        try:
            detail2 = SubElement(tag_user_memory, "Detail")
            detail2.set("name", "TagVRN")
            detail2.set("value", str(row["TagPlateNumber"]))
            return detail2
        except Exception as e:
            raise e

    def create_detail_3(self,tag_user_memory,row):
        try:
            detail3 = SubElement(tag_user_memory, "Detail")
            detail3.set("name", "TagVC")
            detail3.set("value", str(row["TagClassId"]))
            return detail3
        except Exception as e:
            raise e

    def create_vehicle(self,root,row):
        try:
            vehicle = SubElement(root, "Vehicle")
            vehicle.set("TID", str(row["TID"]).upper())
            vehicle.set("tagId", str(row["TagEPC"]).upper())
            vehicle.set("staticweight", str(row["PermissibleVehicleWeight"]))
            vehicle.set("wim", str(row["ActualVehicleWeight"]))
            return vehicle
        except Exception as e:
            raise e

    def create_detail_4(self,vehicle_details,row):
        try:
            detail4 = SubElement(vehicle_details, "Detail")
            detail4.set("name", "AVC")
            detail4.set("value", str(row["VehicleAvcClassId"]))
            return detail4
        except Exception as e:
            raise e

    def create_detail_5(self,vehicle_details,row):
        try:
            detail5 = SubElement(vehicle_details, "Detail")
            detail5.set("name", "LPNumber")
            detail5.set("value", str(row["TagPlateNumber"]))
            return detail5
        except Exception as e:
            raise e

    def create_payment(self,payment,row):
        try:
            amount = SubElement(payment, "Amount")
            amount.set("curr", self.currecy_code) 
            amount.set("value", str(row["TransactionAmount"]))
            amount.set("PriceMode", "POINT") #DISTANCE/POINT/CUSTOM
            amount.set("IsOverWeightCharged", str(row["IsOverWeightCharged"])) #TRUE/FALSE
            amount.set("PaymentMode", str(row["PaymentMode"])) #Tag/Cash/Card/QRCode/Other
            return amount
        except Exception as e:
            raise e

    def create_overweight_payment(self,amount,row):
        try:
            overweight_amount = SubElement(amount, "OverwightAmount")
            overweight_amount.set("curr", self.currecy_code)
            overweight_amount.set("value", str(row["OverWeightAmount"]))
            overweight_amount.set("PaymentMode", str(row["OverwightPaymentMode"])) #Tag/Cash/Card/QRCode/Other
        except Exception as e:
            raise e

    def generate_xml(self, row):
        try:
            file_name=Utilities.generate_file_path(self.default_directory,row["TagReadDateTime"],"Pay",row['MessageId'])
            if Utilities.check_file_exists(file_name)==False:
                namespace = "http://npci.org/etc/schema/"
                register_namespace("etc", namespace)

                root = Element("{http://npci.org/etc/schema/}ReqPay")
                req_time=Utilities.get_date_time()['CurrentDateTime_s']
                # Head Section
                head = SubElement(root, "Head")
                head.set("msgId", str(row['MessageId']))
                head.set("orgId", str(row['OrganizationId']))
                head.set("ts", str(req_time))
                head.set("ver", self.icd_api_detail["Version"])
                SubElement(root, "Meta")
                txn=self.create_Txn(root,row)
                entry_txn=self.create_entry_Txn(txn,row)
                plaza=self.create_plaza(root,row)
                entry_plaza=self.create_entry_plaza(plaza,row)
                
                lane=self.create_lane(plaza,row)
                entry_lane=self.create_entry_lane(plaza,row)
                
                reader_verification=self.create_reader_verification(plaza,row)

                tag_user_memory = SubElement(reader_verification, "TagUserMemory")
                detail1=self.create_detail_1(tag_user_memory,row)
                detail2=self.create_detail_2(tag_user_memory,row)
                detail3=self.create_detail_3(tag_user_memory,row)
                
                vehicle=self.create_vehicle(root,row)
                
                vehicle_details = SubElement(vehicle, "VehicleDetails")
                detail4=self.create_detail_4(vehicle_details,row)
                detail5=self.create_detail_5(vehicle_details,row)
            

                payment = SubElement(root, "Payment")
                amount=self.create_payment(payment,row)
                overweight_amount=self.create_overweight_payment(amount,row)
                xml_string = Utilities.prettify_xml(root)
                
                signed_xml = XmlSigner.sign_xml_file(xml_string, file_name,self.private_key, self.certificate)
                  
            else:
                tree = ElementTree()
                tree.parse(file_name)
                signed_xml = Utilities.prettify_xml(tree.getroot())
                req_time=Utilities.get_date_time()['CurrentDateTime_s']

            if signed_xml:    
                try:
                    response=SendRequest.upload_request(signed_xml, F"{self.icd_api_detail['BaseUrl']}{self.icd_api_detail['RequestPayURL']}")
                    if response.ok:
                        self.update_status(row['MessageId'],"1",req_time)
                    else:
                        self.logger.logError(f"Error: txn {row['MessageId']} failed with StatusCode {response.status_code}, StatusDescription: {response.text}")
                        self.update_status(row['MessageId'],"2",req_time)
                except Exception as e:
                    self.logger.logError(f"Error send RequestPayAPI {row['MessageId']}: {e}")
                    self.update_status(row['MessageId'],"3",req_time)
        except Exception as e:
            self.logger.logError(f"Error generating XML RequestPayAPI {row['MessageId']}: {e}")

    def update_status(self,MessageId,statusId,req_time):
        try:
            formatted_date = Utilities.icd_to_mssql_datetime_format(req_time)
            self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestPayUpdateRequest",params=[MessageId, statusId,formatted_date])
        except Exception as e:
            self.logger.logError(f"Error send update_status {MessageId}: {e}")

    def run(self):
        while self.flag:
            try:
                data = self.dbConnectionObj.execute_stored_procedure("USP_ICDRequestPayGetPending")
                if data:
                    for row in data:
                        self.generate_xml(row)
                        time.sleep(0.100)
                time.sleep(0.100)
            except Exception as e:
                self.logger.logError(f"Error in process loop: {e}")

    def stop(self):
        self.flag = False
        self.logger.logInfo("Stopping the thread.")
