import json
import os
import string
from datetime import datetime, date
import random


def get_date_time():
    CurrentDateTime = datetime.now()
    CurrentDateTime_s = CurrentDateTime.strftime("%d-%m-%YT%H:%M:%S")
    CurrentDateTime_ms = CurrentDateTime.strftime("%d-%m-%YT%H:%M:%S.%MS")
    return {
        "CurrentDateTime_ms": CurrentDateTime_ms,
        "CurrentDateTime_s": CurrentDateTime_s
    }


def txn_message_id():
    length = random.randint(1, 35)
    characters = string.ascii_letters + string.digits
    message_id = ''.join(random.choices(characters, k=length))
    return message_id


# def write_log(msg):
#     log_directory = "C:\\ProjectConfig\\ICD\\log\\API\\"
#     if not os.path.exists(log_directory):
#         os.makedirs(log_directory)
#     file = open(log_directory + str(date.today()) + ".txt", 'a')
#     # log_file_path = os.path.join(log_directory, str(date.today()) + ".txt", 'a')
#     Log_Write = file.write(get_date_time() + '  ' + msg + '\n')
#     file.close()
#     return Log_Write


def write_log(msg, log_type):
    base_log_directory = "C:\\ProjectConfig\\ICD\\log"
    base_Packets_log_directory = "C:\\ProjectConfig\\ICD\\log\\Packets\\RequestPay"
    log_folders = {
        "Services": "Services",
        "WebAPI": "API"
    }
    RequestPay_Packets = {
        "RequestPaySuccess": "Success",
        "RequestPayFailed": "Failed"
    }
    if log_type == "RequestPaySuccess" or log_type == "RequestPayFailed":
        log_directory = os.path.join(base_Packets_log_directory, RequestPay_Packets.get(log_type, "General"))
    else:
        log_directory = os.path.join(base_log_directory, log_folders.get(log_type, "General"))

    # log_directory = os.path.join(base_log_directory, log_folders.get(log_type, "general_logs"))
    os.makedirs(log_directory, exist_ok=True)
    log_file_path = os.path.join(log_directory, f"{date.today()}.txt")
    with open(log_file_path, 'a') as file:
        file.write(get_date_time()['CurrentDateTime_s'] + '  ' + msg + '\n')


# write_log("Service Started.", log_type="Services")
# write_log("API Started.", log_type="WebAPI")


def config_file():
    try:
        Config_File_Path = "C:\\ProjectConfig\\ICD\\MasterConfig\\ConfigFile.JSON"
        with open(Config_File_Path, 'r') as f:
            data = json.load(f)
        host = (data['host'])
        etc = (data['etc'])
        api = (data['api'])
        ver = (data['ver'])
        f.close()
        return {
            "host": host,
            "etc": etc,
            "api": api,
            "ver": ver
        }
    except FileNotFoundError:
        write_log(f"Config file not found")
    except json.JSONDecodeError:
        write_log("Error decoding JSON from the configuration file")
    except KeyError as e:
        write_log(f"Missing expected key in configuration file: {e}")
    except Exception as e:
        write_log(f"Unable to read config file: {e}")
