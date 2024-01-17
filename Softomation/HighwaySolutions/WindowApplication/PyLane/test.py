from PySide6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget
from PySide6.QtCore import Qt
from testui.footer_widget import FooterWidget
from testui.header_widget import HeaderWidget
from testui.main_widget import MainWidget


class MyMainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        screen_geometry = QApplication.primaryScreen().geometry()
        self.setGeometry(0, 0, screen_geometry.width(), screen_geometry.height())
        height=screen_geometry.height()
        container = QWidget(self)
        self.setCentralWidget(container)
        layout = QVBoxLayout(container)
        header_widget = HeaderWidget()
        layout.addWidget(header_widget, alignment=Qt.AlignTop)
        
        main_widget = MainWidget(height-100)
        layout.addWidget(main_widget, alignment=Qt.AlignTop)
        
        Footer_widget = FooterWidget()
        layout.addWidget(Footer_widget, alignment=Qt.AlignBottom)

if __name__ == "__main__":
    app = QApplication([])
    window = MyMainWindow()
    window.show()
    app.exec()
