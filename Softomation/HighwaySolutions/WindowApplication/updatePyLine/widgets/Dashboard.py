from PySide6.QtCore import Qt
from PySide6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget
from widgets.hBox import HorizontalBox
from widgets.vBox import verticalBox

class Dashboard(QMainWindow):
    def __init__(self):
        super(Dashboard, self).__init__()
        self.setWindowTitle("My Dashboard")
        primary_screen = QApplication.primaryScreen()
        screen_height = primary_screen.size().height()
        screen_width = primary_screen.size().width()
        screen_geometry = primary_screen.availableGeometry()
        self.setGeometry(screen_geometry)
        self.setContentsMargins(0, 0, 0, 0)

        central_widget = QWidget(self)
        central_widget_layout = QVBoxLayout(central_widget)
        central_widget_layout.setContentsMargins(0, 0, 0, 0)
        central_widget_layout.setSpacing(0)
        central_widget.setStyleSheet("background-color: lightblue;")

        # Instantiate the separate classes
        header_height=50
        footer_height=50
        middle_left_width=150

        header = HorizontalBox(header_height,screen_width)

        middle_height=screen_height-(header_height+footer_height)
        middle = HorizontalBox(middle_height, screen_width)
        
        middle_left = verticalBox(middle_height,middle_left_width)
        middle.layout.addWidget(middle_left)
        
        middle_right_width=screen_width-middle_left_width
        middle_right = verticalBox(middle_height,middle_right_width)
        middle.layout.addWidget(middle_right)
        
        middle_right_top_height=middle_height/2
        middle_right_top = HorizontalBox(middle_right_top_height,middle_right_width)
        middle_right.layout.addWidget(middle_right_top, alignment=Qt.AlignTop)

        middle_right_top_left_width=middle_right_width/3
        middle_right_top_left  = verticalBox(middle_right_top_height, middle_right_top_left_width)
        middle_right_top.layout.addWidget(middle_right_top_left)

        middle_right_top_middle  = verticalBox(middle_right_top_height, middle_right_top_left_width)
        middle_right_top.layout.addWidget(middle_right_top_middle)

        middle_right_top_right  = verticalBox(middle_right_top_height, middle_right_top_left_width)
        middle_right_top.layout.addWidget(middle_right_top_right)
        
        
        middle_right_bottom = HorizontalBox(middle_right_top_height,middle_right_width)
        middle_right.layout.addWidget(middle_right_bottom, alignment=Qt.AlignTop)
        
        middle_right_bottom_left_width=middle_right_width/2

        middle_right_top_left  = verticalBox(middle_right_top_height, middle_right_bottom_left_width)
        middle_right_bottom.layout.addWidget(middle_right_top_left)

        middle_right_top_middle  = verticalBox(middle_right_top_height, middle_right_bottom_left_width)
        middle_right_bottom.layout.addWidget(middle_right_top_middle)

        footer = HorizontalBox(footer_height,screen_width)

        # Add the separate classes to the central_widget_layout
        central_widget_layout.addWidget(header, alignment=Qt.AlignTop)
        central_widget_layout.addWidget(middle, alignment=Qt.AlignTop)
        central_widget_layout.addWidget(footer, alignment=Qt.AlignTop)

        self.setCentralWidget(central_widget)
        
    def resizeEvent(self, event):
        super(Dashboard, self).resizeEvent(event)


