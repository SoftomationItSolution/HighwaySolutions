import subprocess

try:
    import mysql.connector
except ImportError:
    subprocess.run(['pip3', 'install', 'mysql-connector-python'])
    
    import mysql.connector


import mysql.connector

class Database_connect:
    _instance = None
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connect()
        return cls._instance

    def connect(self):
        self.connection = mysql.connector.connect(host="151.106.124.201",
            user="u942760632_TMS_user",
            password="Tms@2023",
            database="u942760632_TMS"
            
        )
        if self.connection.is_connected():
            print("Connected to MySQL database")
        else:
            print("Failed to connect to MySQL database")

    def disconnect(self):
        if self.connection.is_connected():
            self.connection.close()
            print("Disconnected from MySQL database")

    def get_tables(self):
        cursor = self.connection.cursor()
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        cursor.close()
        return tables




if __name__ == '__main__':
    db = Database_connect()
    #db.connect()
    get_tables = db.get_tables()
    print(get_tables)
    db.disconnect()
