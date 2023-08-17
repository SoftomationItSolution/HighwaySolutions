import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { RoleConfigurationPopupComponent } from '../role-configuration-popup/role-configuration-popup.component';
import { RolePermissionPopupComponent } from '../role-permission-popup/role-permission-popup.component';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
declare var $: any;
@Component({
  selector: 'app-role-configuration',
  templateUrl: './role-configuration.component.html',
  styleUrls: ['./role-configuration.component.css']
})
export class RoleConfigurationComponent implements OnInit {
  DevicesData: any;
  ErrorData: any;
  LogedRoleId;
  PermissionData: any;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  UpdatePermission = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, 
    private dm: DataModel,private spinner: NgxSpinnerService) {
      this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();

  }
  
  GetPermissionData() {
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId:0,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByMenu(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.dm.unauthorized();
        }
        if (this.PermissionData.DataAdd == 1 || this.PermissionData.DataUpdate == 1) {
          this.UpdatePermission = 1;
        }
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ngOnInit(): void {

  }

  GetAllData() {
    this.spinner.show();
    this.dbService.RoleConfigurationGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '331px';
      dialogConfig.data = { action: 'Save', RoleId: 0 };
      const dialogRef = this.dialog.open(RoleConfigurationPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetAllData();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }
  onRowEditInit(data: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '331px';
      dialogConfig.data = { action: 'Update', RoleId: data.RoleId };
      const dialogRef = this.dialog.open(RoleConfigurationPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetAllData();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowPermissionInit(data: any) {
    if (this.DataUpdate == 1 || this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '484px';
      dialogConfig.data = { action: 'Update', RoleId: data.RoleId, UpdatePermission: this.UpdatePermission };
      const dialogRef = this.dialog.open(RolePermissionPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetAllData();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

}
