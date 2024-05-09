
from datetime import datetime
import json
import threading
import time
import pkg_resources
import paho.mqtt.client as mqtt
from models.CommonManager import CommonManager
from models.LaneManager import LaneManager
from utils.DataTransfer import DataSynchronization
from utils.avc.soft_avc_data import STPLAVCDataClient
from utils.camera.FrameCapture import RTSPVideoCapture
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.rfid.mantra_rfid_reader import MantraRfidReader
from utils.ufd.Kits_ufd import KistUFDClient
from utils.wim.appalto_wim_data import AppaltoWinDataClient
from utils.wim.na_wim_data import NAWinDataClient
from utils.PingThread import PingThread
from utils.avc.sagar_avc_data import SagarAVCDataClient
from utils.dio.kits_dio_card import KistDIOClient
from pubsub import pub

class LaneEquipmentSynchronization(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj, default_plaza_Id, lane_details, systemSetting, system_ip):
        super().__init__()
        self.logger = CustomLogger(default_directory,'lane_BG')
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.default_plaza_Id=default_plaza_Id
        self.lane_detail=lane_details
        self.systemSetting=systemSetting
        self.default_lane_ip=system_ip
        self.is_running = False
        self.plaza_detail=None
        self.equipment_detail=None
        self.shiftDetails=None
        self.thread = None
        self.dio_thread = None
        self.avc_thread=None
        self.wim_thread=None
        self.rfid_thread=None
        self.ping_thread=None
        self.dts_thread=None
        self.rfid_client_connected=False
        self.mqtt_client_connected=False
        self.ufd=None
        self.LPICCamera=None
        self.ICCamera=None
        self.create_mqtt_obj()
        self.current_Transaction=None
        self.set_logger(default_directory,'lane_BG')
        pub.subscribe(self.lane_trans_start, "lane_process_start")
        pub.subscribe(self.app_log_status, "app_log_status")
      

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="LESyn"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def create_mqtt_obj(self):
        try:
            client_id=Utilities.generate_random_string(10)
            version_str = pkg_resources.get_distribution("paho-mqtt").version
            current_version = Utilities.version_to_tuple(version_str)
            required_version = (2, 0, 0)
            if Utilities.compare_versions(current_version, required_version):
                self.mqtt_client = mqtt.Client(client_id)
            else:
                self.mqtt_client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, client_id)
            self.logger.logInfo(f"Paho MQTT version:{version_str}")
        except Exception as e:
            self.mqtt_client =None
            self.logger.logError(f"Exception {self.classname} create_mqtt_obj: {str(e)}")

    def on_connect(self, client, userdata, flags, rc):
        self.logger.logInfo(f"Connected with result code {rc}")
        self.mqtt_client_connected=True
    
    def on_disconnect(self,client, userdata, rc):
        if rc != 0:
            self.logger.logInfo("mqtt Unexpected disconnection.")
        else:
            self.logger.logInfo("mqtt Disconnected gracefully.")
        self.mqtt_client_connected=False

    def on_message(self, client, userdata, msg):
        self.logger.logInfo(f"Received message: {msg.payload}")

    def on_subscribe(self, topic):
        try:
            self.mqtt_client.subscribe(topic)
            self.logger.logInfo(f"Subscribe topic: {topic}")
        except Exception as e:
            self.mqtt_client =None
            self.logger.logError(f"Exception {self.classname} on_subscribe: {str(e)}")

    def on_unsubscribe(self, topic):
        try:
            self.mqtt_client.unsubscribe(topic)
            self.logger.logInfo("Unsubscribed from topic")
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_unsubscribe: {str(e)}")

    def send_message_to_mqtt(self,topic,data):
        try:
            if self.mqtt_client is not None:
                response_json = json.dumps(data)
                self.mqtt_client.publish(topic, response_json)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} send_message_to_mqtt: {str(e)}")

    def mqtt_on_connet(self,broker_ip,broker_port=1883):
        try:
            print(broker_ip)
            self.mqtt_client.on_connect = self.on_connect
            self.mqtt_client.on_disconnect = self.on_disconnect
            self.mqtt_client.on_message = self.on_message
            self.mqtt_client.connect(broker_ip, broker_port, 60)
            self.mqtt_client.loop_start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_on_connet: {str(e)}")
    
    def start_dio_thread(self,equipment):
        try:
            if not self.dio_thread:
                if equipment["ManufacturerName"]=="KITS":
                    self.dio_thread = KistDIOClient(self,self.default_directory,equipment, 'lane/devicePosition','lane_BG_dio')
                    self.dio_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_dio_thread: {str(e)}")

    def start_avc_thread(self,equipment):
        try:
            if not self.avc_thread:
                if equipment["ManufacturerName"]=="Sagar":
                    self.avc_thread = SagarAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                    self.avc_thread.start()
                elif equipment["ManufacturerName"]=="Softomation":
                    self.avc_thread = STPLAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                    #self.avc_thread.start()
                
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_avc_thread: {str(e)}")

    def start_wim_thread(self,equipment):
        try:
            if not self.wim_thread:
                if equipment["ManufacturerName"]=="NagaArjun":
                    self.wim_thread = NAWinDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_wim')
                    self.wim_thread.start()
                elif equipment["ManufacturerName"]=="Appalto":
                    self.wim_thread = AppaltoWinDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_wim')
                    self.wim_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_wim_thread: {str(e)}")

    def start_rfid_thread(self,equipment):
        try:
            if not self.rfid_thread:
                if equipment["ManufacturerName"]=="Mantra":
                    self.rfid_thread = MantraRfidReader(self,self.default_directory, equipment, 'lane_BG_wim')
                    self.rfid_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_rfid_thread: {str(e)}")

    def start_ping_thread(self):
        try:
            if not self.ping_thread:
                self.ping_thread = PingThread(self, self.equipment_detail, 'lane/deviceStatus',self.default_directory,'lane_BG_ping', interval=60)
                self.ping_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ping_thread: {str(e)}")
    
    def start_dts_thread(self):
        try:
            if not self.dts_thread:
                self.dts_thread=DataSynchronization(self.default_directory, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
                self.dts_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_dts_thread: {str(e)}")

    def stop_dio_thread(self):
        try:
            if self.dio_thread:
                self.dio_thread.stop()
                self.dio_thread.join()
                self.dio_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_dio_thread: {str(e)}")

    def stop_avc_thread(self):
        try:
            if self.avc_thread:
                self.avc_thread.stop()
                self.avc_thread.join()
                self.avc_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_avc_thread: {str(e)}")

    def stop_wim_thread(self):
        try:
            if self.wim_thread:
                self.wim_thread.stop()
                self.wim_thread.join()
                self.wim_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_wim_thread: {str(e)}")

    def stop_rfid_thread(self):
        try:
            if self.rfid_thread:
                self.rfid_thread.stop()
                self.rfid_thread.join()
                self.rfid_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_rfid_thread: {str(e)}")

    def stop_ping_thread(self):
        try:
            if self.ping_thread:
                self.ping_thread.stop()
                self.ping_thread.join()
                self.ping_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ping_thread: {str(e)}")

    def stop_dts_thread(self):
        try:
            if self.dts_thread:
                self.dts_thread.stop()
                self.dts_thread.join()
                self.dts_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ping_thread: {str(e)}")
    
    def GetPlazaDetails(self):
        try:
            self.plaza_detail=CommonManager.GetPlazaDetailsById(self.dbConnectionObj,self.default_plaza_Id)
            if self.plaza_detail is not None:
                self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} GetPlazaDetails: {str(e)}")
            self.plaza_detail=None

    def GetEquipmentDetails(self):
        try:
            if len(self.lane_detail)>0:
                self.equipment_detail=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.lane_detail["LaneId"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} GetEquipmentDetails: {str(e)}")
            self.equipment_detail=None

    def GetshiftDetails(self):
        try:
            self.shiftDetails=CommonManager.GetShiftTimining(self.dbConnectionObj)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} GetshiftDetails: {str(e)}")
            self.shiftDetails=None

    def ConnectLPICCamera(self,equipment):
        try:
            if self.LPICCamera is None:
                self.LPICCamera=RTSPVideoCapture(self.default_directory,"lane_BG_camera",equipment)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ConnectLPICCamera: {str(e)}")

    def ConnectICCamera(self,equipment):
        try:
            if self.ICCamera is None:
                self.ICCamera=RTSPVideoCapture(self.default_directory,"lane_BG_camera",equipment)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} ConnectICCamera: {str(e)}")

    def startUFD(self,equipment):
        try:
            if self.ufd is None:
                if equipment["ManufacturerName"]=="KITS":
                    self.ufd=KistUFDClient(self,self.default_directory,'lane_BG_ufd',equipment)
                    self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} UFD_start: {str(e)}")

    def loop_function(self):
        while self.is_running:
            try:
                self.start_dts_thread()
                if self.plaza_detail is None:
                    self.GetPlazaDetails()
                else:
                    if self.mqtt_client_connected==False:
                        self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
                if self.shiftDetails is None:
                    self.GetshiftDetails()
                if self.equipment_detail is None:
                    self.GetEquipmentDetails()
                else:
                    for equipment in self.equipment_detail:
                        if equipment["EquipmentTypeId"]==4:
                            self.start_wim_thread(equipment)
                        elif equipment["EquipmentTypeId"]==5:
                            self.start_rfid_thread(equipment)
                        elif equipment["EquipmentTypeId"]==7:
                            self.start_dio_thread(equipment)
                        elif equipment["EquipmentTypeId"]==15:
                            self.ConnectLPICCamera(equipment)
                        elif equipment["EquipmentTypeId"]==16:
                            self.ConnectICCamera(equipment)
                        elif equipment["EquipmentTypeId"]==18:
                            self.startUFD(equipment)
                        elif equipment["EquipmentTypeId"]==21:
                            self.start_avc_thread(equipment)
                    self.start_ping_thread()
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} loop_function: {str(e)}")
            finally:
                if self.is_running == False:
                    break
            time.sleep(0.100)

   

    def run(self):
        if self.is_running == False:
            self.is_running = True
        self.loop_function()

    # def on_start(self):
    #     try:
    #         if not self.is_running:
    #             self.is_running = True
    #             self.thread = threading.Thread(target=self.loop_function)
    #             self.thread.start()
    #             self.logger.logInfo("Lane Equipment Synchronization started.")
    #     except Exception as e:
    #         self.logger.logError(f"Exception {self.classname} start_avc_thread: {str(e)}")

    def on_stop(self):
        try:
            if self.is_running:
                self.is_running = False
                self.stop_dio_thread() 
                self.stop_avc_thread()
                self.stop_wim_thread()
                self.stop_rfid_thread()
                self.stop_ping_thread()
                self.stop_dts_thread()
                self.LPICCamera.stop_capture()
                self.ICCamera.stop_capture()
                self.mqtt_client.disconnect()
                self.plaza_detail=None
                self.lane_detail=None
                self.equipment_detail=None
                self.is_running = False
                self.rfid_client_connected=False
                self.mqtt_client_connected=False
                self.logger.log_info("Lane Equipment Synchronization stopped.")
                self.thread.join()
                self.thread=None
                print('Lane Equipment Synchronization is stopped.')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_stop: {str(e)}")
            print(f'going to stop is_running {str(e)}')

    def avc_data_process(self, transactionInfo):
        try:
            resultData=LaneManager.lane_data_insert(self.dbConnectionObj,transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} avc_data_process: {str(e)}")

    
    def app_log_status(self, transactionInfo):
         if self.dio_thread is not None:
                    self.dio_thread.ohls_status(transactionInfo)

    def lane_trans_start(self, transactionInfo):
        try:
            if self.ufd is not None:
                self.LPICCamera.take_only_screenshot(transactionInfo['LaneTransactionId']+'_lpic.jpg','lpic')
                self.ufd.clear_cmd()
                self.ufd.go_cmd()
                self.ufd.l1_cmd(transactionInfo["TransactionTypeName"])
                if transactionInfo["TransactionTypeId"]==1:
                    self.ufd.l2_cmd(f'{transactionInfo["TagClassId"]} {transactionInfo["TagPlateNumber"]}')
                else:
                    self.ufd.l2_cmd(f'Toll Fare: {transactionInfo["TransactionAmount"]}')
            if self.dio_thread is not None:
                    self.dio_thread.lane_trans_start(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_start: {str(e)}")

    def start_lpic_record(self,transactionInfo):
        try:
            self.LPICCamera.record_video('lpic',transactionInfo['LaneTransactionId']+'_lpic',duration=0, snapshot=False)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_lpic_record: {str(e)}")
    
    def stop_lpic_record(self):
        try:
            self.LPICCamera.stop_recording(snapshot=True)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_lpic_record: {str(e)}")

    def start_ic_record(self,transactionInfo):
        try:
            self.ICCamera.record_video('ic',transactionInfo['LaneTransactionId']+'_ic',duration=0, snapshot=False)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ic_record: {str(e)}")

    def stop_ic_record(self):
        try:
            self.ICCamera.stop_recording(snapshot=True)
            
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ic_record: {str(e)}")

    def screenshort_ic(self,transactionInfo):
        try:
            return self.ICCamera.take_only_screenshot(transactionInfo['LaneTransactionId']+'_ic.png','ic')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} screenshort_ic: {str(e)}")
            return False
    
    def reset_default_ufd(self):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.stop_cmd()
                if self.plaza_detail is not None:
                    self.ufd.single_line_cmd(f'Welcome to {self.plaza_detail["PlazaName"]}')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} reset_default_ufd: {str(e)}")

    def create_fasTag_trans(self,transData,IsReadByReader,TagStatus):
        try:
            self.current_trans()
            if self.lane_detail is not None:
                self.setDefaultValue()
                self.current_Transaction["TransactionTypeId"]= 1
                self.current_Transaction["TagEPC"]= transData["EPC"]
                self.current_Transaction["RCTNumber"]= transData["TID"]
                self.current_Transaction["TagClassId"]=  transData["Class"]
                self.current_Transaction["TagPlateNumber"]= transData["Plate"]
                self.current_Transaction["TagReadDateTime"]= transData["TransactionDateTime"]
                self.current_Transaction["TagReadCount"]=  0
                self.current_Transaction["IsReadByReader"]= IsReadByReader
                self.current_Transaction["TransactionTypeId"]= 1
                self.current_Transaction["VehicleClassId"]= transData["Class"]
                self.current_Transaction["VehicleSubClassId"]= transData["Class"]
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} reset_default_ufd: {str(e)}")

    def create_wim_txn(self,wt):
        ct=datetime.now()
        self.current_trans()
        if self.lane_detail is not None:
            self.setDefaultValue()
            self.current_Transaction["ActualVehicleWeight"]= wt
            self.current_Transaction["VehicleAvcClassId"]= 0
            self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
            self.current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
        
    def create_violation_trans(self):
        try:
            if self.current_Transaction is None:
                ct=datetime.now()
                self.current_trans()
                if self.lane_detail is not None:
                    self.setDefaultValue()
                    self.current_Transaction["TransactionTypeId"]= 4
                    self.current_Transaction["VehicleAvcClassId"]= 0
                    self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                    self.current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
            else:
                self.current_Transaction["TransactionTypeId"]= 4
            lID=self.current_Transaction["LaneTransactionId"]
            res=self.screenshort_ic(self.current_Transaction)
            if res:
                self.current_Transaction["TransactionBackImage"]=f"{self.current_Transaction['LaneTransactionId']}_ic.png"
            resultData=LaneManager.lane_data_insert(self.dbConnectionObj,self.current_Transaction)
            self.avc_thread.getavc(lID)
            self.logger.logInfo(f"create_violation_trans: {resultData}") 
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} create_violation_trans: {str(e)}")
        finally:
            self.current_Transaction=None

    def setDefaultValue(self):
        try:
            self.current_Transaction["LaneId"] = self.lane_detail["LaneId"]
            self.current_Transaction["LaneName"] = self.lane_detail["LaneName"]
            self.current_Transaction["PlazaName"] = self.lane_detail["PlazaName"]
            self.current_Transaction["LaneStatusId"] = self.lane_detail["LaneStatusId"]
            self.current_Transaction["LaneModeId"] = self.lane_detail["LaneModeId"]
            self.current_Transaction["SystemIntegratorId"] = self.lane_detail["SystemIntegratorId"]
            self.current_Transaction["LaneDirectionId"] = self.lane_detail["LaneDirectionId"]
            self.current_Transaction["PlazaId"] = self.systemSetting["DefaultPlazaId"]
            self.current_Transaction["ShiftId"] = self.get_current_shift()
        except Exception as e:
            raise e

    def get_current_shift(self):
        ShiftId=0
        try:
            current_datetime = datetime.now()
            current_date = current_datetime.strftime('%d-%b-%Y')
            current_date_time = current_datetime.strftime('%d-%b-%Y %H:%M:%S')
            date_format = "%d-%b-%Y %H:%M:%S"
            if self.shiftDetails is None or len(self.shiftDetails) == 0:
                ShiftId=0
            for shift in self.shiftDetails:
                start_datetime = datetime.strptime(current_date + ' ' + shift['StartTimmng'], date_format)
                end_datetime = datetime.strptime(current_date + ' ' + shift['EndTimming'], date_format)
                formatted_datetime = datetime.strptime(current_date_time, date_format)
                if start_datetime <= formatted_datetime <= end_datetime:
                    ShiftId=shift['ShiftId']
                    break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_current_shift: {str(e)}")
        finally:
            return ShiftId
    
    def current_trans(self):
        try:
            self.current_Transaction = {
                "LaneTransactionId": 0,
                "SystemIntegratorId": 0,
                "JourneyId": 0,
                "PlazaId": 0,
                "LaneId": 0,
                "LaneStatusId": True,
                "LaneModeId": True,
                "LaneDirectionId":0,
                "ShiftId": 0,
                "TransactionTypeId": 0,
                "PaymentTypeId": 0,
                "ExemptTypeId": 0,
                "ExemptSubTypeId": 0,
                "VehicleClassId": 0,
                "VehicleSubClassId": 0,
                "VehicleAvcClassId": 0,
                "PlateNumber": "",
                "RCTNumber": "",
                "TagEPC": "",
                "TagClassId": 0,
                "TagPlateNumber": "",
                "TagReadDateTime": Utilities.current_date_time_json(),
                "TagReadCount": 0,
                "IsReadByReader": False,
                "PermissibleVehicleWeight": 0.00,
                "ActualVehicleWeight": 0.00,
                "IsOverWeightCharged": False,
                "OverWeightAmount": 0.00,
                "TagPenaltyAmount": 0.00,
                "TransactionAmount": 0.00,
                "TransactionDateTime": Utilities.current_date_time_json(),
                "TransactionFrontImage": "",
                "TransactionBackImage": "",
                "TransactionAvcImage": "",
                "TransactionVideo": "",
                "ExemptionProofImage": "",
                "DestinationPlazaId": 0,
                "UserId": 0,
                "LoginId": 'sys-admin',
                "IsReturnJourney": False,
                "IsExcessJourney": False,
                "IsBarrierAutoClose": True,
                "IsTowVehicle": False,
                "IsFleetTranscation": False,
                "FleetCount": 0,
                "PlazaName": "",
                "LaneName":"",
                "TransactionTypeName": "",
                "PaymentTypeName": "",
                "ExemptTypeName":"",
                "ExemptSubTypeName":"",
                "VehicleClassName": "",
                "VehicleSubClassName": "",
            }
        except Exception as e:
            raise e