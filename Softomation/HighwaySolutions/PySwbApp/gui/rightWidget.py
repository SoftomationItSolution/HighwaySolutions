from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QGroupBox, QLineEdit, QFormLayout,QPushButton,
    QCheckBox
)
from PySide6.QtCore import Qt

class RightWidget(QWidget):
    def __init__(self,system_ip, wh=250):
        super().__init__()
        self.setContentsMargins(0, 0, 0, 0)
        self.setFixedWidth(wh)
        self.wim_data=None
        self.trans_data=None
        self.swb_detail=None
        self.system_ip=system_ip
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        group_box = QGroupBox("Selected Transaction")
        group_box.setContentsMargins(0, 0, 0, 0)

        group_box_layout = QFormLayout()
        group_box_layout.setLabelAlignment(Qt.AlignLeft)

        # Create input fields
        self.lane_number = QLineEdit()
        self.vehicle_class = QLineEdit()
        self.sub_class = QLineEdit()
        self.permissible_weight = QLineEdit("0")
        self.actual_weight = QLineEdit("0")
        self.overweight_checkbox = QCheckBox("Is Overweight")
        self.overweight_amount = QLineEdit("0")
        self.excess_weight = QLineEdit("0")
        self.overweight_checkbox.setEnabled(False)

        self.submit_data = QPushButton("Submit")
        self.submit_data.setDefault(True)
        # Make all text boxes read-only
        for widget in [
            self.lane_number, self.vehicle_class, self.sub_class,
            self.permissible_weight, self.actual_weight,self.excess_weight
        ]:
            widget.setReadOnly(True)

        # Add widgets to the layout
        group_box_layout.addRow("Lane Number:", self.lane_number)
        group_box_layout.addRow("Vehicle Class:", self.vehicle_class)
        group_box_layout.addRow("Sub Class:", self.sub_class)
        group_box_layout.addRow("Permissible Weight:", self.permissible_weight)
        group_box_layout.addRow("Actual Weight:", self.actual_weight)
        group_box_layout.addRow("Excess Weight:", self.excess_weight)
        group_box_layout.addRow(self.overweight_checkbox)
        group_box_layout.addRow("Overweight Amount:", self.overweight_amount)
        group_box_layout.addRow(self.submit_data)

        group_box.setLayout(group_box_layout)
        layout.addWidget(group_box)

    def bind_transaction_data(self, data: dict):
        self.trans_data=data
        self.lane_number.setText(data.get("LaneNumber", ""))
        self.vehicle_class.setText(data.get("VehicleClassName", ""))
        self.sub_class.setText(data.get("VehicleSubClassName", ""))
        self.permissible_weight.setText(str(data.get("PermissibleVehicleWeight", 0)))
        self.get_access_weight()


    def update_swb_details(self,data):
        self.swb_detail=data
    
    def get_wim_data(self,data: dict):
        if data:
            self.wim_data=data
            self.actual_weight.setText(str(data.get("TotalWeight", "")))
            self.get_access_weight()

    def get_access_weight(self):
        try:
            actual = float(self.actual_weight.text())
            permissible = float(self.permissible_weight.text())
            excess_weight = max(0, actual - permissible)
            self.overweight_checkbox.setChecked(actual > permissible)
            self.excess_weight.setText(str(round(excess_weight, 2)))
        except ValueError:
            self.excess_weight.setText("0")
            self.overweight_checkbox.setChecked(False)

    def rest_data(self):
        self.lane_number.setText("")
        self.vehicle_class.setText("")
        self.sub_class.setText("")
        self.permissible_weight.setText("0")
        self.actual_weight.setText("0")
        self.overweight_amount.setText("0")
        self.excess_weight.setText("0")
        self.overweight_checkbox.setEnabled(False)
        self.wim_data=None
        self.trans_data=None