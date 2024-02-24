import socket
import time
axelData=[]
TotalWeight=None
TranscationId=None
transaction_info=None
def process_data(input):
    global axelData
    global TotalWeight
    global TranscationId
    global transaction_info
    data = input.split('\r\n')
    processData=False
    for d in data:
        d=d.strip()
        if d.startswith('#'):
            axelData.append(d)
        elif d.startswith('Total Weight'):
            wt=d.split('=')[1]
            TotalWeight=wt.strip()
        elif d.isdigit():
            TranscationId=d
        elif d == 'Done':
            transaction_info={"axelData":axelData,"TotalWeight":TotalWeight,"TranscationId":TranscationId}
            processData=True
            axelData=[]
            TotalWeight=None
            TranscationId=None
    if processData:            
        print(transaction_info)

def client():
    server_ip = '192.168.10.35'  # Assuming server is running on localhost
    server_port = 4711

    # Connect to the server
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((server_ip, server_port))
    client_socket.send("ACK\r\n".encode('utf-8'))
    opt_str=""
    while True:
        echoed_transaction_number = client_socket.recv(1024).decode('utf-8').strip()
        if len(echoed_transaction_number)!=0:
            process_data(echoed_transaction_number)
            client_socket.send("ACK\r\n".encode('utf-8'))
        time.sleep(.05)
    client_socket.close()

if __name__ == "__main__":
    client()
