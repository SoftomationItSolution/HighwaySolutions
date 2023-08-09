import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { IncidentPopUpComponent } from '../incident-pop-up/incident-pop-up.component';

@Component({
  selector: 'app-incident-data',
  templateUrl: './incident-data.component.html',
  styleUrls: ['./incident-data.component.css']
})
export class IncidentDataComponent implements OnInit {
  MapStatus = true;
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  TMSId;
  UserId;
  IncidentData: any;
  ErrorData: any;
  currentRoute;
  PermissionData: any;
  LogedRoleId;
  constructor(public dialog: MatDialog, private emitService: EmittersService, private dbService: ApiService,
              private spinner: NgxSpinnerService) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.emitService.PageRefresh.subscribe(
        (visibility: boolean) => {
          if (visibility) {
            this.GetAllData();
          }
        });
  }

  ngOnInit() {
    this.GetPermissionData();
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.IncidentDataGetAll().subscribe(
      data => {
        this.IncidentData = data.ResponceData;
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 1,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponceData;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.emitService.unauthorized();
        }
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  NewEntry() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'Save', EntryId: 0, PermissionData: this.PermissionData };
    this.dialog.open(IncidentPopUpComponent, dialogConfig);
  }

  onRowEditInit(TransactionRowData) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'Update', EntryId: TransactionRowData.EntryId, PermissionData: this.PermissionData };
    this.dialog.open(IncidentPopUpComponent, dialogConfig);
  }

}
