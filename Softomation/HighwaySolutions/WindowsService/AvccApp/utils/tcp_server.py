import json
import socket
import threading

class BroadCastTCPServer(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.host = host
        self.port = int(port)
        self.is_running = False
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.clients = []
        self.accept_thread = None

    def run(self):
        self.start_server()

    def start_server(self):
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen(5)
        print(f"Server is listening on {self.host}:{self.port}")
        self.is_running = True
        self.accept_thread = threading.Thread(target=self.accept_clients)
        self.accept_thread.start()

    def accept_clients(self):
        while self.is_running:
            client_socket, client_address = self.server_socket.accept()
            print(f"Accepted connection from {client_address}")
            self.broadcast("Welcome in Softomation Technologies AVCC 1.0")
            client_handler = threading.Thread(target=self.handle_client, args=(client_socket,))
            client_handler.start()
            self.clients.append((client_socket,client_handler))

    def handle_client(self,client_socket):
        while self.is_running:
            try:
                data = client_socket.recv(1024).decode()
                if not data:
                    break
            except ConnectionResetError:
                break
            client_socket.close()

    
    # def handle_client(self, client_socket):
    #     while self.is_running:
    #         try:
    #             client_socket.
    #         except ConnectionResetError:
    #             break
    #     client_socket.close()

    def broadcast(self, data):
        for client_socket, _ in self.clients:
            try:
                if client_socket.fileno() != -1:  # Check if the socket is still valid
                    json_data = json.dumps(data)
                    client_socket.sendall(json_data.encode())
            except OSError as e:
                # Handle specific OSError
                if e.errno == 9:
                    # Bad file descriptor error
                    print("Bad file descriptor error: Socket closed unexpectedly")
                    client_socket.close()
            except Exception as e:
                # Handle other exceptions
                print("An error occurred:", str(e))
                client_socket.close()

    def remove_clients(self):
        for client_socket, client_handler in self.clients:
            client_socket.close()
            client_handler.join() 
        self.clients = []

    def stop_server(self):
        self.is_running = False
        if self.accept_thread:
            self.accept_thread.join()  # Wait for accept_thread to finish
        #self.remove_clients()
        self.server_socket.close()

# # Example usage:
# if __name__ == "__main__":
#     server = BroadCastTCPServer("localhost", 9999)
#     server.start()
#     # To stop the server, call:
#     # server.stop_server()
