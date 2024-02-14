from PySide6.QtWidgets import QHBoxLayout, QFrame
from GUI.widgets.right_widget import RightWidget
from GUI.widgets.vc_widget import VCWidget


class Dashboard(QFrame):
    def __init__(self, height, width):
        super().__init__()
        self.setFixedHeight(height)
        self.setFixedWidth(width)
        self.setContentsMargins(0, 0, 0, 0)
        self.layout = QHBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.layout.setSpacing(0)
        left_width=250
        right_width=width-left_width-25

        self.vc_panel = VCWidget(height,left_width)
        self.layout.addWidget(self.vc_panel)

        self.right_panel = RightWidget(height,right_width)
        self.layout.addWidget(self.right_panel)

        # self.right_panel = verticalBox(height, right_width)
        # self.layout.addWidget(self.right_panel)

        # right_panel_top_height=height/2
        # right_panel_top = HorizontalBox(right_panel_top_height,right_width)
        # self.right_panel.layout.addWidget(right_panel_top, alignment=Qt.AlignTop)

        # right_panel_top_left_width=right_width/3
        # right_panel_top_left  = verticalBox(right_panel_top_height, right_panel_top_left_width)
        # right_panel_top.layout.addWidget(right_panel_top_left)

        # right_panel_top_middle  = verticalBox(right_panel_top_height, right_panel_top_left_width)
        # right_panel_top.layout.addWidget(right_panel_top_middle)

        # right_panel_top_right  = verticalBox(right_panel_top_height, right_panel_top_left_width)
        # right_panel_top.layout.addWidget(right_panel_top_right)
        
        
        # right_panel_bottom = HorizontalBox(right_panel_top_height,right_width)
        # self.right_panel.layout.addWidget(right_panel_bottom, alignment=Qt.AlignTop)
        
        # right_panel_bottom_left_width=right_width/2

        # right_panel_top_left  = verticalBox(right_panel_top_height, right_panel_bottom_left_width)
        # right_panel_bottom.layout.addWidget(right_panel_top_left)

        # right_panel_top_middle  = verticalBox(right_panel_top_height, right_panel_bottom_left_width)
        # right_panel_bottom.layout.addWidget(right_panel_top_middle)