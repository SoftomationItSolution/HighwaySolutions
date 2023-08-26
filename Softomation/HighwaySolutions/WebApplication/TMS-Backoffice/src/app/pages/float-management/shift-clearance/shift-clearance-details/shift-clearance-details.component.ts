import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-shift-clearance-details',
  templateUrl: './shift-clearance-details.component.html',
  styleUrls: ['./shift-clearance-details.component.css']
})
export class ShiftClearanceDetailsComponent implements OnInit {
  DataDetailsForm!: FormGroup;
  DevicesData: any;
  PermissionData: any;
  ErrorData: any;
  LogedRoleId = 0;
  LogedUserId = 0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  ShiftStstausData=[{Id:1, Name:'Closed'},{Id:3, Name:'Open'},]
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService,private dm: DataModel,
     private spinner: NgxSpinnerService) {
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
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      ShiftStatus: new FormControl('', [
      ]),
    });
  }
  
 
  GetAllData() {
    // this.spinner.show();
    // this.dbService.CashFlowShiftClearanceGetAll().subscribe(
    //   data => {
    //     this.spinner.hide();
    //     this.DevicesData = data.ResponseData;
        
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }
  
  
  GetCashDeatils(rowData:any){
    // const dialogConfig = new MatDialogConfig();
    // dialogConfig.disableClose = true;
    // dialogConfig.autoFocus = true;
    // dialogConfig.width = "60%";
    // dialogConfig.data = { "action": 'Save', "Data": rowData, "PermissionData": this.PermissionData }
    // this.dialog.open(ClearanceDetailsPopupComponent, dialogConfig);
  }
}
