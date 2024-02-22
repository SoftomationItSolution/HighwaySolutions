from utils.constants import send_data_to_tcp_server
import time


while True:
    try:
        send_data_to_tcp_server('192.168.10.24',23,'L1 Test 2 \n')
        time.sleep(1)
    except:
        break