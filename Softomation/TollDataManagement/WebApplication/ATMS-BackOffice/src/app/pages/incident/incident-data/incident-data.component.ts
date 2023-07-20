import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { CreateIncidentComponent } from '../create-incident/create-incident.component';
import { IncidentHistoryComponent } from '../incident-history/incident-history.component';

@Component({
  selector: 'app-incident-data',
  templateUrl: './incident-data.component.html',
  styleUrls: ['./incident-data.component.css']
})
export class IncidentDataComponent implements OnInit {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  InProgressData:any;
  PendingData:any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  TabId=0
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
  }
  
  ngOnInit() {
    this.GetPermissionData();
  }
  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 26,
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
        this.GetPending();
        this.GetInProgress();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetPending() {
    this.spinner.show();
    this.dbService.IMSGetPending(24).subscribe(
      data => {
        this.PendingData = data.ResponseData;
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

  GetInProgress() {
    this.spinner.show();
    this.dbService.IMSGetInProgress(24).subscribe(
      data => {
        this.InProgressData = data.ResponseData;
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

  tabChange(id:number){
    if(id==0)
      this.GetPending();
    else
      this.GetInProgress()
    this.TabId=id;
  }

  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Save', IncidentId: '' };
      this.dialog.open(CreateIncidentComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(TransactionRowData: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', IncidentId: TransactionRowData.IncidentId };
      this.dialog.open(CreateIncidentComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
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
    const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = TransactionRowData;
      this.dialog.open(IncidentHistoryComponent, dialogConfig);
  }
  onReAssigned(TransactionRowData: any){

  }
  onStatusChanged(TransactionRowData: any){

  }
}

