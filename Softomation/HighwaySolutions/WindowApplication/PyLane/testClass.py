import threading
from pubsub import pub
from utils.avc_data import AVCDataClient
from utils.wim_data import WinDataClient


def handle_transaction_info(transactionInfo):
    #print("WIM Transaction Info:")
    print(transactionInfo)

def avc_handle_transaction_info(transactionInfo):
    #print("AVC Transaction Info:")
    print(transactionInfo)

def start_client_in_thread(client):
    client.client_start()

if __name__ == "__main__":
    pub.subscribe(handle_transaction_info, "wim_processed")
    transaction_client1 = WinDataClient('192.168.10.35',4711,'wim_transactions')
    #transaction_client.client_start()

    pub.subscribe(avc_handle_transaction_info, "avc_processed")
    transaction_client2 = AVCDataClient('192.168.10.30',4001,'avc_transactions')
    #transaction_client.client_start()

    thread1 = threading.Thread(target=start_client_in_thread, args=(transaction_client1,))
    thread2 = threading.Thread(target=start_client_in_thread, args=(transaction_client2,))
    
    thread1.start()
    thread2.start()