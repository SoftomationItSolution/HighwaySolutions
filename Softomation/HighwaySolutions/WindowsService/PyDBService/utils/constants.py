from datetime import datetime
import json
import os
import platform
import subprocess
import time
import zipfile
import paramiko
import psutil
import pyodbc

class Utilities:
    @staticmethod
    def pid_exists(pid):
        try:
            return psutil.pid_exists(pid)
        except Exception as e:
            raise Exception(f"An error occurred: {e}")
    
    @staticmethod
    def kill_process(pid):
        try:
            process = psutil.Process(pid)
            process.terminate()
            return True
        except psutil.NoSuchProcess:
            return True

    @staticmethod
    def read_json_file(file_path):
        try:
            if os.path.exists(file_path):
                with open(file_path, 'r') as file:
                    return json.load(file)
            return None
        except FileNotFoundError:
            raise Exception(f"Error: File not found at {file_path}")
        except json.JSONDecodeError as e:
            raise Exception(f"Error decoding JSON in {file_path}: {e}")
        except Exception as e:
            raise Exception(f"An unexpected error occurred: {e}")

    @staticmethod
    def get_human_readable_size(size_in_bytes):
        try:
            for unit in ['Bytes', 'KB', 'MB', 'GB', 'TB']:
                if size_in_bytes < 1024:
                    return f"{size_in_bytes:.2f} {unit}"
                size_in_bytes /= 1024
            return f"{size_in_bytes:.2f} TB"
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def genereate_filepath(LocalPath,item,ext):
        try:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M")
            backup_file_path = os.path.join(LocalPath,item["BackUpPreFix"])
            backup_file_name=f"{item['DataBaseName']}_{timestamp}.{ext}"
            final_path= os.path.join(backup_file_path,backup_file_name)
            if not os.path.exists(backup_file_path):
                os.makedirs(backup_file_path)
            return final_path,backup_file_path,backup_file_name
        except Exception as e:
            raise Exception(f"An error occurred: {e}")
    
    @staticmethod
    def get_file_name(input_file):
        try:
            file_name = os.path.basename(input_file)
            return file_name
        except Exception as e:
            raise Exception(f"An error occurred: {e}")
    
    @staticmethod
    def get_file_path(input_file):
        try:
            file_path = os.path.dirname(input_file)
            return file_path
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def zip_file(input_file, output_zip_file):
        try:
            if not os.path.exists(input_file):
                raise FileNotFoundError(f"File {input_file} does not exist.")
            with zipfile.ZipFile(output_zip_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
                zipf.write(input_file, os.path.basename(input_file))
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def ensure_remote_directory(sftp_client, remote_directory):
        try:
            directories = remote_directory.strip("/").split("/")
            current_path = ""
            for directory in directories:
                current_path += f"/{directory}"
                try:
                    sftp_client.listdir(current_path)  # Check if directory exists
                except IOError:
                    sftp_client.mkdir(current_path)
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def upload_on_sftp(hostname, port, username, password, local_file, remote_file_path,backup_file_name):
        if not os.path.exists(local_file):
            raise FileNotFoundError(f"Local file {local_file} does not exist.")
        try:
            ssh_client = paramiko.SSHClient()
            ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh_client.connect(hostname=hostname, port=port, username=username, password=password)
            with ssh_client.open_sftp() as sftp_client:
                try:
                    if remote_file_path.startswith("/"):
                        final_remote_file_path = os.path.join("/data", remote_file_path.lstrip("/"))
                    else:
                        final_remote_file_path = os.path.join("data", remote_file_path)
                    Utilities.ensure_remote_directory(sftp_client, final_remote_file_path)
                    remote_file=os.path.join(final_remote_file_path,backup_file_name)
                    sftp_client.put(local_file, remote_file)
                except paramiko.SFTPError as e:
                    raise Exception(f"SFTP error occurred while uploading: {e}")
                except Exception as e:
                    raise Exception(f"Error occurred while uploading the file: {e}")
        except paramiko.AuthenticationException as e:
            raise Exception(f"Authentication failed: {e}")
        except paramiko.SSHException as e:
            raise Exception(f"SSH connection failed: {e}")
        except Exception as e:
            raise Exception(f"An error occurred: {e}")
        
    
    @staticmethod
    def backup_mysql(db_details, file_name, backup_dir):
        try:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M")
            backup_file = f"{file_name}_{timestamp}.sql"
            if not os.path.exists(backup_dir):
                os.makedirs(backup_dir)
            backup_path = os.path.join(backup_dir, backup_file)
            if platform.system() == 'Linux':
                command = f"mysqldump -u {db_details['db_user']} -p{db_details['db_password']} {db_details['db_name']} > {backup_path}"
            elif platform.system() == 'Windows':
                command = f"mysqldump -u {db_details['db_user']} -p{db_details['db_password']} {db_details['db_name']} > {backup_path}"
            result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if result.returncode != 0:
                raise Exception(f"MySQL backup failed with error: {result.stderr.decode()}")
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def ms_sql_con(item):
        try:
            conn_str = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={item['HostName']};DATABASE={item['DataBaseName']};"
                f"UID={item['LoginId']};PWD={item['LoginPassword']};"
                f"MultipleActiveResultSets=True"
            )
            conn = pyodbc.connect(conn_str)
            return conn
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def get_ms_sql_bkp(conn:pyodbc.Connection,DataBaseName,final_path):
        try:
            conn.autocommit = True
            with conn.cursor() as cursor:
                backup_query = f" BACKUP DATABASE {DataBaseName} TO DISK = '{final_path}';"
                cursor.execute(backup_query)
                time.sleep(5)
                backup_exists = os.path.exists(final_path)
                cursor.execute(f"SELECT TOP 1 physical_name,size FROM sys.master_files WHERE database_id = DB_ID('{DataBaseName}') AND type_desc = 'LOG' ")
                log_file_path = cursor.fetchone()
                log_size = log_file_path[1] if log_file_path else 0  # In bytes
                cursor.execute(f"""
                    SELECT TOP 1 backup_finish_date, backup_size
                    FROM msdb.dbo.backupset
                    WHERE database_name = '{DataBaseName}'
                    ORDER BY backup_finish_date DESC
                """)
                last_backup = cursor.fetchone()
                last_backup_time = last_backup[0] if last_backup else None
                last_backup_size = last_backup[1] if last_backup else 0  # In bytes
                log_file_size_bytes = log_size * 8 * 1024
                #last_backup_size_bytes=last_backup_size * 8 * 1024
                
            return {
                "BackupExists":backup_exists,
                "LastBackUpDatetime": last_backup_time.strftime('%Y-%m-%d %H:%M:%S') if last_backup_time else None,
                "LastBackUpSize": Utilities.get_human_readable_size(last_backup_size),
                "LastBackupFileSize":Utilities.get_human_readable_size(log_file_size_bytes) 
            }
        except Exception as e:
            raise Exception(f"An error occurred: {e}")

    @staticmethod
    def get_my_sql_bkp(item, backup_file):
        try:
            os.environ['MYSQL_PWD'] = item["LoginPassword"]
            command = [
                "mysqldump",
                "-h", item['HostName'],
                "-u", item['LoginId'],
                "--routines",  
                "--triggers",  
                "--single-transaction",  
                "--no-set-names",  
                "--all-tablespaces",  
                item['DataBaseName']
            ]
            file_result=False
            with open(backup_file, "wb") as output_file:
                result = subprocess.run(command, stdout=output_file, stderr=subprocess.PIPE, check=True)
                if result.returncode == 0:
                    file_result=True
                else:
                    file_result=result.stderr.decode('utf-8')
            
            backup_exists = os.path.exists(backup_file)
            last_backup_time = datetime.now()
            if backup_exists:
                last_backup_size_bytes = os.path.getsize(backup_file)
                last_backup_size_bytes=Utilities.get_human_readable_size(last_backup_size_bytes)
            else:
                last_backup_size_bytes=file_result
            return {
                "BackupExists": backup_exists,
                "LastBackUpDatetime": last_backup_time.strftime('%Y-%m-%d %H:%M:%S'),
                "LastBackUpSize": last_backup_size_bytes,
                "LastBackupFileSize": ""
            }
        except Exception as e:
            raise Exception(f"An error occurred: {e}")