import datetime
import json
import os
import random
import re
import shutil
import socket
import string
import time
from ftplib import FTP
import netifaces
import requests
import paramiko
import psutil

class Utilities:
    key = b'0123456789abcdef0123456789abcdef'  # 32 bytes key for AES-256
    iv = b'$0ft0m@ti0nTech$'  # 16 bytes IV for AES-256-CBC
    exception_map = {
            "00": "SUCCESS",
            "01": "Hotlist",
            "02": "Exempted",
            "03": "Low Balance",
            "04": "Invalid Carriage",
            "05": "Blacklist",
            "06": "Closed"
        }
    
    @staticmethod
    def get_absolute_file_path(script_dir, file_name):
        try:
            file_path = os.path.abspath(os.path.join(script_dir, file_name))
            return file_path
        except Exception as e:
            raise e
        
    @staticmethod
    def get_final_path(path_components):
        return os.path.join(*path_components)

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
    def my_sql_date_format(date_obj=None):
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
    def get_local_ips(retries=5, delay=2):
        for _ in range(retries):
            interfaces = netifaces.interfaces()
            ip_addresses = []
            for iface in interfaces:
                addresses = netifaces.ifaddresses(iface)
                if netifaces.AF_INET in addresses:
                    for addr in addresses[netifaces.AF_INET]:
                        if 'addr' in addr and addr['addr'] != '127.0.0.1':
                            ip_addresses.append(addr['addr'])
            if ip_addresses:
                return ip_addresses[0]
            time.sleep(delay)

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
    
    @staticmethod
    def difference_in_seconds(first_datetime_str,second_datetime):
        datetime_format = "%d-%b-%Y %H:%M:%S.%f"
        first_datetime = datetime.datetime.strptime(first_datetime_str, datetime_format)
        difference = (second_datetime - first_datetime).total_seconds()
        return difference
    
    @staticmethod
    def parse_date_time_from_json(date_str):
        return datetime.datetime.strptime(date_str, "%d-%b-%Y %H:%M:%S.%f")

    @staticmethod
    def create_txn_id(dt=None):
        dt = dt or datetime.datetime.now()
        milliseconds = dt.microsecond // 1000
        formatted_number = dt.strftime("%y%m%d%H%M%S") + "{:02}".format(milliseconds)
        return formatted_number

    @staticmethod
    def receipt_number(plaza_id, lane_id,class_id, dt=None):
        mapping = {
        "00": "A", "01": "B", "02": "C", "03": "D", "04": "E",
        "05": "F", "06": "G", "07": "H", "08": "I", "09": "J",
        "10": "K", "11": "L", "12": "M", "13": "N", "14": "O",
        "15": "P", "16": "Q", "17": "R", "18": "S", "19": "T",
        "20": "U", "21": "V", "22": "W", "23": "X", "24": "Y", "25": "Z"
    }
        dt = dt or datetime.datetime.now()
        year= dt.strftime("%y")
        month= mapping.get(dt.strftime("%m"))
        day= dt.strftime("%d")
        #day= mapping.get(dt.strftime("%d"))
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
        #milliseconds = dt.microsecond // 1000
        #first_two_digits_milliseconds = f"{milliseconds:03d}"[:2]
        #formatted_number = dt.strftime("%y%m%d%H%M%S") 
        #formatted_number += milliseconds
        #random_component = f"{random.randint(0, 99):02d}"
        #formatted_number +=random_component
        formatted_number = dt.strftime("%y%m%d%H%M%S%f")[:-3]
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
    def check_api_url(api_base_url,timeout):
        try:
            response = requests.get(api_base_url,timeout=timeout)
            if response.status_code == 200:
                return True
            else:
                return False
        except Exception as e:
            return False
        
    @staticmethod
    def make_dir(directory):
        if not os.path.exists(directory):
            os.makedirs(directory)
    
    
    @staticmethod
    def starts_with_F_ends_with_E(input_string):
        pattern = r'^F.*E$'
        return bool(re.match(pattern, input_string))
    
    @staticmethod
    def is_valid_json(my_json_str):
        try:
            return json.loads(my_json_str)
        except ValueError:
            return False
        
    @staticmethod
    def check_file_exists(file_path):
        return os.path.exists(file_path)
        
    @staticmethod
    def upload_ftp(image_path, ftp_server, ftp_username, ftp_password, ftp_directory):
        try:
            ftp = FTP(ftp_server)
            ftp.login(ftp_username, ftp_password)
            ftp.mkd(ftp_directory)
            ftp.cwd(ftp_directory)
            with open(image_path, 'rb') as file:
                ftp.storbinary('STOR ' + image_path.split('/')[-1], file)
            ftp.quit()
            return True
        except Exception as e:
            raise e
    
    @staticmethod
    def create_remote_directory_recursive(sftp, remote_path):
        remote_dir = '/'.join(remote_path.split('/')[:-1])
        dirs = remote_dir.split('/')
        current_dir = ''
        for dir in dirs:
            if not dir:
                continue
            current_dir += '/' + dir
            try:
                sftp.stat(current_dir)
            except FileNotFoundError:
                sftp.mkdir(current_dir, mode=0o777)

    @staticmethod
    def upload_file_ssh(local_path, remote_path, ssh_host, ssh_username, ssh_password):
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect(hostname=ssh_host, username=ssh_username, password=ssh_password)

            sftp = ssh.open_sftp()
            # Ensure the remote directory exists
            Utilities.create_remote_directory_recursive(sftp, remote_path)

            # Upload file
            sftp.put(local_path, remote_path)

            # ✅ Cross-verify by checking remote file size
            local_size = os.path.getsize(local_path)
            remote_size = sftp.stat(remote_path).st_size
            if local_size != remote_size:
                raise Exception(f"File size mismatch: local={local_size}, remote={remote_size}")

            # If verified, remove the local file
            try:
                os.remove(local_path)
            except Exception as e:
                print(f"unable to remove file {local_path}")
            sftp.close()
            ssh.close()
            return True

        except Exception as e:
            raise e
    
    
    # def upload_file_ssh(local_path, remote_path, ssh_host, ssh_username, ssh_password):
    #     try:
    #         ssh = paramiko.SSHClient()
    #         ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    #         ssh.connect(hostname=ssh_host, username=ssh_username, password=ssh_password)
    #         sftp = ssh.open_sftp()
    #         Utilities.create_remote_directory_recursive(sftp, remote_path)
    #         sftp.put(local_path, remote_path)
    #         sftp.close()
    #         ssh.close()
    #         return True
    #     except Exception as e:
    #         raise e
        
    @staticmethod
    def is_integer(value):
        try:
            return int(value)
        except:
            return 0
        
    @staticmethod
    def pid_exists(pid):
        return psutil.pid_exists(pid)
    
    @staticmethod
    def kill_process(pid):
        try:
            process = psutil.Process(pid)
            process.terminate()
            return True
        except psutil.NoSuchProcess:
            return True
        
    @staticmethod
    def generate_receipt_number():
        timestamp = int(time.time() * 1000)  # Get current timestamp in milliseconds
        random_number = random.randint(0, 9999)  # Generate random number between 0 and 9999
        padded_random = str(random_number).zfill(4)  # Pad random number to have 4 digits
        receipt_number = f"{timestamp}{padded_random}"  # Concatenate timestamp and padded random number
        return receipt_number[:20]  # Ensure the length is 20 characters
    

    def delete_old_folders(directory, days=7):
        try:
            age_in_seconds = days * 24 * 60 * 60
            current_time = time.time()
            if not os.path.exists(directory):
                return

            for folder_name in os.listdir(directory):
                folder_path = os.path.join(directory, folder_name)
                if os.path.isdir(folder_path):
                    folder_age = current_time - os.path.getmtime(folder_path)
                    if folder_age > age_in_seconds:
                        try:
                            shutil.rmtree(folder_path)
                        except Exception as e:
                             raise e
        except Exception as e:
            raise e
        
    @staticmethod
    def equipment_type_exists(equipment_type_id,dio_equipment_detail):
       return any(filter(lambda equipment: equipment['EquipmentTypeId'] == equipment_type_id, dio_equipment_detail))
    

    @staticmethod
    def get_exception_names(exc_codes):
        exc_code_list = exc_codes.split(',')
        exception_names = [Utilities.exception_map.get(code.strip(), "Unknown") for code in exc_code_list]
        return ", ".join(exception_names)
    
    @staticmethod
    def current_trans():
        try:
            current_date_time=datetime.datetime.now()
            current_Transaction = {
                "LaneTransactionId": '0',
                "JourneyId": 0,
                "PlazaId": 0,
                "LaneId": 0,
                "ShiftId": 0,
                "TransactionTypeId": 0,
                "PaymentTypeId": 0,
                "ExemptTypeId": 0,
                "ExemptSubTypeId": 0,
                "VehicleClassId": 0,
                "VehicleSubClassId": 0,
                "VehicleAvcClassId": 0,
                "PlateNumber": "",
                "RCTNumber": "",
                "TagEPC": "",
                "TagClassId": 0,
                "TagPlateNumber": "",
                "TagReadDateTime": Utilities.current_date_time_json(dt=current_date_time),
                "TagReadCount": 0,
                "TagReadById": 0,
                "PermissibleVehicleWeight": 0.00,
                "ActualVehicleWeight": 0.00,
                "IsVehicleOverWeight": False,
                "IsOverWeightCharged": False,
                "OverWeightAmount": 0.00,
                "TagPenaltyAmount": 0.00,
                "TransactionAmount": 0.00,
                "TransactionDateTime": Utilities.current_date_time_json(dt=current_date_time),
                "TransactionFrontImage": "",
                "TransactionBackImage": "",
                "TransactionAvcImage": "",
                "TransactionVideo": "",
                "ExemptionProofImage": "",
                "DestinationPlazaId": 0,
                "UserId": 0,
                "LoginId": 'sys-admin',
                "IsReturnJourney": False,
                "IsExcessJourney": False,
                "IsBarrierAutoClose": True,
                "IsTowVehicle": False,
                "IsFleetTranscation": False,
                "FleetCount": 0,
                "TCRemark": "",
                "PlazaName": "",
                "LaneName":"",
                "TransactionTypeName": "",
                "PaymentTypeName": "",
                "ExemptTypeName":"",
                "ExemptSubTypeName":"",
                "VehicleClassName": "",
                "VehicleSubClassName": "",
                "TagClassName": "",
                "Processed":False,
                "TagStatus":"",
                "ProcessAllowed":False,
                "SystemDateTime":current_date_time.isoformat()
            }
            return current_Transaction
        except Exception as e:
            raise e