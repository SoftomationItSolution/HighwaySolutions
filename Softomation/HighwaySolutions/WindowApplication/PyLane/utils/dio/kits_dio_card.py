import socket
import threading
import time
from utils.log_master import CustomLogger
from pubsub import pub

class KistDIOClient(threading.Thread):
    def __init__(self,_handler,config_manager,_dio_detail,_topic_name,log_file_name,timeout=0.5):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dio_detail=_dio_detail
        self.topic_name=_topic_name
        self.timeout=timeout
        self.logger = CustomLogger(config_manager,log_file_name)
        self.client_socket=None
        self.is_running=False
        self.is_stopped = False
        self.violation_duration=10
        self.out_labels = [
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 2, "EquipmentTypeName": "OHLS", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 17, "EquipmentTypeName": "Traffic light", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 19, "EquipmentTypeName": "Boom Barrier", "Status": False},
            {"LaneId":self.dio_detail["LaneId"],"EquipmentTypeId": 14, "EquipmentTypeName": "Hooter-Violation Light", "Status": False}
        ]
        pub.subscribe(self.lane_trans_start, "lane_process_start")
        self.barrier_loop_last=False
        self.barrier_Status=False

    def formate_output(self, input):
        output_value = input.split(":")[1].strip()
        value = output_value.strip()
        for i in range(4):
            out_data= self.out_labels[i]
            out_data["Status"] = False if int(value[i])==0 else True
            try:
                pub.sendMessage("dio_processed_out", transactionInfo=out_data)
            except Exception as e:
                self.logger.logError(f"An exception occurred in dio to PUB: {e}")
            try:
                self.handler.send_message_to_mqtt(self.topic_name,out_data)
            except Exception as e:
                self.logger.logError(f"An exception occurred in dio to MQTT: {e}")
            finally:
                if i==2:
                    self.barrier_Status=False if int(value[i])==0 else True

    def formate_in(self, input):
        in_data={}
        output_value = input.split(":")[1].strip()
        data_len=len(output_value)
        value = output_value.strip()
        for i in range(data_len):
            key=f"IN-{str(i+1)}"
            status=True if int(value[i])==0 else False
            if (i+1)==9:
                if status==False and self.barrier_loop_last==True and self.barrier_Status==True:
                   pub.sendMessage("lane_process_stoped", transactionInfo=status)
                   self.lane_trans_done()
                if status==False and self.barrier_loop_last==True and self.barrier_Status==False:
                    
                    self.violation_trigger('s41e')
                if status!=self.barrier_loop_last:
                    self.barrier_loop_last=status
            in_data[key] = status
            in_d={"LaneId":self.dio_detail["LaneId"],key:in_data}
            pub.sendMessage("dio_processed_in", transactionInfo=in_d)

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
            self.logger.logError("Exception process_data: {}".format(str(e)))
            return False
        
    def send_data(self,input):
        try:
            bytes_data = input.encode('ascii')
            self.client_socket.sendall(bytes_data)
            return True
        except Exception as e:
            self.logger.logError("Exception send_data: {}".format(str(e)))
            return False
        

    
        
    def violation_trigger(self,command):
        def run():    
            start_time = time.time()
            self.send_data(command)
            while not stop_event.is_set():
                if time.time() - start_time >= self.violation_duration:
                    self.send_data(command.replace('1','0'))
                    break
                time.sleep(0.100)
        stop_event = threading.Event()
        violation_thread = threading.Thread(target=run())
        violation_thread.start()
        violation_thread.join()
        
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
                self.logger.logInfo("Connection refused. Retrying in {} seconds...".format(self.timeout))
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError("Exception occurred: {}".format(str(e)))
            finally:
                self.client_stop()

    def client_stop(self):
        self.is_running = False
        if self.client_socket:
            self.client_socket.close()

    def stop(self):
        self.is_stopped = True
        self.client_stop()

    def lane_trans_start(self, transactionInfo):
        try:
            if self.client_socket is not None:
               self.send_data('s31e')
               self.send_data('s21e')
        except Exception as e:
            print(e)

    def lane_trans_done(self):
        try:
            if self.client_socket is not None:
               self.send_data('s30e')
               self.send_data('s20e')
        except Exception as e:
            print(e)