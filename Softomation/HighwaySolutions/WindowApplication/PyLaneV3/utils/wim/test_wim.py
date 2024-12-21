from datetime import datetime
import socket
import threading
import time

class AppaltoWinDataClient(threading.Thread):
    def __init__(self, ip_add, port, timeout=0.5):
        threading.Thread.__init__(self)
        self.ip_add = ip_add
        self.port = port
        self.timeout = timeout
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket = None
        self.is_running = False
        self.is_stopped = False
        self.is_active = True  # Define is_active

    def process_data(self, indata):
        try:
            axcelData = ''
            data = indata.split(',')
            x = {"IsReverseDirection": False, "AxleCount": 0, "TotalWeight": 0}
            for index, item in enumerate(data):
                val = item.strip()
                if index == 0:
                    x["IsReverseDirection"] = (val != 'F')
                elif index == 2:
                    x["AxleCount"] = int(val)
                elif index == 3:
                    x["TotalWeight"] = int(val)
                elif val != 'E':
                    axcelData = f"{axcelData},{val}" if axcelData else val
            self.process_axel_data(axcelData)
            self.process_transaction_info(x)
        except Exception as e:
            print(f"Exception process_data: {str(e)} data is {indata}")

    def process_axel_data(self, axel_data_str):
        try:
            axel = axel_data_str.split(',')
            avg_speed = int(axel[-1])
            axel = [int(num) for num in axel[:-1]]
            midpoint = len(axel) // 2
            axel_Weight = axel[:midpoint]
            axel_speed = axel[midpoint:]
            for i in range(len(axel_Weight)):
                x = {
                    'AxleNumber': i + 1,
                    'AxleWeight': axel_Weight[i],
                    'Speed': axel_speed[i],
                    'AxleDistance': 0
                }
                self.axleData.append(x)
        except Exception as e:
            print(f"Exception process_axel_data: {str(e)}")

    def process_transaction_info(self, d):
        try:
            current_date_time = datetime.now()
            transactionInfo = {
                "SystemDateTime": current_date_time.isoformat(),
                "AxleData": self.axleData,
                "TotalWeight": d["TotalWeight"],
                'AxleCount': d["AxleCount"],
                'IsReverseDirection': d["IsReverseDirection"],
                "Processed": False
            }
            print(transactionInfo)
        except Exception as e:
            print(f"Exception process_transaction_info: {str(e)}")
        finally:
            self.axleData = []

    def run(self):
        while not self.is_stopped:
            try:
                print("Attempting to connect...")
                self.tcp_conn()  # Attempt to establish and maintain a connection
            except ConnectionRefusedError:
                print(f"Connection refused. Retrying in {self.timeout} seconds.")
                time.sleep(self.timeout)
            except Exception as e:
                print(f"Exception in connection: {str(e)}. Retrying in {self.timeout} seconds.")
                time.sleep(self.timeout)
            finally:
                self.client_stop()  # Ensure the socket is closed if an error occurs

    def tcp_conn(self):
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.ip_add, self.port))
            self.is_running = True
            con_data = ''
            while self.is_running:
                echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                if len(echoed_transaction_number) != 0:
                    if (echoed_transaction_number.startswith('F') or echoed_transaction_number.startswith('R')) and echoed_transaction_number.endswith('E'):
                        self.process_data(echoed_transaction_number)
                    else:
                        con_data += echoed_transaction_number
                        if echoed_transaction_number.endswith('E'):
                            self.process_data(con_data)
                            con_data = ''
                time.sleep(self.timeout)
        except Exception as e:
            print(f"Exception tcp_conn: {str(e)}")
        finally:
            self.client_stop()  # Ensure stop is called to close resources

    def tcp_close(self):
        try:
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            print(f"Exception tcp_close: {str(e)}")

    def client_stop(self):
        try:
            self.is_running = False
            self.tcp_close()
        except Exception as e:
            print(f"Exception client_stop: {str(e)}")

    def stop(self):
        try:
            self.is_stopped = True
            self.client_stop()
        except Exception as e:
            print(f"Exception stop: {str(e)}")

# Usage
wim_thread = AppaltoWinDataClient("192.168.11.15", 4711)
wim_thread.daemon = True
wim_thread.start()
while True:
    try:
        time.sleep(0.1)
    except KeyboardInterrupt:
        print('closed While')
        wim_thread.stop()