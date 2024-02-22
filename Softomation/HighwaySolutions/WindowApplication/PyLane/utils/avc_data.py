import socket
import time
from utils.log_master import CustomLogger
from pubsub import pub

class AVCDataClient:
    def __init__(self,server_ip,server_port,log_file_name,timeout=0.5):
        self.server_ip=server_ip
        self.server_port=server_port
        self.timeout=timeout
        self.logger = CustomLogger(log_file_name)
        self.client_socket=None
        self.is_running=False


    def process_data(self, data):
        try:
            data = data.split('\r\n')
            for d in data:
                d = d.strip()
                if d.startswith('STX,02'):
                    self.process_avc_data(d)
        except Exception as e:
            self.logger.logError("Exception occurred during data processing: {}".format(str(e)))
    
    def process_avc_data(self, avc_data_str):
        avc_data = avc_data_str.split(',')
        if len(avc_data) == 8:
            transactionInfo = {'classId': avc_data[2].strip(),
                'axelCount': avc_data[3].strip(),
                'direction': avc_data[4].strip(),
                'wheelBase': avc_data[5].strip(),
                'transcationCount': avc_data[6].strip()}
        else:
            transactionInfo = avc_data_str
        pub.sendMessage("avc_processed", transactionInfo=transactionInfo)

    def client_start(self):
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.server_ip, self.server_port))
            self.is_running=True
            while self.is_running:
                echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                if len(echoed_transaction_number) != 0:
                    self.logger.logInfo("avc data: {}".format(echoed_transaction_number))
                    self.process_data(echoed_transaction_number)
                time.sleep(self.timeout)
        except Exception as e:
            self.logger.logError("Exception occurred: {}".format(str(e)))
        finally:
            self.client_stop()

    def client_stop(self):
        self.is_running=False
        self.client_socket.close()

def handle_transaction_info(transactionInfo):
    print("AVC Transaction Info:")
    print(transactionInfo)

if __name__ == "__main__":
    pub.subscribe(handle_transaction_info, "avc_processed")
    transaction_client = AVCDataClient('192.168.10.90',4001,'avc_transactions')
    transaction_client.client_start()