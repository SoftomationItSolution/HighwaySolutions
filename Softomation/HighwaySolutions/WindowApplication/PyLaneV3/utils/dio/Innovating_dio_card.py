import platform
import socket
import threading
import time
import serial
from utils.constants import Utilities
from utils.log_master import CustomLogger

class InnovatingDIOClient(threading.Thread):
    def __init__(self,_handler,default_directory,_dio_detail,_out_labels,system_loging_status,barrier_auto,log_file_name,ic_timemout,timeout=0.100):
        threading.Thread.__init__(self)
        self.handler=_handler
        self.dio_detail=_dio_detail
        self.system_loging_status=system_loging_status
        self.barrier_auto=barrier_auto
        self.ic_timemout=ic_timemout
        self.timeout=timeout
        self.client_socket=None
        self.is_running=False
        self.is_stopped = False
        self.record_status=False
        self.system_transcation_status=False
        self.violation_duration=3
        self.auto_count=0
        self.running_Transaction=None
        self.out_labels = _out_labels
        self.barrier_loop_last=False
        self.presence_loop_last=False
        self.barrier_Status=False        
        self.ohls_status=False
        self.set_logger(default_directory,log_file_name)
        self.set_exit_loop()
        self.set_status()
        self.set_serial_port()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="InnovatingDIOClient"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.dio_detail["OnLineStatus"]==0 or self.dio_detail["OnLineStatus"]==False: 
                self.is_active=False
            else:
                self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception set_status: {str(e)}")

    def set_exit_loop(self):
        try:
            self.exit_loop_index=Utilities.is_integer(self.dio_detail["UrlAddress"])
        except Exception as e:
            self.exit_loop_index=9
            self.logger.logError(f"Exception set_exit_loop: {str(e)}")

    def set_serial_port(self):
        try:
            self.ProtocolTypeId=self.dio_detail["ProtocolTypeId"]
            if self.ProtocolTypeId==3:
                self.baudrate=int(self.dio_detail["PortNumber"])
                if platform.system() == 'Linux':
                    self.comport=self.dio_detail["IpAddress"]
                    self.comport=self.comport.replace("COM", "/dev/ttyS")
                else:
                    self.comport=self.dio_detail["IpAddress"]
        except Exception as e:
            self.logger.logError(f"Exception set_serial_port: {str(e)}")

    def app_log_status(self, transactionInfo):
        try:
            self.system_loging_status=transactionInfo
        except Exception as e:
            self.logger.logError(f"Exception app_log_status: {str(e)}")

    def handel_presence_loop(self,loop_status):
        try:
            out_data= self.out_labels[5]
            if out_data["PositionStatus"] != loop_status:
                out_data["PositionStatus"] = loop_status
                self.handler.update_dio_events(self.out_labels)
        except Exception as e:
            self.logger.logError(f"Exception handel_presence_loop: {str(e)}")
        finally:
            if loop_status!=self.presence_loop_last:
                self.presence_loop_last=loop_status

    def handel_exit_loop(self,loop_status):
        try:
            out_data= self.out_labels[4]
            if out_data["PositionStatus"] != loop_status:
                out_data["PositionStatus"] = loop_status
                self.handler.update_dio_events(self.out_labels)
            if loop_status==True and self.barrier_loop_last==False and self.barrier_Status==True:
                self.handler.lane_trans_ic_cam(self.running_Transaction)
            if loop_status==False and self.barrier_loop_last==True and self.barrier_Status==True and self.ohls_status==True and self.system_loging_status==True:
                if self.system_transcation_status:
                    self.lane_trans_end()
                else:
                    self.violation_trigger()
            if loop_status==False and self.barrier_loop_last==True and self.barrier_Status==False and self.ohls_status==True and self.system_loging_status==True:
                self.violation_trigger()
        except Exception as e:
            self.logger.logError(f"Exception handel_exit_loop: {str(e)}")
        finally:
            if loop_status!=self.barrier_loop_last:
                self.barrier_loop_last=loop_status
    
    def process_data(self,data):
        try:
            lines = data.split('\n')
            commands = [cmd for line in lines for cmd in line.split('\r') if cmd]
            filtered_commands = [cmd for cmd in commands if 'INPUT3' in cmd.upper() or 'INPUT4' in cmd.upper()]
            for cmd in filtered_commands:
                cmd_upper = cmd.upper()
                if 'INPUT3LOW' in cmd_upper:
                    self.handel_presence_loop(False)
                elif 'INPUT3HIGH' in cmd_upper:
                    self.handel_presence_loop(True)
                elif 'INPUT4LOW' in cmd_upper:
                    self.handel_exit_loop(False)
                elif 'INPUT4HIGH' in cmd_upper:
                    self.handel_exit_loop(True)
        except Exception as e:
            self.logger.logError(f"Exception process_data: {str(e)}")
            return False
        
    def send_data(self,input):
        result=False
        try:
            bytes_data = input.encode('ascii')
            if self.dio_detail["ProtocolTypeId"]==1:
                self.client_socket.sendall(bytes_data)
            elif self.dio_detail["ProtocolTypeId"]==3:
                self.client_socket.write(bytes_data)
            result= True
        except Exception as e:
            self.logger.logError(f"Exception send_data: {str(e)}")
        finally:
            self.handler.update_dio_events(self.out_labels)
            time.sleep(0.100)
        return result        
        
    def violation_trigger(self):
        try:    
            def violation_trigger_run():    
                try:    
                    start_time = time.time()
                    self.violation_alarm_on()
                    self.handler.start_violation_trans()
                    while not stop_event.is_set():
                        if time.time() - start_time >= self.violation_duration:
                            self.violation_alarm_off()
                            self.handler.stop_violation_trans()
                            break
                        time.sleep(self.timeout)
                except Exception as e:
                    self.logger.logError(f"Exception violation_trigger_run: {str(e)}")
            stop_event = threading.Event()
            violation_thread = threading.Thread(target=violation_trigger_run())
            violation_thread.start()
            violation_thread.join()
        except Exception as e:
            self.logger.logError(f"Exception violation_trigger: {str(e)}")
        
    def run(self):
        while not self.is_stopped:
            if self.is_stopped:
                break
            try:
                if self.dio_detail["ProtocolTypeId"]==1:
                    self.check_status()
                    self.tcp_conn()
                elif self.dio_detail["ProtocolTypeId"]==3:
                    self.serial_conn()
            except ConnectionRefusedError:
                self.logger.logError(f"Connection refused. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception run: {str(e)}")
            finally:
                self.client_stop()

    def tcp_conn(self):
        try:
            while self.is_active:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.dio_detail["IpAddress"], self.dio_detail["PortNumber"]))
                self.is_running = True
                self.handler.update_equipment_list(self.dio_detail["EquipmentId"],'ConnectionStatus',True)
                self.reset_command()
                while self.is_running:
                    if not self.is_active or self.is_stopped or not self.is_running:
                        self.handler.update_equipment_list(self.dio_detail["EquipmentId"],'ConnectionStatus',False)
                        break
                    echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        self.process_data(echoed_transaction_number)
                    time.sleep(self.timeout)
                    self.check_status()
                time.sleep(self.timeout)
            self.check_status()
        except Exception as e:
            raise e
        
    def tcp_close(self):
        try:
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception on_tcp (closing): {str(e)}")

    def serial_conn(self):
        try:
            self.client_socket = serial.Serial(timeout=0.200)
            self.client_socket.baudrate = self.baudrate
            self.client_socket.port = self.comport
            self.handler.update_equipment_list(self.dio_detail["EquipmentId"],'ConnectionStatus',True)
            self.client_socket.open()
            self.is_running = True
            self.reset_command()
            while self.is_running:
                if self.is_stopped or not self.is_running:
                    self.handler.update_equipment_list(self.dio_detail["EquipmentId"],'ConnectionStatus',False)
                    break
                received_data = self.client_socket.readline().decode('utf-8').strip()
                if len(received_data) != 0:
                    self.process_data(received_data)
                time.sleep(self.timeout)
        except Exception as e:
            raise e    
    
    def serial_close(self):
        try:
            if self.client_socket:
                if self.client_socket.is_open:
                    self.client_socket.close()
        except Exception as e:
            self.logger.logError(f"Exception on_serial (closing): {str(e)}")
    
    def client_stop(self):
        try:
            self.is_running = False
            if self.dio_detail["ProtocolTypeId"]==1:
                self.tcp_close()
            elif self.dio_detail["ProtocolTypeId"]==3:
                self.serial_close()
        except Exception as e:
                self.logger.logError(f"Exception client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_running=False
            self.is_active=False
            self.is_stopped = True
            self.client_stop()
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")

    def reset_command(self):
        self.traffic_light_off()
        self.ohls_light_on()
        self.barrier_gate_off()
        self.violation_alarm_off()
        
    def retry(self,status):
        if self.is_active!=status:
            self.is_active=status

    def check_status(self):
        try:
            if self.is_active==False and self.is_stopped==False:
                self.is_active=self.handler.get_on_line_status(self.dio_detail['EquipmentTypeId'])
                if self.is_active==0:
                    self.is_active=False
                elif self.is_active==1:
                    self.is_active=True
        except Exception as e:
            self.logger.logError(f"Exception check_status: {str(e)}")

    def handel_traffic_light(self,status,running_Transaction=None):
        try:
            self.system_transcation_status=status
            self.running_Transaction=running_Transaction
            if self.client_socket is not None and self.barrier_auto:
                if status:
                    self.traffic_light_on()
                    self.barrier_gate_on()
                else:
                    self.traffic_light_off()
                    self.barrier_gate_off()
            else:
                self.auto_count += 1
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_start: {str(e)}")

    def handel_ohls_light(self,status):
        try:
            if self.client_socket is not None:
                if status:
                    self.ohls_light_on()
                else:
                    self.ohls_light_off()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_start: {str(e)}")

    def lane_trans_end(self):
        try:
            self.handel_traffic_light(False,None)
            self.handler.lane_trans_end()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")

    def ohls_light_on(self):
        self.send_data("R2,N,60")
        self.out_labels[0]["PositionStatus"]=True
        self.ohls_status=True

    def ohls_light_off(self):
        self.send_data("R2,F,60")
        self.out_labels[0]["PositionStatus"]=False
        self.ohls_status=False
    
    def traffic_light_on(self):
        self.send_data("R1,N,60")
        self.out_labels[1]["PositionStatus"]=True
    
    def traffic_light_off(self):
        self.send_data("R1,F,60")
        self.out_labels[1]["PositionStatus"]=False
        

    def barrier_gate_on(self):
        self.send_data("R4,N,60")
        self.out_labels[2]["PositionStatus"]=True
        self.barrier_Status=True
    
    def barrier_gate_off(self):
        self.send_data("R4,F,60")
        self.out_labels[2]["PositionStatus"]=False
        self.barrier_Status=False

    def violation_alarm_on(self):
        self.send_data("R5,N,60")
        self.out_labels[3]["PositionStatus"]=True
    
    def violation_alarm_off(self):
        self.send_data("R5,F,60")
        self.out_labels[3]["PositionStatus"]=False