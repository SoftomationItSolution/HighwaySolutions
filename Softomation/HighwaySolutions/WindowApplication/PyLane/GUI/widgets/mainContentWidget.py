from PySide6.QtWidgets import QFrame, QSplitter, QVBoxLayout
from PySide6.QtCore import Qt
from GUI.widgets.right_widget import RightWidget
from GUI.widgets.vc_widget import VCWidget


class MainContentWidget(QFrame):
    def __init__(self, height, width):
        super().__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.setContentsMargins(0, 0, 0, 0)
        vc_width = int(width * 0.2)
        mar=20
        vc_width=vc_width-mar
        right_panel_width= width-vc_width-mar
        splitter = QSplitter(Qt.Horizontal)
        splitter.setContentsMargins(0, 0, 0, 0)
        splitter.setStyleSheet("border: none;")
        self.vc_panel = VCWidget(height,vc_width)
        self.right_panel = RightWidget(height,right_panel_width)
        splitter.addWidget(self.vc_panel)
        splitter.addWidget(self.right_panel)
        sizes = [vc_width, right_panel_width]
        splitter.setSizes(sizes)
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.addWidget(splitter)
        