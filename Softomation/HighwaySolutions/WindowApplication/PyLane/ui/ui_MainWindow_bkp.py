from PySide6.QtCore import QSize, Qt
from PySide6.QtGui import QFont, QIcon
from PySide6.QtWidgets import QHBoxLayout, QLabel, QPushButton, QWidget, QListWidget, QFrame,QVBoxLayout

class ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName("MainWindow")

        font = QFont()
        font.setPointSize(20)
        font.setFamily("Agency FB")

        self.centralwidget = QWidget(MainWindow)
        MainWindow.setCentralWidget(self.centralwidget)

        # Region: top panel
        self.topPanelFrame = QFrame(self.centralwidget)
        self.topPanelLayout = QHBoxLayout(self.topPanelFrame)
        self.topPanelFrame.setFixedHeight(50)
        self.login_label = QLabel(self.topPanelFrame)
        self.login_label.setStyleSheet("color: white;")
        self.login_label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        self.login_label.setFont(font)
        self.topPanelLayout.addWidget(self.login_label)
        self.login_at_label = QLabel(self.topPanelFrame)
        self.login_at_label.setStyleSheet("color: white;")
        self.login_at_label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        self.login_at_label.setFont(font)
        self.topPanelLayout.addWidget(self.login_at_label)
        self.shift_label = QLabel(self.topPanelFrame)
        self.shift_label.setStyleSheet("color: white;")
        self.shift_label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        self.shift_label.setFont(font)
        self.topPanelLayout.addWidget(self.shift_label)
        self.datetime_label = QLabel(self.topPanelFrame)
        self.datetime_label.setStyleSheet("color: white;")
        self.datetime_label.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        self.datetime_label.setFont(font)
        self.topPanelLayout.addWidget(self.datetime_label)
        self.logout_button = QPushButton(self.topPanelFrame)
        self.logout_button.setIcon(QIcon("images/logout.png"))
        self.logout_button.setIconSize(QSize(24, 24))
        self.logout_button.setStyleSheet("background-color: white;")
        self.topPanelLayout.addWidget(self.logout_button, alignment=Qt.AlignRight | Qt.AlignVCenter)
        self.topPanelLayout.setSpacing(0)
        self.topPanelLayout.setObjectName("topPanel")
        self.topPanelLayout.setContentsMargins(0, 0, 0, 0)
        centralLayout = QHBoxLayout(self.centralwidget)
        centralLayout.addWidget(self.topPanelFrame, alignment=Qt.AlignTop)  # Align to the top
        self.topPanelFrame.setStyleSheet("QFrame { border-bottom: 1px solid white; }")
        # End of top panel

        # Region: Vehicle Class
        
        self.list_widget = QListWidget()
        
        items = ["Item 1", "Item 2", "Item 3", "Item 4"]
        self.list_widget.addItems(items)
        self.classPanelFrame = QFrame(self.centralwidget)
        self.classPanelLayout = QHBoxLayout(self.classPanelFrame)
        self.classPanelFrame.setFixedHeight(400)
        self.classPanelFrame.setFixedWidth(400)
        
        # End of Vehicle Class