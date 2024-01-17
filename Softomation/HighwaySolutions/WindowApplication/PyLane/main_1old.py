import sys
from PySide6 import QtCore, QtGui, QtWidgets
from PySide6.QtCore import Qt
from PySide6.QtWidgets import *
import os
from PySide6.QtGui import QFont



class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Toll Plaza")
        self.setMinimumSize(1000, 600)

        self.centralWidget = QWidget()
        self.setCentralWidget(self.centralWidget)

        self.mainLayout = QVBoxLayout()
        self.centralWidget.setLayout(self.mainLayout)

        self.shiftLabel = QLabel("Shift-3")
        self.shiftLabel.setFont(QFont("Arial", 16))
        self.mainLayout.addWidget(self.shiftLabel)

        self.timeLabel = QLabel("23:59:59")
        self.timeLabel.setFont(QFont("Arial", 16))
        self.mainLayout.addWidget(self.timeLabel)

        self.tollPlazaLabel = QLabel("Toll Plaza")
        self.tollPlazaLabel.setFont(QFont("Arial", 24))
        self.tollPlazaLabel.setAlignment(Qt.AlignCenter)
        self.mainLayout.addWidget(self.tollPlazaLabel)

        self.vehicleInfoGroupBox = QGroupBox("Vehicle Information")
        self.vehicleInfoGroupBox.setFont(QFont("Arial", 14))
        self.mainLayout.addWidget(self.vehicleInfoGroupBox)

        self.vehicleInfoLayout = QFormLayout()
        self.vehicleInfoGroupBox.setLayout(self.vehicleInfoLayout)

        self.vehicleClassLabel = QLabel("Vehicle Class:")
        self.vehicleClassLabel.setFont(QFont("Arial", 12))
        self.vehicleInfoLayout.addRow(self.vehicleClassLabel, QLineEdit())

        self.vehicleTypeLabel = QLabel("Vehicle Type:")
        self.vehicleTypeLabel.setFont(QFont("Arial", 12))
        self.vehicleInfoLayout.addRow(self.vehicleTypeLabel, QLineEdit())

        self.transactionTypeLabel = QLabel("Transaction Type:")
        self.transactionTypeLabel.setFont(QFont("Arial", 12))
        self.vehicleInfoLayout.addRow(self.transactionTypeLabel, QLineEdit())

        self.amountLabel = QLabel("Amount:")
        self.amountLabel.setFont(QFont("Arial", 12))
        self.vehicleInfoLayout.addRow(self.amountLabel, QLineEdit())

        self.paymentMethodLabel = QLabel("Payment Method:")
        self.paymentMethodLabel.setFont(QFont("Arial", 12))
        self.vehicleInfoLayout.addRow(self.paymentMethodLabel, QLineEdit())

        self.submitButton = QPushButton("Submit")
        self.submitButton.setFont(QFont("Arial", 12))
        self.mainLayout.addWidget(self.submitButton)

        self.queueGroupBox = QGroupBox("Queue")
        self.queueGroupBox.setFont(QFont("Arial", 14))
        self.mainLayout.addWidget(self.queueGroupBox)

        self.queueLayout = QVBoxLayout()
        self.queueGroupBox.setLayout(self.queueLayout)

        self.queueTable = QTableWidget()
        self.queueTable.setFont(QFont("Arial", 12))
        self.queueTable.setColumnCount(5)
        self.queueTable.setHorizontalHeaderLabels(["S.No.", "Vehicle Class", "Vehicle Type", "Arrival Time", "Departure Time"])
        self.queueLayout.addWidget(self.queueTable)

        self.queueStatusLabel = QLabel("Queue Status:")
        self.queueStatusLabel.setFont(QFont("Arial", 12))
        self.queueLayout.addWidget(self.queueStatusLabel)

        self.queueStatusLineEdit = QLineEdit()
        self.queueStatusLineEdit.setFont(QFont("Arial", 12))
        self.queueStatusLineEdit.setReadOnly(True)
        self.queueLayout.addWidget(self.queueStatusLineEdit)

        self.mainLayout.addStretch()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())