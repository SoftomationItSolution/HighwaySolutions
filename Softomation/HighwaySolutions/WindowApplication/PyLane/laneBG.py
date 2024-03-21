import os
from utils.ConfigManager import ConfigManager
from utils.constants import get_ip_address, read_json_file, send_data_to_tcp_server
import time
from utils.database import MySQLConnection
from utils.log_master import CustomLogger

logger = CustomLogger('lane_bg')
script_dir = os.path.dirname(os.path.abspath(__file__))
config_file = os.path.join(os.path.dirname(__file__), 'config.ini')
config_manager = ConfigManager(config_file,script_dir)

db_path=config_manager.get_setting('Paths', 'db_dir')
db_json_data=read_json_file(db_path)
db = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])




# while True:
#     try:
#         send_data_to_tcp_server('192.168.10.24',23,'L1Test 2 \n')
#         time.sleep(1)
#     except:
#         break


def fetch_equipment_list():
    laneIp=get_ip_address()

    
def on_load(logger):
    fetch_equipment_list()

if __name__ == '__main__':
    on_load(logger)