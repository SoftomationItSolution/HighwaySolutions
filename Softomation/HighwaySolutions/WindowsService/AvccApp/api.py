import json
import os
from threading import Lock
from flask import Flask, render_template, request
from flask_socketio import SocketIO, emit
from service.avc_handler_thread import AVC_Handler_Thread
from utils.constants import Utilities
from pubsub import pub

class SocketIOApp:
    def __init__(self, default_directory, secret_key, log_filePath, bg_handler=None):
        self.app = Flask(__name__, static_url_path='/static')
        self.log_filePath = log_filePath
        self.bg_handler = bg_handler
        self.default_directory = default_directory
        self.app.config['SECRET_KEY'] = secret_key
        self.socketio = SocketIO(self.app, cors_allowed_origins="*")
        self.com_port_options = ["COM1", "COM2", "COM3"]
        self.baud_rate_options = [9600, 19200, 38400]
        self.app.add_url_rule('/', 'index', self.index)
        self.app.add_url_rule('/avc_connect', 'avc_connect', self.avc_connect, methods=['POST'])
        self.socketio.on_event('message', self.handle_message)
        self.socketio.on_event('connect', self.handle_connect)
        self.aline_data=None
        self.event_data=None
        self.thread = None
        self.thread_lock = Lock()
        pub.subscribe(self.handle_aline_data, 'aline_data')
        pub.subscribe(self.handle_avc_events, 'avc_events')

    def index(self):
        config_filePath = os.path.join(self.default_directory, "MasterConfig", "config.json")
        data = Utilities.read_json_file(config_filePath)
        return render_template('index.html', data=data, com_port_options=self.com_port_options, baud_rate_options=self.baud_rate_options)

    def avc_connect(self):
        if request.method == 'POST':
            try:
                ip_address = request.form['ip_address']
                port_number = request.form['port_number']
                connection_type = request.form['connection_type']
                image_path = request.form['image_path']
                server_port = request.form['server_port']
                if connection_type == 'tcp':
                    address = ip_address
                    port = port_number
                else:
                    address = request.form['com_port']
                    port = request.form['baud_rate']
                data = {"connection_type": connection_type, "address": address, "port": port,"server_port":server_port, "image_path": image_path}
                self.update_json_file(data)

                if self.bg_handler is not None:
                    self.bg_handler.stop()

                self.bg_handler = AVC_Handler_Thread(self.log_filePath,data)
                self.bg_handler.is_running=True
                self.bg_handler.start()
                return '<script>alert("Updated successfully!"); window.location="/";</script>'
            except Exception as e:
                return f'<script>alert("Error: {e}"); window.location="/";</script>'

    def update_json_file(self, data):
        try:
            config_filePath = os.path.join(self.default_directory, "MasterConfig", "config.json")
            with open(config_filePath, 'w') as file:
                json.dump(data, file, indent=4)
        except Exception as e:
            raise e

    def background_thread(self):
        while True:
            self.socketio.emit('message', {'aline_data': self.aline_data, "event_data": self.event_data})
            self.socketio.sleep(0.500)

    def handle_connect(self):
        with self.thread_lock:
            if self.thread is None:
                self.thread = self.socketio.start_background_task(self.background_thread)

    def handle_message(self, message):
        print('Received message:', message)
        self.socketio.send("test1", broadcast=True)

    def handle_aline_data(self, data):
        self.aline_data=data

    def handle_avc_events(self, data):
         self.event_data=data

    def run(self, debug=False):
        self.socketio.run(self.app, debug=debug, host='0.0.0.0', port=9090)