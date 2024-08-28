import socket
import select
from utils.log_master import CustomLogger

class MultiTCPServer:
    def __init__(self,default_directory, host, port,log_file_name):
        self.host = host
        self.port = port
        self.logger = CustomLogger(default_directory,log_file_name)
        self.socket_list = []
        self.clients = {}

    def start(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server_socket.bind((self.host, self.port))
        server_socket.listen(10)

        self.logger.log(f"Server started on {self.host}:{self.port}")

        self.socket_list.append(server_socket)

        while True:
            ready_to_read, _, _ = select.select(self.socket_list, [], [])

            for sock in ready_to_read:
                if sock == server_socket:  # New connection
                    sockfd, addr = server_socket.accept()
                    self.socket_list.append(sockfd)
                    self.logger.log(f"Client connected: {addr}")
                    self.clients[sockfd] = addr
                else: 
                    try:
                        data = sock.recv(4096)
                        if data:
                            self.logger.log(f"Received data from {self.clients[sock]}: {data.decode().strip()}")
                        else:  
                            self.logger.log(f"Client {self.clients[sock]} disconnected")
                            sock.close()
                            self.socket_list.remove(sock)
                            del self.clients[sock]
                    except:
                        self.logger.log(f"Client {self.clients[sock]} disconnected unexpectedly")
                        sock.close()
                        self.socket_list.remove(sock)
                        del self.clients[sock]