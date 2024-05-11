from PySide6.QtCore import QThread, Signal
from PySide6.QtGui import QImage
import cv2
import imutils

class CameraThread(QThread):
    image_data = Signal(QImage)
    def __init__(self, camera_url, width, height,logger):
        super().__init__()
        try:
            self.camera_url = camera_url
            self.width = width
            self.height = height
            self.logger=logger
        except Exception as e:
            self.logger.logError(f"Error in CameraThread __init__: {e}")
    
    def run(self):
        try:
            self._running = True
            cap = cv2.VideoCapture(self.camera_url)
            while self._running:
                try:
                    ret, frame = cap.read()
                    if ret:
                        #frame = imutils.resize(frame, width=self.width, height=self.height)
                        frame = cv2.resize(frame, (self.width, self.height))
                        rgb_image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                        h, w, ch = rgb_image.shape
                        bytes_per_line = ch * w
                        qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
                        self.image_data.emit(qt_image)
                except Exception as e:
                    self.logger.logError(f"Error in CameraThread run: {e}")
            cap.release()
        except Exception as e:
                    self.logger.logError(f"Error in CameraThread run_main: {e}")

    def stop(self):
        self._running = False