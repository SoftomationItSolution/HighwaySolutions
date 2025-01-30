
import paramiko
import gnupg
def download_file_from_sftp(host, port, username, password, remote_file_path, local_file_path):
    try:
        transport = paramiko.Transport((host, port))
        transport.connect(username=username, password=password)
        sftp = paramiko.SFTPClient.from_transport(transport)
        sftp.get(remote_file_path, local_file_path)
        print(f"File downloaded successfully: {local_file_path}")
        sftp.close()
        transport.close()
    except Exception as e:
        print(f"Error occurred: {e}")

def decrypt_file(encrypted_file, output_file, passphrase=None):
    gpg = gnupg.GPG()
    with open(encrypted_file, 'rb') as f:
        decrypted_data = gpg.decrypt_file(f, passphrase=passphrase, output=output_file)
    if decrypted_data.ok:
        print(f"File decrypted successfully: {output_file}")
    else:
        print(f"Decryption failed: {decrypted_data.status}")


# Example usage
if __name__ == "__main__":
    sftp_host = "etctoll.hitachi-payments.com"  
    sftp_port = 22
    sftp_username = "hatibari"  
    sftp_password = "XnU8mUv46BYbNx"  
    remote_file = "/OUTBOUND/Blacklist/TPCCH_ONAAV_20250108_180244.blt.gpg" 
    local_file = "/mnt/TMS/Apps/ICD2.4App/local_file.gnp"  
    de_file = "/mnt/TMS/Apps/ICD2.4App/local_file.txt"  
    
    #download_file_from_sftp(sftp_host, sftp_port, sftp_username, sftp_password, remote_file, local_file)
    decrypt_file(local_file, de_file, passphrase='Mcube@7890')
