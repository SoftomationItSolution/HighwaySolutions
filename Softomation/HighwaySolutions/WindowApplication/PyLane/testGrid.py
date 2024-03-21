import sys
from PySide6.QtWidgets import QApplication, QWidget, QGridLayout, QLabel, QVBoxLayout, QFrame


class CustomRowWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        layout = QVBoxLayout()
        self.setLayout(layout)

        # Add widgets to this custom row
        # For demonstration purposes, adding a label here
        label = QLabel("Widget 1")
        layout.addWidget(label)

        # Add frame around the custom row
        frame = QFrame(self)
        frame.setFrameShape(QFrame.StyledPanel)
        frame.setFrameShadow(QFrame.Raised)
        layout.addWidget(frame)


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Grid Layout with Row Borders")
        self.setGeometry(100, 100, 400, 300)

        # Create the main layout
        main_layout = QGridLayout()
        self.setLayout(main_layout)

        # Add custom row widgets to the layout
        for row in range(3):
            custom_row_widget = CustomRowWidget()
            main_layout.addWidget(custom_row_widget, row, 0)

        self.show()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    sys.exit(app.exec())
