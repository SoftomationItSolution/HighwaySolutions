from datetime import datetime
import socket
import threading
import time
from utils.constants import Utilities

class AppaltoSWinDataClient(threading.Thread):
    def __init__(self,wim_detail,timeout=0.5):
        threading.Thread.__init__(self)
        self.wim_detail=wim_detail
        self.timeout=timeout
        self.axleData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket=None
        self.is_running=False
        self.is_stopped=False

    def process_data(self, indata):
        try:
            axcelData=''
            data = indata.split(',')
            x={"IsReverseDirection":False,"AxleCount":0,"TotalWeight":0}
            if data is not None:
                for index, item in enumerate(data):
                    val=item.strip()
                    if index==0:
                      x["IsReverseDirection"]=False if val=='F' else True
                    elif index==1:
                      pass
                    elif index==2:
                      x["AxleCount"]=int(val)
                    elif index==3:
                      x["TotalWeight"]=int(val)
                    else:
                        if axcelData=='':
                            axcelData=val
                        else:
                            if val!='E':
                                axcelData=f"{axcelData},{val}"
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
                x = {'AxleNumber': (i+1),
                    'AxleWeight': axel_Weight[i],
                    'Speed': axel_speed[i],
                    'AxleDistance': 0}
                self.axleData.append(x)
        except Exception as e:
            print(f"Exception process_axel_data: {str(e)}")
    
    def process_transaction_info(self,d):
        try:
            current_date_time=datetime.now()
            transactionInfo = {
                "SystemDateTime":current_date_time.isoformat(),
                "TransactionDateTime":Utilities.current_date_time_json(dt=current_date_time),
                "AxleData": self.axleData,
                "TotalWeight": d["TotalWeight"],
                'AxleCount': d["AxleCount"],
                'IsReverseDirection':d["IsReverseDirection"],
                "Processed":False
            }
           
        except Exception as e:
            print(f"Exception  process_transaction_info: {str(e)}")

    def run(self):
        while not self.is_stopped:
            if self.is_stopped:
                break
            try:
                self.tcp_conn()
            except ConnectionRefusedError:
                self.client_socket=None
                print(f"Connection refused. Retrying in {self.timeout} seconds")
                time.sleep(self.timeout)
            except Exception as e:
                self.client_socket=None
                print(f"Exception run: {str(e)}")
            finally:
                self.client_stop()

    def tcp_conn(self):
        try:
            while self.client_socket is None:
                self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.client_socket.connect((self.wim_detail["IpAddress"], self.wim_detail["PortNumber"]))
                self.is_running=True
                con_data=''
                while self.is_running:
                    if not self.is_active or self.is_stopped or not self.is_running:
                        break
                    echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                    if len(echoed_transaction_number) != 0:
                        print("wim data: {}".format(echoed_transaction_number))
                        if (echoed_transaction_number.startswith('F') or echoed_transaction_number.startswith('R')) and echoed_transaction_number.endswith('E'):
                            self.process_data(echoed_transaction_number)
                        else:
                            if echoed_transaction_number.endswith('E'):
                                con_data+=echoed_transaction_number
                                self.process_data(con_data)
                                con_data=''
                            else:
                                con_data+=echoed_transaction_number
                    time.sleep(self.timeout)
                time.sleep(self.timeout)
        except Exception as e:
            raise e
        
    def tcp_close(self):
        try:
            if self.client_socket:
                self.client_socket.close()
        except Exception as e:
            print(f"Exceptionon_tcp (closing): {str(e)}")
    
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