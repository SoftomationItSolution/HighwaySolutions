import time
import serial

class InnovatingUfdSerailClient:
    def __init__(self, port, baudrate=9600, timeout=1):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.ser = None

    def open(self):
        try:
            self.ser = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            print(f"Serial port {self.port} opened with baudrate {self.baudrate}.")
        except serial.SerialException as e:
            print(f"Error opening serial port: {e}")

    def close(self):
        if self.ser and self.ser.is_open:
            self.ser.close()
            print(f"Serial port {self.port} closed.")
        else:
            print("Serial port is not open or already closed.")

    def send_data(self, data):
        if self.ser and self.ser.is_open:
            data=data+'\r'
            bytes_data = data.encode('ascii')
            self.ser.write(bytes_data)
            print(f"Data sent: {data}")
        else:
            print("Serial port is not open. Cannot send data.")
    
    def welcomeMessage(self):
        self.send_data("MSSL|SCREEN|CLR|00-00|")
        self.send_data("MSSL|ROUND0|RED|00-00|")
        self.send_data("MSSL|STATIC|F07|00-42|TOLL")
        self.send_data("MSSL|STATIC|F07|00-50|Plaza")
        self.send_data("MSSL|SCROLL|F07|00-32|Welcome TO")

    def thanksMessage(self):
        self.send_data("MSSL|SCREEN|CLR|00-00|")
        self.send_data("MSSL|ARROW0|GRN|00-00|")
        self.send_data("MSSL|STATIC|F07|00-32|VISIT")
        self.send_data("MSSL|STATIC|F07|00-40|AGAIN")
        self.send_data("MSSL|STATIC|F07|00-48|THNAK")
        self.send_data("MSSL|STATIC|F07|00-56|YOU")

    def other_trans(self,className,type,fare):
        self.send_data("MSSL|SCREEN|CLR|00-00|")
        self.send_data("MSSL|ROUND0|RED|00-00|")
        self.send_data(f"MSSL|STATIC|F07|00-32|{className}")
        self.send_data(f"MSSL|STATIC|F07|00-40|{type}")
        self.send_data(f"MSSL|STATIC|F07|00-48|{fare}")
         

    def fast_trans(self,className,status):
        self.send_data("MSSL|SCREEN|CLR|00-00|")
        self.send_data("MSSL|ROUND0|RED|00-00|")
        self.send_data(f"MSSL|STATIC|F07|00-32|{className}")
        self.send_data(f"MSSL|SCROLL|F07|00-40|{status}")
# Example usage:
if __name__ == "__main__":
    sender = InnovatingUfdSerailClient(port='/dev/ttyS2', baudrate=4800)
    sender.open()
    sender.welcomeMessage()
    time.sleep(1)
    sender.thanksMessage()
    time.sleep(1)
    sender.fast_trans('CAR','Active')
    time.sleep(1)
    sender.other_trans('CAR','CASH',860)
    time.sleep(1)
    sender.other_trans('CAR','Excempt','Ambulance')
    time.sleep(1)
    sender.close()
