import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-equipment-details-popup',
  templateUrl: './equipment-details-popup.component.html',
  styleUrls: ['./equipment-details-popup.component.css']
})
export class EquipmentDetailsPopupComponent implements OnInit {
  DevicesData: any;
  ErrorData: any;
  TotalCount:0 | undefined;
  constructor(@Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<EquipmentDetailsPopupComponent>,
    public dialog: MatDialog) {
    this.DevicesData = parentData.EquipmentList;
  }
  ngOnInit() {
    
  }
  ClosePoup() { this.Dialogref.close(false); }
}