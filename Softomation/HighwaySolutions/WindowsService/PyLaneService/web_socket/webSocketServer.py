import asyncio
import json
import os
import threading
import websockets
import subprocess
import signal
from log.log_master import CustomLogger
from web_socket.webSocketClient import WebSocketClient



class LaneWebSocketServer:
    def __init__(self, default_directory, host='0.0.0.0', port=6789):
        self.default_directory=default_directory
        self.host = host
        self.port = port
        self.clients = set()
        self.server = None
        self.loop = asyncio.new_event_loop()
        self.server_thread = None
        self.client_task = None  # Changed from thread to asyncio task
        self.uri = f"ws://127.0.0.1:{self.port}"
        self.client = None
        self.set_logger(default_directory, 'WebSocket')

    def set_logger(self, default_directory, log_file_name):
        try:
            self.classname = "WebSocket"
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    async def register(self, websocket):
        self.clients.add(websocket)
        self.logger.logInfo(f"Client connected: {websocket.remote_address}")
        try:
            await websocket.wait_closed()
        except Exception as e:
            self.logger.logError(f"Exception register: {str(e)}")
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
            self.logger.logError(f"Exception _safe_send: {str(e)}")

    async def handle_client(self, websocket, path):
        try:
            await self.register(websocket)
            async for message in websocket:
                self.logger.logInfo(f"Received message: {message}")
                await self.broadcast(message)
        except Exception as e:
            self.logger.logError(f"Exception handle_client: {str(e)}")

    def close_port(self, port):
        try:
            result = subprocess.check_output(f"lsof -i :{port}", shell=True).decode()
            for line in result.splitlines():
                if "LISTEN" in line:
                    pid = int(line.split()[1])
                    os.kill(pid, signal.SIGTERM)  # Kill the process using the port
                    self.logger.logInfo(f"Killed process {pid} that was using port {port}")
                    return True
        except subprocess.CalledProcessError:
            self.logger.logInfo(f"Port {port} is not in use.")
            return False
        except Exception as e:
            self.logger.logError(f"Failed to close port {port}: {str(e)}")
            return False

    async def start_server(self):
        try:
            if self.close_port(self.port):
                self.logger.logInfo(f"Closed process using port {self.port}. Retrying to bind...")
                
            self.server = await websockets.serve(self.handle_client, self.host, self.port)
            self.logger.logInfo(f"WebSocket server started on ws://{self.host}:{self.port}")

            self.client = WebSocketClient(self.uri,self.default_directory)
            await self.client.connect()

            self.client_task = asyncio.create_task(self.client_connect())
            
            await self.server.wait_closed()
        except Exception as e:
            self.logger.logError(f"Exception start_server: {str(e)}")

    def start(self):
        try:
            self.server_thread = threading.Thread(target=self.run)
            self.server_thread.daemon = True
            self.server_thread.start()
        except Exception as e:
            self.logger.logError(f"Exception start: {str(e)}")

    def run(self):
        try:
            asyncio.set_event_loop(self.loop)
            self.loop.run_until_complete(self.start_server())
        except Exception as e:
            self.logger.logError(f"Exception run: {str(e)}")

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

            if self.client_task:
                self.client_task.cancel()
            
            self.loop.stop()
            self.server_thread.join()
            self.logger.logInfo("WebSocket server thread terminated.")
        except Exception as e:
            self.logger.logError(f"Exception stop: {str(e)}")

    async def client_connect(self):
        try:
            async with websockets.connect(self.uri) as websocket:
                self.logger.logInfo(f"Client connected to {self.uri}")
                data={"topic": "ws_conncted","data":"Hello from the client!"}
                await websocket.send(json.dumps(data))
                async for message in websocket:
                    print(f"Received message: {message}")
        except asyncio.CancelledError:
            self.logger.logInfo("Client connection task cancelled.")
        except Exception as e:
            self.logger.logError(f"Exception client_connect: {str(e)}")