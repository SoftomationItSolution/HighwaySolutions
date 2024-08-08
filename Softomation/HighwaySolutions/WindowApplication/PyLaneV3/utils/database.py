import json
import mysql.connector
import pandas as pd

from utils.log_master import CustomLogger

class MySQLConnection:
    _instance = None
    def __new__(cls, host, user, password, database):
        cls.logger= CustomLogger('db_connection')
        if cls._instance is None:
            cls._instance = super(MySQLConnection, cls).__new__(cls)
            cls._instance.host = host
            cls._instance.user = user
            cls._instance.password = password
            cls._instance.database = database
        return cls._instance
    
    def connect(self):
        try:
            if not hasattr(self, 'connection') or self.connection is None or not self.connection.is_connected():
                self.connection = mysql.connector.connect(
                    host=self.host,
                    user=self.user,
                    password=self.password,
                    database=self.database,
                )
                self.connection.autocommit = True
            return self.connection
        except mysql.connector.Error as e:
            self.logger.logError(f"Error connecting to MySQL: {e}")
            raise e

    def execute_query(self, query):
        try:
            self.connect()
            with self.connection.cursor() as cursor:
                cursor.execute(query)
                columns = [col[0] for col in cursor.description]
                data = cursor.fetchall()
                result_df = pd.DataFrame(data, columns=columns)
                result_json = result_df.to_json(orient='records')
            return json.loads(result_json)
        except Exception as e:
            self.logger.logError(f"Error executing to query: {e}")
            raise e
        finally:
            if hasattr(self, 'connection') and self.connection.is_connected():
                self.connection.close()

    def execute_procedure(self, procedure_name, args=None):
        try:
            self.connect()
            with self.connection.cursor() as cursor:
                if args:
                    cursor.callproc(procedure_name, args)
                else:
                    cursor.callproc(procedure_name)
                self.connection.commit()
                result = cursor.stored_results()
                for result_data in result:
                    columns = result_data.column_names
                    result_df = pd.DataFrame(result_data.fetchall(), columns=columns)
                    result_json = result_df.to_json(orient='records')
                    return json.loads(result_json)
                return None
        except Exception as e:
            self.logger.logError(f"Error executing to procedure: {e}")
            raise e