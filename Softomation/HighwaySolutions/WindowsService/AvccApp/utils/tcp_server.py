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
            #client_handler.start()
            self.clients.append((client_socket, client_handler))

    def handle_client(self, client_socket):
        while self.is_running:
            try:
                self.broadcast("Welcome in Softomation Technologies AVCC 1.0")
            except ConnectionResetError:
                break
        client_socket.close()

    def broadcast(self, data):
        for client_socket, _ in self.clients:
            try:
                client_socket.sendall(data.encode())
            except ConnectionError:
                client_socket.close()

    def remove_clients(self):
        for client_socket, client_handler in self.clients:
            client_socket.close()
            client_handler.join()  # Wait for client handler thread to finish
        self.clients = []

    def stop_server(self):
        self.is_running = False
        if self.accept_thread:
            self.accept_thread.join()  # Wait for accept_thread to finish
        self.remove_clients()
        self.server_socket.close()

# # Example usage:
# if __name__ == "__main__":
#     server = BroadCastTCPServer("localhost", 9999)
#     server.start()
#     # To stop the server, call:
#     # server.stop_server()
