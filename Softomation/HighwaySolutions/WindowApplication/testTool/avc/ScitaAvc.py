import asyncio
import websockets
import threading

class ScitaAvc(threading.Thread):
    def __init__(self, uri, output_file):
        super().__init__()
        self.uri = uri
        self.output_file = output_file
        self.loop = asyncio.new_event_loop()

    async def get_data(self):
        async with websockets.connect(self.uri) as websocket:
            with open(self.output_file, "a") as file:
                while True:
                    try:
                        data = await websocket.recv()
                        print(f"Received data: {data}")
                        file.write(data + "\n")
                    except websockets.ConnectionClosed:
                        print("Connection closed")
                        break

    def run(self):
        asyncio.set_event_loop(self.loop)
        self.loop.run_until_complete(self.get_data())

# Usage example
device_ip = "192.168.1.144"
uri = f"ws://{device_ip}:8080/avccservice"
output_file = "received_data.txt"

websocket_receiver = ScitaAvc(uri, output_file)
websocket_receiver.start()