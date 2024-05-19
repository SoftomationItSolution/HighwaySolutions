from PySide6.QtWidgets import QMessageBox


def confirmation_box(title, message):
    msg_box = QMessageBox()
    msg_box.setIcon(QMessageBox.Question)
    msg_box.setWindowTitle(title)
    msg_box.setText(message)
    msg_box.setStandardButtons(QMessageBox.Yes | QMessageBox.No)
    msg_box.setStyleSheet("""
            QMessageBox {
                background-color: #2c3e50; /* Set background color */
                color: #ffffff; /* Set text color to white */
            }
            
                          QLabel {
                color: #ffffff; /* Set text color to white */
            }
            
            QMessageBox QPushButton {
                background-color: #3498db; /* Set button background color */
                color: #ffffff; /* Set button text color to white */
            }
            
            QMessageBox QPushButton:hover {
                background-color: #2980b9; /* Set button background color on hover */
            }
        """)
    result = msg_box.exec_()
    if result == QMessageBox.Yes:
        return True
    else:
        return False

# Create the application object


def show_custom_message_box(title, message, iconType, desc=None,):
    msg_box = QMessageBox()
    if iconType == 'war':
        msg_box.setIcon(QMessageBox.Warning)
    elif iconType == 'inf':
        msg_box.setIcon(QMessageBox.Information)
    elif iconType == 'cri':
        msg_box.setIcon(QMessageBox.Critical)
    elif iconType == 'que':
        msg_box.setIcon(QMessageBox.Question)
    msg_box.setWindowTitle(title)
    msg_box.setText(message)
    if desc is not None:
        msg_box.setInformativeText("Additional information can be added here.")
    msg_box.addButton(QMessageBox.Ok)
    msg_box.setStyleSheet("""
            QMessageBox {
                background-color: #2c3e50; /* Set background color */
                color: #ffffff; /* Set text color to white */
            }
                          
                           QLabel {
                color: #ffffff; /* Set text color to white */
            }
            
            QMessageBox QPushButton {
                background-color: #3498db; /* Set button background color */
                color: #ffffff; /* Set button text color to white */
            }
            
            QMessageBox QPushButton:hover {
                background-color: #2980b9; /* Set button background color on hover */
            }
        """)

    result = msg_box.exec_()
