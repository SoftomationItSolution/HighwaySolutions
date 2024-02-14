import datetime
import json
import os


appProvider = "Softomation"
json_date_time_format = "%d-%b-%Y %H:%M:%S"
json_date_format = "%d-%b-%Y"

def get_absolute_file_path(file_name):
    current_directory = os.getcwd()
    absolute_path = os.path.abspath(os.path.join(current_directory, file_name))
    return absolute_path

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

def JsonDateFormat(inDate=None):
    if inDate is None:
        today_date = datetime.date.today()
    else:
        today_date = inDate
    formatted_date = today_date.strftime("%Y-%m-%d")
    return formatted_date