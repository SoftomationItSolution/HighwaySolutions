from datetime import datetime
import json
import os
import platform
import threading
import time
from flask import Flask, Response, render_template, request, jsonify
from flask_cors import CORS
from database.lane_manager import LaneManager
from log.log_master import CustomLogger
from utils.constants import Utilities
from utils.crypt import CryptoUtils

class FlaskApp(threading.Thread):
    def __init__(self, default_directory,script_dir, bg_handler=None):
        super().__init__()
        self.script_dir=script_dir
        self.app = Flask(__name__, static_folder=os.path.join(script_dir, 'static'),template_folder=os.path.join(script_dir,'templates'))
        self.PID_FILE = "TMSv1.pid"
        self.default_directory = default_directory
        self.bg_handler = bg_handler
        self.desktop_app = None
        CORS(self.app)
        self.app.config['CORS_HEADERS'] = 'Content-Type'
        self.set_logger(default_directory,"web_api")
        self.lane_details = None
        self.default_plaza_Id = 1
        self.userDetails=None
        self.app.add_url_rule('/', 'index', self.index)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/ProjectConfigGet','ProjectConfigGet', self.ProjectConfigGet)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/LoginStatusGet','LoginStatusGet', self.LoginStatusGet)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/ValidateUser','ValidateUser', self.ValidateUser, methods=['POST'])
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/getLaneMasterData','getLaneMasterData', self.getLaneMasterData)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/getLaneRecentData','getLaneRecentData', self.getLaneRecentData)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/getCurrentTransactions','getCurrentTransactions', self.getCurrentTransactions)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/LogoutSystem','LogoutSystem', self.LogoutSystem)
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/ProcessTransactions','ProcessTransactions', self.ProcessTransactions, methods=['POST'])
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/FleetStart','FleetStart', self.FleetStart, methods=['POST'])
        self.app.add_url_rule('/Softomation/FastTrackHighway-lane/FleetStop','FleetStop', self.FleetStop, methods=['POST'])
        self.app.add_url_rule('/Softomation/lpicLiveView','lpicLiveView', self.lpicLiveView)
        self.app.add_url_rule('/Softomation/FasTag','FasTag', self.handled_FasTag, methods=['POST'])
        self.app.add_url_rule('/Softomation/VRN','VRN', self.process_vrn, methods=['POST'])
        self.app.add_url_rule('/app_login', 'app_login', self.app_login, methods=['POST'])
        self.app.add_url_rule('/app_logout', 'app_logout', self.app_logout, methods=['POST'])
        self.app.add_url_rule('/restart', 'restart', self.restart)
        self.app.add_url_rule('/login', 'login', self.login)
        self.app.add_url_rule('/logout', 'logout', self.logout)
        self.app.add_url_rule('/shutdown', 'shutdown', self.shutdown)
        self.server = None

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")


    def LoginStatusGet(self):
        try:
            if self.bg_handler:
                result={"loginStatus":self.bg_handler.system_loging_status,
                        "userData":self.userDetails,
                        "shiftDetails":self.bg_handler.current_shift,
                        "loginTime":self.bg_handler.log_time,
                        "LaneTypeId":self.bg_handler.LaneTypeId}
            else:
                result={"loginStatus":False,
                        "userData":None,
                        "shiftDetails":None,
                        "loginTime":None,
                        "LaneTypeId":0}
            return jsonify({'message': 'success','ResponseData':result}), 200
        except Exception as e:
            self.logger.logError(f"Exception LoginStatusGet: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def ProjectConfigGet(self):
        try:
            return jsonify({'message': 'success','ResponseData':self.bg_handler.project_config}), 200
        except Exception as e:
            self.logger.logError(f"Exception ProjectConfigGet: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def ValidateUser(self):
        try:
            input=request.get_json()
            res = LaneManager.GetUserByLoginId(self.bg_handler.dbConnectionObj,input["LoginId"])
            if res is None:
                return jsonify({'message': 'Invalid loginid','ResponseData':None}), 200
            else:
                if len(res)>0:
                    if CryptoUtils.encrypt_aes_256_cbc(input["LoginPassword"]) == res[0]["LoginPassword"]:
                        if self.bg_handler.lane_detail is not None:
                            userDetails = json.dumps(res[0])
                            self.userDetails=res[0]
                            if self.bg_handler.dts_thread:
                                x={"UserId":self.userDetails["UserId"],"LocalAddress":self.bg_handler.default_lane_ip}
                                logresult=self.bg_handler.dts_thread.logIn_activity(x,"UserLoginActivity")
                                if logresult["status"]:
                                    self.bg_handler.update_master_Details()
                                    self.bg_handler.get_current_shift()
                                    threading.Thread(target=self.bg_handler.app_log_status, args=(True,)).start()
                                    current_time = datetime.now()
                                    formatted_time = current_time.strftime("%H:%M:%S")
                                    self.bg_handler.update_user(userDetails,formatted_time)
                                    result={"userData":self.userDetails,"shiftDetails":self.bg_handler.current_shift,"loginTime":formatted_time,"LaneTypeId":self.bg_handler.LaneTypeId}
                                    return jsonify({'message': 'success','ResponseData':result}), 200
                                else:
                                    return jsonify({'message': logresult["message"],'ResponseData':None}), 200
                            else:
                                return jsonify({'message': 'Try after some time','ResponseData':None}), 200
                        else:
                            return jsonify({'message': 'Lane details not found try after some time','ResponseData':None}), 200
                    else:
                        return jsonify({'message': 'Invalid password','ResponseData':None}), 200
                else:
                    return jsonify({'message': 'Invalid loginid','ResponseData':None}), 200
        except Exception as e:
            self.logger.logError(f"Exception ValidateUser: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def LogoutSystem(self):
        try:
            if self.bg_handler is not None:
                self.bg_handler.app_log_status(False)
                if self.bg_handler.dts_thread:
                    x={"UserId":self.userDetails["UserId"]}
                    logresult=self.bg_handler.dts_thread.logIn_activity(x,'UserLogOut')
                    if self.bg_handler.LaneTypeId==3:
                        time.sleep(1)
                        self.bg_handler.auto_login()
                return jsonify({'message': 'Logout done!'}), 200
            else:
                return jsonify({'message': 'App not running!'}), 404
        except Exception as e:
            self.logger.logError(f"Exception LogoutSystem: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def getLaneMasterData(self):
        try:
            final_data={
                "master_data":self.bg_handler.lane_master_data,
                "hardware_list":self.bg_handler.hardware_list,
                "equipment_detail":self.bg_handler.equipment_detail,
                "lane_loging_status":self.bg_handler.system_loging_status
            }  
            return jsonify({'message': 'success','ResponseData':final_data}), 200
        except Exception as e:
            self.logger.logError(f"Exception getLaneMasterData: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def getLaneRecentData(self):
        try:
            latest_lane_txn=LaneManager.GetLatestLaneTransaction(self.bg_handler.dbConnectionObj)
            return jsonify({'message': 'success','ResponseData':latest_lane_txn}), 200
        except Exception as e:
            self.logger.logError(f"Exception getLaneRecentData: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def getCurrentTransactions(self):
        try:
            self.bg_handler.current_trans()
            if self.bg_handler.lane_detail:
                self.bg_handler.setDefaultValue()
                current_Transaction=self.bg_handler.current_Transaction
                ct=datetime.now()
                current_Transaction["LaneTransactionId"]=Utilities.lane_txn_number(self.bg_handler.lane_detail["LaneId"],ct)
                current_Transaction["TransactionDateTime"]= Utilities.current_date_time_json(dt=ct)
                current_Transaction["TagReadDateTime"]= Utilities.current_date_time_json(dt=ct)
            return jsonify({'message': 'success','ResponseData':current_Transaction}), 200
        except Exception as e:
            self.logger.logError(f"Exception getCurrentTransactions: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def ProcessTransactions(self):
        try:
            input=request.get_json()
            status,trans=self.bg_handler.lane_trans_start(input)
            if status:
                return jsonify({'message': 'success','ResponseData':trans}), 200
            else:
                return jsonify({'message': 'failed','ResponseData':None}), 200
        except Exception as e:
            self.logger.logError(f"Exception ProcessTransactions: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def FleetStart(self):
        try:
            input=request.get_json()
            status,trans=self.bg_handler.lane_fleet_start(input)
            if status:
                return jsonify({'message': 'success','ResponseData':trans}), 200
            else:
                return jsonify({'message': 'Already transaction in progress','ResponseData':trans}), 200 
        except Exception as e:
            self.logger.logError(f"Exception FleetStart: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
        
    def FleetStop(self):
        try:
            input=request.get_json()
            status,trans=self.bg_handler.lane_fleet_Stop(input)
            if status:
                return jsonify({'message': 'success','ResponseData':trans}), 200
            else:
                return jsonify({'message': 'No running trans found to stop the fleet','ResponseData':trans}), 200 
        except Exception as e:
            self.logger.logError(f"Exception FleetStop: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def lpicLiveView(self):
        try:
            if self.bg_handler.lpic_thread:
                return Response(self.bg_handler.lpic_thread.generate_frames(), content_type='multipart/x-mixed-replace; boundary=frame')
        except Exception as e:
            self.logger.logError(f"Exception lpicLiveView: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def handled_FasTag(self):
        try:
            if request.is_json:
                data = request.get_json()
                EPCId=data["epc"]
                TID=data["tagId"]
                result,TID,EPCId=Utilities.vaildate_tag_id_epc(TID,EPCId)
                if result:
                    UserData=data["laneId"]
                    current_date_time=datetime.now()
                    tagDetails={"TagReadById":2,"SystemDateTime":current_date_time.isoformat(),
                                "TransactionDateTime":Utilities.current_date_time_json(dt=current_date_time),
                                "ReaderName":"Handled","EPC":EPCId,"TID":TID,"UserData":UserData,
                                "Class":self.convert_hex_to_int(UserData[24:26]),
                                "Plate":self.hex_to_string_vehicle_number(UserData[4:24]),
                                "TagStatus":"NA","Processed":False}
                    result=self.bg_handler.update_rfid_data(tagDetails)
                    if result:
                        return jsonify({"message": "Data received successfully"}), 200
                    else:
                        return jsonify({"message": "Invalid Tag"}), 200
                else:
                    return jsonify({"message": "Invalid Tag"}), 200
            else:
                 return jsonify({"error": "Request must be in JSON format"}), 400
        except Exception as e:
            self.logger.logError(f"Exception handled_FasTag: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
   
    def process_vrn(self):
        try:
            if request.is_json:
                data = request.get_json()
                current_date_time=datetime.now()
                tagDetails={"TagReadById":3,
                            "SystemDateTime":current_date_time.isoformat(),
                            "TransactionDateTime":Utilities.current_date_time_json(dt=current_date_time),
                            "ReaderName":"Handled",
                            "EPC":data["TagId"],
                            "TID":data["TID"],
                            "Class":data["ClassId"],
                            "Plate":data["PlateNumber"],
                            "EXCCODE":data["EXCCODE"],
                            "Processed":False}
                self.bg_handler.update_rfid_data(tagDetails)
                return jsonify({"message": "Data received successfully"}), 200
        except Exception as e:
            self.logger.logError(f"Exception process_vrn: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500
    
    def app_login(self):
        try:
            self.logger.logInfo("app_login route hit")
            if self.bg_handler is not None:
                self.bg_handler.userDetails = request.get_json()
                self.bg_handler.app_log_status(True)
                return jsonify({'message': 'Login done!'}), 200
            else:
                return jsonify({'message': 'App not running!'}), 404
        except Exception as e:
            self.logger.logError(f"Exception app_login: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def app_logout(self):
        try:
            self.logger.logInfo("app_logout route hit")
            if self.bg_handler is not None:
                self.bg_handler.app_log_status(False)
                return jsonify({'message': 'Logout done!'}), 200
            else:
                return jsonify({'message': 'App not running!'}), 404
        except Exception as e:
            self.logger.logError(f"Exception app_logout: {str(e)}")
            return jsonify({'message': 'Internal server error!'}), 500

    def index(self):
        config_filePath = os.path.join(self.default_directory, "MasterConfig", "dbConfig.json")
        data = Utilities.read_json_file(config_filePath)
        return render_template('index.html', data=data)
    
    def restart(self):
        try:
            result = self.restart_system()
            return result
        except Exception as e:
            return str(e), 500

    def shutdown(self):
        try:
            result = self.shutdown_system()
            return result
        except Exception as e:
            return str(e), 500

    def login(self):
        self.bg_handler.app_log_status(True)
        return "Login functionality"

    def logout(self):
        self.bg_handler.app_log_status(False)
        return "Logout functionality"

    def restart_system(self):
        if platform.system() == 'Windows':
            os.system('shutdown /r /t 1')
        elif platform.system() == 'Linux' or platform.system() == 'Darwin':  # Darwin is macOS
            os.system('shutdown -r now')
        else:
            return "Unsupported OS"
        return "Restart initiated"

    def shutdown_system(self):
        if platform.system() == 'Windows':
            os.system('shutdown /s /t 1')
        elif platform.system() == 'Linux' or platform.system() == 'Darwin':
            os.system('shutdown now')
        else:
            return "Unsupported OS"
        return "Shutdown initiated"

    def run(self):
        self.server = threading.Thread(target=self.app.run, kwargs={'debug': False, 'host': '0.0.0.0', 'port': 5002})
        self.server.start()

    def start_app(self):
        try:
            self.start()
        except Exception as e:
            self.logger.logError(f"Exception start_app: {str(e)}")

    def stop_app(self):
        try:
            if self.server:
                self.server.join(1)
        except Exception as e:
            self.logger.logError(f"Exception stop_app: {str(e)}")

    def convert_hex_to_int(self,hex_string):
        result='00'
        try:
            result=str(int(hex_string, 16))
        except Exception as e:
                self.logger.logError(f"Exception convert_hex_to_int: {str(e)}")
                result='00'
        finally:
            return result
        
    def hex_to_string_vehicle_number(self,hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
                self.logger.logError(f"Exception hex_to_string_vehicle_number: {str(e)}")
                result='XXXXXXXXXX'
        finally:
            return result