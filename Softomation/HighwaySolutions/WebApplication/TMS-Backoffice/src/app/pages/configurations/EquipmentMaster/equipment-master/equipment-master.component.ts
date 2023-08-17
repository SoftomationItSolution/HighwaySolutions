import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { FormControl, FormGroup } from '@angular/forms';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { EquipmentMasterPopupComponent } from '../equipment-master-popup/equipment-master-popup.component';
@Component({
  selector: 'app-equipment-master',
  templateUrl: './equipment-master.component.html',
  styleUrls: ['./equipment-master.component.css']
})
export class EquipmentMasterComponent implements OnInit {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  DevicesData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  TotalCount:0 | undefined;
  MasterData: any;
  EquipmentTypeData: any;
  SystemData:any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  DirectionList = [{ DataId: 0, DataName: 'None' },{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }, { DataId: 3, DataName: 'Median' }];
  ProtocolList = [{ DataId: 1, DataName: 'TCP' }, { DataId: 2, DataName: 'UDP' }, { DataId: 3, DataName: 'Serail' }, { DataId: 4, DataName: 'MQTT' }, { DataId: 5, DataName: 'HTTP' }, { DataId: 6, DataName: "RTSP" }, { DataId: 6, DataName: "Other" }];
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }
  ngOnInit() {
    
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
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.spinner.hide();
          this.dm.unauthorized();
        }
        else{
          this.EquipmentType();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

 
  EquipmentType() {
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        this.EquipmentTypeData = data.ResponseData;
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  GetAllData() {
    this.dbService.EquipmentDetailsGetAll().subscribe(
      data => {
        this.DevicesData = data.ResponseData;
        this.TotalCount = this.DevicesData.length;   
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
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
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Save', EquipmentId: 0 };
      const dialogRef = this.dialog.open(EquipmentMasterPopupComponent, dialogConfig);
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

  onRowEditInit(TransactionRowData: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', EquipmentId: TransactionRowData.EquipmentId };
      const dialogRef = this.dialog.open(EquipmentMasterPopupComponent, dialogConfig);
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
