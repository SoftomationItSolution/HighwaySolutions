import json
import os
import secrets
import string
import time

json_date_time_format = "%d-%b-%Y %H:%M:%S"
json_date_format = "%d-%b-%Y"

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


def get_absolute_file_path(file_name):
    current_directory = os.getcwd()
    absolute_path = os.path.abspath(os.path.join(current_directory, file_name))
    return absolute_path

def ResponseMessage(model, Data):
    return json.dumps({"Message": [{ "AlertMessage": model }],"ResponseData": Data})

def ResponseMessageList(model, Data):
    msg=[]
    for x in model:
        if x !='':
            msg.append({ "AlertMessage": x })
    out = {"Message": msg,"ResponseData": Data}
    return json.dumps(out)

def sleep_ms(milliseconds):
    seconds = milliseconds / 1000.0
    time.sleep(seconds)

def generate_random_string(length=10):
    characters = string.ascii_letters + string.digits
    random_string = ''.join(secrets.choice(characters) for _ in range(length))
    return random_string
