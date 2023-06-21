import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { VehicleClassPopupComponent } from '../vehicle-class-popup/vehicle-class-popup.component';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
declare var $: any;

@Component({
  selector: 'app-vehicle-class-data',
  templateUrl: './vehicle-class-data.component.html',
  styleUrls: ['./vehicle-class-data.component.css']
})
export class VehicleClassDataComponent implements OnInit {
  ErrorData:any;
  PermissionData:any;
  VehicleClassData:any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private emitService: EmittersService,
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
    this.GetAllData();
  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 100);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 100);
  }
GetPermissionData() {
this.spinner.show();
const Obj = {
  MenuId: 8,
  RoleId: this.LogedRoleId
};
this.dbService.RolePermissionGetByEventId(Obj).subscribe(
  data => {
    this.spinner.hide();
    this.PermissionData = data.ResponseData;
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
  this.dbService.VehicleClassGetAll().subscribe(
    data => {
      this.spinner.hide();
      this.VehicleClassData = data.ResponseData;
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
  dialogConfig.height = '450px';
  dialogConfig.data = { action: 'Save', EntryId: 0, PermissionData: this.PermissionData};
  this.dialog.open(VehicleClassPopupComponent, dialogConfig);
}
onRowEditInit(data:any) {
  const dialogConfig = new MatDialogConfig();
  dialogConfig.disableClose = true;
  dialogConfig.autoFocus = true;
  dialogConfig.width = '60%';
  dialogConfig.height = '450px';
  dialogConfig.data = { action: 'Update', EntryId: data.EntryId, PermissionData: this.PermissionData};
  this.dialog.open(VehicleClassPopupComponent, dialogConfig);
}

}
