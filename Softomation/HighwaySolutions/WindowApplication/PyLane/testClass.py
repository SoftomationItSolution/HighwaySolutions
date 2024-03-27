import threading
from pubsub import pub
from utils.Sagar.avc_data import AVCDataClient
from utils.KITS.kits_dio_card import DIOClient
from utils.Nagaarjun.wim_data import WinDataClient


def handle_transaction_info(transactionInfo):
    #print("WIM Transaction Info:")
    print(transactionInfo)

def avc_handle_transaction_info(transactionInfo):
    #print("AVC Transaction Info:")
    print(transactionInfo)

def dio_handle_transaction_info(transactionInfo):
    #print("AVC Transaction Info:")
    print(transactionInfo)

def dio_client_in_thread(client):
    client.client_start()
    client.send_data('sSAe')

def start_client_in_thread(client):
    client.client_start()
if __name__ == "__main__":
    pub.subscribe(handle_transaction_info, "wim_processed")
    transaction_client1 = WinDataClient('192.168.10.35',4711,'wim_transactions')
    #transaction_client.client_start()

    pub.subscribe(avc_handle_transaction_info, "avc_processed")
    transaction_client2 = AVCDataClient('192.168.10.30',4001,'avc_transactions')

    pub.subscribe(dio_handle_transaction_info, "dio_processed")
    transaction_client3 = DIOClient('192.168.1.23',23,'dio_transactions')
    #transaction_client.client_start()

    thread1 = threading.Thread(target=start_client_in_thread, args=(transaction_client1,))
    thread2 = threading.Thread(target=start_client_in_thread, args=(transaction_client2,))
    thread3 = threading.Thread(target=dio_client_in_thread, args=(transaction_client3,))
    
    # thread1.start()
    # thread2.start()
    thread3.start()