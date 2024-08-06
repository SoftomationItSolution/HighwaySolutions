import serial.tools.list_ports
import serial

# List all available serial ports
ports = list(serial.tools.list_ports.comports())

# Filter ports to check if a device is connected
connected_ports = []

for port in ports:
    try:
        ser = serial.Serial(port.device)
        ser.close()
        connected_ports.append({
            "device": port.device,
            "name": port.name,
            "description": port.description
        })
    except (OSError, serial.SerialException) as e:
        print(f"Error opening port {port.device}: {e}")

# Print the information of connected ports
for info in connected_ports:
    print(f"Device: {info['device']}, Name: {info['name']}, Description: {info['description']}")
