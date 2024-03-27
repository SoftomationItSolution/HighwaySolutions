
import threading
import time
from pubsub import pub
from utils.Sagar.avc_data import AVCDataClient
from utils.KITS.kits_dio_card import DIOClient
from utils.Nagaarjun.wim_data import WinDataClient

class DataProcessingManager:
    def __init__(self):
        pub.subscribe(self.handle_transaction_info, "wim_processed")
        pub.subscribe(self.avc_handle_transaction_info, "avc_processed")
        pub.subscribe(self.dio_handle_transaction_info, "dio_processed")
        
        self.transaction_client1 = WinDataClient('192.168.10.35', 4711, 'wim_transactions')
        self.transaction_client2 = AVCDataClient('192.168.10.30', 4001, 'avc_transactions')
        self.transaction_client3 = DIOClient('192.168.1.23', 23, 'dio_transactions')

        self.thread1 = threading.Thread(target=self.start_client_in_thread, args=(self.transaction_client1,))
        self.thread2 = threading.Thread(target=self.start_client_in_thread, args=(self.transaction_client2,))
        self.thread3 = threading.Thread(target=self.start_client_in_thread, args=(self.transaction_client3,))

    def handle_transaction_info(self, transactionInfo):
        print(transactionInfo)

    def avc_handle_transaction_info(self, transactionInfo):
        print(transactionInfo)

    def dio_handle_transaction_info(self, transactionInfo):
            print(transactionInfo)

    def start_client_in_thread(self, client):
        client.client_start()

  
        

    def start_processing(self):
        # self.thread1.start()
        # self.thread2.start()
        self.thread3.start()

if __name__ == "__main__":
    manager = DataProcessingManager()
    manager.start_processing()
    while True:
        result= manager.transaction_client3.send_data('sSAe')
        if result:
            break
        time.sleep(0.100)