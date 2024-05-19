import os
import queue
import socket
import time
import numpy as np
import socket
import os
import numpy as np
from PIL import Image
from utils.constants import Utilities
from service.avc_model import AVC_Model
from pubsub import pub

class AVC_Handler:
    def __init__(self,server_ip,server_port,default_directory,broadcast=None,timeout=0.100):
        self.server_ip = server_ip
        self.server_port = int(server_port)
        self.broadcast = broadcast
        self.is_running = False
        self.fifo_queue = queue.Queue()
        self.curr_dir = os.path.dirname(os.path.abspath(__file__))
        self.set_avc_image_path(default_directory)
        self.model_thread = None

    def set_avc_image_path(self,default_directory):
        try:
            self.image_path=os.path.join(default_directory, 'avc')
            Utilities.make_dir(self.image_path)
        except Exception as e:
            raise e

    def start(self):
        attempt = 0
        while attempt ==0:
            try:
                self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.connection.connect((self.server_ip, self.server_port))
                print(f"Connected to {self.server_ip}:{self.server_port}")
                attempt=1
            except Exception as e:
               attempt = 0
            finally:
                time.sleep(0.100)
        if attempt==1:   
            if not self.is_running:
                self.is_running = True
            self.model_thread = AVC_Model(self.image_path,self.fifo_queue,self.broadcast)
            self.model_thread.daemon=True
            self.model_thread.start()
            self.total_zero = 0
            self.img = None
            while self.is_running:
                self.data = self.receive_data()
                self.num_zeros = np.count_nonzero(self.data == 0)
                self.re_shape()    
                if self.num_zeros < 5 and self.img is not None:
                    self.manage_image()
                if self.num_zeros < 5 and self.img is not None and self.total_zero < 2000:
                    self.img = None
                    self.total_zero = 0

    def re_shape(self):
        try:
            if self.num_zeros > 5:
                if self.img is None:
                    self.total_zero += self.num_zeros
                    self.img = self.data.reshape(1, -1)
                else:
                    self.total_zero += self.num_zeros
                    img_cols = self.img.shape[1]
                    self.img = np.vstack((self.img, self.data.reshape(1, -1)[:, :img_cols]))
        except Exception as e:
            print(f"Exception : {str(e)}")
        
    def manage_image(self):
        image = self.img.astype(np.float32) / 255.0
        image = np.transpose(image, (1, 0))
        image = np.stack((image,) * 3, axis=-1)
        image = Image.fromarray((image * 255).astype(np.uint8)).resize((224, 224))
        self.fifo_queue.put(image)
        self.img = None
        self.total_zero = 0

    def receive_data(self):
        data_list = []
        byte_sequence = self.connection.recv(1024)
        bytes_to_remove = b'\x02\r'
        filtered_bytes = bytearray([b for b in byte_sequence if b not in bytes_to_remove])
        ddata = ''.join(format(byte, '08b') for byte in filtered_bytes)[:100]
        pub.sendMessage("avc_alinement", msg=ddata)
        return (np.frombuffer(ddata.encode(), dtype='u1') - ord('0')) * 255
    
    def stop(self):
        if self.model_thread is not None:
            self.model_thread.stop()
            self.model_thread.join()
        self.is_running = False