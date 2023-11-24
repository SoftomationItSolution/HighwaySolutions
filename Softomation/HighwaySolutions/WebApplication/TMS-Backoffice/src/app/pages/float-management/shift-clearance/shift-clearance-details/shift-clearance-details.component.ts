import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { ConfirmationService } from 'primeng/api';

@Component({
  selector: 'app-shift-clearance-details',
  templateUrl: './shift-clearance-details.component.html',
  styleUrls: ['./shift-clearance-details.component.css']
})
export class ShiftClearanceDetailsComponent implements OnInit {
  DevicesData: any;
  PermissionData: any;
  ErrorData: any;
  LogedRoleId = 0;
  LogedUserId = 0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  isChecked=true;
  ShiftStatus='Open'
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService,private dm: DataModel,
     private spinner: NgxSpinnerService,private confirmationService: ConfirmationService,) {
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
        this.GetOpenShift();
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
  GetOpenShift() {
    this.ShiftStatus='Open'
    this.spinner.show();
    this.dbService.ShiftStatusGetOpen().subscribe(
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
  GetCloseShift() {
    this.ShiftStatus='Close'
    this.spinner.show();
    this.dbService.ShiftStatusGetClose().subscribe(
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
  
  GetCashDeatils(rowData:any){
    // const dialogConfig = new MatDialogConfig();
    // dialogConfig.disableClose = true;
    // dialogConfig.autoFocus = true;
    // dialogConfig.width = "60%";
    // dialogConfig.data = { "action": 'Save', "Data": rowData, "PermissionData": this.PermissionData }
    // this.dialog.open(ClearanceDetailsPopupComponent, dialogConfig);
  }
  statusChanged(){
    if(this.isChecked)
      this.GetOpenShift();
    else
      this.GetCloseShift();
  }

  onRowEditInit(row:any){
    if(row.ShiftStatus){
      const message = 'Are you sure you want to do close this shift';
      this.confirmationService.confirm({
        message: message,
        accept: () => {
          this.OnSubmit(row);
        }
      });
    }
  }

  OnSubmit(data:any){

  }
}
