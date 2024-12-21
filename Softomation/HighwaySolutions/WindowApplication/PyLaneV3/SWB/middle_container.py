from PySide6.QtWidgets import QWidget, QHBoxLayout, QFrame
from PySide6.QtCore import Qt
from SWB.left_section import LeftSection
from SWB.middle_section import MiddleSection
from SWB.right_section import RightSection

class MiddleContainer(QWidget):
    def __init__(self, height, width, apipath, script_dir,default_directory):
        super().__init__()
        self.setup_ui(height, width, apipath, script_dir,default_directory)

    def setup_ui(self, height, width, apipath, script_dir,default_directory):
        layout = QHBoxLayout()
        self.apipath = apipath
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)
        self.setLayout(layout)

        # Create a frame to hold the whole container and apply the border
        container_frame = QFrame(self)
        container_frame.setFrameShape(QFrame.StyledPanel)  # Set frame type (e.g., StyledPanel for a border)
        container_frame.setFrameShadow(QFrame.Sunken)     # Optional: add shadow to frame
        container_frame.setStyleSheet("border: 1px solid white;")  # Apply border to the frame
        container_layout = QHBoxLayout(container_frame)
        container_layout.setContentsMargins(5, 5, 5, 5)

        self.left_section = LeftSection(default_directory,apipath, width=300)
        self.middle_section = MiddleSection(default_directory,apipath, width-600, script_dir)
        self.right_section = RightSection(height,width=300)

        container_layout.addWidget(self.left_section, alignment=Qt.AlignLeft)
        container_layout.addWidget(self.middle_section, stretch=1)
        container_layout.addWidget(self.right_section, alignment=Qt.AlignRight)

        layout.addWidget(container_frame)  # Add the frame to the main layout

        self.setFixedSize(width, height)
        self.setStyleSheet("color: white;")  # Set text color for the entire widget
