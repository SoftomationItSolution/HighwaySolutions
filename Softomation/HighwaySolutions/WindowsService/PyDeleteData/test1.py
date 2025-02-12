import paramiko
import os

# SSH Credentials
SERVER_HOST = "your_server_ip"
CLIENTS = [
    {"host": "192.168.10.12", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.22", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.32", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.42", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.52", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.62", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.72", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.82", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.92", "user": "mcube", "password": "admin@123"},
    {"host": "192.168.10.102", "user": "mcube", "password": "admin@123"}
]

pathlist=[
    {"path":"/home/ProjectConfig/TMSLaneV2/logs/","days":7,"type":"dir"},
    {"path":"/home/ProjectConfig/TMSLaneV2/Events/","days":2,"type":"file"}
]

def run_ssh_command(client, command):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(client["host"], username=client["user"], password=client["password"])

        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode()
        error = stderr.read().decode()
        ssh.close()
        if error:
            print(f"Error on {client['host']}: {error}")
        else:
            print(f"Deleted old files on {client['host']}")
        return output.strip()
    except Exception as e:
        print(f"Failed to connect to {client['host']}: {e}")
        return None
    
def parse_df_output(df_output):
    lines = df_output.strip().split("\n")
    headers = lines[0].split()
    formatted_data = []

    for line in lines[1:]:
        cols = line.split()
        if len(cols) >= 6:  # Ensure it's a valid entry
            filesystem, size, used, avail, use_percent, mount = cols[0], cols[1], cols[2], cols[3], cols[4], cols[5]
            formatted_data.append(f"{filesystem: <20} | {size: <6} | {used: <6} | {avail: <8} | {use_percent: <5} | {mount}")
    print("\n".join(formatted_data))


def delete_old_files_via_ssh(client):
    print(f"\nChecking space before deletion on {client['host']}...")
    before_delete = run_ssh_command(client, "df -h")
    if before_delete:
        parse_df_output(before_delete)
    print(f"\nDeleting old files on {client['host']}...")
    for path in pathlist:
        delete_command=''
        if path['type']=='dir':
            delete_command = f"find {path['path']} -mindepth 1 -mtime +{path['days']} -exec rm -rf {{}} \\; 2>/dev/null"
        if path['type']=='file':
            delete_command = f"find {path['path']} -type f -mtime +{path['days']} -exec rm -f {{}} \\;"
        run_ssh_command(client, delete_command)

    print(f"\nChecking space after deletion on {client['host']}...")
    after_delete = run_ssh_command(client, "df -h")
    if after_delete:
        parse_df_output(after_delete)

if __name__ == "__main__":
    for client in CLIENTS:
        delete_old_files_via_ssh(client)
