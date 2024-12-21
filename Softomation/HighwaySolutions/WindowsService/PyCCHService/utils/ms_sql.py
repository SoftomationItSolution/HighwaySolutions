import json
import pandas as pd
import pyodbc
import threading

class MSSQLConnectionManager:
    _instance = None
    _lock = threading.Lock()

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            with cls._lock:
                if not cls._instance:
                    cls._instance = super(MSSQLConnectionManager, cls).__new__(cls)
        return cls._instance

    def __init__(self, default_directory,server, database, username, password):
        if not hasattr(self, '_initialized'):
            self._initialized = True
            self.default_directory=default_directory
            self.connection_string = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={server};DATABASE={database};"
                f"UID={username};PWD={password}"
            )
            self._connection = None

    def _connect(self):
        if self._connection is None or self._connection.closed:
            self._connection = pyodbc.connect(self.connection_string)

    def execute_query(self, query):
        try:
            self._connect()
            df = pd.read_sql(query, self._connection)
            return df
        except Exception as e:
            print(f"Error executing query: {e}")
            return pd.DataFrame()

    def execute_stored_procedure(self, procedure_name, params=None):
        try:
            self._connect()
            cursor = self._connection.cursor()
            if params:
                placeholders = ', '.join(['?' for _ in params])
                call_proc = f"EXEC {procedure_name} {placeholders}"
                cursor.execute(call_proc, *params)
            else:
                call_proc = f"EXEC {procedure_name}"
                cursor.execute(call_proc)

            # Fetch all results into a pandas DataFrame
            columns = [column[0] for column in cursor.description]
            rows = cursor.fetchall()
            if rows:  # Check if any rows are returned
                df = pd.DataFrame.from_records(rows, columns=columns)
                result_json=df.to_json(orient='records')
                return json.loads(result_json) 
            else:
               return None
        except Exception as e:
            raise e

    def close_connection(self):
        if self._connection:
            self._connection.close()
            self._connection = None

# Usage example
# if __name__ == "__main__":
#     server = "your_server"
#     database = "your_database"
#     username = "your_username"
#     password = "your_password"

#     db_manager = MSSQLConnectionManager(server, database, username, password)

#     # Query example
#     query = "SELECT * FROM your_table"
#     result = db_manager.execute_query(query)
#     print(result)

#     # Stored procedure example
#     procedure = "your_stored_procedure"
#     result = db_manager.execute_stored_procedure(procedure, params=["param1", "param2"])
#     print(result)

#     db_manager.close_connection()
