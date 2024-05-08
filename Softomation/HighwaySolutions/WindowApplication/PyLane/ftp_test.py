import paramiko

def upload_file(hostname, port, username, password, local_file_path, remote_file_path):
    sftp=None
    try:
        # Create SSH client
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        
        # Connect to the server
        ssh.connect(hostname, port, username, password)
        
        print("SSH connection established successfully!")
        
        # Create SFTP client
        sftp = ssh.open_sftp()
        
        print("SFTP session opened successfully!")
        
        # Upload file
        sftp.put(local_file_path, remote_file_path)
        
        print("File uploaded successfully!")
        
    except paramiko.AuthenticationException as e:
        print(f"Authentication failed: {e}")
    except paramiko.SSHException as e:
        print(f"SSH connection failed: {e}")
    except paramiko.SFTPError as e:
        print(f"SFTP operation failed: {e}")
    except Exception as e:
        print(f"Error: {e}")
        
    finally:
        # Close SFTP and SSH connection
        if sftp:
            sftp.close()
        if ssh:
            ssh.close()

# Example usage
hostname = '152.52.51.146'
port = 22 
username = 'lane'
password = 'Softo@7890'
local_file_path = r'C:\Users\hemant\Documents\Lightshot\Screenshot_1.png'
remote_file_path = 'test/Screenshot_1.png'

upload_file(hostname, port, username, password, local_file_path, remote_file_path)