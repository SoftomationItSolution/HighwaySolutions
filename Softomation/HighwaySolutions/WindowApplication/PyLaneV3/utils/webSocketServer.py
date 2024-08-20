import asyncio
import threading
import websockets
from utils.LaneWebSocketClient import WebSocketClient
from utils.log_master import CustomLogger

class LaneWebSocketServer:
    def __init__(self, default_directory, host='0.0.0.0', port=6789):
        self.set_logger(default_directory, 'WebSocket')
        self.host = host
        self.port = port
        self.clients = set()
        self.server = None
        self.loop = asyncio.new_event_loop()
        self.server_thread = None
        self.client_thread = None
        self.uri = f"ws://127.0.0.1:{self.port}"
        self.client = None

    def set_logger(self, default_directory, log_file_name):
        try:
            self.classname = "WebSocket"
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception {self.classname} set_logger: {str(e)}")

    async def register(self, websocket):
        self.clients.add(websocket)
        self.logger.logInfo(f"Client connected: {websocket.remote_address}")
        try:
            await websocket.wait_closed()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} register: {str(e)}")
        finally:
            self.clients.remove(websocket)
            self.logger.logInfo(f"Client disconnected: {websocket.remote_address}")

    async def broadcast(self, message):
        if self.clients:
            await asyncio.gather(*[self._safe_send(client, message) for client in self.clients])

    async def _safe_send(self, client, message):
        try:
            await client.send(message)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} _safe_send: {str(e)}")

    async def handle_client(self, websocket, path):
        try:
            await self.register(websocket)
            async for message in websocket:
                self.logger.logInfo(f"Received message: {message}")
                await self.broadcast(message)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} handle_client: {str(e)}")

    async def start_server(self):
        try:
            self.server = await websockets.serve(self.handle_client, self.host, self.port)
            self.logger.logInfo(f"WebSocket server started on ws://{self.host}:{self.port}")
            self.client = WebSocketClient(self.uri)
            await self.client.connect()
            self.client_thread = threading.Thread(target=self.run_client)
            self.client_thread.daemon = True
            self.client_thread.start()
            await self.server.wait_closed()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_server: {str(e)}")

    def start(self):
        try:
            self.server_thread = threading.Thread(target=self.run)
            self.server_thread.daemon = True
            self.server_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start: {str(e)}")

    def run(self):
        asyncio.set_event_loop(self.loop)
        self.loop.run_until_complete(self.start_server())

    def stop(self):
        try:
            if self.server:
                self.server.close()
                self.loop.run_until_complete(self.server.wait_closed())
                self.logger.logInfo("WebSocket server stopped.")

            for client in self.clients:
                self.loop.run_until_complete(client.close())

            if self.client:
                asyncio.run(self.client.disconnect())

            self.loop.stop()
            if self.client_thread:
                self.client_thread.join()
            self.server_thread.join()
            self.logger.logInfo("WebSocket server thread terminated.")
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop: {str(e)}")

    async def client_connect(self):
        # Define client connection logic here
        async with websockets.connect(self.uri) as websocket:
            print(f"Connected to {self.uri}")

            # Send a message to the server
            await websocket.send("Hello from the client!")

            # Receive a response from the server
            async for message in websocket:
                print(f"Received message: {message}")

    def run_client(self):
        asyncio.run(self.client_connect())

