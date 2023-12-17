import json
import threading
import paho.mqtt.client as mqtt
import base64
import cv2
import numpy as np
import time
from utils.constants import generate_random_string, sleep_ms 
class MqttSingleton:
    _instance = None

    def __new__(cls, broker, port,keepalive):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.broker = broker
            cls._instance.port = port
            cls._instance.keepalive = keepalive
            cls._instance.client_id = generate_random_string(10)
            cls._instance.subscribe_topic = "soft/live"
            cls._instance.current_frame = None
            cls._instance.client = mqtt.Client(cls._instance.client_id)
            cls._instance.client.on_publish = cls._instance.on_publish
            cls._instance.client.on_connect = cls._instance.on_connect
            cls._instance.client.on_message = cls._instance.on_message
            cls._instance.client.on_disconnect = cls._instance.on_disconnect
            cls._instance.connect()
        return cls._instance
    
    def on_connect(self, client, userdata, flags, rc):
        try:
            print("Connected with result code " + str(rc))
            client.subscribe(self.subscribe_topic)
        except Exception as e:
            print("on_connect error: " + str(e))

    def on_disconnect(self, client, userdata, rc):
        try:
            print("Disconnected with result code " + str(rc))
        except Exception as e:
            print(e)

    def on_publish(self, client, userdata, result):
        pass
    
    def on_message(self,client, userdata, msg):
        data = json.loads(msg.payload)
        base64_frame = data['frame']
        frame = base64.b64decode(base64_frame)
        npimg = np.frombuffer(frame, dtype=np.uint8)
        frame = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
        frame = cv2.resize(frame, (1280, 720))
        self.current_frame = frame

    def connect(self):
        if self.client is None or self.client.is_connected()==False:
            self.client.connect(self.broker, self.port, keepalive=self.keepalive)
            threading.Thread(target=self.client.loop_forever).start()
            print("connected")
            
    def disconnect(self):
        self.client.disconnect()
        self.client=None
        print("Disconnected")
    
    def publish_message(self, topic, payload):
        json_string = json.dumps(payload)
        self.client.publish(topic, json_string)
    
    def generate(self):
        while True:
            if self.current_frame is not None:
                ret, jpeg = cv2.imencode('.jpg', self.current_frame)
                frame_bytes = jpeg.tobytes()
                yield (b'--frame\r\n'
                    b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n\r\n')
            time.sleep(0.010)