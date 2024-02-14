from PySide6.QtCore import Qt
from PySide6.QtWidgets import QWidget, QVBoxLayout
from GUI.widgets.dashContent import Dashboard
from GUI.widgets.mainContentWidget import MainContentWidget
from GUI.widgets.mainFooterWidget import MainFooterWidget
from GUI.widgets.mainHeaderWidget import MainHeaderWidget


class ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName("MainWindow")
        self.setContentsMargins(0, 0, 0, 0)
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        main_window_height = MainWindow.height()
        main_window_width = MainWindow.width()
        self.container = QWidget(self)
        self.container.setContentsMargins(0, 0, 0, 0)
        self.setCentralWidget(self.container)
        self.layout = QVBoxLayout(self.container)
       
        self.header_widget = MainHeaderWidget(50)
        self.layout.addWidget(self.header_widget, alignment=Qt.AlignTop)
        self.content_content_widget=Dashboard(main_window_height-150,main_window_width)
        # self.content_content_widget = MainContentWidget(main_window_height-150,main_window_width)
        self.layout.addWidget(self.content_content_widget, alignment=Qt.AlignTop)
        self.content_footer_widget = MainFooterWidget(100)
        self.layout.addWidget(self.content_footer_widget, alignment=Qt.AlignBottom)

    