import datetime
import json
import os
import random
import re
import socket
import string
import netifaces
import requests

class Utilities:
    key = b'0123456789abcdef0123456789abcdef'  # 32 bytes key for AES-256
    iv = b'$0ft0m@ti0nTech$'  # 16 bytes IV for AES-256-CBC
    @staticmethod
    def get_absolute_file_path(script_dir, file_name):
        try:
            file_path = os.path.abspath(os.path.join(script_dir, file_name))
            return file_path
        except Exception as e:
            raise e

    @staticmethod
    def read_json_file(file_path):
        try:
            with open(file_path, 'r') as file:
                data = json.load(file)
                return data
        except FileNotFoundError:
            print(f"Error: File not found at {file_path}")
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON in {file_path}: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    @staticmethod
    def json_date_format(date_obj=None):
        date_obj = date_obj or datetime.date.today()
        return date_obj.strftime("%Y-%m-%d")

    @staticmethod
    def send_data_to_tcp_server(server_ip, server_port, data):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            client_socket.connect((server_ip, server_port))
            client_socket.sendall(data.encode())
            received_data = client_socket.recv(1024)
            print("Received:", received_data.decode())
        finally:
            client_socket.close()

    @staticmethod
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
    
    @staticmethod        
    def get_local_ips():
        interfaces = netifaces.interfaces()
        ip_addresses = []
        for iface in interfaces:
            addresses = netifaces.ifaddresses(iface)
            if netifaces.AF_INET in addresses:
                for addr in addresses[netifaces.AF_INET]:
                    if 'addr' in addr:
                        if addr['addr'] !='127.0.0.1':
                            ip_addresses.append(addr['addr'])
        return ip_addresses[0]

    @staticmethod
    def JsonDateFormat(inDate=None):
        if inDate is None:
            today_date = datetime.date.today()
        else:
            today_date = inDate
        formatted_date = today_date.strftime("%d-%b-%Y")
        return formatted_date

    @staticmethod
    def current_date_time_json(dt=None):
        dt = dt or datetime.datetime.now()
        return dt.strftime("%d-%b-%Y %H:%M:%S.%f")

    # @staticmethod
    # def receipt_number(plaza_id, lane_id, dt=None):
    #     dt = dt or datetime.datetime.now()
    #     formatted_number = dt.strftime("%m%d%H%M%S")
    #     formatted_number += '{:02d}{:02d}'.format(plaza_id, lane_id)
    #     return formatted_number

    @staticmethod
    def receipt_number(plaza_id, lane_id,class_id, dt=None):
        mapping = {
        "01": "A", "02": "B", "03": "C", "04": "D", "05": "E",
        "06": "F", "07": "G", "08": "H", "09": "I", "10": "J",
        "11": "K", "12": "L", "13": "M", "14": "N", "15": "O",
        "16": "P", "17": "Q", "18": "R", "19": "S", "20": "T",
        "21": "U", "22": "V", "23": "W", "24": "X", "25": "Y", "26": "Z"
    }
        dt = dt or datetime.datetime.now()
        year= dt.strftime("%y")
        month= mapping.get(dt.strftime("%m"))
        day= mapping.get(dt.strftime("%d"))
        hour= mapping.get(dt.strftime("%H"))
        min= dt.strftime("%H")
        sec= dt.strftime("%S")
        plaza_id=mapping.get('{:02d}'.format(plaza_id))
        lane_id=mapping.get('{:02d}'.format(lane_id))
        class_id=mapping.get('{:02d}'.format(class_id))

        
        formatted_number = class_id+lane_id+plaza_id+'-'+month+day+hour+'-'+year+min+sec
        #formatted_number += '{:02d}{:02d}'.format(plaza_id, lane_id)
        return formatted_number

    @staticmethod
    def lane_txn_number(lane_id, dt=None):
        dt = dt or datetime.datetime.now()
        formatted_number = dt.strftime("%Y%m%d%H%M%S")
        formatted_number += '{:02d}'.format(lane_id)
        return formatted_number

    @staticmethod
    def json_dt_mysql_dt(input_date):
        input_datetime_obj = datetime.datetime.strptime(input_date, '%d-%b-%Y %H:%M:%S.%f')
        mysql_datetime_str = input_datetime_obj.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
        return mysql_datetime_str
    
    @staticmethod
    def json_dt_mysql_d(input_date):
        input_datetime_obj = datetime.datetime.strptime(input_date, '%d-%b-%Y')
        mysql_datetime_str = input_datetime_obj.strftime('%Y-%m-%d')
        return mysql_datetime_str
    
    @staticmethod
    def json_dt_mysql_dt_import(input_date):
        try:
            if len(input_date)==20:
                input_datetime_obj = datetime.datetime.strptime(input_date, '%d-%b-%Y %H:%M:%S')
            else:
                input_datetime_obj = datetime.datetime.strptime(input_date, '%Y-%m-%dT%H:%M:%S.%fZ')
            
            mysql_datetime_str = input_datetime_obj.strftime('%Y-%m-%d %H:%M:%S')
            return mysql_datetime_str
        except Exception as e:
            return input_date

    @staticmethod
    def generate_random_string(length):
        letters = string.ascii_letters
        return ''.join(random.choice(letters) for _ in range(length))

    @staticmethod
    def compare_versions(version1, version2):
        return version1 < version2

    @staticmethod
    def version_to_tuple(version_str):
        return tuple(map(int, version_str.split('.')))
    
    @staticmethod
    def is_valid_ipv4(ip):
        if ip is None or ip.strip() == "":
            return False
        
        if ip.lower() == 'localhost':
            return False
        
        
        if ip.lower() == '127.0.0.1':
            return False
        
        ipv4_pattern = r"^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        if re.match(ipv4_pattern, ip):
            return True
        else:
            return False

    @staticmethod    
    def upload_data_api(endpoint,data):
        try:
            
            headers = {'Content-Type': 'application/json'}
            return requests.post(endpoint, json=data, headers=headers)
        except Exception as e:
            raise e
        
    @staticmethod
    def make_dir(directory):
        if not os.path.exists(directory):
            os.makedirs(directory)