
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
from utils.camera.CameraHandler import CameraHandler
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
        self.set_logger(default_directory,'lane_BG')
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
        self.ufd=None
        self.lpic_thread=None
        self.ic_thread=None
        self.dio_events=None
        self.rfid_data=None
        self.wim_data=None
        self.current_Transaction=None
        self.running_Transaction=None
        self.is_running = True
        self.rfid_client_connected=False
        self.mqtt_client_connected=False
        self.system_loging_status=False
        self.system_transcation_status=False
        self.mqtt_topic='lane/deviceStatus'
        self.create_mqtt_obj()

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
    
    def publish_data(self,topic,data):
        try:
            pub.sendMessage(topic, transactionInfo=data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} topic:{topic} publish_data: {str(e)}")

    def start_dio_thread(self,equipment):
        try:
            if not self.dio_thread:
                if equipment["ManufacturerName"]=="KITS":
                    self.dio_thread = KistDIOClient(self,self.default_directory,equipment, 'lane/devicePosition','lane_BG_dio')
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
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
                    self.rfid_thread = MantraRfidReader(self,self.default_directory, equipment, 'lane_BG_wim')
                    self.rfid_thread.daemon=True
                    self.rfid_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_rfid_thread: {str(e)}")

    def start_ping_thread(self):
        try:
            if not self.ping_thread:
                self.ping_thread = PingThread(self, self.equipment_detail, self.default_directory,'lane_BG_ping', interval=1)
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

    def start_lpic_thread(self,equipment):
        try:
            if self.lpic_thread is None:
                self.lpic_thread=CameraHandler(self.default_directory,"lpic","lane_BG_camera",equipment,"lpic_liveview")
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
                self.ic_thread=CameraHandler(self.default_directory,"ic","lane_BG_camera",equipment,"ic_liveview")
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

    def run(self):
        while self.is_running:
            try:
                if not self.is_running:
                    break
                self.start_dts_thread()
                if not self.is_running:
                    break
                if self.plaza_detail is None:
                    self.GetPlazaDetails()
                else:
                    if self.mqtt_client_connected==False:
                        self.mqtt_on_connet(self.plaza_detail["PlazaServerIpAddress"])
                if not self.is_running:
                    break
                if self.shiftDetails is None:
                    self.GetshiftDetails()
                if not self.is_running:
                    break
                if self.equipment_detail is None:
                    self.GetEquipmentDetails()
                else:
                    for equipment in self.equipment_detail:
                        if not self.is_running:
                            break
                        if equipment["EquipmentTypeId"]==4:
                            self.start_wim_thread(equipment)
                        elif equipment["EquipmentTypeId"]==5:
                            self.start_rfid_thread(equipment)
                        elif equipment["EquipmentTypeId"]==7:
                            self.start_dio_thread(equipment)
                        elif equipment["EquipmentTypeId"]==15:
                            self.start_lpic_thread(equipment)
                        elif equipment["EquipmentTypeId"]==16:
                            self.start_ic_thread(equipment)
                        elif equipment["EquipmentTypeId"]==18:
                            self.startUFD(equipment)
                        elif equipment["EquipmentTypeId"]==21:
                            self.start_avc_thread(equipment)
                    self.start_ping_thread()
                    if not self.is_running:
                        break
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} loop_function: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    
            
        

    def update_equipment_Status(self,equipment):
        try:
            if self.mqtt_topic is not None:
                self.send_message_to_mqtt(self.mqtt_topic, equipment)
            pub.sendMessage("ping_processed", transactionInfo=equipment)
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

    def update_equipment_list(self,EquipmentId,_key,status):
        try:
            for item in self.equipment_detail:
                if item["EquipmentId"] == EquipmentId:
                    item[_key] = status
                    break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_equipment_list: {str(e)}")
    
    def update_dio_events(self,dio_events):
        try:
            self.dio_events=dio_events
            for data in self.dio_events:
                try:
                    pub.sendMessage("hardware_on_off_status", transactionInfo=data)
                except Exception as e:
                    self.logger.logError(f"Exception {self.classname} update_dio_events_PUB: {str(e)}")
                try:
                    self.send_message_to_mqtt('lane/hardware',data)
                except Exception as e:
                    self.logger.logError(f"Exception {self.classname} update_dio_events_mqtt: {str(e)}")
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} update_dio_events: {str(e)}")

    def update_rfid_data(self,rfid_data):
        self.rfid_data=rfid_data
        self.publish_data("rfid_processed",rfid_data)

    def update_wim_data(self,wim_data):
        self.wim_data=wim_data
        self.publish_data("wim_processed",wim_data)
        #self.handler.create_wim_txn(d["TotalWeight"])

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
                self.lpic_thread.stop_capture()
                self.ic_thread.stop_capture()
                self.mqtt_client.disconnect()
                self.plaza_detail=None
                self.lane_detail=None
                self.equipment_detail=None
                self.rfid_client_connected=False
                self.mqtt_client_connected=False
                self.logger.log_info("Lane Equipment Synchronization stopped.")
                self.thread.join()
                self.thread=None
                print('Lane Equipment Synchronization is stopped.')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} on_stop: {str(e)}")
            print(f'going to stop is_running {str(e)}')

    def app_log_status(self, transactionInfo):
         self.system_loging_status=transactionInfo
         if self.dio_thread is not None:
                self.dio_thread.handel_ohls_light(transactionInfo)

    def lane_trans_start(self, transactionInfo):
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                self.running_Transaction=transactionInfo
                lane_Transaction_Id=self.running_Transaction['LaneTransactionId']
                lane_Transaction_img=f"{str(lane_Transaction_Id)}_lpic.jpg"
                res=self.screenshort_lpic(lane_Transaction_img)
                if res:
                    self.running_Transaction["TransactionFrontImage"]=lane_Transaction_img
                else:
                    self.running_Transaction["TransactionFrontImage"]=''
                threading.Thread(target=self.process_on_ufd).start()
                self.handel_traffic_light(True)
                self.avc_thread.getavc(lane_Transaction_Id)
                threading.Thread(target=LaneManager.lane_data_lpic_update,args=(self.dbConnectionObj,self.running_Transaction)).start()
            else:
                self.logger.logInfo(f"{self.classname} trans already in progress lane_trans_start")
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_start: {str(e)}")

    def start_violation_trans(self):
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                ct=datetime.now()
                if self.current_Transaction is None:
                    self.current_trans()
                    if self.lane_detail is not None:
                        self.setDefaultValue()
                        self.current_Transaction["TransactionTypeId"]= 4
                        self.current_Transaction["VehicleAvcClassId"]= 0
                        self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                        self.current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
                else:
                    self.current_Transaction["TransactionTypeId"]= 4
                    self.current_Transaction["VehicleAvcClassId"]= 0
                    if self.lane_detail is not None:
                        self.current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
                    self.current_Transaction["TransactionDateTime"]=Utilities.current_date_time_json(ct)
                self.running_Transaction=self.current_Transaction
                lane_Transaction_Id=self.running_Transaction['LaneTransactionId']
                self.start_ic_record()
                # res=self.screenshort_ic(self.current_Transaction)
                # if res:
                #     self.current_Transaction["TransactionBackImage"]=f"{self.current_Transaction['LaneTransactionId']}_ic.jpg"
                resultData=LaneManager.lane_data_insert(self.dbConnectionObj,self.current_Transaction)
                self.avc_thread.getavc(lane_Transaction_Id)
                self.logger.logInfo(f"create_violation_trans: {resultData}") 
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} create_violation_trans: {str(e)}")
        finally:
            self.current_Transaction=None

    def stop_violation_trans(self):
        self.stop_ic_record()

    def process_on_ufd(self):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.go_cmd()
                self.ufd.l1_cmd(self.running_Transaction["TransactionTypeName"])
                if self.running_Transaction["TransactionTypeId"]==1:
                    self.ufd.l2_cmd(f'{self.running_Transaction["TagClassName"]} {self.running_Transaction["TagPlateNumber"]}')
                else:
                    self.ufd.l2_cmd(f'{self.running_Transaction["VehicleClassName"]} Toll Fee: {self.running_Transaction["TransactionAmount"]}')
                    #self.ufd.l2_cmd(f'Toll Fee: {self.running_Transaction["TransactionAmount"]}')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_on_ufd: {str(e)}")

    def handel_traffic_light(self,status):
        try:
            if self.dio_thread is not None:
                self.dio_thread.handel_traffic_light(status)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_on_ufd: {str(e)}")

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

    def start_ic_record(self,snapshot=False):
        try:
            if self.running_Transaction:
                file_name=str(self.running_Transaction['LaneTransactionId'])+'_ic'
                if self.ic_thread is not None:
                    self.ic_thread.record_video(file_name,duration=10, snapshot=False)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ic_record: {str(e)}")

    def stop_ic_record(self):
        try:
            if self.running_Transaction:
                file_name=str(self.running_Transaction['LaneTransactionId'])+'_ic'
                if self.ic_thread is not None:
                    res=self.ic_thread.stop_recording(snapshot=True)
                    if res:
                        self.running_Transaction["TransactionBackImage"]=file_name+'.jpg'
                        self.running_Transaction["TransactionVideo"]=file_name+'.avi'
                        threading.Thread(target=LaneManager.lane_data_ic_update,args=(self.dbConnectionObj,self.running_Transaction)).start()   
            self.system_transcation_status=False
            self.running_Transaction=None
            pub.sendMessage("lane_process_end", transactionInfo=True)
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
                    self.ufd.single_line_cmd(f'Welcome to {self.plaza_detail["PlazaName"]}')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} reset_default_ufd: {str(e)}")

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
                "TCRemark": "",
                "PlazaName": "",
                "LaneName":"",
                "TransactionTypeName": "",
                "PaymentTypeName": "",
                "ExemptTypeName":"",
                "ExemptSubTypeName":"",
                "VehicleClassName": "",
                "VehicleSubClassName": ""
            }
        except Exception as e:
            raise e