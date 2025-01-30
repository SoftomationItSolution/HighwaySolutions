import os
import threading
import gnupg


class DirectoryDecryptorThread(threading.Thread):
    def __init__(self, encrypted_dir, output_dir, passphrase=None):
        super().__init__()
        self.encrypted_dir = encrypted_dir
        self.output_dir = output_dir
        self.passphrase = passphrase
        self.gpg = gnupg.GPG()

    def process_decrypted_file(self, csv_file_path):
        try:
            with open(csv_file_path, 'r') as file:
                lines = file.readlines()

            if lines and lines[-1].startswith('#'):
                lines = lines[:-1]

            if lines and lines[0].startswith('#'):
                if 'DIFF' in lines[0].upper():
                    lines = lines[1:]
                    diff_folder = os.path.join(self.output_dir, 'Diff')
                    if not os.path.exists(diff_folder):
                        os.makedirs(diff_folder)
                    diff_file_path = os.path.join(diff_folder, os.path.basename(csv_file_path))
                    with open(diff_file_path, 'w') as csv_file:
                        csv_file.writelines(lines)
                    print(f"Processed file with 'Diff' saved as CSV: {diff_file_path}")
                else:
                    lines = lines[1:]
                    init_folder = os.path.join(self.output_dir, 'INIT')
                    if not os.path.exists(init_folder):
                        os.makedirs(init_folder)
                    init_file_path = os.path.join(init_folder, os.path.basename(csv_file_path))
                    with open(init_file_path, 'w') as csv_file:
                        csv_file.writelines(lines)
                    print(f"Processed file without 'Diff' saved as CSV in INIT folder: {init_file_path}")
            print(f"Processed and saved as CSV: {csv_file_path}")
        except Exception as e:
            print(f"Error processing CSV file {csv_file_path}: {e}")

    def run(self):
        try:
            if not os.path.exists(self.output_dir):
                os.makedirs(self.output_dir)
            files = os.listdir(self.encrypted_dir)
            sorted_files = sorted(files,key=lambda f: os.path.getmtime(os.path.join(self.encrypted_dir, f)),reverse=False)# Set to True for descending order
           
            for file_name in sorted_files:
                encrypted_file_path = os.path.join(self.encrypted_dir, file_name)
                if not os.path.isfile(encrypted_file_path):
                    continue
                if os.path.getsize(encrypted_file_path) == 0:
                    print(f"Skipping empty file: {encrypted_file_path}")
                    continue
                decrypted_file_path = os.path.join(self.output_dir, file_name.replace('.blt.gpg', '.csv'))
                with open(encrypted_file_path, 'rb') as encrypted_file:
                    decrypted_data = self.gpg.decrypt_file(encrypted_file, passphrase=self.passphrase, output=decrypted_file_path)
                if decrypted_data.ok:
                    print(f"File decrypted successfully: {decrypted_file_path}")
                    self.process_decrypted_file(decrypted_file_path)
                    os.remove(encrypted_file_path)
                    os.remove(decrypted_file_path)
                    print(f"Removed encrypted file: {encrypted_file_path}")
                    print(f"Removed encrypted file: {decrypted_file_path}")
                else:
                    print(f"Failed to decrypt {encrypted_file_path}: {decrypted_data.status}")
        except Exception as e:
            print(f"Error occurred during decryption: {e}")


if __name__ == "__main__":
    encrypted_dir = "/home/ProjectConfig/TMSv1/ICDDataFiles/Encrypted"
    output_dir = "/home/ProjectConfig/TMSv1/ICDDataFiles/Decrypted"
    passphrase = "Mcube@7890"

    decryptor_thread = DirectoryDecryptorThread(encrypted_dir, output_dir, passphrase)
    decryptor_thread.start()
    decryptor_thread.join() 
