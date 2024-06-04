import os
import platform
import threading
from api import SocketIOApp
from service.avc_handler_thread import AVC_Handler_Thread
from utils.constants import Utilities

def start_socketio_app(default_directory,log_filePath,handler):
    your_secret_key=Utilities.generate_secret_key()
    app = SocketIOApp(default_directory=default_directory,secret_key=your_secret_key,log_filePath=log_filePath,bg_handler=handler)
    app.run()


def check_default_dir():
    try:
        if platform.system() == 'Linux':
            default_directory = '/home/ProjectConfig/AVCv1/'
        else:
            default_directory = 'C:\\ProjectConfig\\AVCv1\\'
        if not os.path.exists(default_directory):
            os.makedirs(default_directory)
        return default_directory
    except Exception as e:
        print(str(e))


if __name__ == '__main__':
    default_directory = check_default_dir()
    log_filePath = os.path.join(default_directory,"logs")
    config_filePath = os.path.join(default_directory,"MasterConfig" ,"config.json")
    data=Utilities.read_json_file(config_filePath)
    if data["image_path"] is None or data["image_path"]=='':
        data["image_path"]=os.path.join(default_directory,"Events")
    handler = AVC_Handler_Thread(log_filePath,data)
    handler.is_running=True
    handler.start()
    thread = threading.Thread(target=start_socketio_app,args=[default_directory,log_filePath,handler])
    thread.start()