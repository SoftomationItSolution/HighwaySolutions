#import pypyodbc
import subprocess
try:
    import pyodbc
except ImportError:
    subprocess.run(['pip', 'install', 'pyodbc'])
    import pyodbc

import pyodbc
import config
import pandas as pd
class Database_connect:
    _instance = None
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connect()
        return cls._instance
    
    def getConnection(self):
        cnxn = pyodbc.connect(driver='{SQL Server}', server=config.DATABASE_CONFIG["Server"], database=config.DATABASE_CONFIG["Database"],uid=config.DATABASE_CONFIG["UID"],Password=config.DATABASE_CONFIG["Password"],trusted_connection='yes')
        return cnxn

    def disconnect(self):
        if self.IsOpen():
            self.connection.close()
            print("Disconnected from database")

    def connect(self):
        self.connection=self.getConnection()
        if self.IsOpen():
            print("Connected to database")
        else:
            print("Failed to connect to database")

    def IsOpen(self):
        try:
            cursor=self.connection.cursor()
            return True
        except:
            return False

    def get_tables(self,queery):
        try:
            df = pd.read_sql(queery, self.connection)
            # print(df)
            # df.CreatedDate = pd.DataFrame(df.CreatedDate.values.tolist())
            # df.CreatedDate = pd.to_datetime(df.CreatedDate)
            # print (df)
            json_data = df.to_json(orient='records')
            #json_data = df.to_json(orient='records', force_ascii=False, default_handler=str).encode('utf-8').decode('utf-8')
            return json_data
        except Exception as err:
            print(f"Unexpected {err=}, {type(err)=}")