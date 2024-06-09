
from datetime import datetime
import json
import threading
import time
import pkg_resources
import paho.mqtt.client as mqtt
from models.CommonManager import CommonManager
from models.LaneManager import LaneManager
from utils.DataTransfer import DataSynchronization
from utils.Desktop import DesktopApp
from utils.api import FlaskApiApp
from utils.avc.soft_avc_data import STPLAVCDataClient
from utils.camera.CameraHandler import CameraHandler
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
    def __init__(self, default_directory, dbConnectionObj, script_dir, system_ip):
        super().__init__()
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.script_dir = script_dir
        self.default_lane_ip = system_ip
        self.set_logger(default_directory,'lane_BG')
        self.default_plaza_Id=0
        self.LaneTypeId=1
        self.is_running = True
        self.app_thread=None
        self.api_thread=None
        self.lane_detail=None
        self.systemSetting=None
        self.plaza_detail=None
        self.vehicle_class=None
        self.equipment_detail=None
        self.toll_fare=None
        self.shiftDetails=None
        self.current_shift=None
        self.userDetails=None
        self.thread = None
        self.dio_thread = None
        self.avc_thread=None
        self.wim_thread=None
        self.rfid_thread=None
        self.ping_thread=None
        self.dts_thread=None
        self.ufd=None
        self.lpic_thread=None
        self.ic_thread=None
        self.dio_events=None
        self.mqtt_topic=None
        self.current_Transaction=None
        self.running_Transaction=None
        self.rfid_client_connected=False
        self.mqtt_client_connected=False
        self.system_loging_status=False
        self.system_transcation_status=False
        self.ufd_message=""
        self.rfid_data=[]
        self.wim_data=[]
        self.avc_data=[]
        self.transaction_data=[]
        self.create_mqtt_obj()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="LESyn"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def create_mqtt_obj(self):
        try:
            if self.lane_detail:
                self.mqtt_topic=self.lane_detail["LaneName"]+'/laneStatus'
                self.LaneTypeId=int(self.lane_detail["LaneTypeId"])
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
        try:
            self.logger.logInfo(f"Connected with result code {rc}")
            self.mqtt_client_connected=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_connect: {str(e)}")
    
    def on_disconnect(self,client, userdata, rc):
        try:
            if rc != 0:
                self.logger.logInfo("mqtt Unexpected disconnection.")
            else:
                self.logger.logInfo("mqtt Disconnected gracefully.")
            self.mqtt_client_connected=False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_disconnect: {str(e)}")

    def on_message(self, client, userdata, msg):
        try:
            self.logger.logInfo(f"Received message: {msg.payload}")
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_message: {str(e)}")

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
                if self.mqtt_topic is not None:
                    self.mqtt_client.publish(topic, response_json)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} send_message_to_mqtt: {str(e)}")

    def mqtt_on_connet(self,broker_ip,broker_port=1883):
        try:
            self.mqtt_client.on_connect = self.on_connect
            self.mqtt_client.on_disconnect = self.on_disconnect
            self.mqtt_client.on_message = self.on_message
            self.mqtt_client.connect(broker_ip, broker_port, 60)
            self.mqtt_client.loop_start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_on_connet: {str(e)}")
    
    def publish_data(self,topic,data):
        try:
            if self.LaneTypeId!=3:
                pub.sendMessage(topic, transactionInfo=data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} topic:{topic} publish_data: {str(e)}")

    def mqtt_dio_event(self):
        try:
            res={"event_type":"dio","data":self.get_lane_status()}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_dio_event: {str(e)}")
    
    def mqtt_ufd_event(self):
        try:
            res={"event_type":"ufd","data":self.ufd_message}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_ufd_event: {str(e)}")

    def mqtt_wim_event(self,data):
        try:
            res={"event_type":"wim","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_wim_event: {str(e)}")
    
    def mqtt_avc_event(self,data):
        try:
            res={"event_type":"avc","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_avc_event: {str(e)}")

    def mqtt_rfid_event(self,data):
        try:
            res={"event_type":"rfid","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_rfid_event: {str(e)}")

    def mqtt_ping_event(self,data):
        try:
            res={"event_type":"ping","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} mqtt_ping_event: {str(e)}")
    
    def get_lane_status(self):
        try:
            if self.dio_events is not None:
                data={"app_loging":self.system_loging_status,"OHLS_light":self.dio_events[0]["Status"],
                  "TrafficLight":self.dio_events[1]["Status"],"BoomBarrier":self.dio_events[2]["Status"],
                  "ViolationStatus":self.dio_events[3]["Status"],"equipment_detail":self.equipment_detail}
                return data 
            else:
                return None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_lane_status: {str(e)}") 

    def app_log_status(self, transactionInfo):
        try:
            self.system_loging_status=transactionInfo
            self.rfid_data=[]
            self.wim_data=[]
            self.avc_data=[]
            self.transaction_data=[]
            if self.dio_thread is not None:
                self.dio_thread.reset_command()
                self.dio_thread.handel_ohls_light(transactionInfo)
                self.dio_thread.app_log_status(transactionInfo)
            if self.rfid_thread is not None:
                self.rfid_thread.processed_epcs={}
            self.mqtt_dio_event()
            self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} app_log_status: {str(e)}")

    def update_user(self, transactionInfo):
        try:
            self.userDetails=json.loads(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_user: {str(e)}")
    
    def run_desktop_app(self):
        try:
            if self.app_thread is None and self.equipment_detail is not None and self.vehicle_class is not None and self.shiftDetails is not None and self.toll_fare is not None:
                if self.lane_detail.get("LaneTypeId") != 3:
                    self.app_thread = DesktopApp(self)
                    self.app_thread.start_app()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_desktop_app: {str(e)}")

    def stop_desktop_app(self):
        try:
            if self.app_thread is not None:
                self.app_thread.stop_app()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_desktop_app: {str(e)}")

    
    def run_lane_api(self):
        try:
            if self.api_thread is None:
                self.api_thread = FlaskApiApp(self.default_directory,self.script_dir, self.logger,self)
                self.api_thread.start_app()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} run_lane_api: {str(e)}")

    def stop_lane_api(self):
        try:
            if self.api_thread is not None:
                self.api_thread.stop_app()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_lane_api: {str(e)}")

    
    def start_dio_thread(self,equipment):
        try:
            if not self.dio_thread:
                if equipment["ManufacturerName"]=="KITS":
                    self.dio_thread = KistDIOClient(self,self.default_directory,equipment,self.system_loging_status,'lane_BG_dio')
                    self.dio_events=self.dio_thread.out_labels
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
                    self.mqtt_dio_event()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_dio_thread: {str(e)}")

    def start_avc_thread(self,equipment):
        try:
            if not self.avc_thread:
                if equipment["ManufacturerName"]=="Sagar":
                    self.avc_thread = SagarAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                    self.avc_thread.daemon=True
                    self.avc_thread.start()
                elif equipment["ManufacturerName"]=="Softomation":
                    self.avc_thread = STPLAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                    self.avc_thread.daemon=True
                    self.avc_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_avc_thread: {str(e)}")

    def start_wim_thread(self,equipment):
        try:
            if not self.wim_thread:
                if equipment["ManufacturerName"]=="NagaArjun":
                    self.wim_thread = NAWinDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_wim')
                    self.wim_thread.daemon=True
                    self.wim_thread.start()
                elif equipment["ManufacturerName"]=="Appalto":
                    self.wim_thread = AppaltoWinDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_wim')
                    self.wim_thread.daemon=True
                    self.wim_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_wim_thread: {str(e)}")

    def start_rfid_thread(self,equipment):
        try:
            if not self.rfid_thread:
                if equipment["ManufacturerName"]=="Mantra":
                    self.rfid_thread = MantraRfidReader(self,self.default_directory, equipment, 'lane_BG_rfid')
                    self.rfid_thread.daemon=True
                    self.rfid_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_rfid_thread: {str(e)}")

    def start_ping_thread(self):
        try:
            if not self.ping_thread:
                self.ping_thread = PingThread(self, self.default_directory,'lane_BG_ping', interval=1)
                self.ping_thread.daemon=True
                self.ping_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ping_thread: {str(e)}")
    
    def start_dts_thread(self):
        try:
            if not self.dts_thread:
                self.dts_thread=DataSynchronization(self.default_directory, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
                self.dts_thread.daemon=True
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
            self.logger.logError(f"Exception {self.classname} stop_dts_thread: {str(e)}")
    
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
            if self.equipment_detail is None:
                self.equipment_detail=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.lane_detail["LaneId"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} GetEquipmentDetails: {str(e)}")
            self.equipment_detail=None

    def getTollFare(self):
        try:
            if self.toll_fare is None:
                current_date = datetime.now().date()
                self.toll_fare=CommonManager.GetTollfare(self.dbConnectionObj,current_date)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getTollFare: {str(e)}")
            self.toll_fare=None

    def GetshiftDetails(self):
        try:
            if self.shiftDetails is None:
                self.shiftDetails=CommonManager.GetShiftTimining(self.dbConnectionObj)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} GetshiftDetails: {str(e)}")
            self.shiftDetails=None

    def getVSDetails(self):
        try:
            if self.systemSetting is not None and self.vehicle_class is None:
                if self.systemSetting['SubClassRequired']==1:
                    self.vehicle_class=CommonManager.GetsystemVehicleSubClass(self.dbConnectionObj)
                else:
                    self.vehicle_class=CommonManager.GetsystemVehicleClass(self.dbConnectionObj)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getVSDetails: {str(e)}")
            self.vehicle_class=None

    def getSystemSettingDetails(self):
        try:
            if self.systemSetting is None:
                self.systemSetting = CommonManager.GetSystemSetting(self.dbConnectionObj)
                self.default_plaza_Id = self.systemSetting.get('DefaultPlazaId')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getSystemSettingDetails: {str(e)}")
            self.systemSetting=None

    def getLaneDetails(self):
        try:
            if self.lane_detail is None:
                self.lane_detail = CommonManager.GetLaneDetails(self.dbConnectionObj, self.default_lane_ip)
                if self.lane_detail:
                    self.mqtt_topic=self.lane_detail["LaneName"]+'/laneStatus'
                    self.LaneTypeId=int(self.lane_detail["LaneTypeId"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} getLaneDetails: {str(e)}")
            self.lane_detail=None

    def start_lpic_thread(self,equipment):
        try:
            if self.lpic_thread is None:
                self.lpic_thread=CameraHandler(self,self.default_directory,"lpic","lane_BG_camera",equipment,"lpic_liveview")
                self.lpic_thread.daemon=True
                self.lpic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_lpic_thread: {str(e)}")

    def stop_lpic_thread(self):
        try:
            if self.lpic_thread:
                self.lpic_thread.stop()
                self.lpic_thread.join()
                self.lpic_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ping_thread: {str(e)}")

    def start_ic_thread(self,equipment):
        try:
            if self.ic_thread is None:
                self.ic_thread=CameraHandler(self,self.default_directory,"ic","lane_BG_camera",equipment,"ic_liveview")
                self.ic_thread.daemon=True
                self.ic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ic_thread: {str(e)}")

    def startUFD(self,equipment):
        try:
            if self.ufd is None:
                if equipment["ManufacturerName"]=="KITS":
                    self.ufd=KistUFDClient(self,self.default_directory,'lane_BG_ufd',equipment)
                    self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} UFD_start: {str(e)}")

    def get_plaza(self):
        try:
            if self.plaza_detail is None:
                self.GetPlazaDetails()
            else:
                if self.mqtt_client_connected==False:
                    self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} get_plaza: {str(e)}")


    def run_equipments(self):
        try:
            if self.equipment_detail is not None:
                # for equipment in self.equipment_detail:
                #     if equipment["EquipmentTypeId"]==4:
                #         self.start_wim_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==5:
                #         self.start_rfid_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==7:
                #         self.start_dio_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==15:
                #         self.start_lpic_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==16:
                #         self.start_ic_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==18:
                #         self.startUFD(equipment)
                #     elif equipment["EquipmentTypeId"]==21:
                #         self.start_avc_thread(equipment)
                #     time.sleep(0.100)  
                # self.start_ping_thread()
                self.run_desktop_app()  
                self.run_lane_api()  
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} run_equipments: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.start_dts_thread()
                self.getSystemSettingDetails()
                if self.default_plaza_Id>0:
                    self.get_plaza()
                if self.lane_detail is not None and self.plaza_detail is not None:
                    self.GetshiftDetails()
                    self.getVSDetails()
                    self.getTollFare()
                    self.GetEquipmentDetails()
                    self.run_equipments()
                else:
                    self.getLaneDetails()
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} loop_function run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def update_equipment_Status(self,equipment):
        try:
            self.mqtt_ping_event(equipment)
            if equipment["EquipmentTypeId"]==4:
                if self.wim_thread is not None:
                    self.wim_thread.retry(equipment["OnLineStatus"])
            elif equipment["EquipmentTypeId"]==5:
                if self.rfid_thread is not None:
                    self.rfid_thread.retry(equipment["OnLineStatus"])
            elif equipment["EquipmentTypeId"]==7:
                if self.dio_thread is not None:
                    self.dio_thread.retry(equipment["OnLineStatus"])
            elif equipment["EquipmentTypeId"]==18:
                if self.ufd is not None:
                    self.ufd.retry(equipment["OnLineStatus"])
            elif equipment["EquipmentTypeId"]==21:
                if self.avc_thread is not None:
                    self.avc_thread.retry(equipment["OnLineStatus"])
            self.update_equipment_list(equipment["EquipmentId"],'OnLineStatus',equipment["OnLineStatus"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_equipment_Status: {str(e)}")

    def get_on_line_status(self,EquipmentTypeId):
        result=False
        try:
            matched_item = next((item for item in self.equipment_detail if item['EquipmentTypeId'] == EquipmentTypeId), None)
            if matched_item:
                result=matched_item["OnLineStatus"]
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_updated_on_line_status: {str(e)}")
        finally:
            return result

    def update_equipment_list(self,EquipmentId,_key,status):
        try:
            for item in self.equipment_detail:
                if item["EquipmentId"] == EquipmentId:
                    item[_key] = status
                    self.publish_data("equipment_status",item)
                    break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_equipment_list: {str(e)}")
    
    def update_dio_events(self,dio_events):
        try:
            self.dio_events=dio_events
            if self.system_loging_status:
                for data in self.dio_events:
                    self.publish_data("hardware_on_off_status",data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_dio_events: {str(e)}")
        finally:
            self.mqtt_dio_event()
    
    def update_wim_data(self,data):
        try:
            if self.system_loging_status:
                self.wim_data.append(data)
                self.publish_data("wim_processed",data)
                self.mqtt_wim_event(data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_wim_data: {str(e)}")
        finally:
            if len(self.wim_data)>10:
                self.wim_data.pop(0)

    def update_rfid_data(self,data):
        try:
            if self.system_loging_status:
                self.publish_data("rfid_processed",data)
                self.mqtt_rfid_event(data)
                if self.LaneTypeId==3 and self.system_transcation_status==False:
                    data["Processed"]=True
                    self.rfid_data.append(data)
                    self.background_Transcation(data)
                else:
                    self.rfid_data.append(data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_rfid_data: {str(e)}")
        finally:
            if len(self.rfid_data)>10:
                self.rfid_data.pop(0)

    def update_avc_data(self,data):
        try:
            if self.system_loging_status:
                self.publish_data("avc_processed",data)
                self.mqtt_avc_event(data)
                LaneTransactionId=self.get_trxn_data_for_avc(data['SystemDateTime'])
                if LaneTransactionId!='0':
                    self.update_avc_lane_db(LaneTransactionId,data)
                else:
                    self.avc_data.append(data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_avc_data: {str(e)}")
        finally:
            if len(self.avc_data)>10:
                self.avc_data.pop(0)

    def update_lane_transcation(self,data):
        data['SystemDateTime']=datetime.now().isoformat()
        try:
            LaneManager.lane_data_insert(self.dbConnectionObj,data)
            data["Processed"]=True
            self.transaction_data.append(data)
            self.publish_data("lane_processed",data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_lane_transcation: {str(e)}")
            self.transaction_data.append(data)
        finally:
            if len(self.transaction_data)>10:
                self.transaction_data.pop(0)
        
    def get_trxn_data_for_avc(self, transDataTime):
        try:
            if len(self.transaction_data) > 0:
                transDataTime = datetime.fromisoformat(transDataTime)
                filtered_data = [x for x in self.transaction_data if datetime.fromisoformat(x['SystemDateTime']) < transDataTime and x['VehicleAvcClassId'] == 0]
                if not filtered_data:
                    return '0'
                nearest_item = min(filtered_data, key=lambda x: abs(datetime.fromisoformat(x['SystemDateTime']) - transDataTime))
                if nearest_item:
                    nearest_item['Processed'] = True
                    return nearest_item["LaneTransactionId"]
                else:
                   return '0'     
                # time_difference = abs((datetime.fromisoformat(nearest_item['SystemDateTime']) - transDataTime).total_seconds())
                # if time_difference < 10: 
                #     nearest_item['Processed'] = True
                #     return nearest_item["LaneTransactionId"]
                # else:
                #     return '0'
            else:
                return '0'
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_trxn_data_for_avc: {str(e)}")
            return '0'

    def get_Wim_data(self, transDataTime):
        try:
            if len(self.wim_data) > 0:
                transDataTime = datetime.fromisoformat(transDataTime)
                filtered_data = [x for x in self.wim_data if datetime.fromisoformat(x['SystemDateTime']) < transDataTime and x['Processed'] == False]
                
                nearest_item = min(filtered_data, key=lambda x: abs(datetime.fromisoformat(x['SystemDateTime']) - transDataTime))
                time_difference = abs((datetime.fromisoformat(nearest_item['SystemDateTime']) - transDataTime).total_seconds())
                if time_difference < 15: 
                    nearest_item['Processed'] = True
                    return nearest_item["TotalWeight"]
                else:
                    return 0
            else:
                return 0
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_Wim_data: {str(e)}")
            return 0
        
    def get_rfid_data(self, transDataTime):
        try:
            if len(self.rfid_data) > 0:
                transDataTime = datetime.fromisoformat(transDataTime)
                filtered_data = [x for x in self.rfid_data if datetime.fromisoformat(x['SystemDateTime']) < transDataTime]
                nearest_item = min(filtered_data, key=lambda x: abs(datetime.fromisoformat(x['SystemDateTime']) - transDataTime))
                time_difference = abs((datetime.fromisoformat(nearest_item['SystemDateTime']) - transDataTime).total_seconds())
                if time_difference < 3: 
                    nearest_item['Processed'] = True
                    return nearest_item
                else:
                    return None
            else:
                return None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_rfid_data: {str(e)}")
            return None

    def update_avc_lane_db(self,LaneTransactionId,data):
        try:
            d={"LaneTransactionId":LaneTransactionId,"VehicleAvcClassId":data["AvcClassId"],"TransactionAvcImage":data["ImageName"]}
            LaneManager.lane_data_avc_update(self.dbConnectionObj,d)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_db_lane_trans: {str(e)}")

    def get_fasTag_class_name(self,classId,trans_data):
        try:
            if self.systemSetting is not None and self.vehicle_class is not None:
                if self.systemSetting['SubClassRequired'] == 1 or self.systemSetting['SubClassRequired'] == True:
                    matched_item = next((item for item in self.vehicle_class if int(item['SystemVehicleSubClassId']) == int(classId)), None)
                    if matched_item:
                        trans_data["VehicleClassId"]=int(matched_item['SystemVehicleClassId'])
                        trans_data["VehicleSubClassId"]=int(matched_item['SystemVehicleSubClassId'])
                        trans_data["PermissibleVehicleWeight"]=matched_item['PermissibleWeight']
                        trans_data["VehicleClassName"]=matched_item['SystemVehicleClassName']
                        trans_data["VehicleSubClassName"]=matched_item['SystemVehicleSubClassName']
                        trans_data["TagClassName"]=matched_item['SystemVehicleSubClassName']
                    else:
                        trans_data["PermissibleVehicleWeight"]=0
                else:
                    matched_item = next((item for item in self.vehicle_class if int(item['SystemVehicleClassId']) == int(classId)), None)
                    if matched_item:
                        trans_data["VehicleClassId"]=int(matched_item['SystemVehicleClassId'])
                        trans_data["VehicleSubClassId"]=0
                        trans_data["PermissibleVehicleWeight"]=matched_item['PermissibleWeight']
                        trans_data["VehicleClassName"]=matched_item['SystemVehicleClassName']
                        trans_data["TagClassName"]=matched_item['SystemVehicleClassName']
                        trans_data["VehicleSubClassName"]=''
                    else:
                        trans_data["PermissibleVehicleWeight"]=0
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_fasTag_class_name: {str(e)}")
        finally:
            return trans_data
        
    def background_Transcation(self,rfid_data):
        try:
            ct=datetime.now()
            trans_data=self.create_fasTag_trans(rfid_data,True)
            self.current_Transaction=None
            trans_data["ActualVehicleWeight"]=self.get_Wim_data(rfid_data["SystemDateTime"])
            trans_data=self.get_fasTag_class_name(int(rfid_data["Class"]),trans_data)
            if(int(trans_data["ActualVehicleWeight"]>trans_data["PermissibleVehicleWeight"])):
                trans_data["IsVehicleOverWeight"]=True
                trans_data["IsOverWeightCharged"]=True
            else:
                trans_data["IsVehicleOverWeight"]=False
                trans_data["IsOverWeightCharged"]=False
            trans_data["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
            if self.userDetails is not None:
                trans_data["UserId"]=self.userDetails["UserId"]
                trans_data["LoginId"]=self.userDetails["LoginId"]
            self.lane_trans_start(trans_data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} background_Transcation: {str(e)}")

    def lane_trans_start(self, transactionInfo):
        result=False
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                running_Transaction=transactionInfo
                lane_Transaction_Id=running_Transaction['LaneTransactionId']
                lane_Transaction_img=f"{str(lane_Transaction_Id)}_lpic.jpg"
                res=self.screenshort_lpic(lane_Transaction_img)
                if res:
                    running_Transaction["TransactionFrontImage"]=lane_Transaction_img
                else:
                    running_Transaction["TransactionFrontImage"]=''
                self.update_lane_transcation(running_Transaction)
                self.handel_traffic_light(True,running_Transaction)
                self.process_on_ufd(running_Transaction)
                self.system_transcation_status=False
                result=True
            else:
                self.logger.logInfo(f"{self.classname} trans already in progress lane_trans_start")
                self.update_lane_transcation(running_Transaction)
                result=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_start: {str(e)}")
            result=False
        finally:
            return result
           
    def lane_trans_ic_cam(self,running_Transaction):
        try:
            if running_Transaction:
                lane_trans_ic_cam=running_Transaction["LaneTransactionId"]
                file_name=str(lane_trans_ic_cam)+'_ic'
                if self.ic_thread is not None:
                    result=self.ic_thread.record_video(file_name,duration=5, snapshot=False)
                    if result:
                        running_Transaction["TransactionBackImage"]=file_name+'.jpg'
                        running_Transaction["TransactionVideo"]=file_name+'.mp4'
                        threading.Thread(target=LaneManager.lane_data_ic_update,args=(self.dbConnectionObj,running_Transaction)).start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_ic_cam: {str(e)}")

    def lane_trans_end(self):
        try:
            self.stop_ic_record(snapshot=True)
            self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_end: {str(e)}")
        finally:
            self.publish_data("lane_process_end", True)

    def start_violation_trans(self):
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                ct=datetime.now()
                if self.current_Transaction is None:
                    self.current_trans()
                    if self.lane_detail:
                        self.setDefaultValue()
                        self.current_Transaction["TransactionTypeId"]= 4
                        self.current_Transaction["TransactionTypeName"]= "Violation"
                        self.current_Transaction["VehicleAvcClassId"]= 0
                        self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                else:
                    self.current_Transaction["TransactionTypeId"]= 4
                    self.current_Transaction["TransactionTypeName"]= "Violation"
                    self.current_Transaction["VehicleAvcClassId"]= 0
                if self.lane_detail:
                    self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                self.current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
                running_Transaction=self.current_Transaction
                lane_Transaction_Id=running_Transaction['LaneTransactionId']
                file_name=str(lane_Transaction_Id)+'_ic'
                if self.ic_thread is not None:
                    result=self.ic_thread.record_video(file_name,duration=5, snapshot=True)
                    if result:
                        running_Transaction["TransactionBackImage"]=file_name+'.jpg'
                        running_Transaction["TransactionVideo"]=file_name+'.mp4'
                if self.userDetails is not None:
                    running_Transaction["UserId"]=self.userDetails["UserId"]
                    running_Transaction["LoginId"]=self.userDetails["LoginId"]
                self.system_transcation_status=False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} create_violation_trans: {str(e)}")
        finally:
            self.current_Transaction=None

    def stop_violation_trans(self):
        self.stop_ic_record(snapshot=False)

    def process_on_ufd(self,running_Transaction):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.go_cmd()
                if running_Transaction["IsVehicleOverWeight"]==True:
                    self.ufd_message=running_Transaction["TransactionTypeName"]+" Overload Vehicle"
                    self.ufd.l1s_cmd(self.ufd_message)
                else:
                    self.ufd_message=running_Transaction["TransactionTypeName"]
                    self.ufd.l1_cmd(self.ufd_message)
                if running_Transaction["TransactionTypeId"]==1:
                    self.ufd.l2_cmd(f'{running_Transaction["TagClassName"]} {running_Transaction["TagPlateNumber"]}')
                    self.ufd_message=self.ufd_message+f' {running_Transaction["TagClassName"]} {running_Transaction["TagPlateNumber"]}'
                else:
                    self.ufd.l2_cmd(f'{running_Transaction["VehicleClassName"]} Toll Fee: {running_Transaction["TransactionAmount"]}')
                    self.ufd_message=self.ufd_message+f' {running_Transaction["VehicleClassName"]} Toll Fee: {running_Transaction["TransactionAmount"]}'
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_on_ufd: {str(e)}")
        finally:
            self.mqtt_ufd_event()

    def handel_traffic_light(self,status,running_Transaction=None):
        try:
            if self.dio_thread is not None:
                self.dio_thread.handel_traffic_light(status,running_Transaction)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} handel_traffic_light: {str(e)}")

    def start_lpic_record(self,transactionInfo):
        try:
            if self.lpic_thread is not None:
                self.lpic_thread.record_video('lpic',transactionInfo['LaneTransactionId']+'_lpic',duration=0, snapshot=False)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_lpic_record: {str(e)}")
    
    def stop_lpic_record(self):
        try:
            if self.lpic_thread is not None:
                self.lpic_thread.stop_recording(snapshot=True)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_lpic_record: {str(e)}")

    def stop_ic_record(self,snapshot=True):
        try:
             if self.ic_thread is not None:
                    self.ic_thread.stop_recording(snapshot=snapshot)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ic_record: {str(e)}")
    
    def screenshort_ic(self,lane_Transaction_img):
        try:
            if self.ic_thread:
                return self.ic_thread.take_screenshot(lane_Transaction_img)
            else:
                return False    
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} screenshort_ic: {str(e)}")
            return False
        
    def screenshort_lpic(self,lane_Transaction_img):
        try:
            if self.lpic_thread:
                return self.lpic_thread.take_screenshot(lane_Transaction_img)
            else:
                return False    
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} screenshort_lpic: {str(e)}")
            return False
    
    def reset_default_ufd(self):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.stop_cmd()
                if self.plaza_detail is not None:
                    self.ufd_message=f'Welcome to {self.plaza_detail["PlazaName"]}'
                    self.ufd.single_line_cmd(self.ufd_message)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} reset_default_ufd: {str(e)}")
        finally:
            self.mqtt_ufd_event()

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
                    self.current_shift=shift
                    ShiftId=shift['ShiftId']
                    break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} get_current_shift: {str(e)}")
        finally:
            return ShiftId

    def create_fasTag_trans(self,transData,IsReadByReader):
        try:
            self.current_trans()
            if self.lane_detail:
                self.setDefaultValue()
                self.current_Transaction["TagEPC"]= transData["EPC"]
                self.current_Transaction["RCTNumber"]= transData["TID"]
                self.current_Transaction["TagClassId"]=  transData["Class"]
                self.current_Transaction["TagPlateNumber"]= transData["Plate"]
                self.current_Transaction["TagReadDateTime"]= transData["TransactionDateTime"]
                self.current_Transaction["TagReadCount"]=  0
                self.current_Transaction["IsReadByReader"]= IsReadByReader
                self.current_Transaction["TransactionTypeId"]= 1
                self.current_Transaction["TransactionTypeName"]= "FasTag"
                self.current_Transaction["VehicleClassId"]= int(transData["Class"])
                self.current_Transaction["VehicleSubClassId"]= int(transData["Class"])
            return self.current_Transaction
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} create_fasTag_trans: {str(e)}")
            return None
    
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

    def current_trans(self):
        try:
            current_date_time=datetime.now()
            self.current_Transaction = {
                "LaneTransactionId": '0',
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
                "TagReadDateTime": Utilities.current_date_time_json(dt=current_date_time),
                "TagReadCount": 0,
                "IsReadByReader": False,
                "PermissibleVehicleWeight": 0.00,
                "ActualVehicleWeight": 0.00,
                "IsVehicleOverWeight": False,
                "IsOverWeightCharged": False,
                "OverWeightAmount": 0.00,
                "TagPenaltyAmount": 0.00,
                "TransactionAmount": 0.00,
                "TransactionDateTime": Utilities.current_date_time_json(dt=current_date_time),
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
                "TCRemark": "",
                "PlazaName": "",
                "LaneName":"",
                "TransactionTypeName": "",
                "PaymentTypeName": "",
                "ExemptTypeName":"",
                "ExemptSubTypeName":"",
                "VehicleClassName": "",
                "VehicleSubClassName": "",
                "TagClassName": "",
                "Processed":False,
                "SystemDateTime":current_date_time.isoformat()
            }
        except Exception as e:
            raise e
        
    def on_stop(self):
        try:
            if self.is_running:
                self.is_running = False
            self.stop_ping_thread()
            self.stop_dio_thread() 
            self.stop_avc_thread()
            self.stop_wim_thread()
            self.stop_rfid_thread()
            self.stop_dts_thread()
            
            self.lpic_thread.stop()
            self.ic_thread.stop()
            self.mqtt_client.disconnect()
            self.plaza_detail=None
            self.lane_detail=None
            self.equipment_detail=None
            self.rfid_client_connected=False
            self.mqtt_client_connected=False
            self.stop_desktop_app()
            self.stop_lane_api()
            self.logger.logInfo("Lane Equipment Synchronization stopped.")
            print('Lane Equipment Synchronization is stopped.')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_stop: {str(e)}")
            print(f'going to stop is_running {str(e)}')