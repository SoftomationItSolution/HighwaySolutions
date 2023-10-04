import { Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-lane-config',
  templateUrl: './lane-config.component.html',
  styleUrls: ['./lane-config.component.css']
})
export class LaneConfigComponent {
  SystemId = 0;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  PermissionData:any;
  ErrorData:any;
  VehicleClassList:any=[];
  LaneConfigDetails:any;
  SystemSettingData:any;
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
        
          this.GetSystemSetting();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetSystemSetting() {
    this.spinner.show();
    this.dbService.SystemSettingGet().subscribe(
      data => {
        this.spinner.hide();
        this.SystemSettingData = data.ResponseData;
        this.GetVehicleClass();
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


  GetVehicleClass(){
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        this.spinner.hide();
        let d=data.ResponseData;
        var RestrictedVehiclesIds=this.SystemSettingData.RestrictedVehiclesIdList
        for (let i = 1; i < d.length; i++) {
          const element = d[i];
          var req=true;
          for (let j = 0; j < RestrictedVehiclesIds.length; j++) {
            const element1 = RestrictedVehiclesIds[j];
            if(element.VehicleClassId==element1)
              req=false;
          }
          if(req){
            this.VehicleClassList.push(element)
          }
        }
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
    this.dbService.LaneConfigGetAll().subscribe(
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
  
 

  SaveDetails(){
    this.spinner.show();
    for (let j = 0; j < this.LaneConfigDetails.length; j++) {
      this.LaneConfigDetails[j].CreatedBy=this.LogedUserId
      this.LaneConfigDetails[j].ModifiedBy=this.LogedUserId
      if(this.LaneConfigDetails[j].AllowedClassIdList!=null && this.LaneConfigDetails[j].AllowedClassIdList!='')
       this.LaneConfigDetails[j].AllowedClassIds=this.LaneConfigDetails[j].AllowedClassIdList.toString();
    }
    this.dbService.LaneConfigSetUp(this.LaneConfigDetails).subscribe(
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
