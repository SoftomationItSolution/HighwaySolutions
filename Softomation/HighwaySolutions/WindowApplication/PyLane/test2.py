import sys
from PySide6.QtCore import QThread, QUrl
from PySide6.QtMultimedia import QMediaPlayer
from PySide6.QtMultimediaWidgets import QVideoWidget
from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton



class VideoWorker(QThread):
    def __init__(self, rtsp_url):
        super().__init__()
        self.rtsp_url = rtsp_url
        self.player = QMediaPlayer()

    def run(self):
        self.player.setSource(QUrl(self.rtsp_url))
        self.player.play()

class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("RTSP Streamer")

        self.video_widget = QVideoWidget()
        self.video_widget.setFixedHeight(300)
        self.video_widget.setFixedWidth(500)
        self.start_button = QPushButton("Start Stream")
        self.start_button.clicked.connect(self.start_stream)

        layout = QVBoxLayout()
        layout.addWidget(self.video_widget)
        layout.addWidget(self.start_button)
        self.setLayout(layout)
        self.start_stream()

    
    def start_stream(self):
        rtsp_url = "rtsp://admin:admin@192.168.1.181:554"
        self.thread = VideoWorker(rtsp_url)
        self.thread.player.setVideoOutput(self.video_widget)
        self.thread.start()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())