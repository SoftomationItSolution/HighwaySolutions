import { Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-vsds-lane-config',
  templateUrl: './vsds-lane-config.component.html',
  styleUrls: ['./vsds-lane-config.component.css']
})
export class VsdsLaneConfigComponent {
  SystemId = 0;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  PermissionData:any;
  ErrorData:any;
  VehicleClassList:any;
  LaneConfigDetails:any;
  constructor(private dbService: apiIntegrationService, private dm: DataModel,private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }
  ngOnInit(): void {
    
  }
  GetPermissionData() {
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: this.SystemId,
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
          this.GetVehicleClass();
        
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }


  GetVehicleClass(){
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.VehicleClassList= data.ResponseData;
        this.VSDSLaneConfigGetALL()
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

  VSDSLaneConfigGetALL() {
    this.spinner.show();
    this.dbService.VSDSLaneConfigGetAll().subscribe(
      data => {
        this.LaneConfigDetails = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  
  handleCheck(event:any,data:any,type:any){
    // if(!event && type=='EventsRequired'){
    //   for (let i = 0; i < this.EventTypeList.length; i++) {
    //     const element = this.EventTypeList[i];
    //     if(element.EventTypeId==data.EventTypeId){
    //       this.EventTypeList[i].ReviewRequired=event;
    //       this.EventTypeList[i].ChallanTypeId=0;
    //       break;
    //     }
    //   }
    // }
    // else if(event && type=='EventsRequired'){
    //   for (let i = 0; i < this.EventTypeList.length; i++) {
    //     const element = this.EventTypeList[i];
    //     if(element.EventTypeId==data.EventTypeId){
    //       this.EventTypeList[i].ChallanTypeId=0;
    //       break;
    //     }
    //   }
    // }
    // else if(event && type=='ReviewRequired'){
    //   for (let i = 0; i < this.EventTypeList.length; i++) {
    //     const element = this.EventTypeList[i];
    //     if(element.EventTypeId==data.EventTypeId){
    //       this.EventTypeList[i].EventsRequired=event;
    //       this.EventTypeList[i].ChallanTypeId=0;
    //       break;
    //     }
    //   }
    // }
    // else if(!event && type=='ReviewRequired'){
    //   for (let i = 0; i < this.EventTypeList.length; i++) {
    //     const element = this.EventTypeList[i];
    //     if(element.EventTypeId==data.EventTypeId){
    //       this.EventTypeList[i].ChallanTypeId=0;
    //       break;
    //     }
    //   }
    // }
  }

  SaveDetails(){
    this.spinner.show();
    for (let j = 0; j < this.LaneConfigDetails.length; j++) {
      this.LaneConfigDetails[j].DataStatus=this.LaneConfigDetails[j].DataStatus == true ? 1 : 2;
      this.LaneConfigDetails[j].AllowedClassIds=this.LaneConfigDetails[j].AllowedClassIdList.toString();
    }
    this.LaneConfigDetails[0].CreatedBy=this.LogedUserId
    this.LaneConfigDetails[0].ModifiedBy=this.LogedUserId
    this.dbService.VSDSLaneConfigSetUp(this.LaneConfigDetails).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
        } else {
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
