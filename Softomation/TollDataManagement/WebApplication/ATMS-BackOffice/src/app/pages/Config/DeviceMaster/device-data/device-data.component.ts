import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { DevicePopupComponent } from '../device-popup/device-popup.component';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
declare var $: any;
@Component({
  selector: 'app-device-data',
  templateUrl: './device-data.component.html',
  styleUrls: ['./device-data.component.css']
})
export class DeviceDataComponent implements OnInit {
  MapStatus = true;
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  DevicesData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private emitService: EmittersService, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.emitService.getRoleDetails();
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
    this.dbService.EquipmentDetailsGetAll().subscribe(
      data => {
        this.DevicesData = data.ResponseData;
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
      MenuId: 4,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
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
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Save', EquipmentId: 0 };
      this.dialog.open(DevicePopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(TransactionRowData: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', EquipmentId: TransactionRowData.EquipmentId };
      this.dialog.open(DevicePopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
}
