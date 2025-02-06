import os
import subprocess
import platform
import paramiko
import logging
import datetime
import time
from functools import wraps
from threading import Timer, Thread
from concurrent.futures import ThreadPoolExecutor

# Configure logging
logging.basicConfig(
    filename="backup.log",
    level=logging.ERROR,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def retry(max_retries=5, delay=5):
    """Retry decorator for retrying a function on failure."""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(max_retries):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if attempt < max_retries - 1:
                        time.sleep(delay)
                    else:
                        raise e
        return wrapper
    return decorator

class DatabaseBackup:
    BACKUP_DIR = "/path/to/backup"
    SFTP_CONFIG = {
        "host": "your_sftp_host",
        "port": 22,
        "username": "your_username",
        "password": "your_password"
    }

    def __init__(self, db_configs):
        self.db_configs = db_configs
        os.makedirs(self.BACKUP_DIR, exist_ok=True)

    @staticmethod
    @retry(max_retries=5)
    def execute_command(command):
        """Execute a system command."""
        subprocess.check_call(command, shell=True)

    @staticmethod
    @retry(max_retries=5)
    def upload_to_sftp(local_file, remote_path):
        """Upload a file to an SFTP server."""
        try:
            transport = paramiko.Transport((DatabaseBackup.SFTP_CONFIG["host"], DatabaseBackup.SFTP_CONFIG["port"]))
            transport.connect(
                username=DatabaseBackup.SFTP_CONFIG["username"], 
                password=DatabaseBackup.SFTP_CONFIG["password"]
            )
            sftp = paramiko.SFTPClient.from_transport(transport)
            sftp.put(local_file, remote_path)
            sftp.close()
            transport.close()
            print(f"File {local_file} uploaded successfully to {remote_path}")
        except Exception as e:
            logging.error(f"SFTP upload failed for {local_file}: {e}")
            raise

    def backup_mysql(self, config):
        """Backup a MySQL database."""
        user = config["Username"]
        password = config["Password"]
        db = config["Database"]
        host = config["Host"]
        prefix = config["FilePrefix"]
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M")
        backup_file = f"{self.BACKUP_DIR}/{prefix}mysql_{db}_{timestamp}.sql"

        try:
            command = f"mysqldump -h {host} -u {user} -p{password} {db} > {backup_file}"
            self.execute_command(command)
            print(f"MySQL backup completed: {backup_file}")
            self.upload_to_sftp(backup_file, f"/remote/backup/{os.path.basename(backup_file)}")
        except Exception as e:
            logging.error(f"MySQL backup failed for {db}: {e}")

    def backup_mssql(self, config):
        """Backup an MS SQL database."""
        server = config["Server"]
        database = config["Database"]
        prefix = config["FilePrefix"]
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M")
        backup_file = f"{self.BACKUP_DIR}/{prefix}mssql_{database}_{timestamp}.bak"

        try:
            command = f"sqlcmd -S {server} -U {config['Username']} -P {config['Password']} -Q \"BACKUP DATABASE [{database}] TO DISK='{backup_file}'\""
            self.execute_command(command)
            print(f"MS SQL backup completed: {backup_file}")
            self.upload_to_sftp(backup_file, f"/remote/backup/{os.path.basename(backup_file)}")
        except Exception as e:
            logging.error(f"MS SQL backup failed for {database}: {e}")

    def perform_backups(self):
        """Perform backups for all databases in parallel."""
        with ThreadPoolExecutor() as executor:
            futures = []
            for config in self.db_configs:
                if config["DBType"] == "MYSql":
                    futures.append(executor.submit(self.backup_mysql, config))
                elif config["DBType"] == "MSSql":
                    futures.append(executor.submit(self.backup_mssql, config))

            for future in futures:
                try:
                    future.result()
                except Exception as e:
                    logging.error(f"Backup task failed: {e}")

    def schedule_backups(self, interval_hours=4):
        """Schedule backups to run every specified interval."""
        self.perform_backups()
        Timer(interval_hours * 3600, self.schedule_backups, [interval_hours]).start()

if __name__ == "__main__":
    DB_CONFIGS = [
        {
            "DBType": "MYSql",
            "Host": "localhost",
            "Username": "test",
            "Password": "test@121",
            "Database": "lane_1_db",
            "FilePrefix": "L1_",
            "LastBakcup": "",
            "Remark": ""
        },
        {
            "DBType": "MSSql",
            "Server": "localhost",
            "Username": "test",
            "Password": "test@121",
            "Database": "server_1_db",
            "FilePrefix": "S1_",
            "LastBakcup": "",
            "Remark": ""
        }
    ]

    backup_manager = DatabaseBackup(DB_CONFIGS)
    backup_manager.schedule_backups()
