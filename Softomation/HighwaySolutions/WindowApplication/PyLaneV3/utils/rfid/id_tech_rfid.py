from datetime import datetime, timedelta
import socket
import threading
import time
from utils.constants import Utilities
from utils.log_master import CustomLogger

class IdTechRfidReader(threading.Thread):
    def __init__(self, _handler, default_directory, rfid_detail,presence_loop_required, log_file_name, timeout=0.100):
        threading.Thread.__init__(self)
        self.handler = _handler
        self.rfid_detail = rfid_detail
        self.presence_loop_required=presence_loop_required
        self.presence_loop_status=False
        self.timeout = timeout
        self.reader = None
        self.is_running = False
        self.is_stopped = False
        self.CLEANUP_INTERVAL = 30
        self.set_logger(default_directory, log_file_name)
        self.set_status()
        self.processed_epcs = {}

    def set_logger(self, default_directory, log_file_name):
        try:
            self.classname = "idTech_rfid"
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception set_logger: {str(e)}")

    def set_status(self):
        try:
            if self.rfid_detail["OnLineStatus"] == 0 or self.rfid_detail["OnLineStatus"] == False:
                self.is_active = False
            else:
                self.is_active = True
        except Exception as e:
            self.logger.logError(f"Exception set_status: {str(e)}")

    def setup_reader(self):
        try:
            self.reader = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.reader.connect((self.rfid_detail['IpAddress'], self.rfid_detail['PortNumber']))
            return True
        except Exception as e:
            if self.reader:
                self.reader.close()
            self.reader = None
            self.logger.logError(f"Exception setup_reader: {str(e)}")
            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"], 'ConnectionStatus', False)

    def decode_tag(self, data):
        try:
            final_data_list = data.splitlines()
            for tag_details in final_data_list:
                try:
                    final_data = tag_details.split(',')
                    if len(final_data) == 4:
                        tagEPC = final_data[0]
                        tagTID = final_data[1]
                        tagUserData = final_data[2]
                        if tagEPC not in self.processed_epcs:
                            self.processed_epcs[tagEPC] = datetime.now()
                            self.tagDetails["EPC"] = tagEPC
                            self.tagDetails["TID"] = tagTID
                            self.decrypt_user_data(tagUserData)
                            if int(self.tagDetails["Class"]) != 0:
                                current_date_time = datetime.now()
                                self.tagDetails["SystemDateTime"] = current_date_time.isoformat()
                                self.tagDetails["TransactionDateTime"] = Utilities.current_date_time_json(dt=current_date_time)
                                self.handler.update_rfid_data(self.tagDetails)
                                self.tagDetails = {"TransactionDateTime": "", "ReaderName": "", "EPC": "", "TID": "", "UserData": "", "Class": 0, "Plate": "XXXXXXXXXX"}
                                self.presence_loop_status=False
                except Exception as e:
                    self.logger.logError(f"Exception decode_tag loop: {str(e)}")
                finally:
                    time.sleep(self.timeout)

        except Exception as e:
            self.logger.logError(f"Exception decode_tag: {str(e)}")

    def run(self):
        self.processed_epcs = {}
        while not self.is_stopped:
            try:
                while self.is_active:
                    if self.reader is None:
                        self.is_running = self.setup_reader()
                        self.processed_epcs = {}
                    else:
                        self.is_running = True
                    self.tagDetails = {"SystemDateTime": datetime.now(), "TransactionDateTime": "", "ReaderName": "", "EPC": "", "TID": "", "UserData": "", "Class": 0, "Plate": "XXXXXXXXXX", "Processed": False}

                    while self.is_running:
                        if not self.is_active or self.is_stopped or not self.is_running:
                            self.handler.update_equipment_list(self.rfid_detail["EquipmentId"], 'ConnectionStatus', False)
                            if self.reader:
                                self.reader.close()
                            self.reader = None
                            self.processed_epcs = {}
                            break
                        self.processed_epcs = {epc: timestamp for epc, timestamp in self.processed_epcs.items() if datetime.now() - timestamp <= timedelta(seconds=self.CLEANUP_INTERVAL)}
                        if self.reader:
                            try:
                                data = self.reader.recv(1024)
                                if data:
                                    if self.presence_loop_required==False:
                                        self.decode_tag(data.decode())
                                    else:
                                        if self.presence_loop_status:
                                            self.decode_tag(data.decode())
                            except socket.error as e:
                                self.logger.logError(f"Socket error in recv: {str(e)}")
                                self.reader.close()
                                self.reader = None
                                break
                        time.sleep(self.timeout)
                        self.check_status()
                    self.check_status()
                time.sleep(self.timeout)
            except Exception as e:
                self.logger.logError(f"Exception rfid_run: {str(e)}")

    def update_presence_loop_status(self, status):
        self.presence_loop_status=status


    def decrypt_user_data(self, user_data):
        try:
            self.tagDetails["UserData"] = user_data
            self.tagDetails["Class"] = self.convert_hex_to_int(user_data[24:26])
            self.tagDetails["Plate"] = self.hex_to_string_vehicle_number(user_data[4:24])
        except Exception as e:
            self.logger.logError(f"Exception decrypt_user_data: {str(e)}")

    def hex_to_string_vehicle_number(self, hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
            self.logger.logError(f"Exception hex_to_string_vehicle_number: {str(e)}")
            result = 'XXXXXXXXXX'
        finally:
            return result

    def convert_hex_to_int(self, hex_string):
        result = '00'
        try:
            result = str(int(hex_string, 16))
        except Exception as e:
            self.logger.logError(f"Exception convert_hex_to_int: {str(e)}")
            result = '00'
        finally:
            return result

    def retry(self, status):
        if self.is_active != status:
            self.is_active = status

    def check_status(self):
        try:
            if self.is_active == False and self.is_stopped == False:
                self.is_active = self.handler.get_on_line_status(self.rfid_detail['EquipmentTypeId'])
                if self.is_active == 0:
                    self.is_active = False
                elif self.is_active == 1:
                    self.is_active = True
        except Exception as e:
            self.logger.logError(f"Exception check_status: {str(e)}")

    def client_stop(self):
        try:
            self.is_running = False
            if self.reader:
                self.reader.close()  # Ensure the socket is closed
                self.reader = None
        except Exception as e:
            self.logger.logError(f"Exception client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
            self.is_active = False
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")
