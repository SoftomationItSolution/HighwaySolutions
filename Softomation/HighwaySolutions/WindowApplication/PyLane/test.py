import sys
from PySide6.QtWidgets import QApplication, QMainWindow, QTableWidget, QTableWidgetItem, QVBoxLayout, QWidget
import json


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Table Row Selection Example")
        self.setGeometry(100, 100, 600, 400)

        self.setup_ui()

    def setup_ui(self):
        # Create a central widget
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # Create a layout for the central widget
        layout = QVBoxLayout()
        central_widget.setLayout(layout)

        # Create the table widget
        self.table_widget = QTableWidget()
        layout.addWidget(self.table_widget)

        # Set table properties
        self.table_widget.setColumnCount(3)
        self.table_widget.setHorizontalHeaderLabels(["Column 1", "Column 2", "Column 3"])

        # Dummy JSON data (Replace this with your actual JSON data)
        self.json_data = [
            {"col1": "Data 1", "col2": "Data 2", "col3": "Data 3"},
            {"col1": "Data 4", "col2": "Data 5", "col3": "Data 6"},
            {"col1": "Data 7", "col2": "Data 8", "col3": "Data 9"}
        ]

        # Populate the table with JSON data
        self.populate_table(self.json_data)

        # Enable row selection
        self.table_widget.setSelectionBehavior(QTableWidget.SelectRows)

        # Connect selection change signal
        self.table_widget.itemSelectionChanged.connect(self.on_selection_changed)

    def populate_table(self, data):
        self.table_widget.setRowCount(len(data))
        for row, row_data in enumerate(data):
            for col, value in enumerate(row_data.values()):
                item = QTableWidgetItem(str(value))
                self.table_widget.setItem(row, col, item)

    def on_selection_changed(self):
        selected_rows = set(item.row() for item in self.table_widget.selectedItems())
        print("Selected rows:", selected_rows)
        
        # Remove complete row and store the value of the third column in a different variable
        removed_values = []
        for row in sorted(selected_rows, reverse=True):  # Iterate in reverse order to avoid index issues
            # Get the value of the third column
            item = self.table_widget.item(row, 2)
            if item:
                removed_values.append(item.text())
            # Remove the row from the table
            self.table_widget.removeRow(row)
            # Remove the corresponding entry from the JSON data
            del self.json_data[row]

        print("Removed values from Column 3:", removed_values)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
