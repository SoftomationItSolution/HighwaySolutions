import threading
import numpy as np
import os
from datetime import datetime
import numpy as np
import openvino as ov
from utils.broadcast_server import BroadCastTCPServer
from utils.constants import Utilities
from utils.log_master import CustomLogger

from pubsub import pub

class AVC_Model(threading.Thread):
    def __init__(self,log_filePath,image_path,server_port,fifo_queue,model_path='./avcc_v1.onnx', device_name="CPU"):
        threading.Thread.__init__(self)
        self.core = ov.Core()
        self.image_path = image_path
        self.fifo_queue=fifo_queue
        script_dir = os.path.dirname(os.path.abspath(__file__))
        model_path=os.path.join(script_dir,'avcc_v1.onnx')
        self.model = self.core.read_model(model_path)
        self.compiled_model = self.core.compile_model(self.model, device_name=device_name)
        self.output_layer = self.compiled_model.output(0)
        self.class_names = ['Auto', 'Bike', 'Bus', 'Car Jeep Van', 'LCV', 'Truck 3 Axle', 'Truck 4 Axle', 'Truck 5 Axle', 'Truck 6-Axle']
        self.class_id = [2, 1, 7, 4, 5, 11, 12, 13, 14]
        self.axcel_count = [2, 1, 2, 2, 2, 3, 4, 5, 6]
        self.classname="AVC_Model"
        self.set_logger(log_filePath,'avc_app')
        self.start_broadcast_server(server_port)
        self.is_running = True
    
    def start_broadcast_server(self,server_port):
        try:
            self.broadcast_server=BroadCastTCPServer(server_port)
            self.broadcast_server.start()
        except Exception as e:
                self.logger.logError(f"Exception {self.classname} start_broadcast_server: {str(e)}")

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception {self.classname} set_logger: {str(e)}")

    def predict(self, image):
        try:
            image=image.convert("RGB")
            image = np.array(image.resize((224, 224))).astype(np.float32) / 255.0
            image = np.transpose(image, (2, 0, 1))
            result_infer = self.compiled_model([np.expand_dims(image, 0)])[self.output_layer]
            probabilities = np.exp(result_infer) / np.sum(np.exp(result_infer), axis=1, keepdims=True)
            idx = np.argmax(probabilities)
            predicted_class,predicted_class_id,axcel_count, confidence_score = self.class_names[idx],self.class_id[idx],self.axcel_count[idx], probabilities[0, idx]
            return predicted_class,predicted_class_id,axcel_count, confidence_score
        except Exception as e:
            raise e

    def save(self, image,today, predicted_class, class_):
        try:
            image1 = image.copy()
            dir_path = os.path.join(self.image_path, today)
            os.makedirs(dir_path, exist_ok=True)
            img_name = f"img_{predicted_class}_{class_}.png"
            img_path = os.path.join(dir_path, img_name)
            image1.save(img_path)
            return img_name
        except Exception as e:
            raise e

    def run(self):
        while self.is_running:
            try:
                if not self.fifo_queue.empty():
                    avc_data = self.fifo_queue.get()
                    image=avc_data[0]
                    SystemDateTime=avc_data[1]
                    predicted_class,predicted_class_id,axcel_count, confidence_score = self.predict(image)
                    current_datetime = datetime.now()
                    datetime_str = Utilities.get_datetime_str(current_datetime)
                    today = current_datetime.strftime('%Y-%m-%d')
                    img_name = self.save(image,today, datetime_str, predicted_class)
                    data = {'type': 'data','AvcClassName': predicted_class,'AvcClassId': predicted_class_id,
                            'AxleCount': axcel_count,'AvcImageName': img_name,
                            'AvcImage': Utilities.pil_base64(image),'transaction_id': datetime_str,
                            "SystemDateTime":SystemDateTime}
                    pub.sendMessage('avc_events', data=data)
                    if self.broadcast_server is not None:
                        self.broadcast_server.broadcast(data)
            except Exception as e:
                self.logger.logError(f"Exception {self.classname} run: {str(e)}")
                
    def stop(self):
        if self.broadcast_server is not None:
            self.broadcast_server.stop_server()
        self.is_running = False