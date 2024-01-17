from PySide6.QtCore import Qt
from PySide6.QtGui import QFont
from PySide6.QtWidgets import QApplication,QWidget, QVBoxLayout,QPushButton

from ui.mainHeaderWidget import MainHeaderWidget

class ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName("MainWindow")

        # font = QFont()
        # font.setPointSize(20)
        # font.setFamily("Agency FB")
        # screen_geometry = QApplication.primaryScreen().geometry()
        # height=screen_geometry.height()
        # width=screen_geometry.width()
        # print(height,width)
        
        self.container = QWidget(self)
        self.setCentralWidget(self.container)
        self.layout = QVBoxLayout(self.container)
        self.header_widget = MainHeaderWidget(50)
        self.layout.addWidget(self.header_widget, alignment=Qt.AlignTop)
        
        
