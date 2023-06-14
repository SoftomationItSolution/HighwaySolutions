import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { AnyCatcher } from 'rxjs/internal/AnyCatcher';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { ControlRoomDevicePopupComponent } from '../control-room-device-popup/control-room-device-popup.component';
import { ControlRoomPopupComponent } from '../control-room-popup/control-room-popup.component';
declare var $: any;
@Component({
  selector: 'app-control-room-configuration',
  templateUrl: './control-room-configuration.component.html',
  styleUrls: ['./control-room-configuration.component.css']
})
export class ControlRoomConfigurationComponent implements OnInit {
  ErrorData:any;
  PermissionData:any;
  DevicesData:any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.LogedUserId = this.emitService.getUserDetails();
      this.emitService.PageRefresh.subscribe(
        (visibility: boolean) => {
          if (visibility) {
            this.GetAllData();
          }
        });
      this.emitService.InnerHeight.subscribe(
          (innerHeight: any) => {
            this.innerHeight = innerHeight;
            this.SetPageHeight();
          });
      this.GetPermissionData();
     }

  ngOnInit(): void {
  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 175);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 175);
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
    this.DataAdd = this.PermissionData.DataAdd;
    this.DataUpdate = this.PermissionData.DataUpdate;
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

GetAllData() {
  this.spinner.show();
  this.dbService.ControlRoomGetByUserId(this.LogedUserId).subscribe(
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
NewEntry() {
  const dialogConfig = new MatDialogConfig();
  dialogConfig.disableClose = true;
  dialogConfig.autoFocus = true;
  dialogConfig.width = '60%';
  dialogConfig.data = { action: 'Save', EntryId: 0, PermissionData: this.PermissionData};
  this.dialog.open(ControlRoomPopupComponent, dialogConfig);
}
onRowEditInit(data:any) {
  const dialogConfig = new MatDialogConfig();
  dialogConfig.disableClose = true;
  dialogConfig.autoFocus = true;
  dialogConfig.width = '60%';
  dialogConfig.data = { action: 'Update', EntryId: data.EntryId, PermissionData: this.PermissionData};
  this.dialog.open(ControlRoomPopupComponent, dialogConfig);
}
onDeviceTypeList(data:any) {
  const dialogConfig = new MatDialogConfig();
  dialogConfig.disableClose = true;
  dialogConfig.autoFocus = true;
  dialogConfig.width = '60%';
  dialogConfig.data = { action: 'Update', ControlRoomId: data.EntryId, UpdatePermission: this.DataUpdate, ControlRoomName: data.ControlRoomName };
  this.dialog.open(ControlRoomDevicePopupComponent, dialogConfig);
}

}
