from PySide6.QtWidgets import QWidget, QFrame, QHBoxLayout, QVBoxLayout
from GUI.widgets.CameraViewFrame import CameraLiveView
from GUI.widgets.RFIDDataFrame import RfidDataQueueBox
from GUI.widgets.RecentTransactionFrame import RecentTransactionBox
from GUI.widgets.CurrentTransactionFrame import CurrentTransactionBox
from GUI.widgets.TransactionTypeFrame import TransactionTypeBox
from GUI.widgets.WimDataFrame import WimDataQueueBox
class RightFrame(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        self.logger = logger
        self.setStyleSheet("border: none;")
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        layout = QVBoxLayout(self)
        layout.setSpacing(0)
        layout.setContentsMargins(0, 0, 0, 0)
        top_height = int(height / 2)
        bot_height = height - top_height
        top_width = int(width / 3)
        bot_width = int(width / 2)
        
        top_widget = QWidget()
        top_widget.setFixedHeight(top_height)  
        top_widget.setFixedWidth(width)
       
        top_layout = QHBoxLayout() 
        top_layout.setContentsMargins(0, 0, 0, 0)
        top_layout.setSpacing(0)

        self.transaction_type_box = TransactionTypeBox(top_width,top_height,self.logger)
        top_layout.addWidget(self.transaction_type_box)

        self.current_transaction_box = CurrentTransactionBox(top_width,top_height,self.logger)
        top_layout.addWidget(self.current_transaction_box)

        self.lane_view_box = CameraLiveView(top_width,top_height,self.logger)
        top_layout.addWidget(self.lane_view_box)

        top_widget.setLayout(top_layout)
        layout.addWidget(top_widget)

        bot_widget = QWidget()
        bot_widget.setFixedHeight(bot_height)
        bot_widget.setFixedWidth(width)

        bot_layout = QHBoxLayout() 
        bot_layout.setContentsMargins(0, 0, 0, 0)
        bot_layout.setSpacing(0)

        v_widget = QWidget()
        queue_layout = QVBoxLayout() 
        queue_layout.setContentsMargins(0, 0, 0, 0)
        queue_layout.setSpacing(0)

        queue_height=int(bot_height/2)
        self.wim_data_queue_box = WimDataQueueBox(bot_width,queue_height,self.logger)
        self.rfid_data_queue_box = RfidDataQueueBox(bot_width,bot_height-queue_height,self.logger)
        self.recent_transaction_box = RecentTransactionBox(bot_width,bot_height,self.logger)
        
        queue_layout.addWidget(self.wim_data_queue_box)
        queue_layout.addWidget(self.rfid_data_queue_box)

        v_widget.setLayout(queue_layout)

        
        bot_layout.addWidget(v_widget)
        bot_layout.addWidget(self.recent_transaction_box)

        bot_widget.setLayout(bot_layout)
        layout.addWidget(bot_widget)