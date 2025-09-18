import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DBConfigurationPopupComponent } from '../db-configuration-popup/db-configuration-popup.component';
import { FileUploadPopupComponent } from '../file-upload-popup/file-upload-popup.component';


@Component({
  selector: 'app-db-configuration',
  templateUrl: './db-configuration.component.html',
  styleUrls: ['./db-configuration.component.css']
})
export class DBConfigurationComponent implements OnInit {
  DevicesData: any;
  PermissionData:any;
  ErrorData: any;
  LogedRoleId=0;
  LogedUserId=0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  FileUploadData:any;
  FileBackUpData:any;
  FileTypeMaster:any;
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
        else
          this.GetFileUploadDetail();
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
  GetFileUploadDetail() {
    this.spinner.show();
    this.dbService.FileUploadDetailGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.FileUploadData = data.ResponseData;
        this.GetBackUpDBDetail()
      },
      (error) => {
        this.spinner.hide();
        this.GetBackUpDBDetail()
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

  GetBackUpDBDetail() {
    this.spinner.show();
    this.dbService.FileBackUpDetailGetAll().subscribe(
      data => {
        this.spinner.hide();
        const rdData=data.ResponseData;
        this.FileBackUpData = rdData[0];
        this.FileTypeMaster = rdData[1];
        
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

  AddFileUploadDetails(){
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '472px';
      dialogConfig.data = { action: 'Save', FileUploadDetailId: 0 };
      const dialogRef = this.dialog.open(FileUploadPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetFileUploadDetail();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onFileRowEditInit(data: any){
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '472px';
      dialogConfig.data = { action: 'Save', FileUploadDetailId: data.FileUploadDetailId };
      const dialogRef = this.dialog.open(FileUploadPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetFileUploadDetail();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

   AddDatabaseDetails() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '458px';
      dialogConfig.data = { action: 'Save', FileBackUpDetailId: 0,FileTypeMaster:this.FileTypeMaster };
      const dialogRef = this.dialog.open(DBConfigurationPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetBackUpDBDetail();
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
      dialogConfig.height = '458px';
      dialogConfig.data = { action: 'Update', FileBackUpDetailId: data.FileBackUpDetailId,FileTypeMaster:this.FileTypeMaster };
      const dialogRef = this.dialog.open(DBConfigurationPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetBackUpDBDetail();
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
