from datetime import datetime
import json
import os
from PIL import Image
import io
import base64
import secrets

class Utilities:
    @staticmethod
    def make_dir(directory):
        if not os.path.exists(directory):
            os.makedirs(directory)

    
    @staticmethod
    def read_json_file(file_path):
        try:
            with open(file_path, 'r') as file:
                data = json.load(file)
                return data
        except FileNotFoundError as e:
            raise e
        except json.JSONDecodeError as e:
            raise e
        except Exception as e:
            raise e

    @staticmethod
    def get_datetime_str(dt=None):
        if dt is None:
            current_datetime = datetime.now()
        else:
            current_datetime=dt
        datetime_str = current_datetime.strftime("%Y%m%d%H%M%S%f")
        return datetime_str
    
    @staticmethod
    def pil_base64(image):
        #image = Image.open(image_path)
        img_byte_array = io.BytesIO()
        image.save(img_byte_array, format="png")
        img_byte_array = img_byte_array.getvalue()
        base64_img = base64.b64encode(img_byte_array).decode()
        base64_with_format = f"data:image/png;base64,{base64_img}"
        return base64_with_format
    
    @staticmethod
    def generate_secret_key():
        return secrets.token_hex(16)