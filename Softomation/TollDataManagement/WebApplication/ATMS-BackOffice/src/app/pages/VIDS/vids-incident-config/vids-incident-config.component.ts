import { Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vids-incident-config',
  templateUrl: './vids-incident-config.component.html',
  styleUrls: ['./vids-incident-config.component.css']
})
export class VidsIncidentConfigComponent {
  SystemId = 6;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  PermissionData:any;
  ErrorData:any;
  EventTypeList:any
  constructor(private dbService: apiIntegrationService, private dm: DataModel,private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: this.SystemId,
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
        this.GetEventType();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetEventType(){
    this.spinner.show();
    this.dbService.EventsTypeGetBySystemId(this.SystemId).subscribe(
      data => {
        this.spinner.hide();
        this.EventTypeList= data.ResponseData;
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

  handleCheck(event,data,type){
    if(!event && type=='EventsRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].ChallanRequired=event;
          break;
        }
      }
    }
    else if(event && type=='ChallanRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].EventsRequired=event;
          break;
        }
      }
    }
  }

  SaveDetails(){
    this.spinner.show();
    this.dbService.EventsTypeSetup(this.EventTypeList).subscribe(
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
