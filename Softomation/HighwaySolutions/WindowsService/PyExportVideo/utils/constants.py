import datetime
import json
import os
import uuid
from xml.dom import minidom
from lxml import etree
import psutil
import requests
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading
import xml.etree.ElementTree as ET

class Utilities:
    # _lock = threading.Lock()
    # not_allowed = ["01", "03", "05", "06"]
    # allowed = ["00", "02", "04"]
    
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
    def mssql_to_nvr_format(timestamp_ms, add_seconds=0):
        timestamp_s = timestamp_ms / 1000
        #dt = datetime.datetime.fromtimestamp(timestamp_s) + datetime.timedelta(seconds=add_seconds)
        dt = datetime.datetime.utcfromtimestamp(timestamp_s)
        dt += datetime.timedelta(seconds=add_seconds) 
        formatted_time = dt.strftime("%Y_%m_%d_%H_%M_%S")
        return formatted_time

    @staticmethod
    def mssql_to_date_only(timestamp_ms):
        timestamp_s = timestamp_ms / 1000
        #dt = datetime.datetime.fromtimestamp(timestamp_s) + datetime.timedelta(days=add_days)
        dt = datetime.datetime.utcfromtimestamp(timestamp_s)
        formatted_date = dt.strftime("%Y-%m-%d")
        return formatted_date

    @staticmethod
    def delete_if_exists(filepath):
        if filepath and os.path.exists(filepath):
            os.remove(filepath)

    
    


    
 