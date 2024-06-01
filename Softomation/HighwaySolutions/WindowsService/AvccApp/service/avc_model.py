import threading
import numpy as np
import os
from datetime import datetime
import numpy as np
import openvino as ov
from utils.constants import Utilities
from utils.tcp_server import BroadCastTCPServer
from pubsub import pub

class AVC_Model(threading.Thread):
    def __init__(self,dir_path,fifo_queue,broadcast=None,model_path='./avcc_v1.onnx', device_name="CPU"):
        threading.Thread.__init__(self)
        self.core = ov.Core()
        self.dir_path = dir_path
        self.fifo_queue=fifo_queue
        script_dir = os.path.dirname(os.path.abspath(__file__))
        model_path=os.path.join(script_dir,'avcc_v1.onnx')
        self.model = self.core.read_model(model_path)
        self.compiled_model = self.core.compile_model(self.model, device_name=device_name)
        self.output_layer = self.compiled_model.output(0)
        self.class_names = ['Auto', 'Bike', 'Bus', 'CJV', 'LCV', 'MAV3', 'MAV4', 'MAV5', 'MAV6']
        self.class_id = [2, 1, 7, 4, 5, 6, 12, 12, 12]
        self.axcel_count = [2, 1, 2, 2, 2, 3, 4, 5, 6]
        self.is_running = False
        self.start_broadcast_server(broadcast)
    
    def start_broadcast_server(self,broadcast):
        if broadcast is None:
            self.broadcast_server=None
        else:
            self.broadcast_server=BroadCastTCPServer(broadcast["broadcast_ip"], broadcast["broadcast_port"])
            self.broadcast_server.start()
            print(self.broadcast_server)

    def predict(self, image):
        image = np.array(image.resize((224, 224))) / 255.0
        image = np.transpose(image, (2, 0, 1))
        result_infer = self.compiled_model([np.expand_dims(image, 0)])[self.output_layer]
        probabilities = np.exp(result_infer) / np.sum(np.exp(result_infer), axis=1, keepdims=True)
        idx = np.argmax(probabilities)
        predicted_class,predicted_class_id,axcel_count, confidence_score = self.class_names[idx],self.class_id[idx],self.axcel_count[idx], probabilities[0, idx]
        return predicted_class,predicted_class_id,axcel_count, confidence_score

    def save(self, image, predicted_class, class_):
        image1 = image.copy()
        today = datetime.now().strftime('%Y-%m-%d')
        dir_path = os.path.join(self.dir_path, today)
        os.makedirs(dir_path, exist_ok=True)
        img_name = f"img_{predicted_class}_{class_}.png"
        img_path = os.path.join(dir_path, img_name)
        image1.save(img_path)
        return img_name

    def run(self):
        self.is_running = True
        while True:
            if not self.fifo_queue.empty():
                avc_data = self.fifo_queue.get()
                image=avc_data[0]
                SystemDateTime=avc_data[1]
                predicted_class,predicted_class_id,axcel_count, confidence_score = self.predict(image)
                datetime_str = Utilities.get_datetime_str()
                img_name = self.save(image, datetime_str, predicted_class)
                data = {'AvcClassName': predicted_class,
                        'AvcClassId': predicted_class_id,
                        'AxleCount': axcel_count,
                        'AvcImageName': img_name,
                        'AvcImage': Utilities.pil_base64(image),
                        'transaction_id': datetime_str,
                        "SystemDateTime":SystemDateTime
                        }
                pub.sendMessage('avc_data', msg=data)
                if self.broadcast_server is not None:
                    self.broadcast_server.broadcast(data)
                
    def stop(self):
        if self.broadcast_server is not None:
            self.broadcast_server.stop()
            self.broadcast_server.join()
        self.is_running = False
       