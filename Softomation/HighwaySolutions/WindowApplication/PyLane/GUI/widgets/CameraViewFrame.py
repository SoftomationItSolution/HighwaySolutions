from PySide6.QtWidgets import QVBoxLayout, QLabel, QFrame, QSizePolicy, QGroupBox
from PySide6.QtCore import Qt, Signal
from PySide6.QtGui import QPixmap
from GUI.widgets.CameraThread import CameraThread

class CameraLiveView(QFrame):
    updateFinished = Signal(bool)

    def __init__(self, width, height, logger):
        super().__init__()
        try:
            self.logger = logger
            self.camera_thread = None
            self.camera_url = None

            box_layout = QVBoxLayout(self)
            box_layout.setContentsMargins(0, 0, 0, 0)
            box_layout.setSpacing(0)

            self.group_box = QGroupBox("Live View")
            self.group_box.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                                     "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
            self.group_box.setFixedHeight(height)
            box_layout.addWidget(self.group_box)

            group_box_layout = QVBoxLayout(self.group_box)
            group_box_layout.setContentsMargins(0, 5, 0, 5)
            group_box_layout.setSpacing(0)

            self.video_widget = QLabel()
            self.video_widget.setContentsMargins(0, 0, 0, 0)
            self.video_widget.setFixedHeight(height - 20)
            self.video_widget.setFixedWidth(width - 5)
            self.video_widget.setStyleSheet("border: none;")
            group_box_layout.addWidget(self.video_widget, alignment=Qt.AlignBottom | Qt.AlignVCenter)

            self.updateFinished.connect(self.start_stream)
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView __init__: {e}")
    
    def start_stream(self):
        try:
            if self.camera_url:
                self.camera_thread = CameraThread(self.camera_url, self.video_widget.width(), self.video_widget.height(), self.logger)
                self.camera_thread.image_data.connect(self.update_image)
                self.camera_thread.start()
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView start_stream: {e}")

    def stop_stream(self):
        try:
            if self.camera_thread is not None:
                self.camera_thread.stop()
                self.camera_thread.quit()
                self.camera_thread.wait()
                self.camera_thread = None
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView stop_stream: {e}")

    def set_cam_details(self, equipment):
        try:
            if equipment:
                self.camera_url = equipment['UrlAddress']
                self.start_stream()
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView set_cam_details: {e}")

    def update_image(self, image):
        try:
            pixmap = QPixmap.fromImage(image)
            self.video_widget.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView update_image: {e}")
