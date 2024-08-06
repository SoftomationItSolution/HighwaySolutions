from datetime import datetime
import socket
import threading

class IdTechRfidTcpClient(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.host = host
        self.port = port
        self.tag_details = {
            "SystemDateTime": datetime.now(),
            "TransactionDateTime": "",
            "ReaderName": "",
            "EPC": "",
            "TID": "",
            "UserData": "",
            "Class": 0,
            "Plate": "XXXXXXXXXX",
            "Processed": False
        }
    
    def convert_hex_to_int(self, hex_string):
        result = '00'
        try:
            result = str(int(hex_string, 16))
        except Exception as e:
            print(f"Exception convert_hex_to_int: {str(e)}")
            result = '00'
        finally:
            return result
    
    def hex_to_string_vehicle_number(self, hex_string):
        result = ""
        try:
            for i in range(0, len(hex_string), 2):
                hex_pair = hex_string[i:i+2]
                decimal = int(hex_pair, 16)
                result += chr(decimal)
        except Exception as e:
            print(f"Exception hex_to_string_vehicle_number: {str(e)}")
            result = 'XXXXXXXXXX'
        finally:
            return result

    def decrypt_user_data(self, user_data):
        try:
            self.tag_details["UserData"] = user_data
            self.tag_details["Class"] = self.convert_hex_to_int(user_data[24:26])
            self.tag_details["Plate"] = self.hex_to_string_vehicle_number(user_data[4:24])
        except Exception as e:
            print(f"Exception decrypt_user_data: {str(e)}")

    def run(self):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
            sock.connect((self.host, self.port))
            print(f'Connected to {self.host}:{self.port}')
            while True:
                data = sock.recv(1024)
                if data:
                    hex_string = data.decode()
                    final_data_list = hex_string.splitlines()
                    for n in final_data_list:
                        if len(n) > 0:
                            final_data = n.split(',')
                            if len(final_data) == 4:
                                self.tag_details["EPC"] = final_data[0]
                                self.tag_details["TID"] = final_data[1]
                                self.tag_details["UserData"] = final_data[2]
                                self.decrypt_user_data(self.tag_details["UserData"])
                                print(self.tag_details)

if __name__ == "__main__":
    HOST = '192.168.1.134'  # The server's hostname or IP address
    PORT = 6000             # The port used by the server
    tcp_client_thread = IdTechRfidTcpClient(HOST, PORT)
    tcp_client_thread.start()
