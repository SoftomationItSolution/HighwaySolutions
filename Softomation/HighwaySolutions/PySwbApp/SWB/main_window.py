from PySide6.QtWidgets import QApplication,QWidget, QVBoxLayout,QDialog,QMessageBox
from PySide6.QtCore import Signal,Qt
from SWB.middle_container import MiddleContainer
from SWB.footer_section import FooterSection
from SWB.header_section import HeaderSection
from SWB.list_Popup import ListPopup
from utils.wim_sock_connect import WimSocktConnect
from pubsub import pub
from utils.log_master import CustomLogger

class MainWindow(QWidget):
    logout_signal = Signal()
    def __init__(self, default_directory, plaza_config,script_dir):
        super().__init__()
        self.default_directory = default_directory
        self.plaza_config = plaza_config
        self.script_dir=script_dir
        self.logger = CustomLogger(self.default_directory, 'swb_app')
        self.apipath = self.plaza_config["api_url"] + "Softomation/FastTrackHighway-TMS/"
        self.recording_thread=None
        self.init_ui()

    def init_ui(self):
        self.setWindowTitle("SWB Application")
        self.setGeometry(100, 100, 800, 600)  # Full-size window
        screen_rect = QApplication.primaryScreen().availableGeometry()
        screen_height = screen_rect.height()
        screen_width = screen_rect.width()
        # Create main layout
        main_layout = QVBoxLayout(self)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0)

        # Header
        self.header = HeaderSection(height=60)
        self.header.logout_signal.connect(self.handle_logout)
        main_layout.addWidget(self.header,alignment=Qt.AlignTop)

        # Middle
        self.middle = MiddleContainer((screen_height-110),(screen_width),self.apipath,self.script_dir,self.default_directory)
        main_layout.addWidget(self.middle, alignment=Qt.AlignTop)
        self.middle.left_section.vc_list.itemSelectionChanged.connect(self.onVCSelectionChanged)
        self.middle.right_section.connect_button.clicked.connect(self.on_wim_connect)
        self.middle.right_section.disconnect_button.clicked.connect(self.on_wim_disconnect)

        # Footer
        self.footer = FooterSection(height=50,title="SWB Application")
        main_layout.addWidget(self.footer,alignment=Qt.AlignBottom)
        #self.setStyleSheet("border: 1px solid white; color: white;")
        pub.subscribe(self.get_wim_status, "wim_status")
        pub.subscribe(self.get_wim_data, "wim_data")
    
    def handle_logout(self):
        self.logout_signal.emit() 
        self.close()

    def set_user_details(self, user_data):
        self.userData = user_data
        self.header.name_label.setText(user_data["LoginId"])

    def show(self):
        super().showMaximized()

    def onVCSelectionChanged(self):
        try:
            selected_items = self.middle.left_section.vc_list.selectedItems()
            if selected_items:
                selected_item = selected_items[0]
                item_id = selected_item.data(32)
                item_name = selected_item.text()
                self.update_vc(item_id,item_name)
                filtered_data = list(filter(lambda item: item['SystemVehicleClassId'] == item_id, self.middle.left_section.systemVehicleClass))
                if len(filtered_data)>0:
                    subClass=filtered_data[0]["SystemSubClassIds"]
                    subClassList=subClass.split(',')
                    if len(subClassList)>1:
                        subClass_List=[]
                        for main_class in subClassList:
                            filtered_data_1 = list(filter(lambda item: str(item['FasTagVehicleClassId']) == str(main_class), self.middle.left_section.fasTagVehicleClass))
                            if len(filtered_data_1)>0:
                                subClass_List.append(filtered_data_1[0])
                        popup = ListPopup(self.default_directory,subClass_List)
                        if popup.exec() == QDialog.Accepted:
                            selected_item = popup.selected_item
                            if selected_item:
                                item_id = selected_item.data(32)
                                item_name = selected_item.text()
                                self.update_svc(item_id,item_name)
        except Exception as e:
           QMessageBox.critical(self, "Error", f"Failed to onVCSelectionChanged: {str(e)}")

    def update_vc(self,id,name):
        try:
            self.middle.middle_section.top_section.vehicle_class_textbox.setText(name)
            self.middle.middle_section.top_section.vehicle_class_Id=id
        except Exception as e:
           self.logger.logError(f"Error in update_vc {str(e)}")

    def update_svc(self,id,name):
        try:
            self.middle.middle_section.top_section.vehicle_subclass_textbox.setText(name)
            self.middle.middle_section.top_section.sub_vehicle_class_Id=id
            filtered_data_1 = list(filter(lambda item: str(item['FasTagVehicleClassId']) == str(id), self.middle.left_section.fasTagVehicleClass))
            if len(filtered_data_1)>0:
                self.middle.middle_section.top_section.permissible_weight_textbox.setText(str(filtered_data_1[0]["PermissibleWeight"]))
            else:
                self.middle.middle_section.top_section.permissible_weight_textbox.setText("0")
        except Exception as e:
           self.logger.logError(f"Error in update_svc {str(e)}")

    def on_wim_connect(self):
        try:
            self.recording_thread = WimSocktConnect(self.default_directory,self.middle.right_section.ip_input.text(), int(self.middle.right_section.port_input.text()))
            self.recording_thread.start()
            self.middle.right_section.connect_button.setEnabled(False)
            self.middle.right_section.disconnect_button.setEnabled(True)
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to connect to the server: {str(e)}")

    def on_wim_disconnect(self):
        try:
            if self.recording_thread is not None:
                self.recording_thread.stop()
            self.middle.right_section.connect_button.setEnabled(True)
            self.middle.right_section.disconnect_button.setEnabled(False)
        except Exception as e:
           QMessageBox.critical(self, "Error", f"Failed to disconnect to the server: {str(e)}")


    def get_wim_data(self,transactionInfo):
        try:
            print(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Error in get_wim_data {str(e)}")

    def get_wim_status(self,transactionInfo):
        try:
            print(transactionInfo)
        except Exception as e:
            self.logger.logError(f"Error in get_wim_status {str(e)}")