import socket
import time
import re

# Constants
SERVER_IP = '192.168.10.95'
SERVER_PORT = 4711
ACK_MESSAGE = "ACK\r\n"
TIMEOUT = 0.05

# Regular expressions
TRANSACTION_REGEX = re.compile(r'^#|\d+|Total Weight=|Done')
axel_data = []
total_weight = None
transaction_id = None
transaction_info = {}
def process_data(data):
    global axel_data
    global total_weight
    global transaction_id
    global transaction_info

    for line in data.split('\r\n'):
        match = TRANSACTION_REGEX.findall(line)
        if match:
            if match[0] == '#':
                axel_data.append(line)
            elif match[0] == 'Total Weight=':
                total_weight = match[1].strip()
            elif match[0].isdigit():
                transaction_id = match[0]
            elif match[0] == 'Done':
                transaction_info = {"axelData": axel_data, "TotalWeight": total_weight, "TransactionId": transaction_id}
                axel_data = []
                total_weight = None
                transaction_id = None
                #print(transaction_info)

def client():
    # Connect to the server
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        client_socket.connect((SERVER_IP, SERVER_PORT))
        client_socket.send(ACK_MESSAGE.encode('utf-8'))

        while True:
            echoed_transaction_number = client_socket.recv(1024).decode('utf-8').strip()
            if echoed_transaction_number:
                process_data(echoed_transaction_number)
                client_socket.send(ACK_MESSAGE.encode('utf-8'))
            time.sleep(TIMEOUT)

if __name__ == "__main__":
    client()
