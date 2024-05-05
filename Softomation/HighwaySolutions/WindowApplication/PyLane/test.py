import sys
from PySide6.QtWidgets import QApplication, QFrame, QGroupBox, QVBoxLayout, QHBoxLayout, QPushButton, QLineEdit, QLabel, QGridLayout
from PySide6.QtGui import QPainter, QColor

class LineWidget(QFrame):
    def __init__(self):
        super().__init__()
        self.setFrameShape(QFrame.HLine)
        self.setFrameShadow(QFrame.Sunken)

class MainWindow(QFrame):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Group Box Example")
        self.setGeometry(100, 100, 400, 300)

        self.central_widget = QGroupBox("Current Transaction")
        self.central_widget.setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.5em; }"
                                    "QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px;color:#fff }")
        self.central_widget.setFixedHeight(600)
       
        # Create layouts
        main_layout = QVBoxLayout(self)
        self.central_layout = QVBoxLayout()
        self.central_widget.setLayout(self.central_layout)

        top_layout = QGridLayout()
        bottom_layout = QHBoxLayout()

        # Top part with multiple rows of text boxes
        self.textboxes = []
        self.lines = []
        for i in range(3):  # Creating 3 rows of text boxes
            #label = QLabel(f"Text Box {i+1}:")
            #textbox = QLineEdit()
            #self.textboxes.append(textbox)
            line = LineWidget()
            self.lines.append(line)

            #top_layout.addWidget(label, i, 0)
            #top_layout.addWidget(textbox, i, 1)
            top_layout.addWidget(line, i, 0)
            top_layout.columnMinimumWidth(500)

            # Set the horizontal stretch factor to make the lines expand to fill the available space
            top_layout.setColumnStretch(2, 1)
            
        
        # Bottom part with buttons
        submit_button = QPushButton("Submit")
        reset_button = QPushButton("Reset")
        submit_button.clicked.connect(self.submit)
        reset_button.clicked.connect(self.reset)
        bottom_layout.addWidget(submit_button)
        bottom_layout.addWidget(reset_button)

        # Add layouts to central layout of group box
        self.central_layout.addLayout(top_layout)
        self.central_layout.addLayout(bottom_layout)

        # Add group box to main layout
        main_layout.addWidget(self.central_widget)

    def submit(self):
        for textbox in self.textboxes:
            print(textbox.text())  # Example: print text from each textbox

    def reset(self):
        for textbox in self.textboxes:
            textbox.clear()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
