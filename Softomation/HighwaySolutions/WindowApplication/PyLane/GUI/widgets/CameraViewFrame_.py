from PySide6.QtWidgets import QVBoxLayout, QLabel, QSizePolicy, QFrame
from PySide6.QtCore import QThread, Qt, Signal
from PySide6.QtGui import QImage, QPixmap
import cv2

class CameraLiveView(QFrame):
    updateFinished = Signal(bool)

    def __init__(self, width, height,logger):
        super().__init__()
        btn_height=0
        lbl_height=30
        self.rtsp_url = None
        self.cam_thread = None
        self.video_label = QLabel()
        list_height=height-(btn_height+lbl_height)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Live View</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(30)
        box_heading.setStyleSheet("color: white; border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)
        
        self.video_label.setContentsMargins(0, 0, 0, 0)
        self.video_label.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        box_layout.addWidget(self.video_label, alignment=Qt.AlignTop | Qt.AlignVCenter)

    def set_cam_details(self, equipment):
        if equipment is not None:
            self.rtsp_url = f"rtsp://{equipment['LoginId']}:{equipment['LoginPassword']}@{equipment['IpAddress']}:554/{equipment['UrlAddress']}"
            self.start_stream(True)

    def start_stream(self, status):
        if status:
            self.cam_thread = CameraThread(self.rtsp_url)
            self.cam_thread.image_data.connect(self.update_image)
            self.cam_thread.start()

    def update_image(self, image):
        pixmap = QPixmap.fromImage(image)
        self.video_label.setPixmap(pixmap)

class CameraThread(QThread):
    image_data = Signal(QImage)

    def __init__(self, camera_url):
        super().__init__()
        self.camera_url = camera_url
        self.stopped = False

    def run(self):
        cap = cv2.VideoCapture(self.camera_url)
        while not self.stopped:
            ret, frame = cap.read()
            if ret:
                rgb_image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, ch = rgb_image.shape
                bytes_per_line = ch * w
                qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
                self.image_data.emit(qt_image)
            
    def stop(self):
        self.stopped = True