from PySide6.QtWidgets import QFrame, QVBoxLayout, QListWidget, QLabel
from PySide6.QtGui import QFont
from PySide6.QtCore import Qt
class VCWidget(QFrame):
    def __init__(self,height,width):
        super().__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        font = QFont()
        font.setPointSize(18)
        self.setContentsMargins(0, 0, 0, 0)
        font.setFamily("Agency FB")
        self.class_layout = QVBoxLayout(self)
        self.class_layout.setContentsMargins(0, 0, 0, 0)
        self.class_layout.setSpacing(0)
        vc_label = QLabel()
        vc_label.setFont(font)
        vc_label.setAlignment(Qt.AlignCenter)
        vc_label.setStyleSheet("color: black;background-color: white;border: none;")
        vc_label.setText("Vehicle Class")
        self.class_layout.addWidget(vc_label)
        self.vc_list_widget = QListWidget(self)
        self.vc_list_widget.setFont(font)
        self.vc_list_widget.setStyleSheet("color: white;border: none;")
        self.class_layout.addWidget(self.vc_list_widget)
        self.setStyleSheet("border: 1px solid white;")