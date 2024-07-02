import serial
import time

# Define the serial port and baud rate
serial_port = '/dev/ttyS5'  # Use /dev/ttyS0 for your device
baud_rate = 9600            # Set the baud rate; adjust as needed

def send_data(ser,data_to_send):
    
    input=data_to_send+'\r\n'
    bytes_data = input.encode('ascii')
    ser.write(bytes_data)  # Send data
    print(f"Sent: {data_to_send}")


try:
    # Open serial port
    ser = serial.Serial(serial_port, baud_rate, timeout=1)
    print(f"Connected to {serial_port}")
    data_to_send = "CT"
    send_data(ser,"CT")
    send_data(ser,"CB")
    # Example: Sending data
    

    # Example: Reading data (if the device sends something back)
    while True:
        line = ser.readline().decode('utf-8').rstrip()
        if line:
            print(f"Received: {line}")
        time.sleep(0.1)  # Small delay to avoid busy-waiting

except serial.SerialException as e:
    print(f"Error: {e}")
except KeyboardInterrupt:
    print("\nProgram interrupted by user")
finally:
    if ser.is_open:
        ser.close()  # Close serial port
        print(f"Disconnected from {serial_port}")
