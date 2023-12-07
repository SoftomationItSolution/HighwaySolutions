import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';

@Component({
  selector: 'app-fare-configuration',
  templateUrl: './fare-configuration.component.html',
  styleUrls: ['./fare-configuration.component.css']
})
export class FareConfigurationComponent implements OnInit {
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
  constructor(private spinner: NgxSpinnerService,private dm: DataModel,
    private dbService: apiIntegrationService,public datepipe: DatePipe) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.isSubClassRequired = this.dm.getSSData().SubClassRequired;
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
    let StartDate =this.datepipe.transform(this.EffectiveDate, 'dd-MMM-yyyy')
    this.dbService.TollFareGetByEffectedFrom(StartDate).subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponseData;
        this.FareData = this.DevicesData.TollFareConfigurations;
        //this.EffectiveFrom=new Date(this.DevicesData.EffectedFrom);
        this.EffectiveFrom =this.datepipe.transform(this.DevicesData.EffectedFrom, 'dd-MMM-yyyy')
        if(this.FareData.length==0){
          this.ErrorData = [{ AlertMessage: "Toll Fare not found." }];
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

  SaveDetails(){
    this.spinner.show();
    this.DevicesData.EffectedFrom=this.datepipe.transform(this.EffectiveDate, 'dd-MMM-yyyy');
    this.DevicesData.EffectedFromStamp=this.datepipe.transform(this.EffectiveDate, 'dd-MMM-yyyy');
    this.dbService.TollFareSetUp(this.DevicesData).subscribe(
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
