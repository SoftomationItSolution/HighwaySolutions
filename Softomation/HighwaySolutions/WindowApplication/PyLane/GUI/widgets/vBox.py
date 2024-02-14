from PySide6.QtWidgets import QVBoxLayout, QFrame

class verticalBox(QFrame):
    def __init__(self, height, width,bs=None):
        super(verticalBox, self).__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.layout.setSpacing(0)
        if bs == None:
            self.setStyleSheet("border: 1px solid white;")
        else: 
            self.setStyleSheet(bs)