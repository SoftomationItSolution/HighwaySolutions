from PySide6.QtWidgets import QFrame, QVBoxLayout
from GUI.widgets.bottom_widget import BottomWidget
from GUI.widgets.top_Widget import TopWidget


class RightWidget(QFrame):
    def __init__(self, height, width):
        super().__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.setContentsMargins(0, 0, 0, 0)
       
        top_height = int(height / 2)
        self.right_layout = QVBoxLayout(self)
        self.right_layout.setSpacing(0)
        
        top_container = TopWidget(top_height, width)
        self.right_layout.addWidget(top_container)

        # bottom_container = BottomWidget(height, width)
        # self.right_layout.addWidget(bottom_container)  
        #self.setStyleSheet("border: 1px solid red;")