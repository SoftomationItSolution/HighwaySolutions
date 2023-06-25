import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { UserConfigurationPopupComponent } from '../user-configuration-popup/user-configuration-popup.component';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
declare var $: any;
@Component({
  selector: 'app-user-configuration',
  templateUrl: './user-configuration.component.html',
  styleUrls: ['./user-configuration.component.css']
})
export class UserConfigurationComponent implements OnInit {
  DevicesData: any;
  ErrorData: any;
  LogedRoleId;
  PermissionData: any;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private emitService: EmittersService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.emitService.getRoleDetails();
    this.emitService.PageRefresh.subscribe(
      (visibility: boolean) => {
        if (visibility) {
          this.GetAllData();
        }
      });
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 10,
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
  ngOnInit(): void {

  }
 
 
  GetAllData() {
    this.spinner.show();
    this.dbService.UserConfigurationGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponseData;
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
      dialogConfig.data = { action: 'Save', UserId: 0 };
      this.dialog.open(UserConfigurationPopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
  onRowEditInit(data: any) {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', UserId: data.UserId };
      this.dialog.open(UserConfigurationPopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

}
