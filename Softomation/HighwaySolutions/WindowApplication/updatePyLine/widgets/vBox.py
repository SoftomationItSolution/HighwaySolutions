from PySide6.QtWidgets import QVBoxLayout, QFrame

class verticalBox(QFrame):
    def __init__(self, height, width):
        super(verticalBox, self).__init__()
        self.setFrameShape(QFrame.Box)
        self.setFixedWidth(width)
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.layout.setSpacing(0)
        #self.setStyleSheet("background-color: red;")