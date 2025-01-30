from datetime import datetime
import json
import os
import re
import uuid
import psutil
import threading

class Utilities:
    _lock = threading.Lock()
    not_allowed = ["01", "03", "05", "06"]
    allowed = ["00", "02", "04"]
    
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
    def check_values(values):
        values=values.split(',')
        for value in values:
            if value in Utilities.not_allowed:
                return False
            if value in Utilities.allowed:
                continue
            return False
        return True

    @staticmethod
    def make_dir(directory):
        if not os.path.exists(directory):
            os.makedirs(directory)

    
    @staticmethod
    def read_json_file(file_path):
        try:
            if os.path.exists(file_path):
                with open(file_path, 'r') as file:
                    return json.load(file)
            return None
        except FileNotFoundError:
            print(f"Error: File not found at {file_path}")
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON in {file_path}: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    @staticmethod    
    def generate_txn_id():
        unique_id = str(uuid.uuid4())
        message_id = unique_id.replace('-', '')[:22].upper()
        return message_id

    @staticmethod    
    def generate_message_id(PlazaZoneId):
        current_datetime = datetime.now()
        formatted_date_str = current_datetime.strftime("%d%m%y%H%M%S")
        return f'{PlazaZoneId}{formatted_date_str}'
    
    @staticmethod
    def get_date_time():
        CurrentDateTime = datetime.now()
        CurrentDateTime_s = CurrentDateTime.strftime("%Y-%m-%dT%H:%M:%S")
        CurrentDateTime_ms = CurrentDateTime.strftime("%Y-%m-%dT%H:%M:%S.%MS")
        return {
            "CurrentDateTime_ms": CurrentDateTime_ms,
            "CurrentDateTime_s": CurrentDateTime_s
        }
    
    @staticmethod
    def folder_datetime_format(timestamp_ms):
        timestamp_s = timestamp_ms / 1000
        dt = datetime.utcfromtimestamp(timestamp_s)
        formatted_dt = dt.strftime('%Y_%m_%d')
        return formatted_dt

    
    @staticmethod
    def generate_file_path(default_directory,timestamp_ms,apiName,MessageId):
        try:
            apiName=apiName.replace(' ', '')
            if timestamp_ms is None:
                current_utc = datetime.utcnow()
                timestamp_ms = int(current_utc.timestamp() * 1000)
            directory_path = os.path.join(default_directory,"Request",Utilities.folder_datetime_format(timestamp_ms),apiName)
            os.makedirs(directory_path, exist_ok=True)
            return os.path.join(directory_path, f"{MessageId}.xml")
        except Exception as e:
            raise e

    @staticmethod
    def format_file_date(timestamp):
        dt_object = datetime.fromtimestamp(timestamp)
        return dt_object.strftime("%d-%b-%Y %H:%M:%S")

    @staticmethod
    def python_format_to_normal(timestamp_ms):
        timestamp_s = timestamp_ms / 1000
        dt_object = datetime.utcfromtimestamp(timestamp_s)
        return dt_object.strftime("%d-%b-%Y %H:%M:%S")
    
    @staticmethod
    def get_dateTime_fromFile(filename):
        match = re.search(r"_(\d{8})_(\d{6})", filename)
        if match:
            date_str = match.group(1)  # '20250108'
            time_str = match.group(2)  # '180532'
            datetime_obj = datetime.strptime(f"{date_str} {time_str}", "%Y%m%d %H%M%S")
            formatted_datetime = datetime_obj.strftime("%d-%b-%Y %H:%M:%S")
            timestamp_seconds = int(datetime_obj.timestamp())
            return formatted_datetime,timestamp_seconds
        else:
            None,None
    
    @staticmethod
    def human_readable_file_size(size_in_bytes):
        units = ["B", "KB", "MB", "GB", "TB"]
        size = size_in_bytes
        unit_index = 0
        while size >= 1024 and unit_index < len(units) - 1:
            size /= 1024
            unit_index += 1
        return float(f"{size:.2f}"),f"{units[unit_index]}"

   