from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QTableWidget, QTableWidgetItem, QFrame
)
from PySide6.QtCore import Qt

class BottomTableSection(QWidget):
    def __init__(self):
        super().__init__()
        self.setup_ui()

    def setup_ui(self):
        table_layout = QVBoxLayout()
        table_layout.setContentsMargins(10, 10, 10, 10)
        table_layout.setSpacing(5)
        self.setLayout(table_layout)

        # Create a QFrame for the border
        frame = QFrame()
        frame.setFrameShape(QFrame.StyledPanel)  # Set the border style (you can use QFrame.Box for a simple box border)
        frame.setFrameShadow(QFrame.Sunken)  # Set the shadow (Raised or Sunken)
        frame.setStyleSheet("border: 2px solid white;")  # Set the border color and width

        # Create a table widget
        table = QTableWidget(5, 3)  # Example: 5 rows and 3 columns
        table.setHorizontalHeaderLabels(["Column 1", "Column 2", "Column 3"])
        table.setStyleSheet("color: white;")  # Styling the text color of the table

        # Populate the table with sample data
        for row in range(5):
            for col in range(3):
                item = QTableWidgetItem(f"Data {row + 1}, {col + 1}")
                item.setTextAlignment(Qt.AlignCenter)
                table.setItem(row, col, item)

        # Add the table to the frame
        frame_layout = QVBoxLayout(frame)
        frame_layout.addWidget(table)
        
        # Add the frame to the main layout
        table_layout.addWidget(frame)
