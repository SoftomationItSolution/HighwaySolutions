import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { CreateIncidentComponent } from '../create-incident/create-incident.component';

@Component({
  selector: 'app-incident-data',
  templateUrl: './incident-data.component.html',
  styleUrls: ['./incident-data.component.css']
})
export class IncidentDataComponent implements OnInit {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  DevicesData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  TabId=0
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
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
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 26,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
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

  tabChange(id:number){
    this.TabId=id;
  }

  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Save', EquipmentId: 0 };
      this.dialog.open(CreateIncidentComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(TransactionRowData: any) {
    // if (this.DataUpdate == 1) {
    //   const dialogConfig = new MatDialogConfig();
    //   dialogConfig.disableClose = true;
    //   dialogConfig.autoFocus = true;
    //   dialogConfig.width = '60%';
    //   dialogConfig.height = '500px';
    //   dialogConfig.data = { action: 'Update', EquipmentId: TransactionRowData.EquipmentId };
    //   this.dialog.open(DevicePopupComponent, dialogConfig);
    // }
    // else {
    //   this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
    //   this.dm.openSnackBar(this.ErrorData, false);
    // }
  }
}

