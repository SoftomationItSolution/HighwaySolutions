from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel
from PySide6.QtCore import Qt
from PySide6.QtCore import QTimer
import cv2
from PySide6.QtGui import QImage, QPixmap

class CameraLiveView(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        self.setStyleSheet("border: none;border-bottom: 1px solid white;border-right: none;")
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.logger = logger
        self.capture = None
        btn_height=0
        lbl_height=30
        list_height=height-(btn_height+lbl_height)
        
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Live View</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height-1)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)
        self.live_view = QLabel()
        self.live_view.setFixedHeight(list_height)
        self.live_view.setStyleSheet("border: none;border-top: 1px solid white;")
        self.live_view.show()
        box_layout.addWidget(self.live_view)
        self.timer = QTimer()
        self.timer.timeout.connect(self.update_frame)
        self.timer.start(1000 // 30)  # Update frame every 30 milliseconds

    def set_cam_details(self, json_data):
        if json_data is not None:
            self.camDetails = json_data
            rtsp_url = "rtsp://admin:admin@192.168.1.5:554/h264/ch1/main/av_stream"
            self.capture = cv2.VideoCapture(rtsp_url)
        else:
            self.capture = cv2.VideoCapture(0)

    def take_screenshot(self):
        if self.capture is not None and self.capture.isOpened():
            ret, frame = self.capture.read()
            if ret:
                cv2.imwrite("screenshot.png", frame)

    def start_recording(self):
        # Add code to start recording
        pass

    def stop_recording(self):
        # Add code to stop recording
        pass

    def update_frame(self):
        if self.capture is not None and self.capture.isOpened():
            ret, frame = self.capture.read()
            if ret:
                frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, ch = frame.shape
                bytes_per_line = ch * w
                image = QImage(frame.data, w, h, bytes_per_line, QImage.Format_RGB888)
                pixmap = QPixmap.fromImage(image)
                self.live_view.setPixmap(pixmap)