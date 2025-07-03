from PySide6.QtWidgets import QDialog, QVBoxLayout, QLabel, QLineEdit, QPushButton

class ApiDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Enter server api url")
        self.setFixedWidth(300)

        layout = QVBoxLayout(self)

        self.label = QLabel("API URL:")
        self.api_input = QLineEdit()
        self.api_input.setPlaceholderText("https://your.api.url/")

        self.ok_button = QPushButton("Save")
        self.ok_button.clicked.connect(self.accept)

        layout.addWidget(self.label)
        layout.addWidget(self.api_input)
        layout.addWidget(self.ok_button)

    def get_api_url(self):
        return self.api_input.text().strip()
