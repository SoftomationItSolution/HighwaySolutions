from datetime import datetime
import json
from PySide6.QtGui import QColor
from PySide6.QtWidgets import QMainWindow,QListWidgetItem,QMessageBox
from PySide6.QtCore import QTimer, QDateTime,Signal
from models.SystemSettingModel import getSystemSettingGet
from models.shiftTimingModel import getShiftDetails
from models.vehicleClassModel import systemVehicleClassImportGet, systemVehicleSubClassImportGet
from ui.ui_MainWindow import ui_MainWindow


class MainWindow(QMainWindow,ui_MainWindow):
    switch_window = Signal()
    def __init__(self,dbConnectionObj,user_Details):
        super(MainWindow, self).__init__()
        self.setContentsMargins(0, 0, 0, 0)
        self.db=dbConnectionObj
        self.showFullScreen()
        self.setupUi(self)
        #self.userDetails=json.loads(user_Details)
        self.userDetails=None
        self.shiftDetails=getShiftDetails(self.db)
        self.systemSettingDetails=getSystemSettingGet(self.db)
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
        if self.systemSettingDetails['SubClassRequired']==1:
            self.vc=systemVehicleSubClassImportGet(self.db)
            self.bindSubvc(self.vc)
        else:
            self.vc=systemVehicleClassImportGet(self.db)
            self.bindvc(self.vc)

        # self.content_content_widget.vc_panel.vc_list_widget.itemSelectionChanged.connect(self.onVCSelectionChanged)
        self.update_timer()
        self.update_shift()

    def onVCSelectionChanged(self):
        selected_items = self.content_content_widget.vc_panel.vc_list_widget.selectedItems()
        if selected_items:
            selected_item = selected_items[0]
            item_id = selected_item.data(32)
            QMessageBox.information(self, "Selected Item ID", f"Selected Item ID: {item_id}")

    def bindvc(self,json_data):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemVehicleClassName"])
            list_item.setData(32, item_data["SystemVehicleClassId"])
            self.content_content_widget.vc_panel.vc_list_widget.addItem(list_item)

    def bindSubvc(self,json_data):
        for item_data in json_data:
            list_item = QListWidgetItem(item_data["SystemSubClassNames"])
            list_item.setData(32, item_data["SystemSubClassId"])
            self.content_content_widget.vc_panel.vc_list_widget.addItem(list_item)

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
            if start_datetime <= formatted_datetime <= end_datetime:
                self.header_widget.shift_label.setText("Shift: " + str(shift['ShiftId']) + " " + shift['StartTimmng'] + "-" + shift['EndTimming'])
                break
            
    def update_timer(self):
        timer = QTimer(self)
        timer.timeout.connect(self.update_datetime)
        timer.start(1000)

    def update_datetime(self):
        current_datetime = QDateTime.currentDateTime()
        formatted_datetime = current_datetime.toString('HH:mm:ss')
        self.header_widget.datetime_label.setText("Current Time: "+formatted_datetime)

    def handle_selection_change(self):
        selected_items = self.list_widget.selectedItems()
        if selected_items:
            selected_item_text = selected_items[0].text()
            print(f"Selected item: {selected_item_text}")

    def getMainWindowHeight(self):
        return self.geometry().height()

    def getMainWindowWidth(self):
        return self.geometry().width()