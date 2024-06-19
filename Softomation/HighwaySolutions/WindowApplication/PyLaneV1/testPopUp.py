import sys
from PySide6.QtWidgets import (QApplication, QMainWindow, QTableWidget, QTableWidgetItem, QVBoxLayout, QDialog, QHBoxLayout, QLabel, QPushButton, QMessageBox)
from PySide6.QtCore import Qt
import sqlite3

class CurrencyDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Currency Table")

        self.layout = QVBoxLayout(self)

        # Provided row data
        self.row_data = [
            {"DenominationValue": 500, "DenominationCount": 0},
            {"DenominationValue": 200, "DenominationCount": 0},
            {"DenominationValue": 100, "DenominationCount": 0},
            {"DenominationValue": 50, "DenominationCount": 0},
            {"DenominationValue": 20, "DenominationCount": 0},
            {"DenominationValue": 10, "DenominationCount": 0},
            {"DenominationValue": 5, "DenominationCount": 0},
            {"DenominationValue": 2, "DenominationCount": 0},
            {"DenominationValue": 1, "DenominationCount": 0}
        ]

        self.table = QTableWidget(len(self.row_data), 3, self)
        self.table.setHorizontalHeaderLabels(['Currency Type', 'Currency Count', 'Amount'])

        for row, data in enumerate(self.row_data):
            denomination = data["DenominationValue"]
            count = data["DenominationCount"]
            
            currency_item = QTableWidgetItem(f"₹{denomination}")
            currency_item.setFlags(currency_item.flags() & ~Qt.ItemIsEditable)  # Make non-editable
            self.table.setItem(row, 0, currency_item)
            
            count_item = QTableWidgetItem(str(count))
            count_item.setFlags(count_item.flags() | Qt.ItemIsEditable)  # Make editable
            self.table.setItem(row, 1, count_item)
            
            amount_item = QTableWidgetItem('₹0.00')
            amount_item.setFlags(amount_item.flags() & ~Qt.ItemIsEditable)  # Make non-editable
            self.table.setItem(row, 2, amount_item)

        self.table.itemChanged.connect(self.update_amounts)

        self.layout.addWidget(self.table)

        self.footer_layout = QHBoxLayout()
        self.sum_count_label = QLabel("Sum Count: 0")
        self.sum_amount_label = QLabel("Sum Amount: ₹0.00")
        self.footer_layout.addWidget(self.sum_count_label)
        self.footer_layout.addWidget(self.sum_amount_label)

        self.layout.addLayout(self.footer_layout)
        
        self.update_footer()

        # Submit button
        self.submit_button = QPushButton("Submit")
        self.submit_button.setEnabled(False)
        self.submit_button.clicked.connect(self.submit_data)
        self.layout.addWidget(self.submit_button)

        self.update_submit_button_state()

    def update_amounts(self, item):
        if item.column() == 1:
            try:
                count = int(item.text())
                item.setBackground(Qt.white)  # Reset background color if valid
            except ValueError:
                item.setBackground(Qt.red)  # Set background color to red if invalid
                count = 0

            row = item.row()
            value = self.row_data[row]["DenominationValue"]
            amount = count * value
            self.table.item(row, 2).setText(f"₹{amount:.2f}")

            self.update_footer()
            self.update_submit_button_state()

    def update_footer(self):
        total_count = 0
        total_amount = 0.0

        for row in range(self.table.rowCount()):
            count_item = self.table.item(row, 1)
            amount_item = self.table.item(row, 2)
            if count_item and amount_item:
                try:
                    count = int(count_item.text())
                    amount = float(amount_item.text().replace('₹', ''))
                except ValueError:
                    count = 0
                    amount = 0.0
                total_count += count
                total_amount += amount

        self.sum_count_label.setText(f"Sum Count: {total_count}")
        self.sum_amount_label.setText(f"Sum Amount: ₹{total_amount:.2f}")

    def update_submit_button_state(self):
        valid = True
        for row in range(self.table.rowCount()):
            count_item = self.table.item(row, 1)
            try:
                int(count_item.text())
                count_item.setBackground(Qt.white)  # Reset background color if valid
            except ValueError:
                count_item.setBackground(Qt.red)  # Set background color to red if invalid
                valid = False
        self.submit_button.setEnabled(valid)

    def submit_data(self):
        data = []
        for row in range(self.table.rowCount()):
            denomination_value = self.row_data[row]["DenominationValue"]
            count_item = self.table.item(row, 1)
            count = int(count_item.text())
            data.append((denomination_value, count))
        
        # Database connection and data insertion
        conn = sqlite3.connect('currency.db')
        cursor = conn.cursor()
        cursor.execute('''CREATE TABLE IF NOT EXISTS currency_table
                          (DenominationValue INTEGER, DenominationCount INTEGER)''')
        cursor.executemany('INSERT INTO currency_table (DenominationValue, DenominationCount) VALUES (?, ?)', data)
        conn.commit()
        conn.close()

        QMessageBox.information(self, "Success", "Data submitted successfully!")

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Currency App")
        self.setGeometry(100, 100, 800, 600)

        self.show_dialog_button = QPushButton("Show Currency Table")
        self.show_dialog_button.clicked.connect(self.show_currency_dialog)

        self.setCentralWidget(self.show_dialog_button)

    def show_currency_dialog(self):
        dialog = CurrencyDialog(self)
        dialog.exec()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
