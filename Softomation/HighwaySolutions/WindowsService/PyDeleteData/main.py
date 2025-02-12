import paramiko
import os

# SSH Credentials
SERVER_HOST = "your_server_ip"
CLIENTS = [
    {"host": "192.168.10.32", "user": "mcube", "password": "admin@123"}
   
]
DELETE_PATH = "/home/ProjectConfig/TMSLaneV2/logs"  # Change to the actual path
DAYS_OLD = 7  # Change the number of days

def delete_old_files_via_ssh(client):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(client["host"], username=client["user"], password=client["password"])

        # Use sudo with NOPASSWD to avoid permission issues
        #command = f"find {DELETE_PATH} -mindepth 1 -mtime +{DAYS_OLD} -exec rm -rf {{}} \\;"
        command = f"find {DELETE_PATH} -mindepth 1 -mtime +{DAYS_OLD} -exec rm -rf {{}} \\; 2>/dev/null"

        #command = f"find {DELETE_PATH} -type f -mtime +{DAYS_OLD} -exec rm -f {{}} \\;"
        stdin, stdout, stderr = ssh.exec_command(command)

        output = stdout.read().decode()
        error = stderr.read().decode()

        ssh.close()

        if error:
            print(f"Error on {client['host']}: {error}")
        else:
            print(f"Deleted old files on {client['host']}")
    except Exception as e:
        print(f"Failed to connect to {client['host']}: {e}")

if __name__ == "__main__":
    os.system(f"find {DELETE_PATH} -type f -mtime +{DAYS_OLD} -exec rm -f {{}} \\;")
    print("Deleted old files on server")

    for client in CLIENTS:
        delete_old_files_via_ssh(client)
