from datetime import datetime
import json
import os
from PIL import Image
import io
import base64

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
    def get_datetime_str():
        current_datetime = datetime.now()
        datetime_str = current_datetime.strftime("%Y%m%d%H%M%S%f")
        return datetime_str
    
    @staticmethod
    def pil_base64(image_path):
        image = Image.open(image_path)
        img_byte_array = io.BytesIO()
        image.save(img_byte_array, format=image.format)
        img_byte_array = img_byte_array.getvalue()
        base64_img = base64.b64encode(img_byte_array).decode('utf-8')
        return base64_img