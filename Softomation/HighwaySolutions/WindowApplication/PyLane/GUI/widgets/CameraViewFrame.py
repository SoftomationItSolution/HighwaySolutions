from PySide6.QtWidgets import QVBoxLayout, QLabel,QFrame,QSizePolicy
from PySide6.QtCore import QThread, QUrl, Qt,Signal
from PySide6.QtMultimedia import QMediaPlayer
from PySide6.QtMultimediaWidgets import QVideoWidget
from PySide6.QtGui import QImage, QPixmap
import cv2

class VideoWorker(QThread):
    mediaStatusChanged = Signal(bool)
    def __init__(self, rtsp_url):
        super().__init__()
        self.rtsp_url = rtsp_url
        self.media_player = QMediaPlayer()

    def run(self):
        self.media_player.setSource(QUrl(self.rtsp_url))
        self.media_player.play()
        self.media_player.mediaStatusChanged.connect(self.mediaStatusChanged.emit)

class CameraLiveView(QFrame):
    updateFinished = Signal(bool)
    def __init__(self, width, height,logger):
        super().__init__()
        btn_height=0
        lbl_height=30
        self.rtsp_url=None
        self.cam_thread=None
        list_height=height-(btn_height+lbl_height)
        #self.updateFinished.connect(self.start_stream)
        self.updateFinished.connect(self.start_cam_thread)
        box_layout = QVBoxLayout(self)
        box_layout.setContentsMargins(0, 0, 0, 0)
        box_layout.setSpacing(0)

        box_heading = QLabel("<b>Live View</b>")
        box_heading.setAlignment(Qt.AlignTop)
        box_heading.setFixedHeight(lbl_height-1)
        box_heading.setStyleSheet("color: white;border: none;")
        box_layout.addWidget(box_heading, alignment=Qt.AlignHCenter | Qt.AlignVCenter)
        
        self.video_widget = QLabel()

        #self.video_widget = QVideoWidget()
        self.video_widget.setContentsMargins(0, 0, 0, 0)
        self.video_widget.setFixedHeight(list_height)
        self.video_widget.setFixedWidth(width-2)
        self.video_widget.setStyleSheet("border: none;border-top: 1px solid white;")
        self.video_widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        #self.video_widget.setAspectRatioMode(Qt.IgnoreAspectRatio)
        box_layout.addWidget(self.video_widget, alignment=Qt.AlignTop | Qt.AlignVCenter)

    
    def start_stream(self,status):
        if status:
            self.cam_thread = VideoWorker(self.rtsp_url)
            self.cam_thread.media_player.setVideoOutput(self.video_widget)
            self.cam_thread.mediaStatusChanged.connect(self.handle_media_status)
            self.cam_thread.mediaStatusChanged.emit(True)
            self.cam_thread.start()
    
    def set_cam_details(self, equipment):
        if equipment is not None:
            self.rtsp_url=f"rtsp://{equipment['LoginId']}:{equipment['LoginPassword']}@{equipment['IpAddress']}:554/{equipment['UrlAddress']}"
            print(self.rtsp_url)

    def handle_media_status(self, playing):
        if not playing:  # If stream stops
            self.cam_thread.quit()  # Stop the thread
            self.start_stream(True)  # Restart the stream

    def start_cam_thread(self):
        self.camera_thread = CameraThread(self.rtsp_url)
        self.camera_thread.image_data.connect(self.update_image)
        self.camera_thread.start()

    def update_image(self, image):
        pixmap = QPixmap.fromImage(image)
        self.video_widget.setPixmap(pixmap)

class CameraThread(QThread):
    image_data = Signal(QImage)

    def __init__(self, camera_url):
        super().__init__()
        self.camera_url = camera_url

    def run(self):
        cap = cv2.VideoCapture(self.camera_url)
        while True:
            ret, frame = cap.read()
            if ret:
                rgb_image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, ch = rgb_image.shape
                bytes_per_line = ch * w
                qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
                self.image_data.emit(qt_image)
            
   