import asyncio
from datetime import datetime
import json
import threading
import time
from api.flask_app import FlaskApp
from data_sync.data_synchronization import DataSynchronization
from database.lane_manager import LaneManager
from log.log_master import CustomLogger
from sdks.avc.sagar_avc_data import SagarAVCDataClient
from sdks.avc.scaita_avc_data import ScaitaAVCDataClient
from sdks.avc.soft_avc_data import STPLAVCDataClient
from sdks.dio.Innovating_dio_card import InnovatingDIOClient
from sdks.dio.kits_dio_card import KistDIOClient
from sdks.rfid.id_tech_rfid import IdTechRfidReader
from sdks.rfid.mantra_rfid_reader import MantraRfidReader
from sdks.ufd.Innovating_ufd import InnovatingUFDClient
from sdks.ufd.Kits_ufd import KistUFDClient
from sdks.wim.appalto_wim_data import AppaltoWinDataClient
from sdks.wim.na_wim_data import NAWinDataClient
from threads.ip_cam_thread import IpCameraHandler
from threads.ping_thread import PingThread
from utils.constants import Utilities
from utils.mqttHandler import MqttHandler
from utils.toll_receipt_printer import TollReceiptPrinter
from web_socket.webSocketServer import LaneWebSocketServer

class LaneBGProcess(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj, script_dir, system_ip,ic_timemout):
        super().__init__()
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.ic_timemout=ic_timemout
        self.script_dir = script_dir
        self.default_lane_ip = system_ip
        self.is_running = True
        self.mqtt_Handler=None
        self.receipt_printer=None
        self.default_plaza_Id=0
        self.current_Transaction=None
        self.running_Transaction=None
        self.hold_Transaction=None
        self.log_time=None
        self.barrier_auto=True
        self.rfid_data=[]
        self.wim_data=[]
        self.transaction_data=[]
        self.init_master_varaibles()
        self.init_master_thread()
        self.set_logger(default_directory,"lane_bg")
        self.load_project_config(default_directory)
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")
    
    def init_master_varaibles(self):
        try:
            self.AutoFasTagProcess=False
            self.presence_loop_required=False
            self.exit_loop_required=False
            self.avc_loop_required=False
            self.system_loging_status=False
            self.system_transcation_status=False
            self.project_config=None
            self.lane_master_data=None
            self.equipment_detail= None 
            self.dio_equipment_detail= None
            self.transaction_type_master= None 
            self.payment_type_master= None
            self.vehicle_class= None 
            self.vehicle_sub_class= None
            self.shiftDetails= None 
            self.toll_fare= None 
            self.systemSetting= None
            self.plaza_detail= None 
            self.lane_detail= None 
            self.keyBoardCodes= None
            self.current_shift=None
            self.userDetails=None
            self.ufd_message=""
            self.last_epc=""
        except Exception as e:
            self.logger.logError(f"Exception init_master_varaibles: {str(e)}")

    def init_master_thread(self):
        try:
            self.dio_equipment_detail=None
            self.ping_thread=None
            self.wim_thread=None
            self.rfid_thread=None
            self.ufd=None
            self.dio_thread = None
            self.avc_thread=None
            self.lpic_thread=None
            self.ic_thread=None
            self.api_thread=None
            self.dts_thread=None
            self.web_socket_thread=None
        except Exception as e:
            self.logger.logError(f"Exception init_master_thread: {str(e)}")
    
    def load_project_config(self,default_directory):
        try:
            dirlist=[default_directory, 'MasterConfig', 'ProjectConfiguration.json']
            project_config_path = Utilities.get_final_path(dirlist)
            self.project_config=Utilities.read_json_file(project_config_path)
        except Exception as e:
            self.logger.logError(f"Exception load_project_config: {str(e)}")

    def auto_login(self):
        try:
            login_id = f'tollcollector{str(self.lane_detail["LaneId"])}'
            users=LaneManager.GetUserByLoginId(self.dbConnectionObj,login_id)
            if users:
                self.userDetails=users[0]
                x={"UserId":self.userDetails["UserId"],"LocalAddress":self.default_lane_ip}
                logresult=self.dts_thread.logIn_activity(x,"UserLoginActivity")
                if logresult["status"]:
                    threading.Thread(target=self.app_log_status, args=(True,)).start()
                    current_time = datetime.now()
                    formatted_time = current_time.strftime("%H:%M:%S")
                    self.update_user(self.userDetails,formatted_time)
                    self.logger.logInfo(f"auto_login done: {login_id}")
                else:
                    self.logger.logInfo(f"auto_login pending for: {login_id}")
            else:
                self.logger.logInfo(f"auto_login user not found: {login_id}")
        except Exception as e:
            self.logger.logError(f"Exception auto_login: {str(e)}")

    def default_hardware_list(self):
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

    def update_equipment_list(self,EquipmentId,_key,status):
        try:
            for item in self.equipment_detail:
                if item["EquipmentId"] == EquipmentId:
                    item[_key] = status
                    self.publish_data("equipment_status",item)
                    break
        except Exception as e:
            self.logger.logError(f"Exception update_equipment_list: {str(e)}")

    def update_hardware_list(self,ind,status):
        try:
            if self.hardware_list:
                self.hardware_list[ind]["PositionStatus"]=status
                self.publish_data("hardware_on_off_status",self.hardware_list[ind])
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_dio_event(self.hardware_list[ind])
        except Exception as e:
            self.logger.logError(f"Exception update_hardware_list: {str(e)}")

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
        
    def publish_data(self,topic,data):
        try:
            if self.system_loging_status==True:
                self.send_message_ws(topic,data)
        except Exception as e:
            self.logger.logError(f"Exception topic:{topic} publish_data: {str(e)}")
        finally:
            time.sleep(0.100)

    def send_message_ws(self,topic,data):
        try:
            output=None
            if self.web_socket_thread and data is not None:
                if topic=="hardware_on_off_status":
                    output={"topic":topic,"EquipmentTypeId":data["EquipmentTypeId"],"PositionStatus":data["PositionStatus"]}
                elif topic=="equipment_status":
                    output={"topic":topic,"EquipmentTypeId":data["EquipmentTypeId"],"OnLineStatus":data["OnLineStatus"]}
                elif topic=="lane_process_end":
                    output={"topic":topic,"lane_process_end":data}
                elif topic=="fleet_count":
                    output={"topic":topic,"fleet_count":data}
                else:
                    data["topic"] = topic
                    output=data
                if output is not None:
                    result=json.dumps(output)
                    asyncio.run(self.web_socket_thread.broadcast(message=result))
        except Exception as e:
            self.logger.logError(f"Exception send_message_ws: {str(e)}")
    
    def start_ws_thread(self):
        try:
            if self.web_socket_thread is None:
                self.web_socket_thread=LaneWebSocketServer(self.default_directory)
                self.web_socket_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ws_thread: {str(e)}")

    def stop_ws_thread(self):
        try:
            if self.web_socket_thread:
                self.web_socket_thread.stop()
                self.web_socket_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_ws_thread: {str(e)}")

    def start_dts_thread(self):
        try:
            if not self.dts_thread:
                self.dts_thread=DataSynchronization(self.default_directory, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
                self.dts_thread.daemon=True
                self.dts_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_dts_thread: {str(e)}")

    def stop_dts_thread(self):
        try:
            if self.dts_thread:
                self.dts_thread.stop()
                self.dts_thread.join()
                self.dts_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_dts_thread: {str(e)}")
    
    def start_ping_thread(self):
        try:
            if not self.ping_thread:
                self.ping_thread = PingThread(self, self.default_directory,'lane_BG_ping', interval=1)
                self.ping_thread.daemon=True
                self.ping_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ping_thread: {str(e)}")

    def stop_ping_thread(self):
        try:
            if self.ping_thread:
                self.ping_thread.stop()
                self.ping_thread.join()
                self.ping_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_ping_thread: {str(e)}")
    
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
    
    def update_master_Details(self):
        try:
            if (self.equipment_detail is None or self.dio_equipment_detail is None or
                self.transaction_type_master is None or self.payment_type_master is None or
                self.vehicle_class is None or self.vehicle_sub_class is None or
                self.shiftDetails is None or self.toll_fare is None or self.systemSetting is None
                or self.plaza_detail is None or self.lane_detail is None or self.keyBoardCodes is None):
                
                current_date = datetime.now().date()
                self.lane_master_data = LaneManager.GetLaneDetails(self.dbConnectionObj, self.default_lane_ip, current_date)
                
                if len(self.lane_master_data) == 13:
                    (self.equipment_detail, self.dio_equipment_detail, self.transaction_type_master,
                    self.payment_type_master, self.exempt_type_master, self.vehicle_class,self.vehicle_sub_class, 
                    self.shiftDetails, self.toll_fare, self.systemSetting,self.plaza_detail,self.lane_detail,self.keyBoardCodes) = self.lane_master_data
                else:
                    raise ValueError("Unexpected number of result sets returned from the stored procedure.")
                if self.shiftDetails:
                    self.get_current_shift()

                if self.dio_equipment_detail is None:
                    self.presence_loop_required=Utilities.equipment_type_exists(3,self.dio_equipment_detail)
                    self.exit_loop_required=Utilities.equipment_type_exists(20,self.dio_equipment_detail)
                    self.avc_loop_required=Utilities.equipment_type_exists(22,self.dio_equipment_detail)

                if self.plaza_detail and len(self.plaza_detail)>0:
                    self.plaza_detail=self.plaza_detail[0]
                
                if self.lane_detail:
                    if len(self.lane_detail)>0:
                        self.lane_detail=self.lane_detail[0]
                        self.LaneTypeId=int(self.lane_detail["LaneTypeId"])
                
                if self.systemSetting:
                    if len(self.systemSetting)>0:
                        self.systemSetting=self.systemSetting[0]
                    self.AutoFasTagProcess=self.systemSetting["AutoFasTagProcess"]
                    self.default_plaza_Id=self.systemSetting.get('DefaultPlazaId')
        except Exception as e:
            self.logger.logError(f"Exception update_master_Details: {str(e)}")
            self.lane_master_data = None
    
    def GetLaneDetails(self):
        try:
            if (self.equipment_detail is None or self.dio_equipment_detail is None or
                self.transaction_type_master is None or self.payment_type_master is None or
                self.vehicle_class is None or self.vehicle_sub_class is None or
                self.shiftDetails is None or self.toll_fare is None or self.systemSetting is None
                or self.plaza_detail is None or self.lane_detail is None or self.keyBoardCodes is None):
                
                current_date = datetime.now().date()
                self.lane_master_data = LaneManager.GetLaneDetails(self.dbConnectionObj, self.default_lane_ip, current_date)
                
                if len(self.lane_master_data) == 13:
                    (self.equipment_detail, self.dio_equipment_detail, self.transaction_type_master,
                    self.payment_type_master, self.exempt_type_master, self.vehicle_class,self.vehicle_sub_class, 
                    self.shiftDetails, self.toll_fare, self.systemSetting,self.plaza_detail,self.lane_detail,self.keyBoardCodes) = self.lane_master_data
                else:
                    raise ValueError("Unexpected number of result sets returned from the stored procedure.")
                if self.shiftDetails:
                    self.get_current_shift()

                if self.dio_equipment_detail is None:
                    self.presence_loop_required=Utilities.equipment_type_exists(3,self.dio_equipment_detail)
                    self.exit_loop_required=Utilities.equipment_type_exists(20,self.dio_equipment_detail)
                    self.avc_loop_required=Utilities.equipment_type_exists(22,self.dio_equipment_detail)

                if self.plaza_detail and len(self.plaza_detail)>0:
                    self.plaza_detail=self.plaza_detail[0]

                if self.lane_detail:
                    if len(self.lane_detail)>0:
                        self.lane_detail=self.lane_detail[0]
                        self.default_hardware_list()
                        
                        self.LaneTypeId=int(self.lane_detail["LaneTypeId"])
                if self.plaza_detail and self.lane_detail:
                    self.mqtt_Handler=MqttHandler(self.plaza_detail,self.lane_detail,self.default_directory)
                
                if self.systemSetting:
                    if len(self.systemSetting)>0:
                        self.systemSetting=self.systemSetting[0]
                    self.AutoFasTagProcess=self.systemSetting["AutoFasTagProcess"]
                    self.default_plaza_Id=self.systemSetting.get('DefaultPlazaId')
        except Exception as e:
            self.logger.logError(f"Exception GetLaneDetails: {str(e)}")
            self.lane_master_data = None

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

    def start_lane_api(self):
        try:
            if self.api_thread is None:
                self.api_thread = FlaskApp(self.default_directory,self.script_dir,self)
                self.api_thread.start_app()
        except Exception as e:
            self.logger.logError(f"Exception start_lane_api: {str(e)}")
    
    def stop_lane_api(self):
        try:
            if self.api_thread is not None:
                self.api_thread.stop_app()
        except Exception as e:
            self.logger.logError(f"Exception stop_lane_api: {str(e)}")

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

    def stop_wim_thread(self):
        try:
            if self.wim_thread:
                self.wim_thread.stop()
                self.wim_thread.join()
                self.wim_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_wim_thread: {str(e)}")

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

    def stop_rfid_thread(self):
        try:
            if self.rfid_thread:
                self.rfid_thread.stop()
                self.rfid_thread.join()
                self.rfid_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_rfid_thread: {str(e)}")
    
    def start_dio_thread(self,equipment):
        try:
            if not self.dio_thread:
                if equipment["ManufacturerName"]=="KITS":
                    self.dio_thread = KistDIOClient(self,self.default_directory,equipment,self.hardware_list,self.system_loging_status,self.barrier_auto,'lane_BG_dio',self.ic_timemout)
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
                if equipment["ManufacturerName"]=="Innovating":
                    self.dio_thread = InnovatingDIOClient(self,self.default_directory,equipment,self.hardware_list,self.system_loging_status,self.barrier_auto,'lane_BG_dio',self.ic_timemout)
                    self.dio_thread.daemon=True
                    self.dio_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_dio_thread: {str(e)}")
        finally:
            if self.dio_thread and self.lane_detail and self.LaneTypeId==3:
                self.auto_login()

    def stop_dio_thread(self):
        try:
            if self.dio_thread:
                self.dio_thread.stop()
                self.dio_thread.join()
                self.dio_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_dio_thread: {str(e)}")
    
    def start_avc_thread(self,equipment):
        try:
            if not self.avc_thread:
                if equipment["ManufacturerName"]=="Sagar" and self.vehicle_class:
                    self.avc_thread = SagarAVCDataClient(self,self.default_directory,self.dbConnectionObj,self.lane_detail["LaneId"], equipment,self.vehicle_class, 'lane_BG_avc')
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

    def stop_avc_thread(self):
        try:
            if self.avc_thread:
                self.avc_thread.stop()
                self.avc_thread.join()
                self.avc_thread = None
        except Exception as e:
            self.logger.logError(f"Exception stop_avc_thread: {str(e)}")
    
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
                if self.ic_timemout==0:
                    self.ic_thread=IpCameraHandler(self,self.default_directory,"ic","lane_BG_camera",equipment,"ic_liveview")
                else:
                    self.ic_thread=IpCameraHandler(self,self.default_directory,"ic","lane_BG_camera",equipment,"ic_liveview",duration=10,retry_delay=1,timeout=self.ic_timemout)
                self.ic_thread.daemon=True
                self.ic_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_ic_thread: {str(e)}")
    
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
    
    def start_ic_record(self,transactionInfo):
        try:
            if self.ic_thread is not None:
                file_name=str(transactionInfo['LaneTransactionId'])+'_ic'
                self.ic_thread.start_recording(file_name,snapshot=False)
                transactionInfo["TransactionBackImage"]=file_name+'.jpg'
                transactionInfo["TransactionVideo"]=file_name+'.mp4'
                LaneManager.lane_data_ic_update(self.dbConnectionObj,transactionInfo)
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception start_ic_record: {str(e)}")
            return False
    
    def stop_ic_record(self):
        try:
             if self.ic_thread is not None:
                self.ic_thread.stop_recording(snapshot=True)
        except Exception as e:
            self.logger.logError(f"Exception stop_ic_record: {str(e)}")
    
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
    
    def run_equipments(self):
        try:
            if self.equipment_detail is not None and self.dio_equipment_detail is not None:
                self.start_ping_thread()
                self.start_lane_api()  
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
               
        except Exception as e:
            self.logger.logError(f"Exception run_equipments: {str(e)}")
    
    def run(self):
        while self.is_running:
            try:
                self.start_dts_thread()
                self.start_ws_thread()
                self.GetLaneDetails()
                self.run_equipments()
            except Exception as e:
                self.logger.logError(f"Exception loop_function run: {str(e)}")
            finally:
                if self.is_running == False:
                    break
                time.sleep(0.100)

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
    
    def update_wim_data(self,data):
        try:
            if self.system_loging_status:
                self.wim_data.append(data)
                self.publish_data("wim_processed",data)
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_wim_event(data)
        except Exception as e:
            self.logger.logError(f"Exception update_wim_data: {str(e)}")
        finally:
            if len(self.wim_data)>10:
                self.wim_data.pop(0)
   
    def update_avc_data(self,data):
        try:
            if self.system_loging_status:
                self.publish_data("avc_processed",data)
                if self.mqtt_Handler:
                    self.mqtt_Handler.mqtt_avc_event(data)
        except Exception as e:
            self.logger.logError(f"Exception update_avc_data: {str(e)}")
    
    def get_Wim_data(self):
        try:
            if self.wim_data is not None and len(self.wim_data) > 0:
                item = self.wim_data.pop(0)
                return item.get("TotalWeight", 0)
            return 0
        except Exception as e:
            self.logger.logError(f"Exception in get_Wim_data: {str(e)}")
            return 0
    
    def check_tag_status(self,EPC,TID,VRN):
        try:
            data={"TagId":EPC,"TID":TID,"VRN":VRN}
            result= self.dts_thread.fasTag_Status(data=data)
            if result.get("status") == "success":
                return result.get("VehicleDetails")
            else:
                return None
        except Exception as e:
            self.logger.logError(f"Exception check_tag_status: {str(e)}")
            return None

    def update_rfid_data(self,data):
        try:
            if self.system_loging_status:
                current_epc=data["EPC"]
                if current_epc != self.last_epc:
                    if self.system_transcation_status:
                        self.rfid_data.append(data)
                    else:
                        self.last_epc=current_epc
                        if self.mqtt_Handler:
                            threading.Thread(target=self.mqtt_Handler.mqtt_rfid_event, args=(data,)).start()
                        self.logger.logInfo(f"check EPC: {self.last_epc}")
                        if data["TagReadById"]!=3:
                            tag_status= self.check_tag_status(self.last_epc,"","")
                            self.logger.logInfo(f"Tag status: {tag_status}")
                            if tag_status:
                                data["TagStatus"]=Utilities.get_exception_names(tag_status["EXCCODE"])
                                self.process_fasTag_trans(data,tag_status)
                                return True
                            else:
                                return False
                        else:
                            tag_status={"EXCCODE":"00","Allowed":True,"REGNUMBER":data["Plate"]}
                            data["TagStatus"]=Utilities.get_exception_names(tag_status["EXCCODE"])
                            self.process_fasTag_trans(data,tag_status)
                            return True
        except Exception as e:
            self.logger.logError(f"Exception update_rfid_data: {str(e)}")
        finally:
            if len(self.rfid_data)>10:
                self.rfid_data.pop(0)
    
    def process_fasTag_trans(self,tag_data,tag_status):
        try:
            ct=datetime.now()
            trans_data=self.create_fasTag_trans(tag_data,tag_status)
            self.current_Transaction=None
            wim_weight=self.get_Wim_data()
            trans_data["ActualVehicleWeight"]=str(wim_weight)
            trans_data=self.get_fasTag_class_name(int(tag_data["Class"]),trans_data)
            if(int(trans_data["ActualVehicleWeight"])>int(trans_data["PermissibleVehicleWeight"])):
                trans_data["IsVehicleOverWeight"]=True
                trans_data["IsOverWeightCharged"]=True
            else:
                trans_data["IsVehicleOverWeight"]=False
                trans_data["IsOverWeightCharged"]=False
            trans_data["LaneTransactionId"]=Utilities.lane_txn_number(self.lane_detail["LaneId"],ct)
            if self.userDetails is not None:
                trans_data["UserId"]=self.userDetails["UserId"]
                trans_data["LoginId"]=self.userDetails["LoginId"]
            if trans_data["ProcessAllowed"]:
                self.lane_trans_start(trans_data)
            else:
                self.ufd_data_process_thread(trans_data)
                if self.LaneTypeId==3:
                    self.process_bl(trans_data)
        except Exception as e:
            self.logger.logError(f"Exception process_fasTag_trans: {str(e)}")
        finally:
            if self.LaneTypeId==3:
                self.publish_data("rfid_processed",trans_data)
            else:
                self.publish_data("rfid_processed",tag_data)

    def create_fasTag_trans(self,transData,tag_status):
        try:
            if self.lane_detail:
                self.current_Transaction=Utilities.current_trans()
                self.setDefaultValue()
                self.current_Transaction["TagEPC"]= transData["EPC"]
                self.current_Transaction["RCTNumber"]= transData["TID"]
                self.current_Transaction["TagClassId"]=  transData["Class"]
                self.current_Transaction["TagReadDateTime"]= transData["TransactionDateTime"]
                self.current_Transaction["TagReadCount"]=  0
                self.current_Transaction["TagReadById"]= transData["TagReadById"]
                self.current_Transaction["TransactionTypeId"]= 1
                self.current_Transaction["TransactionTypeName"]= "FasTag"
                self.current_Transaction["VehicleClassId"]= int(transData["Class"])
                self.current_Transaction["VehicleSubClassId"]= int(transData["Class"])
                if tag_status:
                    self.current_Transaction["TagStatus"]= Utilities.get_exception_names(tag_status["EXCCODE"])
                    self.current_Transaction["ProcessAllowed"]= tag_status["Allowed"]
                    if tag_status["REGNUMBER"]=='':
                        self.current_Transaction["TagPlateNumber"]= transData["Plate"]
                    else:
                        self.current_Transaction["TagPlateNumber"]= tag_status["REGNUMBER"]
                else:
                    self.current_Transaction["TagStatus"]= "No tag detail found"
                    self.current_Transaction["ProcessAllowed"]=False
                    self.current_Transaction["TagPlateNumber"]= transData["Plate"]
                return self.current_Transaction
        except Exception as e:
            self.logger.logError(f"Exception create_fasTag_trans: {str(e)}")
            return None

    def process_bl(self,transactionInfo):
        try:
            if self.system_transcation_status==False:
                self.system_transcation_status=True
                running_Transaction=transactionInfo
                running_Transaction["TransactionTypeId"]=-1
                lane_Transaction_Id=running_Transaction['LaneTransactionId']
                lane_Transaction_img=f"{str(lane_Transaction_Id)}_lpic.jpg"
                res=self.screenshort_lpic(lane_Transaction_img)
                if res:
                    running_Transaction["TransactionFrontImage"]=lane_Transaction_img
                else:
                    running_Transaction["TransactionFrontImage"]=''
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                self.update_lane_transcation(running_Transaction)
                self.system_transcation_status=False
        except Exception as e:
            self.logger.logError(f"Exception process_bl: {str(e)}")

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
                self.ufd_data_process_thread(running_Transaction)
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                self.update_lane_transcation(running_Transaction)
                self.handel_traffic_light(True,running_Transaction)
                self.system_transcation_status=False
                result=True
            else:
                self.logger.logInfo(f"trans already in progress lane_trans_start")
                self.send_data_avc(running_Transaction["LaneTransactionId"],running_Transaction['TransactionDateTime'])
                self.update_lane_transcation(running_Transaction)
                result=True
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_start: {str(e)}")
            result=False
        finally:
            return result,running_Transaction
    
    def send_data_avc(self,lane_Transaction_Id,TransactionDateTime):
        try:
            if self.avc_thread:
                self.avc_thread.put_lane_data_q(lane_Transaction_Id,TransactionDateTime)
        except Exception as e:
            self.logger.logError(f"Exception send_data_avc: {str(e)}")
        
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
    
    def lane_trans_end(self):
        try:
            self.publish_data("lane_process_end", True)
            self.reset_default_ufd()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")
    
    
        
    def setDefaultValue(self):
        try:
            self.current_Transaction["LaneId"] = self.lane_detail["LaneId"]
            self.current_Transaction["LaneName"] = self.lane_detail["LaneName"]
            self.current_Transaction["PlazaName"] = self.plaza_detail["PlazaName"]
            self.current_Transaction["PlazaId"] = self.systemSetting["DefaultPlazaId"]
            self.current_Transaction["ShiftId"] = self.get_current_shift()
        except Exception as e:
            raise e
    
    def get_fasTag_class_name(self,classId,trans_data):
        try:
            matched_item = next((item for item in self.vehicle_sub_class if int(item['SystemVehicleSubClassId']) == int(classId)), None)
            if matched_item:
                trans_data["VehicleClassId"]=int(matched_item['SystemVehicleClassId'])
                trans_data["VehicleSubClassId"]=int(matched_item['SystemVehicleSubClassId'])
                trans_data["PermissibleVehicleWeight"]=matched_item['PermissibleWeight']
                trans_data["VehicleClassName"]=matched_item['SystemVehicleClassName']
                trans_data["VehicleSubClassName"]=matched_item['SystemVehicleSubClassName']
                trans_data["TagClassName"]=matched_item['SystemVehicleSubClassName']
            else:
                trans_data["PermissibleVehicleWeight"]=0
            # if self.systemSetting is not None and self.vehicle_class is not None:
            #     if self.systemSetting['TollFareonSubClass'] == 1:
                   
            #     else:
            #         matched_item = next((item for item in self.vehicle_class if int(item['SystemVehicleClassId']) == int(classId)), None)
            #         if matched_item:
            #             trans_data["VehicleClassId"]=int(matched_item['SystemVehicleClassId'])
            #             trans_data["VehicleSubClassId"]=0
            #             trans_data["PermissibleVehicleWeight"]=matched_item['PermissibleWeight']
            #             trans_data["VehicleClassName"]=matched_item['SystemVehicleClassName']
            #             trans_data["TagClassName"]=matched_item['SystemVehicleClassName']
            #             trans_data["VehicleSubClassName"]=''
            #         else:
            #             trans_data["PermissibleVehicleWeight"]=0
        except Exception as e:
            self.logger.logError(f"Exception get_fasTag_class_name: {str(e)}")
        finally:
            return trans_data
    
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
                    self.current_Transaction=Utilities.current_trans()
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
    
    def update_user(self, transactionInfo,log_time):
        try:
            self.log_time=log_time
            self.userDetails=json.loads(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Exception update_user: {str(e)}")
    
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
    
    def ufd_data_process_thread(self, running_transaction):
        try:
            thread = threading.Thread(target=self.process_on_ufd, args=(running_transaction,))
            thread.start()
        except Exception as e:
            self.logger.logError(f"Exception ufd_data_process_thread: {str(e)}")
    
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
                    self.ufd_message=running_Transaction["TagStatus"]
                    self.ufd.l1_cmd(self.ufd_message)
                    self.ufd.l2s_cmd(f'{running_Transaction["TagClassName"]} {running_Transaction["TagPlateNumber"]}')
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
            self.logger.logError(f"Exception process_fleet_ufd: {str(e)}")
    
    def handel_traffic_light(self,status,running_Transaction=None):
        try:
            if self.dio_thread is not None:
                self.dio_thread.handel_traffic_light(status,running_Transaction)
        except Exception as e:
            self.logger.logError(f"Exception handel_traffic_light: {str(e)}")

    def current_trans(self):
        self.current_Transaction=Utilities.current_trans()
        return self.current_Transaction

    def on_stop(self):
        try:
            self.stop_ws_thread()
            self.stop_ping_thread()
            self.stop_wim_thread()
            self.stop_rfid_thread()
            self.stop_dio_thread() 
            self.stop_avc_thread()
            self.stop_dts_thread()
            self.stop_lpic_thread()
            self.stop_ic_thread()
            self.init_master_varaibles()
            self.logger.logInfo("Lane bg process stopped.")
        except Exception as e:
            self.logger.logError(f"Exception on_stop: {str(e)}")
        finally:
            if self.is_running:
                self.is_running = False