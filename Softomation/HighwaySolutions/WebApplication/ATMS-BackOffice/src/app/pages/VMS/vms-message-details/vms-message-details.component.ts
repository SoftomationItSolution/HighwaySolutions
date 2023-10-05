import { Component } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { VMSMessageDetailsPopupComponent } from '../vms-message-details-popup/vms-message-details-popup.component';
import { EquipmentDetailsPopupComponent } from '../../Config/EquipmentMaster/equipment-details-popup/equipment-details-popup.component';

@Component({
  selector: 'app-vms-message-details',
  templateUrl: './vms-message-details.component.html',
  styleUrls: ['./vms-message-details.component.css']
})
export class VMSMessageDetailsComponent {
  ErrorData: any;
  PermissionData: any;
  MessageData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  MediaPrefix: any;
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
    this.LogedUserId = this.dm.getUserId();
    this.MediaPrefix = this.dm.getMediaAPI()?.toString();
    this.GetPermissionData();
  }

  ngOnInit(): void {
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
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.VMSMessageGetAll().subscribe(
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
    let imagepath = '';
    let Videopath = '';
    let Process = false;
    if (TransactionRowData.MessageTypeId == 1) {
      var MyWindow = window.open(this.MediaPrefix + TransactionRowData.MediaPath, 'MyWindow', 'width=600,height=300');
      Process = false;
    }
    else if (TransactionRowData.MessageTypeId == 2) {
      imagepath = TransactionRowData.MediaPath;
      Process = true;
    }
    else if (TransactionRowData.MessageTypeId == 3) {
      Videopath = TransactionRowData.MediaPath;
      Process = true;
    }
    if (Process) {
      var obj = {
        PageTitle: "Message media-(" + TransactionRowData.MessageTypeName + ")",

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
  }
  NewEntry() {
    if (this.DataAdd == 1) {
      localStorage.setItem('manualData', "");
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '55%';
      dialogConfig.height = '394px';
      dialogConfig.data = { action: 'Save', MessageId: 0 };
      const dialogRef = this.dialog.open(VMSMessageDetailsPopupComponent, dialogConfig);
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
      localStorage.setItem('manualData', "");
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '55%';
      dialogConfig.height = '394px';
      dialogConfig.data = { action: 'Update', MessageId: data.MessageId };
      const dialogRef = this.dialog.open(VMSMessageDetailsPopupComponent, dialogConfig);
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

  onRowViewInit(data: any) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '55%';
    dialogConfig.height = '400px';
    dialogConfig.data = { action: 'Update', EquipmentList: data.EquipmentList };
    const dialogRef = this.dialog.open(EquipmentDetailsPopupComponent, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetAllData();
        }
      }
    );
  }
}