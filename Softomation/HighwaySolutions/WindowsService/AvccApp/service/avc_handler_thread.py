import os
import threading
import queue
import socket
import time
import numpy as np
from datetime import datetime
from PIL import Image
from utils.constants import Utilities
from service.avc_model import AVC_Model
from pubsub import pub
from utils.log_master import CustomLogger

class AVC_Handler_Thread(threading.Thread):
    def __init__(self,log_filePath, data, timeout=0.100):
        super().__init__()
        self.fifo_queue = queue.Queue()
        self.curr_dir = os.path.dirname(os.path.abspath(__file__))
        self.data=data
        self.model_thread = None
        self.init_data = None
        self.init_zero = None
        self.SystemDateTime = None
        self.timeout = timeout
        self.classname="Handler"
        self.is_running = False
        self.is_connected = False
        self.is_data_process = False
        self.log_filePath=log_filePath
        self.set_logger(log_filePath,'avc_app')
        self.set_config(data)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception {self.classname} set_logger: {str(e)}")

    def set_config(self,data):
        try:
            self.server_ip = data["address"]
            self.server_port = int(data["port"])
            self.set_avc_image_path(data["image_path"])
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_config: {str(e)}")
    
    def set_avc_image_path(self, default_directory):
        try:
            self.image_path = os.path.join(default_directory, 'avc')
            Utilities.make_dir(self.image_path)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_avc_image_path: {str(e)}")
            raise e
    
    def tcp_connection(self):
        try:
            self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.connection.connect((self.server_ip, self.server_port))
            self.logger.logInfo(f"Connected to {self.server_ip}:{self.server_port}")
            self.is_connected=True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} tcp_connection: {str(e)}")
            self.is_connected=False

    def avc_model_thread(self):
        try:
            if self.model_thread is None:
                self.model_thread = AVC_Model(self.log_filePath,self.image_path,int(self.data["server_port"]), self.fifo_queue)
                self.model_thread.daemon = True
                self.model_thread.start()
                self.total_zero = 0
                self.img = None
                self.is_data_process=True
                self.data_process()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} avc_model_thread: {str(e)}")
            self.is_data_process=False

    def data_process(self):
        while self.is_data_process:
            try:
                self.data = self.receive_data()
                self.num_zeros = np.count_nonzero(self.data == 0)
                if self.init_data is None:
                    self.init_data = self.data
                    self.init_zero = self.num_zeros
                if not np.array_equal(self.data, self.init_data):
                    if self.SystemDateTime is None:
                        self.SystemDateTime = datetime.now().isoformat()
                    self.re_shape()
                    if self.num_zeros < self.init_zero + 5 and self.img is not None:
                        self.manage_image()
                if self.num_zeros < self.init_zero + 5 and self.img is not None and self.total_zero < 2000:
                    self.img = None
                    self.SystemDateTime = None
                    self.total_zero = 0
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} data_process: {str(e)}")
            finally:
                if self.is_data_process==False:
                    break

    def run(self):
        while self.is_running:
            try:
                if self.is_connected == False:
                    self.tcp_connection()
                else:
                    self.avc_model_thread()
            except Exception as e:
                    self.logger.logError(f"Exception {self.classname} is_running: {str(e)}")
            finally:
                if self.is_running==False:
                    break
                time.sleep(self.timeout)

    def re_shape(self):
        try:
            if self.num_zeros > self.init_zero + 5:
                if self.img is None:
                    self.total_zero += self.num_zeros
                    self.img = self.data.reshape(1, -1)
                else:
                    self.total_zero += self.num_zeros
                    img_cols = self.img.shape[1]
                    reshaped_data = self.data.reshape(1, -1)
                    if reshaped_data.shape[1] < img_cols:
                        reshaped_data = np.pad(reshaped_data, ((0, 0), (0, img_cols - reshaped_data.shape[1])), 'constant')
                    self.img = np.vstack((self.img, reshaped_data[:, :img_cols]))
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} re_shape: {str(e)}")

    def manage_image(self):
        try:
            image = self.img.astype(np.float32) / 255.0
            image = np.transpose(image, (1, 0))
            image = np.stack((image,) * 3, axis=-1)
            image = Image.fromarray((image * 255).astype(np.uint8)).resize((224, 224))
            self.fifo_queue.put([image, self.SystemDateTime])
            self.img = None
            self.total_zero = 0
            self.SystemDateTime = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} manage_image: {str(e)}")

    def receive_data(self):
        try:
            byte_sequence = self.connection.recv(1024)
            bytes_to_remove = b'\x02\r'
            filtered_bytes = bytearray([b for b in byte_sequence if b not in bytes_to_remove])
            data = ''.join(format(byte, '08b') for byte in filtered_bytes)
            split_strings = [data[i:i+112] for i in range(0, len(data), 112)]
            for s in split_strings:
                ddata = s[:100]
                pub.sendMessage("aline_data", data=ddata)
                return (np.frombuffer(ddata.encode(), dtype='u1') - ord('0')) * 255
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} receive_data: {str(e)}")

    def stop(self):
        try:
            self.is_data_process = False
            self.is_running = False
            if self.model_thread is not None:
                self.model_thread.stop()
                self.model_thread.join()
            self.connection.close()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop: {str(e)}")