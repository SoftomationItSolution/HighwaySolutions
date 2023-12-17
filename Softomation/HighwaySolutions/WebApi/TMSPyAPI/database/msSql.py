import pyodbc
import pandas as pd
from config.dbConfig import DATABASE_CONFIG


class Database_connect:
    _instance = None
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connect()
        return cls._instance
    
    def getConnection(self):
        cnxn = pyodbc.connect(driver='{SQL Server}', server=DATABASE_CONFIG["Server"], database=DATABASE_CONFIG["Database"],uid=DATABASE_CONFIG["UID"],Password=DATABASE_CONFIG["Password"],trusted_connection='yes')
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
            json_data = df.to_json(orient='records')
            return json_data
        except Exception as err:
            print(f"Unexpected {err=}, {type(err)=}")