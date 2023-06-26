import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { PackagesPopupComponent } from '../packages-popup/packages-popup.component';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
declare var $: any;
@Component({
  selector: 'app-packages-details',
  templateUrl: './packages-details.component.html',
  styleUrls: ['./packages-details.component.css']
})
export class PackagesDetailsComponent implements OnInit {
  ErrorData: any;
  PermissionData: any;
  DevicesData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private emitService: EmittersService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.emitService.getRoleDetails();
    this.LogedUserId = this.emitService.getUserDetails();
    this.emitService.PageRefresh.subscribe(
      (visibility: boolean) => {
        if (visibility) {
          this.GetAllData();
        }
      });
    this.GetPermissionData();
  }

  ngOnInit(): void {
  }
  
  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 7,
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
    this.dbService.PackagesGetAll().subscribe(
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
      dialogConfig.data = { action: 'Save', PackageId: 0 };
      this.dialog.open(PackagesPopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(data: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', PackageId: data.PackageId };
      this.dialog.open(PackagesPopupComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
}
