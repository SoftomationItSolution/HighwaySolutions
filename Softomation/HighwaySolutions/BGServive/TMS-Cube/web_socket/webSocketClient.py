import asyncio
import websockets

from log.log_master import CustomLogger

class WebSocketClient:
    def __init__(self, uri,default_directory):
        self.uri = uri
        self.websocket = None
        self.is_connected = False
        self.set_logger(default_directory, 'WebSocket')

    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

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
                self.logger.logError(f"Error while disconnecting: {str(e)}")

    async def send_message(self, message):
        if self.is_connected:
            try:
                await self.websocket.send(message)
            except Exception as e:
                self.logger.logError(f"Error while sending message: {str(e)}")
       

    async def receive_messages(self):
        if self.is_connected:
            try:
                async for message in self.websocket:
                    pass
            except Exception as e:
                self.logger.logError(f"Error while receiving messages: {str(e)}")

    def start(self):
        asyncio.run(self.connect())

    def stop(self):
        asyncio.run(self.disconnect())