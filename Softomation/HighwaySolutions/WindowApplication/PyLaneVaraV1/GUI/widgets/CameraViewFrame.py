import os
from PySide6.QtWidgets import QVBoxLayout, QLabel, QFrame, QSizePolicy, QGroupBox
from PySide6.QtCore import Qt, Signal
from PySide6.QtGui import QPixmap, QImage
from GUI.widgets.CameraPopup import CameraPopup
import cv2
from pubsub import pub

class CameraLiveView(QFrame):
    def __init__(self, width, height, default_directory, logger):
        super().__init__()
        try:
            self.logger = logger
            self.camera_thread_lpic = None
            self.camera_thread_ic = None
            self.camera_url_lpic = None
            self.camera_url_ic = None
            self.default_directory = default_directory
            self.popups = []
            box_layout = QVBoxLayout(self)
            box_layout.setContentsMargins(0, 0, 0, 0)
            box_layout.setSpacing(0)

            self.group_box = QGroupBox("Live View")
            self.group_box.setStyleSheet(
                "QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.3em;padding: 0 3px 0 3px; }"
                "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }"
            )
            self.group_box.setFixedHeight(height)
            box_layout.addWidget(self.group_box)

            group_box_layout = QVBoxLayout(self.group_box)
            group_box_layout.setContentsMargins(0, 5, 0, 5)
            group_box_layout.setSpacing(0)
            cam_view_height = int((height - 20) / 2)

            self.lpic_widget = QLabel('LPIC')
            self.lpic_widget.setContentsMargins(0, 0, 0, 0)
            self.lpic_widget.setFixedHeight(cam_view_height)
            self.lpic_widget.setFixedWidth(width - 5)
            self.lpic_widget.setStyleSheet("border: none;")
            self.lpic_widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
            self.lpic_widget.mouseDoubleClickEvent = self.show_lpic_popup
            group_box_layout.addWidget(self.lpic_widget, alignment=Qt.AlignTop | Qt.AlignVCenter)

            self.ic_widget = QLabel('IC')
            self.ic_widget.setContentsMargins(0, 0, 0, 0)
            self.ic_widget.setFixedHeight(cam_view_height)
            self.ic_widget.setFixedWidth(width - 5)
            self.ic_widget.setStyleSheet("border: none;")
            self.ic_widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
            self.ic_widget.mouseDoubleClickEvent = self.show_ic_popup
            group_box_layout.addWidget(self.ic_widget, alignment=Qt.AlignBottom | Qt.AlignVCenter)

            pub.subscribe(self.lpic_liveview, "lpic_liveview")
            pub.subscribe(self.ic_liveview, "ic_liveview")
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView __init__: {e}")

    def lpic_liveview(self, liveview):
        try:
            if liveview is None:
                self.logger.logError("Error: liveview is None in lpic_liveview")
                return

            #self.logger.logInfo(f"liveview shape: {liveview.shape}")
            rgb_image = cv2.cvtColor(liveview, cv2.COLOR_BGR2RGB)
            #self.logger.logInfo(f"Converted to RGB: shape = {rgb_image.shape}, dtype = {rgb_image.dtype}")

            h, w, ch = rgb_image.shape
            bytes_per_line = ch * w
            qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
            if qt_image.isNull():
                self.logger.logError("Error: QImage is null in lpic_liveview")
                return

            #self.logger.logInfo(f"QImage created: size = {qt_image.size()}, format = {qt_image.format()}")
            pixmap = QPixmap.fromImage(qt_image)
            if pixmap.isNull():
                self.logger.logError("Error: QPixmap is null in lpic_liveview")
                return

            self.lpic_widget.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in lpic_liveview: {e}")

    def ic_liveview(self, liveview):
        try:
            if liveview is None:
                self.logger.logError("Error: liveview is None in ic_liveview")
                return

            #self.logger.logInfo(f"liveview shape: {liveview.shape}")
            rgb_image = cv2.cvtColor(liveview, cv2.COLOR_BGR2RGB)
            #self.logger.logInfo(f"Converted to RGB: shape = {rgb_image.shape}, dtype = {rgb_image.dtype}")

            h, w, ch = rgb_image.shape
            bytes_per_line = ch * w
            qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
            if qt_image.isNull():
                self.logger.logError("Error: QImage is null in ic_liveview")
                return

            #self.logger.logInfo(f"QImage created: size = {qt_image.size()}, format = {qt_image.format()}")
            pixmap = QPixmap.fromImage(qt_image)
            if pixmap.isNull():
                self.logger.logError("Error: QPixmap is null in ic_liveview")
                return

            self.ic_widget.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in ic_liveview: {e}")

    def show_lpic_popup(self, event):
        try:
            self.close_all_popups()
            popup = CameraPopup("LPIC Live View", self.lpic_widget, self.default_directory, self.logger, "lpic_liveview")
            self.popups.append(popup)
            popup.show()
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView show_lpic_popup: {e}")

    def show_ic_popup(self, event):
        try:
            self.close_all_popups()
            popup = CameraPopup("IC Live View", self.ic_widget, self.default_directory, self.logger, "ic_liveview")
            self.popups.append(popup)
            popup.show()
        except Exception as e:
            self.logger.logError(f"Error in CameraLiveView show_ic_popup: {e}")

    def close_all_popups(self):
        for popup in self.popups:
            popup.close()
        self.popups.clear()
