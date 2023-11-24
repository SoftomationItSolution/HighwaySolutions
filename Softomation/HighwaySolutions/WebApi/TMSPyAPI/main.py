import datetime
from flask import Flask
from db_connection import Database_connect 
import json
app = Flask(__name__)

@app.route('/')
def hello_world():
    db=Database_connect()
    data=db.get_tables("SELECT * FROM tbl_ShiftTimining")
    #json_data = data.to_json(orient='records')
    return data


def serialize_datetime(obj): 
    if isinstance(obj, datetime.datetime): 
        return obj.isoformat() 
    raise TypeError("Type not serializable") 


if __name__ == '__main__':
    app.run()