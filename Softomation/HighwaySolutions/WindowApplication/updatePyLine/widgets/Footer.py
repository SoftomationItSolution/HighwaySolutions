from PySide6.QtWidgets import QHBoxLayout, QFrame

class Footer(QFrame):
    def __init__(self, height, width):
        super(Footer, self).__init__()
        self.setFrameShape(QFrame.Box)
        self.setFixedHeight(height)
        self.layout = QHBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.layout.setSpacing(0)