import serial
import time

class KistUfdSerailClient():
    def __init__(self, port, baudrate=115200, timeout=1):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.client_socket=None
    
    def open(self):
        try:
            self.client_socket = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            print(f"Serial port {self.port} opened with baudrate {self.baudrate}.")
        except serial.SerialException as e:
            print(f"Error opening serial port: {e}")
    
    def send_data(self,input):
        try:
            input=input+'\r\n'
            bytes_data = input.encode('ascii')
            self.on_serial(bytes_data)
            return True
        except Exception as e:
            print(f"Exception  send_data: {str(e)}")
            return False
    
    def serial_close(self):
        try:
            if self.client_socket:
                if self.client_socket.is_open:
                    self.client_socket.close()
        except Exception as e:
            print(f"Exception  on_serial (closing): {str(e)}")


    def on_serial(self,bytes_data):
        try:
            self.client_socket = serial.Serial(timeout=0.200)
            self.client_socket.baudrate = self.baudrate
            self.client_socket.port = self.port
            self.client_socket.open()
            self.is_running = True
            self.client_socket.write(bytes_data)
            time.sleep(0.300)
            self.serial_close()
        except Exception as e:
            print(f"Exception  on_serial: {str(e)}")
            
    def stop_cmd(self):
        self.send_data("NO")

    def go_cmd(self):
        self.send_data("GO")


    def clear_cmd(self):
        self.send_data("CT")
        time.sleep(0.1)
        self.send_data("CB")

    def welcomeMessage(self,message):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"S1{message}")

    def thanksMessage(self):
        self.clear_cmd()
        time.sleep(0.1)
        self.go_cmd()
        time.sleep(0.1)
        self.send_data(f"S1VISIT AGAIN THANK YOU")
        time.sleep(0.1)

    def other_trans(self,className,type,fare):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"L1{className} {fare}")
        time.sleep(0.1)
        self.send_data(f"L2{type}")
        time.sleep(0.1)

    def fast_trans(self,className,status):
        self.clear_cmd()
        time.sleep(0.1)
        self.stop_cmd()
        time.sleep(0.1)
        self.send_data(f"L1{className}")
        time.sleep(0.1)
        self.send_data(f"L2{status}")
        time.sleep(0.1)


if __name__ == "__main__":
    sender = KistUfdSerailClient(port='/dev/ttyS4', baudrate=9600)
    sender.welcomeMessage("Welcome to plaza")
    time.sleep(1)
    sender.thanksMessage()
    time.sleep(1)
    sender.fast_trans('CAR','Active')
    time.sleep(1)
    sender.other_trans('CAR','CASH',860)
    time.sleep(1)
    sender.other_trans('CAR','Excempt','Ambulance')
    time.sleep(1)