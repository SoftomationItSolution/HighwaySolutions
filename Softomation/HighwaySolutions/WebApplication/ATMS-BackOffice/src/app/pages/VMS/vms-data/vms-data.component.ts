import { Component } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { VmsPopupComponent } from '../vms-popup/vms-popup.component';

@Component({
  selector: 'app-vms-data',
  templateUrl: './vms-data.component.html',
  styleUrls: ['./vms-data.component.css']
})
export class VmsDataComponent {
  ErrorData: any;
  PermissionData: any;
  MessageData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
    this.LogedUserId = this.dm.getUserId();
    this.GetPermissionData();
  }

  ngOnInit(): void {
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
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.GetVMSMessage().subscribe(
      data => {
        this.spinner.hide();
        this.MessageData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  onMidiaView(TransactionRowData: any) {
    let imagepath='';
    let Videopath='';
    if(TransactionRowData.FormatId==2)
    {
      imagepath=TransactionRowData.MessageDetails;
    }
    else if(TransactionRowData.FormatId==3)
    {
      Videopath=TransactionRowData.MessageDetails;
    }

    var obj = {
      PageTitle: "Message media-(" + TransactionRowData.FormatName + ")",
      
      ImageData: [{
        ImagePath: imagepath
      }],
      VideoData: [{
        VideoPath: Videopath
      }],
      AudioData: [{
        AudioPath: ''
      }]
    }
    this.dm.MediaView(obj);
  }
  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '476px';
      dialogConfig.data = { action: 'Save', PackageId: 0 };
      const dialogRef = this.dialog.open(VmsPopupComponent, dialogConfig);
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
      dialogConfig.height = '476px';
      dialogConfig.data = { action: 'Update', PackageId: data.PackageId };
      const dialogRef = this.dialog.open(VmsPopupComponent, dialogConfig);
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
