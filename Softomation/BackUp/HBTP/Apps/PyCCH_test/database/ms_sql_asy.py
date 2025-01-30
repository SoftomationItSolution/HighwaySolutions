import json
import pandas as pd
import aioodbc
import asyncio
from utils.log_master import CustomLogger


class AsyncMSSQLConnectionManager:
    _instance = None
    _lock = asyncio.Lock()

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super(AsyncMSSQLConnectionManager, cls).__new__(cls)
        return cls._instance

    def __init__(self, default_directory, server, database, username, password):
        if not hasattr(self, "_initialized"):
            self._initialized = True
            self.default_directory = default_directory
            self.set_logger(default_directory, "icd_db_service")
            self.connection_string = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={server};DATABASE={database};"
                f"UID={username};PWD={password};"
                f"MultipleActiveResultSets=True"
            )
            self.pool = None

    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    async def _connect(self):
        """Create a connection pool."""
        if not self.pool:
            try:
                self.pool = await aioodbc.create_pool(dsn=self.connection_string)
            except Exception as e:
                self.logger.logError(f"Error creating connection pool: {e}")
                raise e
        return self.pool

    async def execute_query(self, query):
        """Execute a query asynchronously."""
        pool = await self._connect()
        async with pool.acquire() as connection:
            async with connection.cursor() as cursor:
                try:
                    await cursor.execute(query)
                    rows = await cursor.fetchall()
                    if rows:
                        columns = [column[0] for column in cursor.description]
                        df = pd.DataFrame.from_records(rows, columns=columns)
                        return df
                    else:
                        return pd.DataFrame()
                except Exception as e:
                    self.logger.logError(f"Error executing query: {e}")
                    return pd.DataFrame()

    async def execute_stored_procedure(self, procedure_name, params=None):
        pool = await self._connect()
        async with pool.acquire() as connection:
            async with connection.cursor() as cursor:
                try:
                    # If parameters are provided, format the placeholders and execute
                    if params:
                        placeholders = ", ".join(["?" for _ in params])
                        call_proc = f"EXEC {procedure_name} {placeholders}"
                        await cursor.execute(call_proc, *params)  # Unpack the parameters
                    else:
                        call_proc = f"EXEC {procedure_name}"
                        await cursor.execute(call_proc)

                    # If results are available, fetch and process them
                    if cursor.description:
                        columns = [column[0] for column in cursor.description]
                        rows = await cursor.fetchall()
                        if rows:
                            df = pd.DataFrame.from_records(rows, columns=columns)
                            return json.loads(df.to_json(orient="records"))
                        else:
                            return None
                    else:
                        return None
                except Exception as e:
                    self.logger.logError(f"Error executing stored procedure: {e}")
                    raise e
    

    async def execute_stored_procedure_single(self, procedure_name, params=None):
        """Execute a stored procedure that returns a single result row asynchronously."""
        pool = await self._connect()
        async with pool.acquire() as connection:
            async with connection.cursor() as cursor:
                try:
                    if params:
                        placeholders = ", ".join(["?" for _ in params])
                        call_proc = f"EXEC {procedure_name} {placeholders}"
                        await cursor.execute(call_proc, params)
                    else:
                        call_proc = f"EXEC {procedure_name}"
                        await cursor.execute(call_proc)

                    columns = [column[0] for column in cursor.description]
                    row = await cursor.fetchone()
                    if row:
                        return dict(zip(columns, row))
                    else:
                        return None
                except Exception as e:
                    self.logger.logError(f"Error executing stored procedure: {e}")
                    raise e

    async def execute_long_query_async(self, procedure_name, params=None):
        """Execute a long-running query in a background task."""
        async def execute():
            try:
                await self.execute_stored_procedure(procedure_name, params)
            except Exception as e:
                self.logger.logError(f"Error executing long-running query: {e}")

        # Run in a background task
        asyncio.create_task(execute())

    async def execute_query_with_retry(self, query, retries=3, delay=2):
        """Retry a query asynchronously if it fails."""
        attempt = 0
        while attempt < retries:
            try:
                return await self.execute_query(query)
            except Exception as e:
                if attempt < retries - 1:
                    await asyncio.sleep(delay)
                    attempt += 1
                else:
                    self.logger.logError(f"Error executing query after retries: {e}")
                    raise e

    async def close_connection(self):
        """Close the connection pool."""
        if self.pool:
            self.pool.close()
            await self.pool.wait_closed()
