import serial
import threading
import time

class InnovatingDioSerailClient:
    def __init__(self, port, baudrate=9600, timeout=1):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.serial_connection = None
        self.receive_thread = None
        self._running = False
        self.on_data_received = None

    def open(self):
        if self.serial_connection and self.serial_connection.is_open:
            print("Serial port is already open.")
            return

        try:
            self.serial_connection = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            print(f"Serial port {self.port} opened successfully.")
            self._running = True
            self.receive_thread = threading.Thread(target=self._receive_data_loop)
            self.receive_thread.start()
        except serial.SerialException as e:
            print(f"Failed to open serial port {self.port}: {e}")

    def close(self):
        if self.serial_connection and self.serial_connection.is_open:
            self._running = False
            if self.receive_thread:
                self.receive_thread.join()
            self.serial_connection.close()
            print("Serial port closed.")
        else:
            print("Serial port is not open.")

    def send_data(self, data):
        if self.serial_connection and self.serial_connection.is_open:
            data=data+'\r\n'
            bytes_data = data.encode('ascii')
            self.serial_connection.write(bytes_data)
            print(f"Data sent: {data}")
        else:
            print("Serial port is not open. Cannot send data.")

    def _receive_data_loop(self):
        while self._running:
            if self.serial_connection and self.serial_connection.is_open:
                try:
                    data = self.serial_connection.read_until()
                    print(f"Received: {data}")
                    if data and self.on_data_received:
                        self.on_data_received(data)
                except serial.SerialException as e:
                    print(f"Failed to receive data: {e}")
            time.sleep(0.1)  # Prevent tight loop; adjust as needed.

    def traffic_light_on(self):
        self.send_data("R1,N,60")
    
    def traffic_light_off(self):
        self.send_data("R1,F,60")

    
    def ohls_light_on(self):
        self.send_data("R2,N,60")
    
    def ohls_light_off(self):
        self.send_data("R2,F,60")

    def bg_light_on(self):
        self.send_data("R3,N,60")
    
    def bg_light_off(self):
        self.send_data("R3,F,60")


    def vc_light_on(self):
        self.send_data("R5,N,60")
    
    def vc_light_off(self):
        self.send_data("R5,F,60")
    
    def set_on_data_received_callback(self, callback):
        self.on_data_received = callback
        print(callback)

# Example usage:
if __name__ == "__main__":
    sender = InnovatingDioSerailClient(port='/dev/ttyS3', baudrate=9600)
    sender.open()
    #sender.traffic_light_on()
    time.sleep(1)
    #sender.ohls_light_on()
    time.sleep(1)
    sender.bg_light_on()
    time.sleep(1)
    #sender.vc_light_on()
    time.sleep(1)
    #sender.traffic_light_off()
    time.sleep(1)
    #sender.ohls_light_off()
    time.sleep(1)
    sender.bg_light_off()
    time.sleep(1)
    #sender.vc_light_off()
    sender.close()