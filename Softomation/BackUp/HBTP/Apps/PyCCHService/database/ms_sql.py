import json
import pandas as pd
import pyodbc
import threading
import time
from utils.log_master import CustomLogger

class MSSQLConnectionManager:
    _instance = None
    _lock = threading.Lock()
    pyodbc.pooling = True
    _thread_local = threading.local()

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
            self.set_logger(default_directory, "icd_db_service")
            self.connection_string = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={server};DATABASE={database};"
                f"UID={username};PWD={password};"
                f"MultipleActiveResultSets=True"
            )

    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def _connect(self):
        """Ensures separate connections for each thread."""
        if not hasattr(self._thread_local, 'connection'):
            try:
                # Create a new connection per thread
                self._thread_local.connection = pyodbc.connect(self.connection_string, timeout=3600)  # 1 hour timeout
            except pyodbc.Error as e:
                self.logger.logError(f"Error connecting to database: {e}")
                raise e
        return self._thread_local.connection

    def execute_query(self, query):
        """Execute a query, ensuring each connection only executes one command at a time."""
        connection = self._connect()
        with connection.cursor() as cursor:
            try:
                cursor.execute(query)
                connection.commit()
                # Ensure results are fetched before proceeding to the next command
                rows = cursor.fetchall()
                if rows:
                    columns = [column[0] for column in cursor.description]
                    df = pd.DataFrame.from_records(rows, columns=columns)
                    return df
                else:
                    return pd.DataFrame()
            except Exception as e:
                self.logger.logError(f"Error executing query: {e}")
                return pd.DataFrame()
            finally:
                connection.close()  # Ensure connection is closed after execution

    def execute_stored_procedure(self, procedure_name, params=None):
        connection = self._connect()
        with connection.cursor() as cursor:
            try:
                if params:
                    placeholders = ', '.join(['?' for _ in params])
                    call_proc = f"EXEC {procedure_name} {placeholders}"
                    cursor.execute(call_proc, *params)
                else:
                    call_proc = f"EXEC {procedure_name}"
                    cursor.execute(call_proc)

                # Ensure results are processed before executing another command
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
                self.logger.logError(f"Error executing stored procedure: {e}")
                raise e
   
    def execute_stored_procedure_single(self, procedure_name, params=None):
        """Execute a stored procedure that returns a single result row."""
        connection = self._connect()
        with connection.cursor() as cursor:
            try:
                if params:
                    placeholders = ', '.join(['?' for _ in params])
                    call_proc = f"EXEC {procedure_name} {placeholders}"
                    cursor.execute(call_proc, *params)
                else:
                    call_proc = f"EXEC {procedure_name}"
                    cursor.execute(call_proc)

                # Fetch the first result row
                columns = [column[0] for column in cursor.description]
                row = cursor.fetchone()
                if row:
                    return dict(zip(columns, row))
                else:
                    return None
            except Exception as e:
                self.logger.logError(f"Error executing stored procedure: {e}")
                raise e

    def execute_long_query_async(self, procedure_name, params=None):
        """Execute a long-running query in a separate thread."""
        def execute():
            try:
                self.execute_stored_procedure(procedure_name, params)
            except Exception as e:
                self.logger.logError(f"Error executing long-running query: {e}")

        # Run in a background thread
        thread = threading.Thread(target=execute)
        thread.start()
        return thread  # Returning thread in case the caller wants to wait for it

    def execute_query_with_retry(self, query, retries=3, delay=2):
        """Retry a query if it fails."""
        attempt = 0
        while attempt < retries:
            try:
                return self.execute_query(query)
            except Exception as e:
                if attempt < retries - 1:
                    time.sleep(delay)
                    attempt += 1
                else:
                    self.logger.logError(f"Error executing query after retries: {e}")
                    raise e

    def close_connection(self):
        """Close the connection after usage."""
        if hasattr(self._thread_local, 'connection'):
            self._thread_local.connection.close()
            del self._thread_local.connection
