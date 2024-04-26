import socket
import threading
import time
from utils.log_master import CustomLogger
from pubsub import pub

class KistDIOClient(threading.Thread):
    def __init__(self,_handler,default_directory,_dio_detail,_topic_name,log_file_name,timeout=0.100):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dio_detail=_dio_detail
        self.topic_name=_topic_name
        self.timeout=timeout
        self.logger = CustomLogger(default_directory,log_file_name)
        self.client_socket=None
        self.transactionInfo=None
        self.is_running=False
        self.is_stopped = False
        self.violation_duration=10
        self.out_labels = [
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 2, "EquipmentTypeName": "OHLS", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 17, "EquipmentTypeName": "Traffic light", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 19, "EquipmentTypeName": "Boom Barrier", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 14, "EquipmentTypeName": "Hooter-Violation Light", "Status": False}
        ]
        self.barrier_loop_last=False
        self.barrier_Status=False
        self.set_logger(default_directory,log_file_name)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="KistDIOClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def formate_output(self, input):
        try:
            output_value = input.split(":")[1].strip()
            value = output_value.strip()
            for i in range(4):
                out_data= self.out_labels[i]
                out_data["Status"] = False if int(value[i])==0 else True
                try:
                    pub.sendMessage("hardware_on_off_status", transactionInfo=out_data)
                except Exception as e:
                    self.logger.logError(f"Exception {self.classname} formate_output_PUB: {str(e)}")
                try:
                    self.handler.send_message_to_mqtt(self.topic_name,out_data)
                except Exception as e:
                    self.logger.logError(f"Exception {self.classname} formate_output_mqtt: {str(e)}")
                finally:
                    if i==2:
                        self.barrier_Status=False if int(value[i])==0 else True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} formate_output: {str(e)}")

    def formate_in(self, input):
        try:
            in_data={}
            output_value = input.split(":")[1].strip()
            data_len=len(output_value)
            value = output_value.strip()
            for i in range(data_len):
                key=f"IN-{str(i+1)}"
                status=True if int(value[i])==0 else False
                if (i+1)==9:
                    if status==False and self.barrier_loop_last==True and self.barrier_Status==True:
                        self.lane_trans_end(status)
                    if status==False and self.barrier_Status==True:
                        self.handler.start_lpic_record(self.transactionInfo)
                    if status==False and self.barrier_loop_last==True and self.barrier_Status==False:
                        self.violation_trigger('s41e')
                    if status!=self.barrier_loop_last:
                        self.barrier_loop_last=status
                in_data[key] = status
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} formate_output: {str(e)}")

    def process_data(self,data):
        try:
            pairs = data.split(",")
            for pair in pairs:
                pair=pair.strip()
                if pair.upper().startswith("OUT"):
                    self.formate_output(pair)
                elif pair.upper().startswith("IN"):
                    self.formate_in(pair)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} process_data: {str(e)}")
            return False
        
    def send_data(self,input):
        try:
            bytes_data = input.encode('ascii')
            self.client_socket.sendall(bytes_data)
            return True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} send_data: {str(e)}")
            return False
        
    def violation_trigger(self,command):
        try:    
            def violation_trigger_run():    
                try:    
                    start_time = time.time()
                    self.send_data(command)
                    self.handler.create_violation_trans()
                    while not stop_event.is_set():
                        if time.time() - start_time >= self.violation_duration:
                            self.send_data(command.replace('1','0'))
                            break
                        time.sleep(self.timeout)
                except Exception as e:
                    self.logger.logError(f"Exception {self.classname} violation_trigger_run: {str(e)}")
            stop_event = threading.Event()
            violation_thread = threading.Thread(target=violation_trigger_run())
            violation_thread.start()
            violation_thread.join()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} violation_trigger: {str(e)}")
        
    def run(self):
        while not self.is_stopped:
            try:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.dio_detail["IpAddress"], self.dio_detail["PortNumber"]))
                self.is_running = True
                self.send_data('sSAe')
                while self.is_running:
                    echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        self.process_data(echoed_transaction_number)
                    time.sleep(self.timeout)
            except ConnectionRefusedError:
                self.logger.logError(f"Connection refused {self.classname}. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} run: {str(e)}")
            finally:
                self.client_stop()

    def client_stop(self):
        try:
            self.is_running = False
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop: {str(e)}")

    def lane_trans_start(self,transactionInfo):
        try:
            self.transactionInfo=transactionInfo
            if self.client_socket is not None:
               self.send_data('s31e')
               self.send_data('s21e')
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_start: {str(e)}")

    def lane_trans_end(self):
        try:
            if self.client_socket is not None:
               self.send_data('s30e')
               self.send_data('s20e')
            self.handler.stop_ic_record()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} lane_trans_end: {str(e)}")