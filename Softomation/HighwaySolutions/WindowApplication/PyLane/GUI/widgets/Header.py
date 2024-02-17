from datetime import datetime
from PySide6.QtWidgets import QWidget,QFrame, QHBoxLayout, QPushButton,QLabel
from PySide6.QtCore import Qt,QDateTime,QTimer
from PySide6.QtGui import QFont, QIcon
from PySide6.QtCore import QSize, Qt

from GUI.ui.messBox import confirmation_box
class Header(QFrame):
    def __init__(self, width, height,userDetails,shiftDetails):
        super().__init__()
        self.initUI(width, height,userDetails,shiftDetails)

    def initUI(self, width, height,userDetails,shiftDetails):
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        
        layout = QHBoxLayout(self)
        layout.setContentsMargins(0,0,0,0)
        layout.setSpacing(0)

        lab_width=int((width-30)/5)
        login_label = QLabel()
        login_label.setFixedWidth(lab_width)
        login_label.setStyleSheet("color: white;border: none;")
        if userDetails == None:
            login_label.setText("<b>Login By: ADMIN</b>")
        else:
            login_label.setText("<b>Login By: "+userDetails["LoginId"]+"</b>")
        layout.addWidget(login_label, alignment=Qt.AlignRight | Qt.AlignVCenter)

        login_at_label = QLabel()
        login_at_label.setFixedWidth(lab_width)
        login_at_label.setText("<b>Login at: "+QDateTime.currentDateTime().toString('HH:mm:ss')+"</b>")
        login_at_label.setStyleSheet("color: white;border: none;")
        layout.addWidget(login_at_label, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.shift_label = QLabel()
        self.shift_label.setFixedWidth(lab_width)
        self.shift_label.setStyleSheet("color: white;border: none;")
        layout.addWidget(self.shift_label, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.datetime_label = QLabel()
        self.datetime_label.setFixedWidth(lab_width)
        self.datetime_label.setStyleSheet("color: white;border: none;")
        layout.addWidget(self.datetime_label, alignment=Qt.AlignRight | Qt.AlignVCenter)

        lblVersion = QLabel()
        lblVersion.setFixedWidth(lab_width)
        lblVersion.setText('<b>TMSv1</b>')
        lblVersion.setStyleSheet("color: white;border: none;")
        layout.addWidget(lblVersion, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.logout_button = QPushButton()
        self.logout_button.setIcon(QIcon("assets/images/logout.png"))
        self.logout_button.setIconSize(QSize(24, 24))
        self.logout_button.setStyleSheet("background-color: white; border: none;")
        layout.addWidget(self.logout_button, alignment=Qt.AlignRight | Qt.AlignVCenter)
        self.setStyleSheet("border-bottom: 1px solid white;")
        self.update_shift(shiftDetails)
        self.update_timer()

    def update_shift(self,shiftDetails):
        current_datetime = QDateTime.currentDateTime()
        current_date = current_datetime.toString('dd-MMM-yyyy')
        current_date_time = current_datetime.toString('dd-MMM-yyyy HH:mm:ss')
        date_format = "%d-%b-%Y %H:%M:%S"
        for shift in shiftDetails:
            start_datetime = datetime.strptime(current_date + ' ' + shift['StartTimmng'], date_format)
            end_datetime = datetime.strptime(current_date + ' ' + shift['EndTimming'], date_format)
            formatted_datetime = datetime.strptime(current_date_time, date_format)
            if start_datetime <= formatted_datetime <= end_datetime:
                self.shift_label.setText("<b>Shift: " + str(shift['ShiftId']) + " " + shift['StartTimmng'] + "-" + shift['EndTimming']+"</b>")
                break

    def update_timer(self):
        timer = QTimer(self)
        timer.timeout.connect(self.update_datetime)
        timer.start(1000)
    
    def update_datetime(self):
        current_datetime = QDateTime.currentDateTime()
        formatted_datetime = current_datetime.toString('HH:mm:ss')
        self.datetime_label.setText("<b>Current Time: "+formatted_datetime)