import json
import mysql.connector.pooling
import pandas as pd
from utils.log_master import CustomLogger

class MySQLConnections:
    _instance = None
    _pool = None

    def __new__(cls, log_dir, host, user, password, database):
        if cls._instance is None:
            cls._instance = super(MySQLConnections, cls).__new__(cls)
            cls._instance.host = host
            cls._instance.user = user
            cls._instance.password = password
            cls._instance.database = database
            cls._instance.logger = CustomLogger(log_dir,'db_connection')
            cls._instance.create_pool()
        return cls._instance
    
    def create_pool(self):
        if MySQLConnections._pool is None:
            MySQLConnections._pool = mysql.connector.pooling.MySQLConnectionPool(
                pool_name="pool",
                pool_size=25,
                pool_reset_session=True,
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )

    def get_connection(self):
        try:
            return MySQLConnections._pool.get_connection()
        except mysql.connector.Error as e:
            self.logger.logError(f"Error connecting to MySQL: {e}")
            raise e

    def execute_query(self, query):
        try:
            connection = self.get_connection()
            cursor = connection.cursor()
            cursor.execute(query)
            columns = [col[0] for col in cursor.description]
            data = cursor.fetchall()
            result_df = pd.DataFrame(data, columns=columns)
            result_json = result_df.to_json(orient='records')
            return json.loads(result_json)
        except Exception as e:
            self.logger.logError(f"Error executing query: {e}")
            raise e
        finally:
            if 'cursor' in locals():
                cursor.close()
            if 'connection' in locals():
                connection.close()

    def execute_procedure(self, procedure_name, args=None):
        try:
            connection = self.get_connection()
            cursor = connection.cursor()
            if args:
                cursor.callproc(procedure_name, args)
            else:
                cursor.callproc(procedure_name)
            connection.commit()
            result = cursor.stored_results()
            for result_data in result:
                columns = result_data.column_names
                result_df = pd.DataFrame(result_data.fetchall(), columns=columns)
                for col in result_df.select_dtypes(include='datetime64[ns]').columns:
                    result_df[col] = result_df[col].apply(lambda x: x.to_pydatetime().strftime('%d-%b-%Y %H:%M:%S.%f') if isinstance(x, pd.Timestamp) else x)
                result_json = result_df.to_json(orient='records')
                return json.loads(result_json)
            return None
        except Exception as e:
            self.logger.logError(f"Error executing procedure: {e}")
            raise e
        finally:
            if 'cursor' in locals():
                cursor.close()
            if 'connection' in locals():
                connection.close()
