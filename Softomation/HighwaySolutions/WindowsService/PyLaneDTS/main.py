
from utils.constants import read_json_file
from utils.database import MySQLConnection
from utils.shiftTimingModel import shiftTimingImport
from utils.userModel import  userDetailsImport

def fetch_and_store_data():
    try:
        api_base_url = 'https://tmsapi.avsrealtor.in/'
        db_json_data=read_json_file(r'C:\ProjectConfig\TMSLane\MasterConfig\dbConfig.json')
        db = MySQLConnection(host=db_json_data['host'], user=db_json_data['user'], password=db_json_data['password'], database=db_json_data['database'])
        shiftTimingImport(api_base_url,db)
        userDetailsImport(api_base_url,db)
        
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


if __name__ == '__main__':
    fetch_and_store_data()