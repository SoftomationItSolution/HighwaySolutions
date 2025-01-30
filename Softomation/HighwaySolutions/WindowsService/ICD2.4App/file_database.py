import pandas as pd
from sqlalchemy import create_engine
import urllib.parse

class CSVToSQLServer:
    def __init__(self, file_path, server, database, username, password, table_name, chunk_size=100000):
        self.file_path = file_path
        self.server = server
        self.database = database
        self.username = urllib.parse.quote_plus(username)
        self.password = urllib.parse.quote_plus(password)
        self.table_name = table_name
        self.chunk_size = chunk_size
        #self.connection_string = f'mssql+pyodbc://{self.username}:{self.password}@{self.server}/{self.database}?driver=ODBC+Driver+17+for+SQL+Server'
        self.connection_string = f"mssql+pyodbc://{self.username}:{self.password}@{self.server}/{self.database}?driver=ODBC+Driver+17+for+SQL+Server"
        self.engine = create_engine(self.connection_string)
        self.columns = ['TagID', 'TagStatus', 'TagStatusTimestamp', 'Category']  
    
        # username = urllib.parse.quote_plus(self.username)
        # password = urllib.parse.quote_plus(self.password)
        # server = self.server
        # database = self.database
        # connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
        # engine = create_engine(connection_string)
        # try:
        #     with engine.connect() as connection:
        #         print("Connection successful")
        # except Exception as e:
        #     print(f"Error: {e}")
    
    
    def insert_data(self):
        try:
            for chunk in pd.read_csv(self.file_path, header=None, names=self.columns, chunksize=self.chunk_size):
                chunk.to_sql(self.table_name, con=self.engine, if_exists='append', index=False)
                print(f"Inserted {len(chunk)} rows into {self.table_name}.")
            print("Data insertion completed successfully!")
        except Exception as e:
            print(f"Error occurred during data insertion: {e}")

csv_to_sql = CSVToSQLServer(
    file_path='/home/ProjectConfig/TMSv1/ICDDataFiles/Decrypted/Diff/TPCCH_ONAAV_20250109_025745.csv',  # Path to your CSV file
    server='192.168.10.201',          # SQL Server name
    database='TMSv1',      # Database name
    username='mcube',           # SQL Server username
    password='Softo@7890',           # SQL Server password
    table_name='tbl_VehicleStatusLog',      # Target table in SQL Server
    chunk_size=100000                   # Optional: Chunk size for handling large files
)


csv_to_sql.insert_data()
