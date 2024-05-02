from PySide6.QtWidgets import QWidget, QFrame, QHBoxLayout, QVBoxLayout
from GUI.widgets.CameraViewFrame import CameraLiveView
from GUI.widgets.RecentTransactionFrame import RecentTransactionBox
from GUI.widgets.CurrentTransactionFrame import CurrentTransactionBox
from GUI.widgets.TransactionTypeFrame import TransactionTypeBox
from GUI.widgets.WimDataFrame import WimDataQueueBox
#,TransactionTypeDetails,camDetails,toll_fare,user_Details,systemSettingDetails,system_ip
class RightFrame(QFrame):
    def __init__(self, width, height,logger):
        super().__init__()
        self.initUI(width, height,logger)

    def initUI(self, width, height,logger):
        self.logger = logger
        self.setStyleSheet("border: none;border-right: 1px solid white;")
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

        self.wim_data_queue_box = WimDataQueueBox(bot_width,bot_height)
        self.recent_transaction_box = RecentTransactionBox(bot_width,bot_height)
        bot_layout.addWidget(self.wim_data_queue_box)
        bot_layout.addWidget(self.recent_transaction_box)

        bot_widget.setLayout(bot_layout)
        layout.addWidget(bot_widget)