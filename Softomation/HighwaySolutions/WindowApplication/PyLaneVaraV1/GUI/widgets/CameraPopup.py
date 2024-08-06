import os
from PySide6.QtWidgets import QVBoxLayout, QLabel, QWidget, QHBoxLayout, QToolButton, QSpacerItem, QSizePolicy
from PySide6.QtGui import QImage, QPixmap, QIcon
from PySide6.QtCore import Qt
import cv2
from pubsub import pub


class CameraPopup(QWidget):
    def __init__(self, title, image,default_directory, logger, topic):
        super().__init__()
        self.logger = logger
        self.setWindowTitle(title)


        # Determine screen size
        screen_geometry = self.screen().geometry()
        screen_width = screen_geometry.width()
        screen_height = screen_geometry.height()
        
        # Calculate 60% of screen size
        width = int(screen_width * 0.6)
        height = int(screen_height * 0.6)
        
        # Set the size of the window
        self.setMinimumSize(width, height)

        #self.setMinimumSize(800, 600)
        icon = os.path.join(default_directory, 'close.png')
        main_layout = QVBoxLayout(self)

        title_bar = QHBoxLayout()
        title_bar.setContentsMargins(0, 0, 0, 0)
        title_bar.setSpacing(0)
        
        title_label = QLabel(title)
        title_label.setStyleSheet("font-size: 16px; font-weight: bold;")
        
        close_button = QToolButton()
        close_button.setIcon(QIcon(icon))  # Provide path to your close icon
        close_button.setStyleSheet("border: none;")
        close_button.clicked.connect(self.close)
        
        spacer = QSpacerItem(40, 20, QSizePolicy.Expanding, QSizePolicy.Minimum)
        
        title_bar.addWidget(title_label)
        title_bar.addItem(spacer)
        title_bar.addWidget(close_button)
        
        main_layout.addLayout(title_bar)
        
        self.image_label = QLabel(self)
        self.image_label.resize(width, height-100)
        #self.image_label.setMaximumSize(800, 500)
        main_layout.addWidget(self.image_label)
        
        pub.subscribe(self.liveview, topic)
        
        #self.update_image(image)
    
    def liveview(self, liveview):
        rgb_image = cv2.cvtColor(liveview, cv2.COLOR_BGR2RGB)
        h, w, ch = rgb_image.shape
        bytes_per_line = ch * w
        qt_image = QImage(rgb_image.data, w, h, bytes_per_line, QImage.Format_RGB888)
        pixmap = QPixmap.fromImage(qt_image)
        if pixmap.isNull():
            self.image_label.setPixmap(pixmap)
    
    def update_image(self, image):
        try:
            pixmap = QPixmap.fromImage(image)
            if pixmap.isNull():
                self.image_label.setPixmap(pixmap)
        except Exception as e:
            self.logger.logError(f"Error in CameraPopup update_image: {e}")
