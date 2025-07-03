import threading
import serial
from datetime import datetime
from utils.constants import Utilities
from pubsub import pub

from utils.log_master import CustomLogger

class WimSerialConnect(threading.Thread):
    def __init__(self,default_directory, port, baudrate):
        threading.Thread.__init__(self)
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.serial_connection = None
        self.is_running = False
        self.is_stopped = False
        self.port = port
        self.baudrate = baudrate
        self.logger = CustomLogger(default_directory, 'swb_app')

    def run(self):
        self.connect(self.port, self.baudrate)
        self.is_running = True
        while self.is_running and not self.is_stopped:
            self.receive_data()

    def connect(self, port, baudrate):
        try:
            self.serial_connection = serial.Serial(port, baudrate, timeout=1)
            print(f"Connected to {port} at {baudrate} baudrate")
            pub.sendMessage("wim_status", transactionInfo=True)
        except Exception as e:
            print(f"Connection error: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def send_data(self, data):
        try:
            if self.serial_connection:
                self.serial_connection.write(data.encode('utf-8'))
        except Exception as e:
            print(f"Send data error: {e}")

    def receive_data(self):
        try:
            if self.serial_connection:
                received_data = self.serial_connection.readline().decode('utf-8').strip()
                if received_data:
                    if (received_data.startswith('F') or received_data.startswith('R')) and received_data.endswith('E'):
                        self.process_data(received_data)
                    else:
                        if received_data.endswith('E'):
                            con_data += received_data
                            self.process_data(con_data)
                            con_data = ''
                        else:
                            con_data += received_data
        except Exception as e:
            print(f"Exception in receive_data: {e}")
            pub.sendMessage("wim_status", transactionInfo=False)

    def process_data(self, indata):
        try:
            axcelData = ''
            data = indata.split(',')
            x = {"IsReverseDirection": False, "AxleCount": 0, "TotalWeight": 0}
            if data is not None:
                for index, item in enumerate(data):
                    val = item.strip()
                    if index == 0:
                        x["IsReverseDirection"] = False if val == 'F' else True
                    elif index == 1:
                        pass
                    elif index == 2:
                        x["AxleCount"] = int(val)
                    elif index == 3:
                        x["TotalWeight"] = int(val)
                    else:
                        if axcelData == '':
                            axcelData = val
                        else:
                            if val != 'E':
                                axcelData = f"{axcelData},{val}"
            self.process_axel_data(axcelData)
            self.process_transaction_info(x)
        except Exception as e:
            print(f"Exception in process_data: {str(e)} data is {indata}")

    def process_axel_data(self, axel_data_str):
        try:
            axel = axel_data_str.split(',')
            avg_speed = int(axel[-1])
            axel = [int(num) for num in axel[:-1]]
            midpoint = len(axel) // 2
            axel_Weight = axel[:midpoint]
            axel_speed = axel[midpoint:]
            for i in range(len(axel_Weight)):
                x = {'AxleNumber': (i+1),
                     'AxleWeight': axel_Weight[i],
                     'Speed': axel_speed[i],
                     'AxleDistance': 0}
                self.axleData.append(x)
        except Exception as e:
            print(f"Exception in process_axel_data: {str(e)}")

    def process_transaction_info(self, d):
        try:
            current_date_time = datetime.now()
            transactionInfo = {
                "SystemDateTime": current_date_time.isoformat(),
                "TransactionDateTime": Utilities.current_date_time_json(dt=current_date_time),
                "AxleData": self.axleData,
                "TotalWeight": d["TotalWeight"],
                'AxleCount': d["AxleCount"],
                'IsReverseDirection': d["IsReverseDirection"],
                "Processed": False
            }
            pub.sendMessage("wim_data", transactionInfo=transactionInfo)
        except Exception as e:
            print(f"Exception in process_transaction_info: {str(e)}")

    def dis_connect(self):
        if self.serial_connection:
            self.serial_connection.close()
            print("Connection closed")
            pub.sendMessage("wim_status", transactionInfo=False)

    def stop(self):
        self.is_running = False
        self.is_stopped = True
        self.dis_connect()