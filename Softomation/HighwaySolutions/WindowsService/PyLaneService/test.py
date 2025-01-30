from datetime import datetime
import paramiko
import os

hostname = '93.127.198.13'
port = 22
username = 'softo_sftp'
password = 'SoftoMation@2025'
remote_dir = '/data/'
local_file = r"C:\Users\hemant\Downloads\data.rar"  # Make sure this path is correct
remote_file = remote_dir + '/data.rar'
current_date = datetime.now().strftime('%Y%m%d')
remote_dir_path = os.path.join(remote_dir, current_date)

def create_remote_dir(sftp_client, remote_dir):
    dirs = remote_dir.strip('/').split('/')
    path = ''
    for dir in dirs:
        path = os.path.join(path, dir)
        try:
            sftp_client.stat(path)  # Check if the directory exists
        except FileNotFoundError:
            print(f"try to create Directory {path}.")
            sftp_client.mkdir('/data/20250127')  # Create the directory if it doesn't exist
            print(f"Directory {path} created.")
        except Exception as e:
            print(f"Error checking or creating {path}: {e}")

try:
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(hostname, port=port, username=username, password=password)
    sftp_client = ssh_client.open_sftp()

    current_date = datetime.now().strftime('%Y%m%d')
    upload_path = os.path.join('\\opt', 'sys_bkp', 'data', 'TMS')

    create_remote_dir(sftp_client, remote_dir_path)
    # Ensure the directories exist
    #create_remote_dir(sftp_client, upload_path)

    # Upload the file to the remote server
    print(f"Uploading {local_file} to {remote_file}...")
    sftp_client.put(local_file, remote_file)
    print(f"File uploaded successfully to {remote_file}")

    # Close the SFTP session and SSH client
    sftp_client.close()
    ssh_client.close()

except Exception as e:
    print(f"An error occurred: {e}")
