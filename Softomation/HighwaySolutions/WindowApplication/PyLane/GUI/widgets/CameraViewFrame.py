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
            self.camera_thread_lpic = None
            self.camera_thread_ic = None
            self.camera_url_lpic = None
            self.camera_url_ic = None

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
            cam_view_height=int((height - 20)/2)
            self.lpic_widget = QLabel('LPIC')
            self.lpic_widget.setContentsMargins(0, 0, 0, 0)
            self.lpic_widget.setFixedHeight(cam_view_height)
            self.lpic_widget.setFixedWidth(width - 5)
            self.lpic_widget.setStyleSheet("border: none;")
            self.lpic_widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
            group_box_layout.addWidget(self.lpic_widget, alignment=Qt.AlignTop | Qt.AlignVCenter)

            self.ic_widget = QLabel('IC')
            self.ic_widget.setContentsMargins(0, 0, 0, 0)
            self.ic_widget.setFixedHeight(cam_view_height)
            self.ic_widget.setFixedWidth(width - 5)
            self.ic_widget.setStyleSheet("border: none;")
            self.ic_widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
            group_box_layout.addWidget(self.ic_widget, alignment=Qt.AlignBottom | Qt.AlignVCenter)
            self.updateFinished.connect(self.start_stream)
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView __init__: {e}")
    
    def start_stream(self):
        try:
            if self.camera_url_lpic and self.camera_thread_lpic is None:
                self.camera_thread_lpic = CameraThread('lpic',self.camera_url_lpic, self.lpic_widget.width(), self.lpic_widget.height(), self.logger)
                self.camera_thread_lpic.lpic_image_data.connect(self.update_image_lpic)
                self.camera_thread_lpic.start()

            if self.camera_url_ic and self.camera_thread_ic is None:
                self.camera_thread_ic = CameraThread('ic',self.camera_url_ic, self.ic_widget.width(), self.ic_widget.height(), self.logger)
                self.camera_thread_ic.ic_image_data.connect(self.update_image_ic)
                self.camera_thread_ic.start()
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView start_stream: {e}")

    def stop_stream(self):
        try:
            if self.camera_thread_lpic is not None:
                self.camera_thread_lpic.stop()
                self.camera_thread_lpic.quit()
                self.camera_thread_lpic.wait()
                self.camera_thread_lpic = None

            if self.camera_thread_ic is not None:
                self.camera_thread_ic.stop()
                self.camera_thread_ic.quit()
                self.camera_thread_ic.wait()
                self.camera_thread_ic = None
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView stop_stream: {e}")

    def set_cam_details(self, equipment):
        try:
            if equipment:
                if equipment['EquipmentTypeId']==15:
                    self.camera_url_lpic = equipment['UrlAddress']
                elif equipment['EquipmentTypeId']==16:
                    self.camera_url_ic = equipment['UrlAddress']
                
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView set_cam_details: {e}")

    def update_image_lpic(self, image):
        try:
            pixmap = QPixmap.fromImage(image)
            self.lpic_widget.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView update_image: {e}")

    def update_image_ic(self, image):
        try:
            pixmap = QPixmap.fromImage(image)
            self.ic_widget.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView update_image: {e}")
