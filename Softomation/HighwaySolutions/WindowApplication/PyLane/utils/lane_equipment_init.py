
import json
import threading
import time
import pkg_resources
import paho.mqtt.client as mqtt
from models.CommonManager import CommonManager
from utils.DataTransfer import DataSynchronization
from utils.camera.CameraManager import CameraManager
from utils.constants import Utilities
from utils.log_master import CustomLogger
from utils.rfid.mantra_rfid_reader import MantraRfidReader
from utils.wim.na_wim_data import NAWinDataClient
from utils.PingThread import PingThread
from utils.avc.sagar_avc_data import SagarAVCDataClient
from utils.dio.kits_dio_card import KistDIOClient

class LaneEquipmentSynchronization:
    def __init__(self, config_manager, dbConnectionObj,default_plaza_Id,system_ip):
        self.logger = CustomLogger('lane_BG')
        self.config_manager = config_manager
        self.dbConnectionObj = dbConnectionObj
        self.default_plaza_Id=default_plaza_Id
        self.default_lane_ip=system_ip
        self.plaza_detail=None
        self.lane_detail=None
        self.equipment_detail=None
        self.is_running = False
        self.thread = None
        self.dio_thread = None
        self.avc_thread=None
        self.wim_thread=None
        self.rfid_thread=None
        self.ping_thread=None
        self.dts_thread=None
        self.rfid_client_connected=False
        self.mqtt_client_connected=False
        self.camera_manager = CameraManager(self,"lane_BG_camera")
        self.camera_details=[]
        self.create_mqtt_obj()
        

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
            self.logger.logError("Paho MQTT is not installed.")

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
        self.mqtt_client.subscribe(topic)
        self.logger.logInfo(f"Subscribe topic: {topic}")

    def on_unsubscribe(self, topic):
        self.mqtt_client.unsubscribe(topic)
        self.logger.logInfo("Unsubscribed from topic")

    def send_message_to_mqtt(self,topic,data):
        try:
            response_json = json.dumps(data)
            self.mqtt_client.publish(topic, response_json)
        except Exception as e:
            self.logger.logError(f"An exception occurred in send_message_to_mqtt: {e}")

    def mqtt_on_connet(self,broker_ip,broker_port=1883):
        try:
            self.mqtt_client.on_connect = self.on_connect
            self.mqtt_client.on_disconnect = self.on_disconnect
            self.mqtt_client.on_message = self.on_message

            self.mqtt_client.connect(broker_ip, broker_port, 60)
            self.mqtt_client.loop_start()
        except Exception as e:
            self.logger.logError(f"An exception occurred in mqtt_on_connet: {e}")
    
    def start_dio_thread(self,equipment):
        if not self.dio_thread:
             if equipment["ManufacturerName"]=="KITS":
                self.dio_thread = KistDIOClient(self, equipment, 'lane/devicePosition','lane_BG_dio')
                self.dio_thread.start()

    def start_avc_thread(self,equipment):
        if not self.avc_thread:
             if equipment["ManufacturerName"]=="Sagar":
                self.avc_thread = SagarAVCDataClient(self,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                self.avc_thread.start()

    def start_wim_thread(self,equipment):
        if not self.wim_thread:
             if equipment["ManufacturerName"]=="NagaArjun":
                self.wim_thread = NAWinDataClient(self,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_wim')
                self.wim_thread.start()

    def start_rfid_thread(self,equipment):
        if not self.rfid_thread:
             if equipment["ManufacturerName"]=="Mantra":
               self.rfid_thread = MantraRfidReader(self, equipment, 'lane_BG_wim')
               self.rfid_thread.start()

    def start_ping_thread(self):
        if not self.ping_thread:
            self.ping_thread = PingThread(self, self.equipment_detail, 'lane/deviceStatus', interval=60)
            self.ping_thread.start()
    
    def start_dts_thread(self):
        if not self.dts_thread:
            self.dts_thread=DataSynchronization(self.config_manager, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
            self.dts_thread.start()

    def start_camera(self, equipment):
        ip_address = equipment["IpAddress"]
        if any(cam["IpAddress"] == ip_address for cam in self.camera_details):
            return
        else:
            #rtsp=f"rtsp://{equipment['LoginId']}:{equipment['LoginPassword']}@{equipment['IpAddress']}:554/{equipment['UrlAddress']}"
            rtsp="rtsp://admin:admin@192.168.1.181:554"
            x = {"IpAddress": ip_address, "rtsp": rtsp}
            self.camera_details.append(x)
            self.camera_manager.initialize_video_capture(rtsp, ip_address)
            #print(rtsp)

    def stop_dio_thread(self):
        if self.dio_thread:
            self.dio_thread.client_stop()
            self.dio_thread.join()
            self.dio_thread = None

    def stop_avc_thread(self):
        if self.avc_thread:
            self.avc_thread.client_stop()
            self.avc_thread.join()
            self.avc_thread = None

    def stop_wim_thread(self):
        if self.wim_thread:
            self.wim_thread.client_stop()
            self.wim_thread.join()
            self.wim_thread = None

    def stop_rfid_thread(self):
        if self.rfid_thread:
            self.rfid_thread.stop()
            self.rfid_thread.join()
            self.rfid_thread = None

    def stop_ping_thread(self):
        if self.ping_thread:
            self.ping_thread.stop()
            self.ping_thread.join()
            self.ping_thread = None

    def stop_dts_thread(self):
        if self.dts_thread:
            self.dts_thread.on_stop()
            self.dts_thread.join()
            self.dts_thread = None
    
    def GetPlazaDetails(self):
        try:
            self.plaza_detail=CommonManager.GetPlazaDetailsById(self.dbConnectionObj,self.default_plaza_Id)
            if self.plaza_detail is not None:
                self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
        except Exception as e:
            self.logger.logError(f"An exception occurred in GetPlazaDetail: {e}")
            self.plaza_detail=None

    def GetLaneDetails(self):
        try:
            self.lane_detail=CommonManager.GetLaneDetails(self.dbConnectionObj,self.default_lane_ip)
            if self.lane_detail is not None: 
                self.GetEquipmentDetails()
        except Exception as e:
            self.logger.logError(f"An exception occurred in GetLaneDetails: {e}")
            self.lane_detail=None

    def GetEquipmentDetails(self):
        try:
            self.equipment_detail=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.lane_detail["LaneId"])
        except Exception as e:
            self.logger.logError(f"An exception occurred in GetEquipmentDetails: {e}")
            self.equipment_detail=None

    def loop_function(self):
        while self.is_running:
            try:
                #self.start_dts_thread()
                if self.plaza_detail is None:
                    self.GetPlazaDetails()
                else:
                    if self.mqtt_client_connected==False:
                        self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
                if self.lane_detail is None:
                    self.GetLaneDetails()
                if self.equipment_detail is None:
                    self.GetEquipmentDetails()
                else:
                    self.equipment_detail
                    for equipment in self.equipment_detail:
                        if equipment["EquipmentTypeId"]==4:
                            self.start_wim_thread(equipment)
                        elif equipment["EquipmentTypeId"]==5:
                            self.start_rfid_thread(equipment)
                        elif equipment["EquipmentTypeId"]==7:
                            self.start_dio_thread(equipment)
                        elif equipment["EquipmentTypeId"]==15:
                            self.start_camera(equipment)
                        elif equipment["EquipmentTypeId"]==16:
                            self.start_camera(equipment)
                        elif equipment["EquipmentTypeId"]==21:
                            self.start_avc_thread(equipment)
                    self.start_ping_thread()
                    
            except Exception as e:
                self.logger.logError(f"An exception occurred in loop_function: {e}")
            time.sleep(0.100)

    def on_start(self):
        if not self.is_running:
            self.is_running = True
            self.thread = threading.Thread(target=self.loop_function)
            self.thread.start()
            
            self.logger.logInfo("Lane Equipment Synchronization started.")

    def on_stop(self):
        if self.is_running:
            self.is_running = False
            self.stop_dio_thread() 
            self.stop_avc_thread()
            self.start_wim_thread()
            self.stop_rfid_thread()
            self.stop_ping_thread()
            #self.stop_dts_thread()
            self.mqtt_client.disconnect()
            self.plaza_detail=None
            self.lane_detail=None
            self.equipment_detail=None
            self.is_running = False
            self.rfid_client_connected=False
            self.mqtt_client_connected=False
            self.thread.join()
            self.logger.log_info("Lane Equipment Synchronization stopped.")