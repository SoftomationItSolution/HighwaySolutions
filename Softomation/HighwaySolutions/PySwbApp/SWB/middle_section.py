from PySide6.QtWidgets import QWidget, QVBoxLayout, QFrame

from SWB.bottom_table_section import BottomTableSection
from SWB.top_form_section import TopFormSection

class MiddleSection(QWidget):
    def __init__(self,default_directory, apipath, width, script_dir):
        super().__init__()
        self.setup_ui(default_directory,apipath, width, script_dir)

    def setup_ui(self, default_directory,apipath, width, script_dir):
        # Main layout for MiddleSection
        main_layout = QVBoxLayout()
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0)
        self.setLayout(main_layout)

        # Create a frame to hold the entire content and apply the border
        frame = QFrame(self)
        frame.setFrameShape(QFrame.StyledPanel)  # Set the frame shape (e.g., a panel with a border)
        frame.setFrameShadow(QFrame.Sunken)     # Optional: add shadow effect to the frame
        frame.setStyleSheet("border: 1px solid white;")  # Apply a border to the frame
        frame_layout = QVBoxLayout(frame)
        frame_layout.setContentsMargins(5, 5, 5, 5)  # Optional: adjust margins inside the frame

        # Top section for form
        self.top_section = TopFormSection(default_directory,apipath, script_dir)
        frame_layout.addWidget(self.top_section)

        # Bottom section for table
        bottom_section = BottomTableSection()
        frame_layout.addWidget(bottom_section)

        # Add the frame to the main layout
        main_layout.addWidget(frame)

        self.setStyleSheet("color: white;")
