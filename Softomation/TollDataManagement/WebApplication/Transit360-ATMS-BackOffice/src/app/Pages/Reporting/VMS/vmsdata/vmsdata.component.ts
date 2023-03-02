import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { VMSListPopupComponent } from '../vmslist-popup/vmslist-popup.component';
import { VMSPopupComponent } from '../vmspopup/vmspopup.component';

@Component({
  selector: 'app-vmsdata',
  templateUrl: './vmsdata.component.html',
  styleUrls: ['./vmsdata.component.css']
})
export class VMSDataComponent implements OnInit {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  LogedRoleId;
  LogedUserId;
  DevicesData: any;
  ErrorData: any;
  currentRoute;
  PermissionData: any;
  ApiCallUrl;
  constructor(public dialog: MatDialog, private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.LogedUserId = this.emitService.getUserDetails();
      this.emitService.PageRefresh.subscribe(
        (visibility: boolean) => {
          if (visibility) {
            this.GetDeviceData();
          }
        });
  }

  ngOnInit() {
   this.GetPermissionData();
   this.ApiCallUrl = this.dbService.GetBasePath();
   if (this.ApiCallUrl == null) {
    this.ApiCallUrl = this.dbService.GetBasePath();
   }
  }

  GetDeviceData() {
    this.spinner.show();
    this.dbService.VMSGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 9,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponceData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.emitService.unauthorized();
        }
        this.GetDeviceData();
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
    dialogConfig.data = { action: 'Save', EntryId: 0, Permission: this.DataUpdate };
    this.dialog.open(VMSPopupComponent, dialogConfig);
  }

  onRowEditInit(TransactionRowData) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'Update', EntryId: TransactionRowData.EntryId, Permission: this.DataUpdate };
    this.dialog.open(VMSPopupComponent, dialogConfig);
  }

  ViewVMSList(TransactionRowData) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'display', VmsList: TransactionRowData.VmsList };
    this.dialog.open(VMSListPopupComponent, dialogConfig);
  }

  ViewImage(imageName) {
    if (this.ApiCallUrl == null) {
      this.ApiCallUrl = this.dbService.GetBasePath();
    }
    let win = window.open(this.ApiCallUrl + '\VMS\\image\\' + imageName, '', 'width=600,height=600');
    win.focus();
  }
}
