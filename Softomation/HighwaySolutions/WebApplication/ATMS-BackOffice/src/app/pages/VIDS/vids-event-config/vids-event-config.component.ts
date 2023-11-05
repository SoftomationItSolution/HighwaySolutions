import { Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vids-event-config',
  templateUrl: './vids-event-config.component.html',
  styleUrls: ['./vids-event-config.component.css']
})
export class VIDSEventConfigComponent {
  SystemId = 0;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  PermissionData:any;
  ErrorData:any;
  EventTypeList:any;
  ChalanTypeData:any;
  constructor(private dbService: apiIntegrationService, private dm: DataModel,private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }
  ngOnInit(): void {
    this.SystemGetByName()
  }

  SystemGetByName() {
    this.spinner.show();
    let MenuUrl = window.location.pathname.replace('/', '');
    let systenname = MenuUrl.substring(0, 4)
    this.dbService.SystemGetByName(systenname).subscribe(
      data => {
        let SystemDetails = data.ResponseData;
        this.SystemId = SystemDetails.SystemId;
        this.GetPermissionData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
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
          this.GetEventType();
          this.ChalanTypeGetAll();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetEventType(){
    this.dbService.EventsTypeGetBySystemId(this.SystemId).subscribe(
      data => {
        this.spinner.hide();
        let d=data.ResponseData;
        this.EventTypeList= d.filter((e: { EventTypeId: any; }) => e.EventTypeId != 0);
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
  ChalanTypeGetAll() {
    this.dbService.ChalanTypeGetAll().subscribe(
      data => {
        this.ChalanTypeData = data.ResponseData;
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
  handleCheck(event:any,data:any,type:any){
    
    if(!event && type=='EventsRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].ReviewRequired=event;
          this.EventTypeList[i].ChallanTypeId=0;
          break;
        }
      }
    }
    else if(event && type=='EventsRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].ChallanTypeId=0;
          break;
        }
      }
    }
    else if(event && type=='ReviewRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].EventsRequired=event;
          this.EventTypeList[i].ChallanTypeId=0;
          break;
        }
      }
    }
    else if(!event && type=='ReviewRequired'){
      for (let i = 0; i < this.EventTypeList.length; i++) {
        const element = this.EventTypeList[i];
        if(element.EventTypeId==data.EventTypeId){
          this.EventTypeList[i].ChallanTypeId=0;
          break;
        }
      }
    }
  }

  SaveDetails(){
    this.spinner.show();
    this.EventTypeList[0].CreatedBy=this.LogedUserId
    this.EventTypeList[0].ModifiedBy=this.LogedUserId
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
