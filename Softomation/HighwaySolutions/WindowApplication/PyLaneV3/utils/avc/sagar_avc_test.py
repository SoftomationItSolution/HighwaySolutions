import socket

class SagarAVCTestClient:
    def __init__(self, ip, port):
        self.server_ip = ip
        self.server_port = port
        self.client_socket = None
        self.buffer = ""

    def connect(self):
        try:
            self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.client_socket.connect((self.server_ip, self.server_port))
            print(f"Connected to {self.server_ip}:{self.server_port}")
        except socket.error as e:
            print(f"Failed to connect to {self.server_ip}:{self.server_port}. Error: {e}")
            self.client_socket = None

    def receive_data(self):
        if not self.client_socket:
            print("Socket is not connected.")
            return
        
        try:
            while True:
                data = self.client_socket.recv(1024)
                if not data:
                    print("Connection closed by the server.")
                    break
                self.buffer += data.decode('utf-8')
                print(f"buffer: {self.buffer}")
                while "\r\n" in self.buffer:
                    line, self.buffer = self.buffer.split("\r\n", 1)
                    self.process_line(line.strip())
        except UnicodeDecodeError as e:
            print(f"Decoding error: {e}")
        except socket.error as e:
            print(f"Socket error: {e}")
        finally:
            self.close()

    def process_line(self, line):
        if len(line) > 0:
            print(f"Received: {line}")

    def close(self):
        if self.client_socket:
            self.client_socket.close()
            print("Socket closed.")

if __name__ == "__main__":
    client = SagarAVCTestClient("192.168.10.101", 4001)
    try:
        client.connect()
        client.receive_data()
    except KeyboardInterrupt:
        print("\nKeyboard interrupt detected. Closing connection...")
        client.close()
