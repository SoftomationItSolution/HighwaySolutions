import numpy as np
import socket
import threading
import os
from datetime import datetime
import numpy as np
from PIL import Image
import openvino as ov
import queue
from pubsub import pub
from models.LaneManager import LaneManager
from utils.constants import Utilities
from utils.log_master import CustomLogger

fifo_queue = queue.Queue()
curr_dir = os.path.dirname(os.path.abspath(__file__))

def get_datetime_str():
    current_datetime = datetime.now()
    datetime_str = current_datetime.strftime("%Y%m%d%H%M%S%f")
    return datetime_str

class AVC_Model:
    def __init__(self,logger, dir_path,dbConnectionObj, model_path='./avcc_v1.onnx', device_name="CPU"):
        self.core = ov.Core()
        self.logger=logger
        self.LaneTransactionId=0
        self.dir_path = dir_path
        self.dbConnectionObj = dbConnectionObj
        script_dir = os.path.dirname(os.path.abspath(__file__))
        model_path=os.path.join(script_dir,'avcc_v1.onnx')
        print(model_path)
        self.model = self.core.read_model(model_path)
        self.compiled_model = self.core.compile_model(self.model, device_name=device_name)
        self.output_layer = self.compiled_model.output(0)
        self.class_names = ['Auto', 'Bike', 'Bus', 'CJV', 'LCV', 'MAV3', 'MAV4', 'MAV5', 'MAV6']
        self.class_id = [2, 1, 7, 4, 5, 6, 12, 12, 12]
        pub.subscribe(self.avc_data_id, "avc_data_id")

    def predict(self, image):
        image = np.array(image.resize((224, 224))) / 255.0
        image = np.transpose(image, (2, 0, 1))
        result_infer = self.compiled_model([np.expand_dims(image, 0)])[self.output_layer]
        probabilities = np.exp(result_infer) / np.sum(np.exp(result_infer), axis=1, keepdims=True)
        idx = np.argmax(probabilities)
        predicted_class,predicted_class_id, confidence_score = self.class_names[idx],self.class_id[idx], probabilities[0, idx]
        return predicted_class,predicted_class_id, confidence_score

    def save(self, image, predicted_class, class_):
        image1 = image.copy()
        today = datetime.now().strftime('%Y-%m-%d')
        dir_path = os.path.join(curr_dir, "data", today)
        os.makedirs(dir_path, exist_ok=True)
        img_name = f"img_{predicted_class}_{class_}.png"
        img_path = os.path.join(dir_path, img_name)
        image1.save(img_path)
        return img_name

    def conti(self):
        while True:
            if not fifo_queue.empty():
                image = fifo_queue.get()
                predicted_class,predicted_class_id, confidence_score = self.predict(image)
                datetime_str = get_datetime_str()
                img_name = self.save(image, datetime_str, predicted_class)
                # data = {'predicted_class': predicted_class,'predicted_class_id': predicted_class_id, 'confidence_score': confidence_score, 'image': img_name,
                #         'transaction_id': datetime_str}
                #print(data)
                #pub.sendMessage('avc_data', value=data)
                if self.LaneTransactionId>0:
                    self.update_avc(predicted_class_id,img_name)

    def update_avc(self,predicted_class_id,img_name):
        try:
            data={"LaneTransactionId":self.LaneTransactionId,'VehicleAvcClassId':predicted_class_id,'TransactionAvcImage':img_name}
            LaneManager.lane_data_avc_update(self.dbConnectionObj,data)
            self.LaneTransactionId=0
        except Exception as e:
            self.logger.logError("update_avc.")
            
    def avc_data_id(self,id):
        self.LaneTransactionId=int(id)
    

class AVC_Handler:
    def __init__(self,_handler,default_directory,dbConnectionObj,LaneId,avc_detail,log_file_name,timeout=0.100):
        self.server_ip = avc_detail["IpAddress"]
        self.server_port = avc_detail["PortNumber"]
        self.dbConnectionObj=dbConnectionObj
        self.set_logger(default_directory,log_file_name)
        self.set_avc_image_path(default_directory)
    
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="STPL"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_avc_image_path(self,default_directory):
        try:
            self.image_path=os.path.join(default_directory, 'Events', 'avc')
            Utilities.make_dir(self.image_path)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_avc_image_path: {str(e)}")



    def start(self):
        self.connection  = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.connection.connect((self.server_ip, self.server_port))
        avc = AVC_Model(self.logger,self.image_path,self.dbConnectionObj)
        avcTh = threading.Thread(target=avc.conti)
        avcTh.start()
      
        total_zero = 0
        img = None

        while True:
            data = self.receive_data()
            num_zeros = np.count_nonzero(data == 0)
            try:
                if num_zeros > 5:
                    if img is None:
                        total_zero += num_zeros
                        img = data.reshape(1, -1)
                    else:
                        total_zero += num_zeros
                        img_cols = img.shape[1]
                        img = np.vstack((img, data.reshape(1, -1)[:, :img_cols]))
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} start: {str(e)}")
            if num_zeros < 5 and img is not None:
                image = img.astype(np.float32) / 255.0
                image = np.transpose(image, (1, 0))
                image = np.stack((image,) * 3, axis=-1)
                image = Image.fromarray((image * 255).astype(np.uint8)).resize((224, 224))
                fifo_queue.put(image)
                img = None
                total_zero = 0

            if num_zeros < 5 and img is not None and total_zero < 2000:
                img = None
                total_zero = 0

    def receive_data(self):
        data_list = []
        byte_sequence = self.connection.recv(1024)
        bytes_to_remove = b'\x02\r'
        filtered_bytes = bytearray([b for b in byte_sequence if b not in bytes_to_remove])
        data = ''.join(format(byte, '08b') for byte in filtered_bytes)[:100]
        return (np.frombuffer(data.encode(), dtype='u1') - ord('0')) * 255


# if __name__ == "__main__":
#     server_ip = "192.168.10.11"
#     server_port = 4001
#     dir_path = get_dir()

#     handler = AVC_Handler(server_ip, server_port, dir_path)
#     handler.start()

# if __name__ == '__main__':
#     server_ip = '192.168.10.11'
#     server_port = 4001
#     sock = sock_connect(server_ip, server_port)
#     avc=AVC_Model()
#     thread1 = threading.Thread(target=sock.queue_data)
#     thread2 = threading.Thread(target=avc.conti)

#     # Start threads
#     thread1.start()
#     thread2.start()

#     # Wait for threads to finish
#     thread1.join()
#     thread2.join()
