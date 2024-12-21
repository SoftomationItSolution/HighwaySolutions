import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';

@Component({
  selector: 'app-keyboard-configuration',
  templateUrl: './keyboard-configuration.component.html',
  styleUrls: ['./keyboard-configuration.component.css']
})
export class KeyboardConfigurationComponent implements OnInit {
  DevicesData: any;
  PermissionData:any;
  ErrorData: any;
  LogedRoleId=0;
  LogedUserId=0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  EffectiveDate:any;
  FareData:any;
  EffectiveFrom:any;
  SystemSetting:any
  isSubClassRequired=false;
  isCashReturnRequired=false;
  isFasTagPenaltyRequired=false;
  constructor(private spinner: NgxSpinnerService,private dm: DataModel,
    private dbService: apiIntegrationService,public datepipe: DatePipe) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    console.log(this.dm.getSSData())
    this.isSubClassRequired = this.dm.getSSData().SubClassRequired;
    this.isCashReturnRequired = this.dm.getSSData().CashReturn;
    this.isFasTagPenaltyRequired = this.dm.getSSData().FasTagPenalty;
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
    this.EffectiveDate=new Date();
    this.GetAllData();
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.KeyboardDetailGetAll().subscribe(
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

  storeAsciiValue(event: KeyboardEvent,row:any): void {
    event.preventDefault();
    row.KeyCode=event.keyCode
  }
  onRowReset(row:any){
    row.KeyCode=null
  }
 

  SaveDetails(){
    this.spinner.show();
    this.DevicesData[0].ModifiedBy=this.LogedUserId
    this.dbService.KeyboardDetailUpdate(this.DevicesData).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success')>-1) {
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
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }
}
