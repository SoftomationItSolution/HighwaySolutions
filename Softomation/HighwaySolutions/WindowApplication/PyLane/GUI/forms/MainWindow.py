import json
from PySide6.QtCore import QDateTime,Signal
from PySide6.QtWidgets import QMainWindow
from PySide6.QtWidgets import QWidget,QHBoxLayout, QVBoxLayout
from gui.ui.messBox import confirmation_box, show_custom_message_box
from gui.widgets.Header import Header
from gui.widgets.LeftFrame import LeftFrame
from gui.widgets.RightFrame import RightFrame
from gui.widgets.Footer import Footer
from models.SystemSettingModel import GetSystemSetting
from models.shiftTimingModel import getShiftDetails
from models.transactionTypeModel import GetTransactionType
from models.vehicleClassModel import GetsystemVehicleClass, GetsystemVehicleSubClass

class MainWindow(QMainWindow):
    switch_window = Signal(str)
    def __init__(self,dbConnectionObj,user_Details):
        super(MainWindow, self).__init__()
        self.setStyleSheet("background-color: rgb(1, 27, 65);")
        self.setWindowTitle("TMS Lane V1")
        self.db=dbConnectionObj
        self.showFullScreen()
        self.userDetails=None
        main_window_height = self.height()
        main_window_width = self.width()
        if user_Details is not None:
            self.userDetails=json.loads(user_Details)
        self.shiftDetails=getShiftDetails(self.db)
        self.systemSettingDetails=GetSystemSetting(self.db)
        self.TransactionTypeDetails=GetTransactionType(self.db)
        
        if self.systemSettingDetails['SubClassRequired']==1:
            self.vc=GetsystemVehicleSubClass(self.db)
        else:
            self.vc=GetsystemVehicleClass(self.db)

        central_widget = QWidget() 
        self.setCentralWidget(central_widget)

        main_layout = QVBoxLayout(central_widget)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0) 
        
        self.header_widget = Header(main_window_width, 50,self.userDetails,self.shiftDetails)
        main_layout.addWidget(self.header_widget)

        
        self.header_widget.logout_button.clicked.connect(self.logout)
        
        frames_height=main_window_height-100
        left_frame_width=200
        right_frame_width=main_window_width-left_frame_width
        
        frames_layout = QHBoxLayout()
        frames_layout.setContentsMargins(0, 0, 0, 0)
        
        self.left_frame = LeftFrame(left_frame_width, frames_height,self.vc,self.systemSettingDetails)
        self.left_frame.setContentsMargins(0, 0, 0, 0)
        frames_layout.addWidget(self.left_frame)
        #self.left_frame.vc_list.itemSelectionChanged.connect(self.onVCSelectionChanged)
        camDetails=None
        right_frame = RightFrame(right_frame_width, frames_height,self.TransactionTypeDetails,camDetails)
        right_frame.setContentsMargins(0, 0, 0, 0)
        frames_layout.addWidget(right_frame)

       
        main_layout.addLayout(frames_layout)


        footer_widget = Footer(main_window_width, 50)
        main_layout.addWidget(footer_widget)

        self.setLayout(main_layout)

    def onVCSelectionChanged(self):
        selected_items = self.left_frame.vc_list.selectedItems()
        if selected_items:
            selected_item = selected_items[0]
            item_id = selected_item.data(32)
            show_custom_message_box("Selected Item",f"Selected Item ID: {item_id}",'inf')

    def logout(self):
        confirmation=confirmation_box("Logout","Are you sure you want to logout?")
        if confirmation == True:
            self.close()
            #self.switch_window.emit()