
from datetime import datetime
import os
import threading
import time
from PySide6.QtWidgets import QFrame, QGridLayout, QPushButton,QLabel
from PySide6.QtCore import Qt,QDateTime
from PySide6.QtGui import QIcon
from PySide6.QtCore import QSize, Qt,Signal

class Header(QFrame):
    update_label_signal = Signal(str)
    update_label_time = Signal(str)
    auto_logout = Signal(bool)
    def __init__(self, width, height, userDetails,image_dir):
        super().__init__()
        self.initUI(width, height, userDetails,image_dir)

    def initUI(self, width, height, userDetails,image_dir):
        self.current_shift = None
        self.setFixedWidth(width)
        self.setFixedHeight(height)
        self.last_update_date = QDateTime.currentDateTime().toString('yyyy-MM-dd')
        self.update_label_signal.connect(self.update_label)
        self.update_label_time.connect(self.update_datetime)
        layout = QGridLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        lab_width = int((width - 30) / 5)

        login_label = QLabel()
        login_label.setFixedWidth(lab_width)
        login_label.setStyleSheet("color: white; border: none;")
        if userDetails is None:
            login_label.setText("<b>Login By: ADMIN</b>")
        else:
            login_label.setText("<b>Login By: " + userDetails["LoginId"] + "</b>")
        layout.addWidget(login_label, 0, 0, alignment=Qt.AlignRight | Qt.AlignVCenter)

        login_at_label = QLabel()
        login_at_label.setFixedWidth(lab_width)
        login_at_label.setText("<b>Login at: " + QDateTime.currentDateTime().toString('HH:mm:ss') + "</b>")
        login_at_label.setStyleSheet("color: white; border: none;")
        layout.addWidget(login_at_label, 0, 1, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.shift_label = QLabel()
        self.shift_label.setFixedWidth(lab_width)
        self.shift_label.setStyleSheet("color: white; border: none;")
        layout.addWidget(self.shift_label, 0, 2, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.datetime_label = QLabel()
        self.datetime_label.setFixedWidth(lab_width)
        self.datetime_label.setStyleSheet("color: white; border: none;")
        layout.addWidget(self.datetime_label, 0, 3, alignment=Qt.AlignRight | Qt.AlignVCenter)

        self.Rdatetime_label = QLabel()
        self.Rdatetime_label.setFixedWidth(lab_width)
        self.Rdatetime_label.setStyleSheet("color: green; border: none;")
        layout.addWidget(self.Rdatetime_label, 0, 4, alignment=Qt.AlignRight | Qt.AlignVCenter)

        lblVersion = QLabel()
        lblVersion.setFixedWidth(lab_width)
        lblVersion.setText('<b>TMSv1</b>')
        lblVersion.setStyleSheet("color: white; border: none;")
        layout.addWidget(lblVersion, 0, 5, alignment=Qt.AlignRight | Qt.AlignVCenter)

        icon = os.path.join(image_dir, 'logout.png')
        self.logout_button = QPushButton()
        self.logout_button.setIcon(QIcon(icon))
        self.logout_button.setIconSize(QSize(24, 24))
        self.logout_button.setStyleSheet("background-color: white; border: none;")
        layout.addWidget(self.logout_button, 0, 6, alignment=Qt.AlignRight | Qt.AlignVCenter)
        self.setStyleSheet("border-bottom: 1px solid white;")
        self.is_running=True
        self.datetime_thread = threading.Thread(target=self.display_datetime)
        self.datetime_thread.daemon=True
        self.datetime_thread.start()

    def update_shift(self, json_data):    
        self.current_shift = json_data

    def update_label(self, new_text):
        self.shift_label.setText(new_text)

    def display_datetime(self):
        while self.is_running:
            try:
                current_datetime = QDateTime.currentDateTime().toString("yyyy-MM-dd hh:mm:ss")
                self.update_label_time.emit(current_datetime)
            except Exception as e:
                pass
            finally:
                if self.is_running==False:
                    break
                time.sleep(1)

    def update_datetime(self):
        try:
            current_datetime = QDateTime.currentDateTime()
            formatted_datetime = current_datetime.toString('HH:mm:ss')
            formatted_date = current_datetime.toString('yyyy-MM-dd')
            self.datetime_label.setText(f"<b>Current Time: {formatted_datetime}</b>")
            # Check if the day has changed
            if self.last_update_date != formatted_date:
                self.last_update_date = formatted_date
                remaining_minutes = 0
                self.is_running = False
                self.auto_logout.emit(True)
                return

            if self.current_shift is not None:
                StartTiming = datetime.strptime(self.current_shift['StartTimmng'], "%H:%M:%S").time()
                EndTiming = datetime.strptime(self.current_shift['EndTimming'], "%H:%M:%S").time()
                CurrentTiming = datetime.strptime(formatted_datetime, "%H:%M:%S").time()
                remaining_time = None  # Default assignment
                if CurrentTiming < StartTiming:
                    remaining_time = datetime.combine(datetime.today(), StartTiming) - datetime.combine(datetime.today(), CurrentTiming)
                    remaining_minutes = remaining_time.total_seconds() // 60
                elif CurrentTiming > EndTiming:
                    remaining_minutes = 0
                    self.is_running = False
                    self.auto_logout.emit(True)
                else:
                    remaining_time = datetime.combine(datetime.today(), EndTiming) - datetime.combine(datetime.today(), CurrentTiming)
                    remaining_minutes = remaining_time.total_seconds() // 60

                if remaining_time is not None:
                    remaining_hours = int(remaining_minutes // 60)
                    remaining_minutes = int(remaining_minutes % 60)
                    remaining_seconds = int(remaining_time.total_seconds() % 60)
                    remaining_time_str = "{:02}:{:02}:{:02}".format(remaining_hours, remaining_minutes, remaining_seconds)
                    if remaining_minutes < 5:
                        self.Rdatetime_label.setStyleSheet("color: red; border: none;")
                    else:
                        self.Rdatetime_label.setStyleSheet("color: green; border: none;")
                        
                    self.Rdatetime_label.setText(f"<b>Time Left: {remaining_time_str}</b>")
        except Exception as e:
            print(f"Error in update_datetime: {e}")

