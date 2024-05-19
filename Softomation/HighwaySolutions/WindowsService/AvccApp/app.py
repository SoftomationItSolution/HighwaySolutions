import json
import os
import threading
from flask import Flask, render_template, request
from flask_socketio import SocketIO
from service.avc_Handler import AVC_Handler
from utils.constants import Utilities
from pubsub import pub
handler_lock = threading.Lock()
handler = None
avcData=None
avcAline=None
app = Flask(__name__)
socketio = SocketIO(app, async_mode='eventlet')
current_directory = os.getcwd()
com_port_options = ["COM1", "COM2", "COM3"]
baud_rate_options = [9600, 19200, 38400]

#pub.subscribe(handle_avc_data, 'avc_data')
#pub.subscribe(handle_avc_alinement, 'avc_alinement')

def update_json_file(data):
    filepath = os.path.join(current_directory, "static","config.json")
    with open(filepath, 'w') as file:
        json.dump(data, file, indent=4)

@app.route('/')
def index():
    filepath = os.path.join(current_directory, "static","config.json")
    data=Utilities.read_json_file(filepath)
    filepath = os.path.join(current_directory, "static","brodcast_config.json")
    brodcast=Utilities.read_json_file(filepath)
    return render_template('index.html',data=data,brodcast=brodcast,com_port_options=com_port_options, baud_rate_options=baud_rate_options)

@app.route('/avc_broadcast', methods=['POST'])
def avc_broadcast():
    if request.method == 'POST':
        try:
            broadcast_ip = request.form['data_ip_address']
            broadcast_port = request.form['data_port_number']
            update_json_file({"broadcast_ip":broadcast_ip,"broadcast_port":broadcast_port})
            return '<script>alert("JSON file updated successfully!"); window.location="/";</script>'
        except Exception as e:
            return f'<script>alert("Error: {e}"); window.location="/";</script>'
        
@app.route('/avc_connect', methods=['POST'])
def avc_connect():
    if request.method == 'POST':
        try:
            ip_address = request.form['ip_address']
            port_number = request.form['port_number']
            connection_type = request.form['connection_type']
            if connection_type == 'tcp':
                address = ip_address
                port = port_number
            else:
                address = request.form['com_port']
                port = request.form['baud_rate']
            update_json_file({"connection_type":connection_type,"address":address,"port":port})
            return '<script>alert("JSON file updated successfully!"); window.location="/";</script>'
        except Exception as e:
            return f'<script>alert("Error: {e}"); window.location="/";</script>'

@socketio.on('connect')
def handle_connect():
    pub.subscribe(handle_avc_data, 'avc_data')
    pub.subscribe(handle_avc_alinement, 'avc_alinement')

def handle_avc_alinement(msg):
    array_with_comprehension = [char for char in msg]
    socketio.emit('aline_data', {'data': array_with_comprehension})

def handle_avc_data(msg):
    socketio.emit('avcc_data', {'data': msg})

def handler_thread(data,brodcast):
     global handler
     if data is not None:
        if data['connection_type']=='tcp':
            with handler_lock:
                handler = AVC_Handler(data["address"], data["port"], data["image_dir"], brodcast)

def run_flask():
    app.run(host='0.0.0.0', port=9090,debug=True)

def run_socketio():
    socketio.run(app, host='0.0.0.0', port=9090)

if __name__ == '__main__':
    filepath = os.path.join(current_directory, "static","config.json")
    flask_thread =threading.Thread(target=run_socketio)
    #flask_thread =threading.Thread(target=app.run, kwargs={'host': '0.0.0.0', 'port': 9090})
    data=Utilities.read_json_file(filepath)
    brodcast_filepath = os.path.join(current_directory, "static","brodcast_config.json")
    brodcast=Utilities.read_json_file(brodcast_filepath)
    handler_thread(data,brodcast)
    flask_thread.start()
    #run_socketio()
    if handler is not None:
        with handler_lock:
            handler.start()  