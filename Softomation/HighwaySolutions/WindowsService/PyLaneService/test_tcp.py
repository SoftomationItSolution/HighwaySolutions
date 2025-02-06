import socket
import struct

def start_server(host='0.0.0.0', port=9091):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind((host, port))
    server_socket.listen(5)
    print(f"Server listening on {host}:{port}")
    
    while True:
        client_socket, client_address = server_socket.accept()
        print(f"Connection from {client_address}")
        data = client_socket.recv(1024)
        if data:
            header, command, length = struct.unpack("!B B H", data[:4])  
            print(f"Header: {hex(header)}, Command: {hex(command)}, Length: {length}")

           
            tag_id = data[4:16].hex().upper()  # Convert to uppercase for readability
            print(f"Tag ID: {tag_id}")

            # Extract next 12 bytes (24 hex digits) for EPC
            epc = data[16:28].hex().upper()
            print(f"EPC: {epc}")

            # Extract checksum (last 2 bytes)
            checksum = struct.unpack("!H", data[-2:])[0]
            print(f"Checksum: {hex(checksum)}")
                
        client_socket.close()

if __name__ == "__main__":
    start_server()