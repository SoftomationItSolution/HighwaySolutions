import json
import threading
import time
import websocket
from log.log_master import CustomLogger

class wsSocketClient(threading.Thread):
    def __init__(self, default_directory,url="ws://localhost:5001/ws"):
        super().__init__(daemon=True)   
        self.url = url
        self.ws = None
        self.connected = False
        self.stop_flag = False
        self.set_logger(default_directory, 'WebSocket')

    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Exception set_logger: {str(e)}")

    def run(self):
        while not self.stop_flag:
            try:
                self.ws = websocket.WebSocketApp(self.url,on_open=self.on_open,on_message=self.on_message,on_error=self.on_error,on_close=self.on_close)
                self.ws.run_forever()
            except Exception as e:
                self.logger.logError(f"[ERROR] WebSocket connection failed: {e}")

            if not self.stop_flag:
                self.logger.logInfo("[INFO] Reconnecting in 5 seconds...")
                time.sleep(5)

    
    def on_open(self, ws):
        self.connected = True
        self.logger.logError("[INFO] Connected to server")
        self.send({"topic": "testing","data":None})

    def on_message(self, ws, message):
        self.logger.logInfo(f"[RECEIVED] {message}")

    def on_error(self, ws, error):
        self.logger.logError(f"[ERROR] {error}")

    def on_close(self, ws, close_status_code, close_msg):
        self.connected = False
        self.logger.logInfo(f"[INFO] Disconnected from server: {close_msg}")
        if self.stop_flag:
            self.logger.logInfo("[INFO] Stop flag set, not reconnecting")

    # ---- Public API ----
    def send(self, data):
        try:
            if isinstance(data, dict):
                data = json.dumps(data)
            if self.connected:
                self.ws.send(data)
            else:
                self.logger.logInfo("[WARN] Cannot send, not connected")
        except Exception as e:
            self.logger.logError(f"[ERROR] Failed to send message: {e}")

    def stop(self):
        self.stop_flag = True
        if self.ws:
            try:
                self.ws.close()
            except Exception as e:
                self.logger.logError(f"[ERROR] Failed to close WS: {e}")