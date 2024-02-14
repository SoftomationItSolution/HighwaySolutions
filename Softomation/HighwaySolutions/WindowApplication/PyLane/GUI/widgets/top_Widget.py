from PySide6.QtWidgets import QFrame, QVBoxLayout,QHBoxLayout, QListWidget, QLabel,QWidget
from PySide6.QtGui import QFont

class TopWidget(QFrame):
    def __init__(self,height,width):
        super().__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.setContentsMargins(0, 0, 0, 0)
        self.setStyleSheet("border: 1px solid red;")
        # top_container = QFrame(self)
        # top_container.setFixedHeight(height)
        # top_container.setFixedWidth(width)
        # top_container.setContentsMargins(0, 0, 0, 0)
        # top_container.setStyleSheet("border: 1px solid white;")
        # top_container.setStyleSheet("border: none;")
        #top_layout = QHBoxLayout(self)


        # Divide into three sub-containers horizontally
        # sub_container1 = QFrame(top_container)
        # #sub_container1.setStyleSheet("border: 1px solid white;")
        # sub_container1.setFixedHeight(height)
        # sub_container1.setFixedWidth(width // 3)  # Divide the width into three parts
        # top_layout.addWidget(sub_container1)

        # sub_container2 = QFrame(top_container)
        # #sub_container2.setStyleSheet("border: 1px solid white;")
        # sub_container2.setFixedHeight(height)
        # sub_container2.setFixedWidth(width // 3)
        # top_layout.addWidget(sub_container2)

        # sub_container3 = QFrame(top_container)
        # #sub_container3.setStyleSheet("border: 1px solid white;")
        # sub_container3.setFixedHeight(height)
        # sub_container3.setFixedWidth(width // 3)
        # top_layout.addWidget(sub_container3)

        # label1 = QLabel("Container 1")
        # label2 = QLabel("Container 2")
        # label3 = QLabel("Container 3")

        # sub_container1_layout = QVBoxLayout(sub_container1)
        # sub_container1_layout.addWidget(label1)

        # sub_container2_layout = QVBoxLayout(sub_container2)
        # sub_container2_layout.addWidget(label2)

        # sub_container3_layout = QVBoxLayout(sub_container3)
        # sub_container3_layout.addWidget(label3)