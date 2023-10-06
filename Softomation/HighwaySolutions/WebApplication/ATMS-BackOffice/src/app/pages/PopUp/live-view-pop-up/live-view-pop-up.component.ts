import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-live-view-pop-up',
  templateUrl: './live-view-pop-up.component.html',
  styleUrls: ['./live-view-pop-up.component.css']
})
export class LiveViewPopUpComponent {
  PageTitle: string = 'Live View'
  CameraDetails: any
  constructor(public Dialogref: MatDialogRef<LiveViewPopUpComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any) {
    this.CameraDetails = parentData.data;
  }
  ClosePoup() { this.Dialogref.close(false); }
}
