import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { RoleConfigurationPopupComponent } from '../role-configuration-popup/role-configuration-popup.component';
import { RolePermissionPopupComponent } from '../role-permission-popup/role-permission-popup.component';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
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
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private emitService: EmittersService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.emitService.getRoleDetails();
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

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 9,
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
        if (this.PermissionData.DataAdd == 1 || this.PermissionData.DataUpdate == 1) {
          this.UpdatePermission = 1;
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

  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 175);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 175);
  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
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
    dialogConfig.data = { action: 'Save', RoleId: 0 };
    this.dialog.open(RoleConfigurationPopupComponent, dialogConfig);
  }
  onRowEditInit(data: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '450px';
      dialogConfig.data = { action: 'Update', RoleId: data.RoleId };
      this.dialog.open(RoleConfigurationPopupComponent, dialogConfig);
    }
    else{
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

  onRowPermissionInit(data: any) {
    if (this.DataUpdate == 1 || this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '450px';
      dialogConfig.data = { action: 'Update', RoleId: data.RoleId, UpdatePermission: this.UpdatePermission };
      this.dialog.open(RolePermissionPopupComponent, dialogConfig);
    }
    else{
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

}
