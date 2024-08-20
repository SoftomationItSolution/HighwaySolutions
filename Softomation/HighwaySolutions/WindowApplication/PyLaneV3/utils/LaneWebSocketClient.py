import asyncio
import websockets

class WebSocketClient:
    def __init__(self, uri):
        self.uri = uri
        self.websocket = None
        self.is_connected = False

    async def connect(self):
        try:
            self.websocket = await websockets.connect(self.uri)
            self.is_connected = True
            print(f"Connected to {self.uri}")
        except Exception as e:
            print(f"Failed to connect: {str(e)}")
            self.is_connected = False

    async def disconnect(self):
        if self.is_connected:
            try:
                await self.websocket.close()
                self.is_connected = False
                print("Disconnected from the server")
            except Exception as e:
                print(f"Error while disconnecting: {str(e)}")
        else:
            print("Not connected to any server")

    async def send_message(self, message):
        if self.is_connected:
            try:
                await self.websocket.send(message)
                print(f"Message sent: {message}")
            except Exception as e:
                print(f"Error while sending message: {str(e)}")
        else:
            print("Not connected to any server")

    async def receive_messages(self):
        if self.is_connected:
            try:
                async for message in self.websocket:
                    print(f"Received message: {message}")
            except Exception as e:
                print(f"Error while receiving messages: {str(e)}")
        else:
            print("Not connected to any server")

    def start(self):
        asyncio.run(self.connect())

    def stop(self):
        asyncio.run(self.disconnect())

