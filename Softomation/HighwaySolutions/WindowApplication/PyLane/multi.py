from PySide6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QHBoxLayout, QWidget, QLabel, QFrame

class MyMainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setGeometry(0, 0, 800, 600)

        # Create main container widget
        container = QWidget(self)
        self.setCentralWidget(container)

        # Create layout for the main container
        layout = QVBoxLayout(container)

        # Header
        header_frame = QFrame()
        header_layout = QHBoxLayout(header_frame)

        # Set the height of the header to 50 pixels
        header_frame.setFixedHeight(50)

        # Divide header into 4 parts
        for i in range(4):
            part_label = QLabel(f"Part {i + 1}")
            part_label.setStyleSheet("background-color: lightblue;")
            header_layout.addWidget(part_label)

            if i < 3:  # Add horizontal line after the first three parts
                line = QFrame()
                line.setFrameShape(QFrame.HLine)
                line.setFrameShadow(QFrame.Sunken)
                header_layout.addWidget(line)

        header_frame.setFrameStyle(QFrame.Panel | QFrame.Plain)
        header_frame.setLineWidth(1)
        layout.addWidget(header_frame)

        # Main content
        main_content_label = QLabel("Main Content")
        main_content_label.setStyleSheet("background-color: lightgreen; border: 1px solid black;")
        layout.addWidget(main_content_label, 1)  # The second parameter is the stretch factor

        # Footer
        footer_label = QLabel("Footer")
        footer_label.setStyleSheet("background-color: lightcoral; border: 1px solid black;")
        layout.addWidget(footer_label)

if __name__ == "__main__":
    app = QApplication([])
    window = MyMainWindow()
    window.show()
    app.exec()
