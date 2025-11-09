import platform
import socket
import threading
import time
import serial
from log.log_master import CustomLogger
from utils.constants import Utilities

class KistDIOClient(threading.Thread):
    def __init__(self,_handler,default_directory,_dio_detail,_out_labels,system_loging_status,barrier_auto,log_file_name,ic_timemout,timeout=0.200):
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
        self.fleet_status=False
        self.fleet_counter=0
        self.set_logger(default_directory,log_file_name)
        self.set_exit_loop()
        self.set_status()
        self.set_serial_port()

    def set_logger(self,default_directory,log_file_name):
        try:
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

    def formate_output(self, input):
        try:
            if ":" in input:
                output_value = input.split(":")[1].strip()
                value = output_value.strip()
                for i in range(4):
                    if i==0:
                        self.ohls_status=False if int(value[i])==0 else True
                    elif i==2:
                        self.barrier_Status=False if int(value[i])==0 else True
        except Exception as e:
            self.logger.logError(f"Exception formate_output: {str(e)}")

    def formate_in(self, input):
        try:
            in_data={}
            if ":" in input:
                output_value = input.split(":")[1].strip()
                data_len=len(output_value)
                value = output_value.strip()
                for i in range(data_len):
                    key=f"IN-{str(i+1)}"
                    status=False if int(value[i])==1 else True
                    if (i+1)==self.exit_loop_index:
                        self.handel_exit_loop(status)
                    in_data[key] = status
        except Exception as e:
            self.logger.logError(f"Exception formate_in: {str(e)}")

    def handel_presence_loop(self,loop_status):
        try:
            if loop_status!=self.presence_loop_last:
                self.presence_loop_last=loop_status
            out_data= self.out_labels[5]
            if out_data["PositionStatus"] != loop_status:
                out_data["PositionStatus"] = loop_status
                self.handler.update_hardware_list(5,loop_status)
        except Exception as e:
            self.logger.logError(f"Exception handel_presence_loop: {str(e)}")

    def handel_exit_loop(self,loop_status):
        try:
            if loop_status!=self.barrier_loop_last:
                out_data= self.out_labels[4]
                if out_data["PositionStatus"] != loop_status:
                    out_data["PositionStatus"] = loop_status
                # if self.running_Transaction and self.fleet_status==False:
                #     if self.ic_timemout==0:
                #         self.ic_camera_handel(loop_status)
                #     else:
                #          if loop_status==True:
                #             self.ic_camera_handel(loop_status)
                if loop_status==False and self.barrier_loop_last==True and self.barrier_Status==True and self.ohls_status==True:
                    if self.system_transcation_status and self.fleet_status==False:
                        self.lane_trans_end()
                    if self.fleet_status:
                        self.fleet_counter += 1
                        self.handler.update_fleet_counter(self.fleet_counter)
                if loop_status==True and self.barrier_loop_last==False and self.barrier_Status==False and self.ohls_status==True and self.fleet_status==False:
                    threading.Thread(target=self.handler.start_violation_trans()).start()
                    self.violation_alarm_on()
                if loop_status==False and self.barrier_loop_last==True and self.barrier_Status==False and self.ohls_status==True and self.fleet_status==False:
                    threading.Thread(target=self.handler.stop_violation_trans()).start()
                    self.violation_alarm_off()          
        except Exception as e:
            self.logger.logError(f"Exception handel_exit_loop: {str(e)}")
        finally:
            if loop_status!=self.barrier_loop_last:
                self.barrier_loop_last=loop_status
                self.handler.update_hardware_list(4,loop_status)
    
    def ic_camera_handel(self,status):
        try:
            if status:
                threading.Thread(target=self.handler.start_ic_record, args=(self.running_Transaction,)).start()
            else:
                threading.Thread(target=self.handler.stop_ic_record()).start()
        except Exception as e:
            self.logger.logError(f"Exception ic_camera_handel: {str(e)}")
    
    def process_data(self,data):
        try:
            pairs = data.split(",")
            for pair in pairs:
                pair=pair.strip()
                if pair.upper().startswith("IN"):
                    self.formate_in(pair)
        except Exception as e:
            self.logger.logError(f"Exception process_data: {str(e)}")
            return False
        
    def resend_data(self,input):
        result = False
        try:
            bytes_data = input.encode('ascii')
            if self.dio_detail["ProtocolTypeId"] == 1:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.dio_detail["IpAddress"], self.dio_detail["PortNumber"]))
                self.client_socket.sendall(bytes_data)
            elif self.dio_detail["ProtocolTypeId"] == 3:
                self.client_socket = serial.Serial(timeout=0.200)
                self.client_socket.baudrate = self.baudrate
                self.client_socket.port = self.comport
                self.client_socket.open()
                self.client_socket.write(bytes_data)
            result = True
        except Exception as e:
            self.logger.logError(f"Exception resend_data: {str(e)}")
            result = False
            self.is_running=False
        finally:
            return result
        
    def send_data(self, input):
        result = False
        try:
            if self.client_socket is not None and self.client_socket.fileno() != -1:
                bytes_data = input.encode('ascii')
                if self.dio_detail["ProtocolTypeId"] == 1:
                    self.client_socket.sendall(bytes_data)
                elif self.dio_detail["ProtocolTypeId"] == 3:
                    self.client_socket.write(bytes_data)
                result = True
            else:
                self.logger.logError("Socket is not open, attempting to reconnect.")
                self.tcp_conn()
        except Exception as e:
            self.logger.logError(f"Exception send_data: {str(e)}")
            self.resend_data(input)
        finally:
            time.sleep(0.100)
        return result
        
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
                try:
                    self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    self.client_socket.connect((self.dio_detail["IpAddress"], self.dio_detail["PortNumber"]))
                    self.is_running = True
                    self.handler.update_equipment_list(self.dio_detail["EquipmentId"], 'ConnectionStatus', True)
                    self.reset_command()
                    while self.is_running:
                        try:
                            if not self.is_active or self.is_stopped or not self.is_running:
                                self.handler.update_equipment_list(self.dio_detail["EquipmentId"], 'ConnectionStatus', False)
                                break
                            data = self.client_socket.recv(1024)
                            decoded_data = data.decode('utf-8', errors='ignore').strip()
                            
                            if len(decoded_data) != 0:
                                self.process_data(decoded_data)
                        except Exception as e:
                            self.logger.logError(f"Exception in tcp_conn data: {str(e)}")
                            if isinstance(e, socket.error) and e.errno in [104, 32]:  # Connection reset by peer (104) or broken pipe (32)
                                self.logger.logError(f"Connection error detected. Retrying in {self.timeout} seconds...")
                                time.sleep(self.timeout)
                                self.client_socket.close() 
                                self.tcp_conn() 
                                break 
                            
                        time.sleep(self.timeout)  # Control the speed of the loop
                    time.sleep(self.timeout)  # Small delay between reconnection attempts
                except (socket.error, ConnectionRefusedError) as e:
                    self.logger.logError(f"Initial connection failed: {str(e)}. Retrying in {self.timeout} seconds...")
                    time.sleep(self.timeout)
                    self.client_socket.close()  # Ensure the socket is closed before retrying
                    self.tcp_conn()  # Retry the connection
                except Exception as e:
                    self.logger.logError(f"Exception in tcp_conn: {str(e)}")
                    break  # Break the loop in case of any other exception
        except Exception as e:
            self.logger.logError(f"Exception in tcp_conn main loop: {str(e)}")
        finally:
            self.client_stop()  # Ensure the client socket is properly closed after the loop ends
        
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
        self.ohls_light_off()
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
            if self.client_socket is not None and self.barrier_auto:
                if status:
                    self.running_Transaction=running_Transaction
                    self.traffic_light_on()
                    self.barrier_gate_on()
                else:
                    self.traffic_light_off()
                    self.barrier_gate_off()
                    self.running_Transaction=None
            else:
                self.auto_count += 1
        except Exception as e:
            self.logger.logError(f"Exception handel_traffic_light: {str(e)}")

    def handel_ohls_light(self,status):
        try:
            if self.client_socket is not None:
                if status:
                    self.ohls_light_on()
                else:
                    self.ohls_light_off()
        except Exception as e:
            self.logger.logError(f"Exception handel_ohls_light: {str(e)}")

    def lane_trans_end(self):
        try:
            self.handel_traffic_light(False,None)
            self.handler.lane_trans_end()
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")

    def handel_fleet(self,action):
        try:
            if action==True:
                self.traffic_light_on()
                self.barrier_gate_on()
                self.fleet_counter=0
            else:
                self.traffic_light_off()
                self.barrier_gate_off()
                self.fleet_counter=0
            self.fleet_status=action
        except Exception as e:
            self.logger.logError(f"Exception lane_trans_end: {str(e)}")
    
    def ohls_light_on(self):
        self.send_data("s11e")
        self.out_labels[0]["PositionStatus"]=True
        self.ohls_status=True
        self.handler.update_hardware_list(0,True)

    def ohls_light_off(self):
        self.send_data("s10e")
        self.out_labels[0]["PositionStatus"]=False
        self.ohls_status=False
        self.handler.update_hardware_list(0,False)
    
    def traffic_light_on(self):
        self.send_data("s21e")
        self.out_labels[1]["PositionStatus"]=True
        self.handler.update_hardware_list(1,True)
    
    def traffic_light_off(self):
        self.send_data("s20e")
        self.out_labels[1]["PositionStatus"]=False
        self.handler.update_hardware_list(1,False)

    def barrier_gate_on(self):
        self.send_data("s31e")
        self.out_labels[2]["PositionStatus"]=True
        self.barrier_Status=True
        self.handler.update_hardware_list(2,True)
    
    def barrier_gate_off(self):
        self.send_data("s30e")
        self.out_labels[2]["PositionStatus"]=False
        self.barrier_Status=False
        self.handler.update_hardware_list(2,False)

    def violation_alarm_on(self):
        self.send_data("s41e")
        self.out_labels[3]["PositionStatus"]=True
        self.handler.update_hardware_list(3,True)
    
    def violation_alarm_off(self):
        self.send_data("s40e")
        self.out_labels[3]["PositionStatus"]=False
        self.handler.update_hardware_list(3,False)