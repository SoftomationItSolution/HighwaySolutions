import paho.mqtt.client as mqtt
import json
import pkg_resources
from utils.constants import Utilities
from utils.log_master import CustomLogger

class MqttHandler:
    def __init__(self, lane_detail, default_directory):
        self.classname = "MqttHandler"
        self.lane_detail = lane_detail
        self.mqtt_client = None
        self.mqtt_topic = None
        self.mqtt_client_connected = False
        self.set_logger(default_directory,self.classname)
        self.create_mqtt_obj()

    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def create_mqtt_obj(self):
        try:
            if self.lane_detail:
                self.mqtt_topic = self.lane_detail["LaneName"] + '/laneStatus'

            client_id = Utilities.generate_random_string(10)
            version_str = pkg_resources.get_distribution("paho-mqtt").version
            current_version = Utilities.version_to_tuple(version_str)
            required_version = (2, 0, 0)

            if Utilities.compare_versions(current_version, required_version):
                self.mqtt_client = mqtt.Client(client_id)
            else:
                self.mqtt_client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, client_id)

            self.logger.logInfo(f"Paho MQTT version: {version_str}")
            self.mqtt_connect(self.lane_detail['PlazaServerIpAddress'])
        except Exception as e:
            self.mqtt_client = None
            self.logger.logError(f"Exception create_mqtt_obj: {str(e)}")

    def on_connect(self, client, userdata, flags, rc):
        try:
            self.logger.logInfo(f"Connected with result code {rc}")
            self.mqtt_client_connected = True
        except Exception as e:
            self.logger.logError(f"Exception on_connect: {str(e)}")

    def on_disconnect(self, client, userdata, rc):
        try:
            if rc != 0:
                self.logger.logInfo("MQTT unexpected disconnection.")
            else:
                self.logger.logInfo("MQTT disconnected gracefully.")
            self.mqtt_client_connected = False
        except Exception as e:
            self.logger.logError(f"Exception on_disconnect: {str(e)}")

    def on_message(self, client, userdata, msg):
        try:
            self.logger.logInfo(f"Received message: {msg.payload}")
        except Exception as e:
            self.logger.logError(f"Exception on_message: {str(e)}")

    def on_subscribe(self, topic):
        try:
            self.mqtt_client.subscribe(topic)
            self.logger.logInfo(f"Subscribed to topic: {topic}")
        except Exception as e:
            self.mqtt_client = None
            self.logger.logError(f"Exception on_subscribe: {str(e)}")

    def on_unsubscribe(self, topic):
        try:
            self.mqtt_client.unsubscribe(topic)
            self.logger.logInfo(f"Unsubscribed from topic")
        except Exception as e:
            self.logger.logError(f"Exception on_unsubscribe: {str(e)}")

    def send_message_to_mqtt(self, topic, data):
        try:
            if self.mqtt_client is not None:
                response_json = json.dumps(data)
                if self.mqtt_topic is not None:
                    self.mqtt_client.publish(topic, response_json)
        except Exception as e:
            self.logger.logError(f"Exception send_message_to_mqtt: {str(e)}")

    def mqtt_connect(self, broker_ip, broker_port=1883):
        try:
            if self.mqtt_client is not None:
                self.mqtt_client.on_connect = self.on_connect
                self.mqtt_client.on_disconnect = self.on_disconnect
                self.mqtt_client.on_message = self.on_message
                self.mqtt_client.connect(broker_ip, broker_port, 60)
                self.mqtt_client.loop_start()
        except Exception as e:
            self.logger.logError(f"Exception mqtt_connect: {str(e)}")

    def ufd_messge_broadcast(self,ufd_message):
        try:
            res={"event_type":"ufd","data":ufd_message}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception mqtt_ufd_event: {str(e)}")

    def mqtt_rfid_event(self,data):
        try:
            res={"event_type":"rfid","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception mqtt_rfid_event: {str(e)}")

    def mqtt_avc_event(self,data):
        try:
            res={"event_type":"avc","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception mqtt_avc_event: {str(e)}")

    def mqtt_ping_event(self,data):
        try:
            res={"event_type":"ping","data":data}
            self.send_message_to_mqtt(self.mqtt_topic,res)
        except Exception as e:
            self.logger.logError(f"Exception mqtt_avc_event: {str(e)}")

