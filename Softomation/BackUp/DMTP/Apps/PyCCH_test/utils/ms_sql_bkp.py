import json
import pandas as pd
import pyodbc
import threading

from utils.log_master import CustomLogger

class MSSQLConnectionManager:
    _instance = None
    _lock = threading.Lock()

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            with cls._lock:
                if not cls._instance:
                    cls._instance = super(MSSQLConnectionManager, cls).__new__(cls)
        return cls._instance

    def __init__(self, default_directory, server, database, username, password):
        if not hasattr(self, '_initialized'):
            self._initialized = True
            self.default_directory = default_directory
            self.set_logger(default_directory,"icd_db_service")
            self.connection_string = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={server};DATABASE={database};"
                f"UID={username};PWD={password}"
            )
            self._connection = None
            
    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def _connect(self):
        if self._connection is None:
            self._connection = pyodbc.connect(self.connection_string)
        else:
            try:
                # Validate the connection by executing a lightweight query
                with self._connection.cursor() as cursor:
                    cursor.execute("SELECT 1")
            except pyodbc.Error as e:
                self.logger.logError(f"Error _connect query: {e}")
                self._connection = pyodbc.connect(self.connection_string)

    def execute_query(self, query):
        self._connect()
        with self._connection.cursor() as cursor:
            try:
                df = pd.read_sql(query, self._connection)
                return df
            except Exception as e:
                self.logger.logError(f"Error executing query: {e}")
                return pd.DataFrame()

    def execute_stored_procedure(self, procedure_name, params=None):
        self._connect()
        with self._connection.cursor() as cursor:
            try:
                if params:
                    placeholders = ', '.join(['?' for _ in params])
                    call_proc = f"EXEC {procedure_name} {placeholders}"
                    cursor.execute(call_proc, *params)
                else:
                    call_proc = f"EXEC {procedure_name}"
                    cursor.execute(call_proc)
                if cursor.description:
                    columns = [column[0] for column in cursor.description]
                    rows = cursor.fetchall()
                    if rows:
                        df = pd.DataFrame.from_records(rows, columns=columns)
                        return json.loads(df.to_json(orient='records'))
                    else:
                        return None
                else:
                    return None
            except Exception as e:
                self.logger.logError(f"Error execute_stored_procedure query: {e}")
                raise e

    def execute_stored_procedure_single(self, procedure_name, params=None):
        self._connect()
        with self._connection.cursor() as cursor:
            try:
                if params:
                    placeholders = ', '.join(['?' for _ in params])
                    call_proc = f"EXEC {procedure_name} {placeholders}"
                    cursor.execute(call_proc, *params)
                else:
                    call_proc = f"EXEC {procedure_name}"
                    cursor.execute(call_proc)

                columns = [column[0] for column in cursor.description]
                row = cursor.fetchone()
                if row:
                    return dict(zip(columns, row))
                else:
                    return None
            except Exception as e:
                self.logger.logError(f"Error execute_stored_procedure_single query: {e}")
                raise e

    def close_connection(self):
        if self._connection:
            self._connection.close()
            self._connection = None
