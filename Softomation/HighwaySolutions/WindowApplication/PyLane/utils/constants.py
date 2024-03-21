import datetime
import json
import os
import socket

appProvider = "Softomation"
json_date_time_format = "%d-%b-%Y %H:%M:%S"
json_date_format = "%d-%b-%Y"

# def get_absolute_file_path(file_name):
#     current_directory = os.getcwd()
#     absolute_path = os.path.abspath(os.path.join(current_directory, file_name))
#     return absolute_path

def get_absolute_file_path(script_dir,file_name):
    try:
        file_path = os.path.join(script_dir, file_name)
        absolute_path = os.path.abspath(file_path)
        return absolute_path
    except Exception as e:
        raise e

def read_json_file(file_path):
    try:
        if os.path.exists(file_path):
            with open(file_path, 'r') as file:
                data = json.load(file)
                return data
        else:
            return None
    except FileNotFoundError:
        print(f"Error: File not found at {file_path}")
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON in {file_path}: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def JsonDateFormat(inDate=None):
    if inDate is None:
        today_date = datetime.date.today()
    else:
        today_date = inDate
    formatted_date = today_date.strftime("%Y-%m-%d")
    return formatted_date

def send_data_to_tcp_server(SERVER_IP,SERVER_PORT,data):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        client_socket.connect((SERVER_IP, SERVER_PORT))
        client_socket.sendall(data.encode())
        #client_socket.sendall('\n'.encode())
        received_data = client_socket.recv(1024)
        print("Received:", received_data.decode())
    finally:
        client_socket.close()

def get_ip_address():
    try:
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)
        return ip_address
    except socket.gaierror:
        try:
            import subprocess
            result = subprocess.run(['ifconfig'], stdout=subprocess.PIPE)
            output = result.stdout.decode('utf-8')
            ip_address = output.split('\n')[1].split()[1][5:]
            return ip_address
        except Exception as e:
            print("Error:", e)
            return None
        
def current_date_time_JSON(dt=None):
    if dt==None:
        dt = datetime.datetime.now()
    formatted_date = dt.strftime("%d-%b-%Y %H:%M:%S.%f")
    return formatted_date

def receipt_Number(plazaId,LaneId,dt=None):
    if dt==None:
        dt = datetime.datetime.now()
    formatted_Number = dt.strftime("%d%m%y%H%M%S")
    formatted_Number=formatted_Number+'{:02d}'.format(plazaId)+'{:02d}'.format(LaneId)
    return formatted_Number

def lane_txn_Number(LaneId,dt=None):
    if dt==None:
        dt = datetime.datetime.now()
    formatted_Number = dt.strftime("%d%m%Y%H%M%S")
    formatted_Number=formatted_Number+'{:02d}'.format(LaneId)
    return formatted_Number
