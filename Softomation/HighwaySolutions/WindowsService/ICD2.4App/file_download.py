import paramiko
import os
import json

# Function to load last downloaded file details from JSON
def get_last_downloaded_details():
    if os.path.exists('download_details.json'):
        with open('download_details.json', 'r') as f:
            return json.load(f)
    return None  # No previous details, first run

# Function to save the latest downloaded file details to JSON
def update_downloaded_details(filename, timestamp):
    with open('download_details.json', 'w') as f:
        json.dump({'last_downloaded_file': filename, 'last_downloaded_timestamp': timestamp}, f)

# Function to download files from SFTP and handle the latest file download
def download_file_from_sftp(host, port, username, password, remote_dir, local_dir):
    try:
        # Connect to the SFTP server
        transport = paramiko.Transport((host, port))
        transport.connect(username=username, password=password)
        sftp = paramiko.SFTPClient.from_transport(transport)
        
        # Get the last downloaded file details (if any)
        last_downloaded_details = get_last_downloaded_details()
        last_downloaded_timestamp = None
        if last_downloaded_details:
            last_downloaded_timestamp = last_downloaded_details.get('last_downloaded_timestamp')

        
        remote_files = sftp.listdir_attr(remote_dir)
        
        # Sort files by modification time (newest first)
        remote_files.sort(key=lambda x: x.st_mtime, reverse=True)
        
        # Download files that were modified after the last downloaded timestamp
        for file in remote_files:
            if last_downloaded_timestamp is None or file.st_mtime > last_downloaded_timestamp:
                remote_file_path = os.path.join(remote_dir, file.filename)
                local_file_path = os.path.join(local_dir, file.filename)
                
                # Download the file
                sftp.get(remote_file_path, local_file_path)
                print(f"Downloaded {file.filename} to {local_file_path}")
                
                # Update the last downloaded timestamp and file name
                last_downloaded_timestamp = file.st_mtime
                update_downloaded_details(file.filename, last_downloaded_timestamp)
        
        # Close the SFTP and transport connections
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
local_dir = '/home/ProjectConfig/TMSv1/ICDDataFiles'
download_file_from_sftp(host, port, username, password, remote_dir, local_dir)