#from PIL import Image
import socket
import matplotlib.pyplot as plt
import numpy as np

def cal_check_sum_xor(packet_data, packet_length):
    check_sum_byte = 0x00

    for i in range(packet_length):
        check_sum_byte ^= packet_data[i]

    return check_sum_byte



def calculate_xor_checksum(data):
    hex_values = data.split()
    int_values = [int(value, 16) for value in hex_values]
    xor_checksum = 0
    for value in int_values:
        xor_checksum ^= value
    return hex(xor_checksum)[2:].upper()


class sock_connect:
    _instance = None

    def __new__(cls, server_ip, server_port):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connect(server_ip, server_port)
        return cls._instance

    def connect(self, server_ip, server_port):
        self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.connection.connect((server_ip, server_port))

    def binary_to_hex(self,binary_str):
        decimal_value = int(binary_str, 2)
        hex_value = hex(decimal_value)[2:].upper()  # [2:] is used to remove the '0x' prefix

        # Ensure the hex value is two characters long (padded with zero if needed)
        hex_value = hex_value.zfill(2)

        return hex_value 

    def send_image_data(self, image_path):
        hex_data, hex_value = self.image_to_mono_hex_m()
        val1 = '3A 51 48 57 52 47 00 00 A1 03 A0 00 02 10 00 00 00 00 00 03 D0'
        val2 = 'A3 C4'
        hex_str=' '.join(hex_data)
        fval = f'{val1} {hex_str} {hex_value} {val2}'
        che=calculate_xor_checksum(fval)
        # #print(hex_data)
        # #print(che)
        fval1 = f'02 {fval} 03 {che}'
        # #print(fval1.encode('utf-8'))

        # fval1='02 3A 51 48 57 52 47 00 00 A1 03 A0 00 02 00 00 00 00 00 00 03 D0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A3 C4 03 D4'

        self.send_data(fval1)
        print(fval1)

    def send_data(self, data):
        byte_data = bytes.fromhex(data)
        self.connection.sendall(byte_data)
        # self.connection.send(data)

    def decimal_to_hex(self, decimal_value):
        hex_value = hex(decimal_value)[2:].zfill(2).upper()
        print(decimal_value,hex_value)
        return hex_value
    def plot_matrix(self,matrix):
        # Create a sample matrix
        #matrix = np.random.rand(5, 5)

        # Plot the matrix using imshow
        plt.imshow(matrix, cmap='viridis', interpolation='nearest')

        # Add a colorbar for reference
        plt.colorbar()

        # Show the plot
        plt.show()


    def matrix_to_list(self,matrix):
        result_list = []
        hex_list = []
        rows = len(matrix)
        cols = len(matrix[0])

        for col in range(cols):
            col_values = [matrix[row][col] for row in range(rows)]
            
            result_list.extend(col_values)
            if len(result_list) % 8 == 0:
                print(f"Chunk: {result_list[-8:]}")
                bin_str = ''.join(map(str, result_list[-8:]))
                hex_val=self.binary_to_hex(bin_str)
                hex_list.append(hex_val)

        return hex_list


    def image_to_mono_hex_m(self):
            binary_matrix_16x2 = [
    [0, 1],
    [1, 0],
    [1, 1],
    [0, 0],
    [1, 0],
    [0, 1],
    [1, 1],
    [0, 0],
    [1, 1],
    [0, 1],
    [1, 0],
    [1, 1],
    [0, 1],
    [1, 0],
    [0, 0],
    [1, 1]
]
            
            pixel_data = [[element] * 24 for row in binary_matrix_16x2 for element in row]
            print(pixel_data)
            self.plot_matrix(pixel_data)
            hex_list = self.matrix_to_list(pixel_data)
            hex_value = self.decimal_to_hex(len(hex_list))
           
            return hex_list, hex_value


    




    



def main():
    server_ip = '192.168.1.224'
    server_port = 9999

    sock = sock_connect(server_ip, server_port)
    image_path = '/home/softomation/Desktop/output.bmp'
    sock.send_image_data(image_path)


if __name__ == "__main__":
    main()
