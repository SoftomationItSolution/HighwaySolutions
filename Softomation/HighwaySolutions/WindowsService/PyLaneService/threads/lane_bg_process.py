from datetime import datetime
import threading
import time
from api.flask_app import FlaskApp
from data_sync.data_importer import DataImporter
from data_sync.data_synchronization import DataSynchronization
from database.common_manager import CommonManager
from log.log_master import CustomLogger
from threads.ping_thread import PingThread
from utils.constants import Utilities
from web_socket.webSocketServer import LaneWebSocketServer


class LaneBGProcess(threading.Thread):
    def __init__(self, default_directory, dbConnectionObj, script_dir, system_ip,ic_timemout):
        super().__init__()
        self.default_directory = default_directory
        self.dbConnectionObj = dbConnectionObj
        self.ic_timemout=ic_timemout
        self.script_dir = script_dir
        self.default_lane_ip = system_ip
        self.default_plaza_Id=0
        self.default_lane_Id=0
        self.LaneTypeId=1
        self.is_running = True
        #self.data_importer=DataImporter(default_directory,dbConnectionObj,self.default_plaza_Id,system_ip)
        self.dts_thread=None
        self.data_import_thread=None
        self.systemSetting=None
        self.plaza_detail=None
        self.lane_detail=None
        self.equipment_detail=None

        # self.app_thread=None
        # self.api_thread=None
        # self.vehicle_class=None
        # self.vehicle_sub_class=None
        # self.dio_equipment_detail=None
        # self.toll_fare=None
        # self.shiftDetails=None
        # self.current_shift=None
        # self.userDetails=None
        # self.dio_thread = None
        # self.avc_thread=None
        # self.wim_thread=None
        # self.rfid_thread=None
        # self.ping_thread=None
        # 
        # self.ufd=None
        # self.lpic_thread=None
        # self.ic_thread=None
        # self.current_Transaction=None
        # self.running_Transaction=None
        # self.project_config=None
        # self.lane_master_data=None
        # self.web_socket_server=None
        # self.receipt_printer=None
        # self.mqtt_Handler=None
        # self.rfid_client_connected=False
        # self.system_loging_status=False
        # self.system_transcation_status=False
        # self.barrier_auto=True
        # self.presence_loop_required=False
        # self.exit_loop_required=False
        # self.avc_loop_required=False
        self.ufd_message=""
        self.rfid_data=[]
        self.wim_data=[]
        self.transaction_data=[]
        self.set_logger(default_directory,"lane_bg")
        self.load_project_config(default_directory)

    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")
    
    def load_project_config(self,default_directory):
        try:
            dirlist=[default_directory, 'MasterConfig', 'ProjectConfiguration.json']
            project_config_path = Utilities.get_final_path(dirlist)
            self.project_config=Utilities.read_json_file(project_config_path)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

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

    def start_dts_thread(self):
        try:
            if not self.dts_thread:
                self.dts_thread=DataSynchronization(self.default_directory, self.dbConnectionObj,self.default_plaza_Id,self.default_lane_ip)
                self.dts_thread.daemon=True
                self.dts_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start_dts_thread: {str(e)}")

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
    
    def GetLaneDetails(self):
        try:
            if (self.equipment_detail is None or self.dio_equipment_detail is None or
                self.transaction_type_master is None or self.payment_type_master is None or
                self.vehicle_class is None or self.vehicle_sub_class is None or
                self.shiftDetails is None or self.toll_fare is None or self.systemSetting is None
                or self.Plaza is None or self.Lane is None or self.keyBoardCodes is None):
                
                current_date = datetime.now().date()
                self.lane_master_data = CommonManager.GetLaneDetails(self.dbConnectionObj, self.default_lane_ip, current_date)
                
                if len(self.lane_master_data) == 13:
                    (self.equipment_detail, self.dio_equipment_detail, self.transaction_type_master,
                    self.payment_type_master, self.exempt_type_master, self.vehicle_class,self.vehicle_sub_class, 
                    self.shiftDetails, self.toll_fare, self.systemSetting,self.Plaza,self.Lane,self.keyBoardCodes) = self.lane_master_data
                else:
                    raise ValueError("Unexpected number of result sets returned from the stored procedure.")
                if self.shiftDetails:
                    self.get_current_shift()
        except Exception as e:
            self.logger.logError(f"Exception GetLaneDetails: {str(e)}")
            self.lane_master_data = None

    def start_lane_api(self):
        try:
            if self.api_thread is None:
                self.api_thread = FlaskApp(self.default_directory,self.script_dir, self.logger,self)
                self.api_thread.start_app()
        except Exception as e:
            self.logger.logError(f"Exception start_lane_api: {str(e)}")
    
    def stop_lane_api(self):
        try:
            if self.api_thread is not None:
                self.api_thread.stop_app()
        except Exception as e:
            self.logger.logError(f"Exception stop_lane_api: {str(e)}")

    def run_equipments(self):
        try:
            if self.equipment_detail is not None and self.dio_equipment_detail is not None:
                self.start_ping_thread()
                self.start_lane_api()  
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
                #         self.connect_ufd(equipment)
                #     elif equipment["EquipmentTypeId"]==21:
                #         self.start_avc_thread(equipment)
                #     elif equipment["EquipmentTypeId"]==10:
                #         self.set_up_printer(equipment)
                #     time.sleep(0.100)  
               
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

    def on_stop(self):
        try:
            self.stop_ws_thread()
            self.stop_ping_thread()
            # self.stop_dio_thread() 
            # self.stop_avc_thread()
            # self.stop_wim_thread()
            # self.stop_rfid_thread()
            # self.stop_dts_thread()
            # self.stop_lpic_thread()
            # self.stop_ic_thread()
            # 
            # self.plaza_detail=None
            # self.lane_detail=None
            # self.equipment_detail=None
            # self.rfid_client_connected=False
            self.stop_lane_api()
            self.logger.logInfo("Lane Equipment Synchronization stopped.")
        except Exception as e:
            self.logger.logError(f"Exception on_stop: {str(e)}")
        finally:
            if self.is_running:
                self.is_running = False