import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-system-details',
  templateUrl: './system-details.component.html',
  styleUrls: ['./system-details.component.css']
})
export class SystemDetailsComponent {
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  SystemDetails: any;
  ReportDetails: any;
  constructor(private dbService: apiIntegrationService, private dm: DataModel,
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
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.spinner.hide();
          this.dm.unauthorized();
        }else{
        this.GetSystemDetails();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetSystemDetails() {
    this.dbService.SystemGetAll().subscribe(
      data => {
        this.SystemDetails = data.ResponseData;
        this.GetReportDetails();
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

  GetReportDetails() {
    this.dbService.ReportGetActive().subscribe(
      data => {
        this.ReportDetails = data.ResponseData;
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
  handleCheck(event:any, data:any, type:any) {
    if (type == 1) {
      if (!event) {
        for (let i = 0; i < this.SystemDetails.length; i++) {
          const element = this.SystemDetails[i];
          if (element.SystemId == data.SystemId) {
            this.SystemDetails[i].DashBoard = event;
            break;
          }
        }
      }
    }
    else {
      if (event) {
        for (let i = 0; i < this.SystemDetails.length; i++) {
          const element = this.SystemDetails[i];
          if (element.SystemId == data.SystemId) {
            this.SystemDetails[i].DataStatus = event;
            break;
          }
        }
      }
    }
  }
  ReportSelection(event:any,rowData:any){
   // console.log(rowData)
  }

  SaveDetails(){
    this.spinner.show();
   
    for (let k = 0; k < this.SystemDetails.length; k++) {
      this.SystemDetails[k].DataStatus=this.SystemDetails[k].DataStatus==true?1:0
      this.SystemDetails[k].CreatedBy=this.LogedUserId
      this.SystemDetails[k].ModifiedBy=this.LogedUserId
    }
    this.dbService.SystemSetup(this.SystemDetails).subscribe(
      data => {
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.GetSystemDetails();
        } else {
          this.spinner.hide();
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
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
}
