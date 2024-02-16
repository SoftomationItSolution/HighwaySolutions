from PySide6.QtWidgets import QFrame, QHBoxLayout

class Footer(QFrame):
    def __init__(self, width, height):
        super().__init__()
        self.initUI(width, height)

    def initUI(self, width, height):
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.setStyleSheet("border: 1px solid white;")
        layout = QHBoxLayout(self)
        layout.setContentsMargins(0,0,0,0)
        layout.setSpacing(0)

        self.footer_frame = QFrame()
        self.footer_frame.setFixedHeight(height)
        self.footer_frame.setFixedWidth(width)
        self.footer_frame.setContentsMargins(0, 0, 0, 0)
        self.footer_frame.setFrameStyle(QFrame.NoFrame)
        layout.addWidget(self.footer_frame)