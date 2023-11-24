import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { SystemVehicleClassPopupComponent } from '../system-vehicle-class-popup/system-vehicle-class-popup.component';

@Component({
  selector: 'app-system-vehicle-class',
  templateUrl: './system-vehicle-class.component.html',
  styleUrls: ['./system-vehicle-class.component.css']
})
export class SystemVehicleClassComponent implements OnInit {
  DevicesData: any;
  PermissionData:any;
  ErrorData: any;
  LogedRoleId=0;
  LogedUserId=0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  constructor(public dialog: MatDialog,private spinner: NgxSpinnerService,private dm: DataModel,
    private dbService: apiIntegrationService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: 0,
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
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }
  ngOnInit(): void {

  }
 
 
  GetAllData() {
    this.spinner.show();
    this.dbService.SystemVehicleClassGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

   NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '330px';
      dialogConfig.data = { action: 'Save', SystemVehicleClassId: 0 };
      const dialogRef = this.dialog.open(SystemVehicleClassPopupComponent, dialogConfig);
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
      dialogConfig.height = '330px';
      dialogConfig.data = { action: 'Update', SystemVehicleClassId: data.SystemVehicleClassId };
      const dialogRef = this.dialog.open(SystemVehicleClassPopupComponent, dialogConfig);
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


