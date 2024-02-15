from PySide6.QtWidgets import QWidget, QFrame, QHBoxLayout, QVBoxLayout
from GUI.widgets.CameraLiveViewFrame import CameraLiveView
from GUI.widgets.RightBottomFrame import RecentTransactionBox, WimDataQueueBox
from GUI.widgets.RightTopFrame import CurrentTransactionBox
from GUI.widgets.TransactionTypeFrame import TransactionTypeBox

class RightFrame(QFrame):
    def __init__(self, width, height,TransactionTypeDetails,camDetails):
        super().__init__()
        self.initUI(width, height,TransactionTypeDetails,camDetails)

    def initUI(self, width, height,TransactionTypeDetails,camDetails):
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
        top_widget.setFixedHeight(top_height)  # Set the height
        top_widget.setFixedWidth(width)    # Set the width
       
        top_layout = QHBoxLayout() 
        top_layout.setContentsMargins(0, 0, 0, 0)
        top_layout.setSpacing(0)

        transaction_type_box = TransactionTypeBox(top_width,top_height,TransactionTypeDetails)
        current_transaction_box = CurrentTransactionBox(top_width,top_height)
        lane_view_box = CameraLiveView(top_width,top_height,camDetails)
        top_layout.addWidget(transaction_type_box)
        top_layout.addWidget(current_transaction_box)
        top_layout.addWidget(lane_view_box)

        top_widget.setLayout(top_layout)
        layout.addWidget(top_widget)

        bot_widget = QWidget()
        bot_widget.setFixedHeight(bot_height)
        bot_widget.setFixedWidth(width)

        bot_layout = QHBoxLayout() 
        bot_layout.setContentsMargins(0, 0, 0, 0)
        bot_layout.setSpacing(0)

        wim_data_queue_box = WimDataQueueBox(bot_width,bot_height)
        recent_transaction_box = RecentTransactionBox(bot_width,bot_height)
        bot_layout.addWidget(wim_data_queue_box)
        bot_layout.addWidget(recent_transaction_box)

        bot_widget.setLayout(bot_layout)
        layout.addWidget(bot_widget)
