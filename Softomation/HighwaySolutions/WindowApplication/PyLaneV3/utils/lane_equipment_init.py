
import asyncio
from datetime import datetime
import json
import os
import threading
import time
from models.CommonManager import CommonManager
from models.LaneManager import LaneManager
from utils.DataTransfer import DataSynchronization
#from utils.Desktop import DesktopApp
from utils.api import FlaskApiApp
from utils.avc.scaita_avc_data import ScaitaAVCDataClient
from utils.avc.soft_avc_data import STPLAVCDataClient
from utils.camera.IpCameraHandler import IpCameraHandler
from utils.constants import Utilities
from utils.dio.Innovating_dio_card import InnovatingDIOClient
from utils.log_master import CustomLogger
from utils.mqttHandler import MqttHandler
from utils.rfid.id_tech_rfid import IdTechRfidReader
from utils.rfid.mantra_rfid_reader import MantraRfidReader
from utils.toll_receipt_printer import TollReceiptPrinter
from utils.ufd.Innovating_ufd import InnovatingUFDClient
from utils.ufd.Kits_ufd import KistUFDClient
from utils.webSocketServer import LaneWebSocketServer
from utils.wim.appalto_wim_data import AppaltoWinDataClient
from utils.wim.na_wim_data import NAWinDataClient
from utils.PingThread import PingThread
from utils.avc.sagar_avc_data import SagarAVCDataClient
from utils.dio.kits_dio_card import KistDIOClient
from pubsub import pub

