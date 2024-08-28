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
        except Exception as e:
            print(f"Failed to connect: {str(e)}")
            self.is_connected = False

    async def disconnect(self):
        if self.is_connected:
            try:
                await self.websocket.close()
                self.is_connected = False
            except Exception as e:
                print(f"Error while disconnecting: {str(e)}")

    async def send_message(self, message):
        if self.is_connected:
            try:
                await self.websocket.send(message)
            except Exception as e:
                print(f"Error while sending message: {str(e)}")
       

    async def receive_messages(self):
        if self.is_connected:
            try:
                async for message in self.websocket:
                    pass
            except Exception as e:
                print(f"Error while receiving messages: {str(e)}")

    def start(self):
        asyncio.run(self.connect())

    def stop(self):
        asyncio.run(self.disconnect())