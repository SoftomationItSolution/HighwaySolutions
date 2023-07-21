import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { IncidentHistoryComponent } from '../incident-history/incident-history.component';
import { IncidentAssigneComponent } from '../incident-assigne/incident-assigne.component';

@Component({
  selector: 'app-incident-closed',
  templateUrl: './incident-closed.component.html',
  styleUrls: ['./incident-closed.component.css']
})
export class IncidentClosedComponent {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ClosedData:any;
  constructor(private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService,public dialog: MatDialog) {
    this.LogedRoleId = this.dm.getRoleId();
  }
  
  ngOnInit() {
    this.GetPermissionData();
    this.GetClosed();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 27,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.dm.unauthorized();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetClosed() {
    this.spinner.show();
    this.dbService.IMSGetClosed(24).subscribe(
      data => {
        this.ClosedData = data.ResponseData;
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  onMidiaView(TransactionRowData: any){
    var obj={
      PageTitle:"Incident media-("+TransactionRowData.IncidentId+")",
      ImageData:[{
        ImagePath:TransactionRowData.IncidentImagePath
      }],
      VideoData:[{
        VideoPath:TransactionRowData.IncidentVideoPath
      }],
      AudioData:[{
        AudioPath:TransactionRowData.IncidentAudioPath
      }]
    }
    this.dm.MediaView(obj);
  }

  onActionHistory(TransactionRowData: any){
    if(TransactionRowData.ActionHistoryDetails.length>0){
      const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '60%';
        dialogConfig.height = '500px';
        dialogConfig.data = { action: 'Action History', IncidentId: TransactionRowData.IncidentId };
        this.dialog.open(IncidentHistoryComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'No action history found!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }
  onReAssigned(TransactionRowData: any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.height = '331px';
    dialogConfig.data = { action: 'Manage Assigne', IncidentId: TransactionRowData.IncidentId };
    this.dialog.open(IncidentAssigneComponent, dialogConfig);
}
}
