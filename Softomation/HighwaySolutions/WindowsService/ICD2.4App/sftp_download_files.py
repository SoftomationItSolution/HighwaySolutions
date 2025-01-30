from datetime import datetime
import paramiko
import os
import json
import threading

class DownloadFilesThread(threading.Thread):
    def __init__(self, host, port, username, password, remote_dir, local_dir):
        super().__init__()  
        self.host = host
        self.port = port
        self.username = username
        self.password = password
        self.remote_dir = remote_dir
        self.local_dir = local_dir
        self.file_name='file_status.json'
        self.date_format='%d-%b-%Y %H:%M:%S'
    
    def get_last_downloaded_details(self):
        if os.path.exists(self.file_name):
            with open(self.file_name, 'r') as f:
                return json.load(f)
        return None

    def update_downloaded_details(self, filename, timestamp):
        formatted_timestamp = datetime.fromtimestamp(timestamp).strftime(self.date_format)
        with open(self.file_name, 'w') as f:
            json.dump({'last_downloaded_file': filename, 'last_downloaded_timestamp': formatted_timestamp}, f)

    def run(self):
        try:
            if not os.path.exists(self.local_dir):
                os.makedirs(self.local_dir)
                print(f"Created local directory: {self.local_dir}")

            transport = paramiko.Transport((self.host, self.port))
            transport.connect(username=self.username, password=self.password)
            sftp = paramiko.SFTPClient.from_transport(transport)

            last_downloaded_details = self.get_last_downloaded_details()
            last_downloaded_timestamp = None
            if last_downloaded_details:
                last_downloaded_timestamp = datetime.strptime(last_downloaded_details.get('last_downloaded_timestamp'), self.date_format).timestamp()

            remote_files = sftp.listdir_attr(self.remote_dir,reverse=False) #asc true for desc
            remote_files.sort(key=lambda x: x.st_mtime)

            for file in remote_files:
                if last_downloaded_timestamp is None or file.st_mtime > last_downloaded_timestamp:
                    remote_file_path = os.path.join(self.remote_dir, file.filename)
                    local_file_path = os.path.join(self.local_dir, file.filename)

                    sftp.get(remote_file_path, local_file_path)
                    print(f"Downloaded {file.filename} to {local_file_path}")

                    last_downloaded_timestamp = file.st_mtime
                    self.update_downloaded_details(file.filename, last_downloaded_timestamp)

            sftp.close()
            transport.close()

        except Exception as e:
            print(f"Error occurred: {e}")

# Example usage:
host = 'etctoll.hitachi-payments.com'
port = 22
username = 'hatibari'
password = 'XnU8mUv46BYbNx'
remote_dir = '/OUTBOUND/Blacklist'
local_dir = '/home/ProjectConfig/TMSv1/ICDDataFiles/Encrypted'

# Create and start the download thread
download_thread = DownloadFilesThread(host, port, username, password, remote_dir, local_dir)
download_thread.start()

# Optionally, you can join the thread to wait for it to finish
download_thread.join()
