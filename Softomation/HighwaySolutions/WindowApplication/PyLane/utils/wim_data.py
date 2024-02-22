import socket
import time
from utils.log_master import CustomLogger
from pubsub import pub
class WinDataClient:
    def __init__(self,server_ip,server_port,log_file_name,timeout=0.5):
        self.server_ip=server_ip
        self.server_port=server_port
        self.timeout=timeout
        self.logger = CustomLogger(log_file_name)
        self.axelData = []
        self.totalWeight = None
        self.transactionId = None
        self.client_socket=None
        self.is_running=False


    def process_data(self, data):
        try:
            data = data.split('\r\n')
            for d in data:
                d = d.strip()
                if d.startswith('#'):
                    self.process_axel_data(d)
                elif d.startswith('Total Weight'):
                    self.process_total_weight(d)
                elif d.isdigit():
                    self.process_transaction_id(d)
                elif d == 'Done':
                    self.process_transaction_info()
        except Exception as e:
            self.logger.logError("Exception occurred during data processing: {}".format(str(e)))
    
    def process_axel_data(self, axel_data_str):
        axel = axel_data_str.split(',')
        if len(axel) == 4:
            x = {'number': axel[0].replace('#', ''),
                'weight': axel[1].replace('w', ''),
                'speed': axel[2].replace('s', ''),
                'distance': axel[3].replace('d', '')}
        else:
            x = axel_data_str.replace('#', '')
        self.axelData.append(x)

    def process_total_weight(self, total_weight_str):
        self.totalWeight = total_weight_str.split('=')[1].strip()

    def process_transaction_id(self, transaction_id_str):
        self.transactionId = transaction_id_str

    def process_transaction_info(self):
        transactionInfo = {
            "axelData": self.axelData,
            "TotalWeight": self.totalWeight,
            "TransactionId": self.transactionId
        }
        pub.sendMessage("wim_processed", transactionInfo=transactionInfo)
        self.axelData = []
        self.totalWeight = None
        self.transactionId = None

    def client_start(self):
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.server_ip, self.server_port))
            self.client_socket.send("ACK\r\n".encode('utf-8'))
            self.is_running=True
            while self.is_running:
                echoed_transaction_number = self.client_socket.recv(1024).decode('utf-8').strip()
                if len(echoed_transaction_number) != 0:
                    self.logger.logInfo("wim data: {}".format(echoed_transaction_number))
                    self.process_data(echoed_transaction_number)
                    self.client_socket.send("ACK\r\n".encode('utf-8'))
                time.sleep(self.timeout)
        except Exception as e:
            self.logger.logError("Exception occurred: {}".format(str(e)))
        finally:
            self.client_stop()

    def client_stop(self):
        self.is_running=False
        self.client_socket.close()

def handle_transaction_info(transactionInfo):
    print("Transaction Info:")
    print(transactionInfo)

if __name__ == "__main__":
    pub.subscribe(handle_transaction_info, "wim_processed")
    transaction_client = WinDataClient('192.168.10.95',4711,'wim_transactions')
    transaction_client.client_start()