class LaneEquipmentSynchronization(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj, script_dir, system_ip):
        super().__init__()
        self.set_logger(default_directory,'lane_BG')
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.script_dir = script_dir
        self.default_lane_ip = system_ip
        self.default_plaza_Id=0
        self.LaneTypeId=1
        self.is_running = True
        self.app_thread=None
        self.api_thread=None
        self.lane_detail=None
        self.systemSetting=None
        self.plaza_detail=None
        self.vehicle_class=None
        self.vehicle_sub_class=None
        self.equipment_detail=None
        self.dio_equipment_detail=None
        self.toll_fare=None
        self.shiftDetails=None
        self.current_shift=None
        self.userDetails=None
        self.dio_thread = None
        self.avc_thread=None
        self.wim_thread=None
        self.rfid_thread=None
        self.ping_thread=None
        self.dts_thread=None
        self.ufd=None
        self.lpic_thread=None
        self.ic_thread=None
        self.current_Transaction=None
        self.running_Transaction=None
        self.project_config=None
        self.lane_master_data=None
        self.web_socket_server=None
        self.receipt_printer=None
        self.mqtt_Handler=None
        self.rfid_client_connected=False
        self.system_loging_status=False
        self.system_transcation_status=False
        self.barrier_auto=True
        self.presence_loop_required=False
        self.exit_loop_required=False
        self.avc_loop_required=False
        self.ufd_message=""
        self.rfid_data=[]
        self.wim_data=[]
        self.transaction_data=[]
        self.load_project_config(default_directory)
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="LESyn"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")
    
    def load_project_config(self,default_directory):
        try:
            project_config_path = os.path.join(default_directory, 'MasterConfig', 'ProjectConfiguration.json')
            self.project_config=Utilities.read_json_file(project_config_path)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")
    
    def hardware_list_setup(self):
        try:
           self.hardware_list = [
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 2, "EquipmentTypeName": "OHLS", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 17, "EquipmentTypeName": "Traffic light", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 19, "EquipmentTypeName": "Boom Barrier", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 14, "EquipmentTypeName": "Hooter-Violation Light", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 20, "EquipmentTypeName": "Exit Loop", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 3, "EquipmentTypeName": "Presence Loop", "PositionStatus": False},
            {"LaneId":self.lane_detail["LaneId"],"EquipmentTypeId": 10, "EquipmentTypeName": "Recipt-Printer", "PositionStatus": False}
        ]
        except Exception as e:
            self.logger.logError(f"Exception hardware_list_setup: {str(e)}")
            self.hardware_list=None

    def update_hardware_list(self,ind,status):
        try:
            if self.hardware_list:
                self.hardware_list[ind]["PositionStatus"]=status
                self.publish_data("hardware_on_off_status",self.hardware_list[ind])
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_dio_event(self.hardware_list[ind])
        except Exception as e:
            self.logger.logError(f"Exception update_hardware_list: {str(e)}")

    def publish_data(self,topic,data):
        try:
            if self.system_loging_status==True:
                if self.app_thread is not None:
                    pub.sendMessage(topic, transactionInfo=data)
                self.send_message_ws({"topic":topic,"data":data})
        except Exception as e:
            self.logger.logError(f"Exception topic:{topic} publish_data: {str(e)}")

    def send_message_ws(self,data):
        try:
            if self.web_socket_server:
                result=json.dumps(data)
                asyncio.run(self.web_socket_server.broadcast(message=result))
        except Exception as e:
            self.logger.logError(f"Exception send_message_ws: {str(e)}")

    def app_log_status(self, transactionInfo):
        try:
            self.system_loging_status=transactionInfo
            self.rfid_data=[]
            self.wim_data=[]
            self.transaction_data=[]
            if self.dio_thread is not None:
                self.dio_thread.reset_command()
                self.dio_thread.handel_ohls_light(transactionInfo)
                self.dio_thread.app_log_status(transactionInfo)
            if self.rfid_thread is not None:
                self.rfid_thread.processed_epcs={}
            if self.avc_thread is not None:
                self.avc_thread.clean_queue()
            self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception app_log_status: {str(e)}")

    def update_user(self, transactionInfo):
        try:
            self.userDetails=json.loads(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception update_user: {str(e)}")
    
    def run_lane_api(self):
        try:
            if self.api_thread is None:
                self.api_thread = FlaskApiApp(self.default_directory,self.script_dir, self.logger,self)
                self.api_thread.start_app()
        except Exception as e:
            self.logger.logError(f"Exception run_lane_api: {str(e)}")

    def stop_lane_api(self):
        try:
            if self.api_thread is not None:
                self.api_thread.stop_app()
        except Exception as e:
            self.logger.logError(f"Exception stop_lane_api: {str(e)}")
    
    def start_dio_thread(self,equipment):
        try:
            if not self.dio_thread:
                if equipment["ManufacturerName"]=="KITS":
                    self.dio_thread = KistDIOClient(self,self.default_directory,equipment,self.hardware_list,self.system_loging_status,self.barrier_auto,'lane_BG_dio')
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
                if equipment["ManufacturerName"]=="Innovating":
                    self.dio_thread = InnovatingDIOClient(self,self.default_directory,equipment,self.hardware_list,self.system_loging_status,self.barrier_auto,'lane_BG_dio')
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_dio_thread: {str(e)}")

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
                elif equipment["ManufacturerName"]=="Scita":
                    self.avc_thread = ScaitaAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment, 'lane_BG_avc')
                    self.avc_thread.daemon=True
                    self.avc_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_avc_thread: {str(e)}")

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
            self.logger.logError(f"Exception start_wim_thread: {str(e)}")

    def start_rfid_thread(self,equipment):
        try:
            if not self.rfid_thread:
                if equipment["ManufacturerName"]=="Mantra":
                    self.rfid_thread = MantraRfidReader(self,self.default_directory, equipment,self.presence_loop_required, 'lane_BG_rfid')
                    self.rfid_thread.daemon=True
                    self.rfid_thread.start()
                elif equipment["ManufacturerName"]=="ID-Tech":
                    self.rfid_thread = IdTechRfidReader(self,self.default_directory, equipment,self.presence_loop_required, 'lane_BG_rfid')
                    self.rfid_thread.daemon=True
                    self.rfid_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_rfid_thread: {str(e)}")

    def start_ping_thread(self):
        try:
            if not self.ping_thread:
                self.ping_thread = PingThread(self, self.default_directory,'lane_BG_ping', interval=1)
                self.ping_thread.daemon=True
                self.ping_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ping_thread: {str(e)}")
    
    def start_dts_thread(self):
        try:
            if not self.dts_thread:
                self.dts_thread=DataSynchronization(self.default_directory, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
                self.dts_thread.daemon=True
                self.dts_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_dts_thread: {str(e)}")

    def start_lpic_thread(self,equipment):
        try:
            if self.lpic_thread is None:
                self.lpic_thread=IpCameraHandler(self,self.default_directory,"lpic","lane_BG_camera",equipment,"lpic_liveview")
                self.lpic_thread.daemon=True
                self.lpic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_lpic_thread: {str(e)}")

    def start_ic_thread(self,equipment):
        try:
            if self.ic_thread is None:
                self.ic_thread=IpCameraHandler(self,self.default_directory,"ic","lane_BG_camera",equipment,"ic_liveview")
                self.ic_thread.daemon=True
                self.ic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ic_thread: {str(e)}")

    def connect_ufd(self,equipment):
        try:
            if self.ufd is None:
                if equipment["ManufacturerName"]=="KITS":
                    self.ufd=KistUFDClient(self,self.default_directory,'lane_BG_ufd',equipment)
                    self.reset_default_ufd()
                if equipment["ManufacturerName"]=="Innovating":
                    self.ufd=InnovatingUFDClient(self,self.default_directory,'lane_BG_ufd',equipment)
                    self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception connect_ufd: {str(e)}")

    def stop_dio_thread(self):
        try:
            if self.dio_thread:
                self.dio_thread.stop()
                self.dio_thread.join()
                self.dio_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_dio_thread: {str(e)}")

    def stop_avc_thread(self):
        try:
            if self.avc_thread:
                self.avc_thread.stop()
                self.avc_thread.join()
                self.avc_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_avc_thread: {str(e)}")

    def stop_wim_thread(self):
        try:
            if self.wim_thread:
                self.wim_thread.stop()
                self.wim_thread.join()
                self.wim_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_wim_thread: {str(e)}")

    def stop_rfid_thread(self):
        try:
            if self.rfid_thread:
                self.rfid_thread.stop()
                self.rfid_thread.join()
                self.rfid_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_rfid_thread: {str(e)}")

    def stop_ping_thread(self):
        try:
            if self.ping_thread:
                self.ping_thread.stop()
                self.ping_thread.join()
                self.ping_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_ping_thread: {str(e)}")

    def stop_dts_thread(self):
        try:
            if self.dts_thread:
                self.dts_thread.stop()
                self.dts_thread.join()
                self.dts_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_dts_thread: {str(e)}")

    def stop_lpic_thread(self):
        try:
            if self.lpic_thread:
                self.lpic_thread.stop()
                self.lpic_thread.join()
                self.lpic_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_lpic_thread: {str(e)}")

    def stop_ic_thread(self):
        try:
            if self.ic_thread:
                self.ic_thread.stop()
                self.ic_thread.join()
                self.ic_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_ic_thread: {str(e)}")

    def start_ws_thread(self):
        try:
            if self.web_socket_server is None:
                self.web_socket_server=LaneWebSocketServer(self.default_directory)
                self.web_socket_server.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ws_thread: {str(e)}")

    def stop_ws_thread(self):
        try:
            if self.web_socket_server:
                self.web_socket_server.stop()
                self.web_socket_server = None
        except Exception as e:
            self.logger.logError(f"Exception stop_ws_thread: {str(e)}")

    def set_up_printer(self,equipment):
        try:
            if self.receipt_printer is None:
                self.receipt_printer=TollReceiptPrinter(self,equipment)
                self.hardware_list[6]["OnLineStatus"]=True
                self.hardware_list[6]["PositionStatus"]=True
        except Exception as e:
            self.logger.logError(f"Exception set_up_printer: {str(e)}")
            self.receipt_printer=None
            self.hardware_list[6]["OnLineStatus"]=False
            self.hardware_list[6]["PositionStatus"]=False
        finally:
            self.publish_data("hardware_on_off_status",self.hardware_list[6])

    def print_receipt(self,current_Transaction):
        last_status=self.hardware_list[6]["PositionStatus"]
        current_status=False
        try:
            if self.receipt_printer is not None:
                self.receipt_printer.generate_receipt(current_Transaction)
                current_status=True
        except Exception as e:
            self.logger.logError(f"Exception on_print: {str(e)}")
        finally:
            self.hardware_list[6]["OnLineStatus"]=current_status
            self.hardware_list[6]["PositionStatus"]=current_status
            if last_status!=current_status:
                self.publish_data("hardware_on_off_status",self.hardware_list[6])

    def equipment_type_exists(self, equipment_type_id):
       return any(filter(lambda equipment: equipment['EquipmentTypeId'] == equipment_type_id, self.dio_equipment_detail))

    def GetEquipmentDetails(self):
        try:
            if self.equipment_detail is None:
                self.equipment_detail=CommonManager.GetEquipmentDetails(self.dbConnectionObj,self.lane_detail["LaneId"])
        except Exception as e:
            self.logger.logError(f"Exception GetEquipmentDetails: {str(e)}")
            self.equipment_detail=None

    def GetDioEquipmentDetails(self):
        try:
            if self.dio_equipment_detail is None:
                self.dio_equipment_detail=CommonManager.GetDioEquipmentDetails(self.dbConnectionObj,self.lane_detail["LaneId"])
                self.presence_loop_required=self.equipment_type_exists(3)
                self.exit_loop_required=self.equipment_type_exists(20)
                self.avc_loop_required=self.equipment_type_exists(22)
        except Exception as e:
            self.logger.logError(f"Exception GetDioEquipmentDetails: {str(e)}")
            self.dio_equipment_detail=None

    def GetLaneDetailsGetByLaneId(self):
        try:
            if (self.equipment_detail is None or self.dio_equipment_detail is None or
                self.transaction_type_master is None or self.payment_type_master is None or
                self.vehicle_class is None or self.vehicle_sub_class is None or
                self.shiftDetails is None or self.toll_fare is None):
                
                current_date = datetime.now().date()
                self.lane_master_data = CommonManager.getLaneDetailsGetByLaneId(
                    self.dbConnectionObj, self.lane_detail["LaneId"], current_date
                )
                
                if len(self.lane_master_data) == 12:
                    (self.equipment_detail, self.dio_equipment_detail, self.transaction_type_master,
                    self.payment_type_master, self.exempt_type_master, self.vehicle_class,
                    self.vehicle_sub_class, self.shiftDetails, self.toll_fare, systemSetting,
                    Plaza,Lane) = self.lane_master_data
                else:
                    raise ValueError("Unexpected number of result sets returned from the stored procedure.")
                if self.shiftDetails:
                    self.get_current_shift()
                    
        except Exception as e:
            self.logger.logError(f"Exception GetLaneDetailsGetByLaneId: {str(e)}")
            self.lane_master_data = None

    def getSystemSettingDetails(self):
        try:
            if self.systemSetting is None:
                self.systemSetting = CommonManager.GetSystemSetting(self.dbConnectionObj)
                self.default_plaza_Id = self.systemSetting.get('DefaultPlazaId')
        except Exception as e:
            self.logger.logError(f"Exception getSystemSettingDetails: {str(e)}")
            self.systemSetting=None

    def GetPlazaDetails(self):
        try:
            if self.plaza_detail is None:
                self.plaza_detail=CommonManager.GetPlazaDetailsById(self.dbConnectionObj,self.default_plaza_Id)
        except Exception as e:
            self.logger.logError(f"Exception GetPlazaDetails: {str(e)}")
            self.plaza_detail=None

    def getLaneDetails(self):
        try:
            if self.lane_detail is None:
                self.lane_detail = CommonManager.GetLaneDetails(self.dbConnectionObj, self.default_lane_ip)
                if self.lane_detail:
                    self.hardware_list_setup()
                    self.mqtt_Handler=MqttHandler(self.lane_detail,self.default_directory)
                    self.LaneTypeId=int(self.lane_detail["LaneTypeId"])
            else:
                if self.mqtt_Handler is None:
                    self.mqtt_Handler=MqttHandler(self.lane_detail,self.default_directory)
        except Exception as e:
            self.logger.logError(f"Exception getLaneDetails: {str(e)}")
            self.lane_detail=None

    def run_equipments(self):
        try:
            if self.equipment_detail is not None and self.dio_equipment_detail is not None:
                for equipment in self.equipment_detail:
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
                        self.connect_ufd(equipment)
                    elif equipment["EquipmentTypeId"]==21:
                        self.start_avc_thread(equipment)
                    elif equipment["EquipmentTypeId"]==10:
                        self.set_up_printer(equipment)
                    time.sleep(0.100)  
                self.start_ping_thread()
                #self.run_desktop_app()  
                self.run_lane_api()  
        except Exception as e:
                self.logger.logError(f"Exception run_equipments: {str(e)}")

    def run(self):
        while self.is_running:
            try:
                self.start_ws_thread()
                self.start_dts_thread()
                self.getSystemSettingDetails()
                if self.default_plaza_Id>0:
                    self.GetPlazaDetails()
                if self.lane_detail is not None and self.plaza_detail is not None:
                    self.GetLaneDetailsGetByLaneId()
                    self.run_equipments()
                else:
                    self.getLaneDetails()
            except Exception as e:
                self.logger.logError(f"Exception loop_function run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)    

    def update_equipment_Status(self,equipment):
        try:
            if self.mqtt_Handler:
                self.mqtt_Handler.mqtt_ping_event(equipment)
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
            self.logger.logError(f"Exception update_equipment_Status: {str(e)}")

    def get_on_line_status(self,EquipmentTypeId):
        result=False
        try:
            matched_item = next((item for item in self.equipment_detail if item['EquipmentTypeId'] == EquipmentTypeId), None)
            if matched_item:
                result=matched_item["OnLineStatus"]
        except Exception as e:
            self.logger.logError(f"Exception get_updated_on_line_status: {str(e)}")
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
            self.logger.logError(f"Exception update_equipment_list: {str(e)}")
    
    def update_lane_transcation(self,data):
        data['SystemDateTime']=datetime.now().isoformat()
        try:
            LaneManager.lane_data_insert(self.dbConnectionObj,data)
            data["Processed"]=True
            self.transaction_data.append(data)
            self.publish_data("lane_processed",data)
        except Exception as e:
            self.logger.logError(f"Exception update_lane_transcation: {str(e)}")
            self.transaction_data.append(data)
        finally:
            if len(self.transaction_data)>10:
                self.transaction_data.pop(0)

    def update_rfid_data(self,data):
        try:
            if self.system_loging_status:
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_rfid_event(data)
                if self.LaneTypeId==3:
                    if self.system_transcation_status==False:
                        data["Processed"]=True
                        self.background_Transcation(data)
                    self.rfid_data.append(data)
                else:
                    self.publish_data("rfid_processed",data)
                    self.rfid_data.append(data)
        except Exception as e:
            self.logger.logError(f"Exception update_rfid_data: {str(e)}")
        finally:
            if len(self.rfid_data)>10:
                self.rfid_data.pop(0)

    def update_avc_data(self,data):
        try:
            if self.system_loging_status:
                self.publish_data("avc_processed",data)
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_avc_event(data)
        except Exception as e:
            self.logger.logError(f"Exception update_avc_data: {str(e)}")

    def update_avc_lane_db(self,LaneTransactionId,data):
        try:
            d={"LaneTransactionId":LaneTransactionId,"VehicleAvcClassId":data["AvcClassId"],"TransactionAvcImage":data["ImageName"]}
            LaneManager.lane_data_avc_update(self.dbConnectionObj,d)
        except Exception as e:
            self.logger.logError(f"Exception update_db_lane_trans: {str(e)}")

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
            else:
                return '0'
        except Exception as e:
            self.logger.logError(f"Exception get_trxn_data_for_avc: {str(e)}")
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
            self.logger.logError(f"Exception get_Wim_data: {str(e)}")
            return 0

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
            self.logger.logError(f"Exception get_fasTag_class_name: {str(e)}")
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
            self.logger.logError(f"Exception background_Transcation: {str(e)}")

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
                    vc_name=running_Transaction["VehicleSubClassName"]
                    if vc_name=='':
                        vc_name=running_Transaction["VehicleClassName"]
                    self.ufd.l2_cmd(f'{vc_name} Toll Fee: {running_Transaction["TransactionAmount"]}')
                    self.ufd_message=self.ufd_message+f' {vc_name} Toll Fee: {running_Transaction["TransactionAmount"]}'
                if self.mqtt_Handler:
                    self.mqtt_Handler.ufd_messge_broadcast(self.ufd_message)
        except Exception as e:
            self.logger.logError(f"Exception process_on_ufd: {str(e)}")

    def process_fleet_ufd(self,running_Transaction):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.go_cmd()
                self.ufd_message=running_Transaction["TransactionTypeName"]
                self.ufd.l1_cmd(self.ufd_message)
                self.ufd.l2_cmd(f'{running_Transaction["ExemptTypeName"]}')
                if self.mqtt_Handler:
                    self.mqtt_Handler.ufd_messge_broadcast(self.ufd_message)
        except Exception as e:
            self.logger.logError(f"Exception process_on_ufd: {str(e)}")

    def handel_traffic_light(self,status,running_Transaction=None):
        try:
            if self.dio_thread is not None:
                self.dio_thread.handel_traffic_light(status,running_Transaction)
        except Exception as e:
            self.logger.logError(f"Exception handel_traffic_light: {str(e)}")

    def lane_fleet_start(self,transactionInfo):
        result=False
        running_Transaction=None
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                running_Transaction=transactionInfo
                running_Transaction["RCTNumber"]=Utilities.receipt_number(self.lane_detail["PlazaId"],self.lane_detail["LaneId"],0,Utilities.parse_date_time_from_json(running_Transaction["TransactionDateTime"]))
                running_Transaction["IsFleetTranscation"]=True
                self.process_fleet_ufd(running_Transaction)
                if self.dio_thread is not None:
                    self.dio_thread.handel_fleet(True)
                result=True
            else:
                self.logger.logInfo(f"trans already in progress lane_trans_start")
                result=False
        except Exception as e:
            self.logger.logError(f"Exception lane_fleet_start: {str(e)}")
            result=False
        finally:
            return result,running_Transaction
        
    def lane_fleet_Stop(self,transactionInfo):
        result=False
        running_Transaction=None
        try:
            if self.system_transcation_status==True:
                running_Transaction=transactionInfo
                if self.dio_thread is not None:
                    running_Transaction["FleetCount"]=self.dio_thread.fleet_counter
                    self.dio_thread.handel_fleet(False)
                self.update_lane_transcation(running_Transaction)
                self.system_transcation_status=False
                result=True
            else:
                self.logger.logInfo(f"No running trans found to stop the fleet")
                result=False
        except Exception as e:
            self.logger.logError(f"Exception FleetStop: {str(e)}")
            result=False
        finally:
            return result,running_Transaction

    def update_fleet_counter(self,fleet_count):
        try:
            self.publish_data("fleet_count",fleet_count)
        except Exception as e:
            self.logger.logError(f"Exception update_fleet_counter: {str(e)}")

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
                    result=self.start_ic_record(running_Transaction)
                    if result:
                        running_Transaction["TransactionBackImage"]=file_name+'.jpg'
                        running_Transaction["TransactionVideo"]=file_name+'.mp4'
                if self.userDetails is not None:
                    running_Transaction["UserId"]=self.userDetails["UserId"]
                    running_Transaction["LoginId"]=self.userDetails["LoginId"]
                self.system_transcation_status=False
                #self.send_data_avc(running_Transaction["LaneTransactionId"])
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                self.update_lane_transcation(running_Transaction)
        except Exception as e:
            self.logger.logError(f"Exception create_violation_trans: {str(e)}")
        finally:
            self.current_Transaction=None

    def stop_violation_trans(self):
        try:
            self.publish_data("lane_process_end", True)
            self.stop_ic_record()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")
    
    def lane_trans_start(self, transactionInfo):
        result=False
        running_Transaction=None
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                running_Transaction=transactionInfo
                if running_Transaction["TransactionTypeId"] !=1:
                    running_Transaction["RCTNumber"]=Utilities.receipt_number(self.lane_detail["PlazaId"],self.lane_detail["LaneId"],running_Transaction["VehicleSubClassId"],Utilities.parse_date_time_from_json(running_Transaction["TransactionDateTime"]))
                if running_Transaction["TransactionTypeId"] ==2:
                    self.print_receipt(running_Transaction)
                lane_Transaction_Id=running_Transaction['LaneTransactionId']
                lane_Transaction_img=f"{str(lane_Transaction_Id)}_lpic.jpg"
                res=self.screenshort_lpic(lane_Transaction_img)
                if res:
                    running_Transaction["TransactionFrontImage"]=lane_Transaction_img
                else:
                    running_Transaction["TransactionFrontImage"]=''
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                #self.send_data_avc(running_Transaction["LaneTransactionId"])
                self.update_lane_transcation(running_Transaction)
                self.process_on_ufd(running_Transaction)
                self.handel_traffic_light(True,running_Transaction)
                self.system_transcation_status=False
                result=True
            else:
                self.logger.logInfo(f"trans already in progress lane_trans_start")
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                #self.send_data_avc(running_Transaction["LaneTransactionId"])
                self.update_lane_transcation(running_Transaction)
                result=True
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_start: {str(e)}")
            result=False
        finally:
            return result,running_Transaction
    
    def lane_trans_end(self):
        try:
            self.publish_data("lane_process_end", True)
            self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")

    def send_data_avc(self,lane_Transaction_Id,TransactionDateTime):
        try:
            if self.avc_thread:
                self.avc_thread.put_lane_data_q(lane_Transaction_Id,TransactionDateTime)
        except Exception as e:
            self.logger.logError(f"Exception send_data_avc: {str(e)}")
    
    def start_ic_record(self,transactionInfo):
        try:
            if self.ic_thread is not None:
                self.ic_thread.start_recording(transactionInfo['LaneTransactionId']+'_ic',snapshot=False)
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_ic_record: {str(e)}")
            return False
        
    def stop_ic_record(self):
        try:
             if self.ic_thread is not None:
                self.ic_thread.stop_recording(snapshot=True)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_ic_record: {str(e)}")
        
    def screenshort_lpic(self,lane_Transaction_img):
        try:
            if self.lpic_thread:
                lane_Transaction_img_path=self.lpic_thread.get_image_path(lane_Transaction_img)
                return self.lpic_thread.take_screenshot(lane_Transaction_img_path)
            else:
                return False    
        except Exception as e:
            self.logger.logError(f"Exception screenshort_lpic: {str(e)}")
            return False
    
    def reset_default_ufd(self):
        try:
            if self.ufd is not None:
                self.ufd.clear_cmd()
                self.ufd.stop_cmd()
                if self.plaza_detail is not None:
                    self.ufd_message=f'Welcome to {self.plaza_detail["PlazaName"]}'
                    self.ufd.welcomeMessage(self.ufd_message)
                    if self.mqtt_Handler:
                        self.mqtt_Handler.ufd_messge_broadcast(self.ufd_message)
        except Exception as e:
            self.logger.logError(f"Exception reset_default_ufd: {str(e)}")

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
            self.logger.logError(f"Exception get_current_shift: {str(e)}")
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
            self.logger.logError(f"Exception create_fasTag_trans: {str(e)}")
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
                "TagReadById": 0,
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
            self.stop_lpic_thread()
            self.stop_ic_thread()
            self.stop_ws_thread()
            self.plaza_detail=None
            self.lane_detail=None
            self.equipment_detail=None
            self.rfid_client_connected=False
            self.stop_lane_api()
            self.logger.logInfo("Lane Equipment Synchronization stopped.")
        except Exception as e:
            self.logger.logError(f"Exception on_stop: {str(e)}")