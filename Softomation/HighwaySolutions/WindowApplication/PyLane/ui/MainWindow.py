from datetime import datetime
import json
from PySide6.QtWidgets import QMainWindow
from PySide6.QtCore import QTimer, QDateTime,Signal
from ui.messBox import show_custom_message_box
from utils.dbModel import getShiftDetails
from ui.ui_MainWindow import ui_MainWindow

class MainWindow(QMainWindow,ui_MainWindow):
    switch_window = Signal()
    def __init__(self,dbConnectionObj,user_Details):
        super(MainWindow, self).__init__()
        self.db=dbConnectionObj
        #self.userDetails=json.loads(user_Details)
        self.userDetails=None
        self.showFullScreen()
        self.setupUi(self)
        self.shiftDetails=getShiftDetails(self.db)    
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        current_datetime = QDateTime.currentDateTime()
        if self.userDetails == None:
            self.header_widget.login_label.setText("Login By: ADMIN")
            # show_custom_message_box("Login Failed","User Details not matched",'cri')
            # self.switch_window.emit()
            # return
        else:
            self.header_widget.login_label.setText("Login By: "+self.userDetails["LoginId"])
        self.header_widget.login_at_label.setText("Login at:"+current_datetime.toString('HH:mm:ss'))
        self.header_widget.logout_button.clicked.connect(self.logout)
        #self.header_widget.list_widget.itemSelectionChanged.connect(self.handle_selection_change)
        self.update_timer()
        self.update_shift()

    def logout(self):
        self.close()
        #self.switch_window.emit()

    def update_shift(self):
        current_datetime = QDateTime.currentDateTime()
        current_date = current_datetime.toString('dd-MMM-yyyy')
        current_date_time = current_datetime.toString('dd-MMM-yyyy HH:mm:ss')
        date_format = "%d-%b-%Y %H:%M:%S"
        for shift in self.shiftDetails:
            start_datetime = datetime.strptime(current_date + ' ' + shift['StartTimmng'], date_format)
            end_datetime = datetime.strptime(current_date + ' ' + shift['EndTimming'], date_format)
            formatted_datetime = datetime.strptime(current_date_time, date_format)
            #print(formatted_datetime)
            if start_datetime <= formatted_datetime <= end_datetime:
                self.header_widget.shift_label.setText("Shift: " + str(shift['ShiftId']) + " " + shift['StartTimmng'] + "-" + shift['EndTimming'])
                break
                
            
    def update_timer(self):
        timer = QTimer(self)
        timer.timeout.connect(self.update_datetime)
        timer.start(1000)  # Update every second

    def update_datetime(self):
        current_datetime = QDateTime.currentDateTime()
        formatted_datetime = current_datetime.toString('HH:mm:ss')
        self.header_widget.datetime_label.setText("Current Time: "+formatted_datetime)

    def handle_selection_change(self):
        selected_items = self.list_widget.selectedItems()
        if selected_items:
            selected_item_text = selected_items[0].text()
            print(f"Selected item: {selected_item_text}")

     

