from fabric import Connection
from paramiko import AuthenticationException, SSHException
import os


class sFTP:
    def __init__(self, hostname, port, username, password):
        self.connection = None
        self.hostname = hostname
        self.port = port
        self.username = username
        self.password = password
        self.connect()

    def connect(self):
        try:
            self.connection = Connection(host=self.hostname, user=self.username, port=self.port, connect_kwargs={"password": self.password})
            print("SSH connection established successfully!")
        except AuthenticationException as e:
            print(f"Authentication failed: {e}")
        except SSHException as e:
            print(f"SSH connection failed: {e}")
        except Exception as e:
            print(f"Error: {e}")

    def is_connected(self):
        if self.connection:
            try:
                self.connection.run('echo "Connection is alive"', hide=True)
                return True
            except Exception:
                return False
        return False

    def upload_file(self, local_file_path, remote_file_path):
        if not self.is_connected():
            print("Reconnecting...")
            self.connect()

        try:
            if os.path.isdir(local_file_path):
                for dirpath, dirnames, filenames in os.walk(local_file_path):
                    for file in filenames:
                        local_file = os.path.join(dirpath, file)
                        relative_path = os.path.relpath(local_file, local_file_path)
                        remote_file = os.path.join(remote_file_path, relative_path)
                        remote_dir = os.path.dirname(remote_file)
                        result = self.connection.run(f'test -d {remote_dir}', warn=True)
                        if result.failed:
                            self.connection.run(f'echo {password} | sudo -S mkdir -m 777 -p {remote_dir}', pty=True)
                        print(f"Uploading {local_file} to {remote_file}")
                        self.connection.put(local_file, remote_file)
            else:
                remote_dir = os.path.dirname(remote_file_path)
                result = self.connection.run(f'test -d {remote_dir}', warn=True)
                if result.failed:
                    self.connection.run(f'echo {password} | sudo -S mkdir -m 777 -p {remote_dir}', pty=True)
                self.connection.put(local_file_path, remote_file_path)
            
            print("File(s) uploaded successfully!")
        except Exception as e:
            print(f"Error: {e}")

# Example usage
hostname = '192.168.1.111'
port = 22
username = 'softomation'
password = 'Soft#Mation@1'
local_file_path = r'D:\\setup.txt'
remote_file_path = '/opt/ftp/soft/'

sftp = sFTP(hostname, port, username, password)
sftp.upload_file(local_file_path, remote_file_path)