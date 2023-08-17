import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

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
  constructor(private spinner: NgxSpinnerService,private dm: DataModel,
    private dbService: apiIntegrationService,public datepipe: DatePipe) {
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

  }

  GetAllData() {
    // this.spinner.show();
    // let StartDate =this.datepipe.transform(this.effectiveDate, 'dd-MMM-yyyy')
    // const Obj = {
    //   EffectiveDate: StartDate
    // }
    // this.dbService.FareGetAllByDate(Obj).subscribe(
    //   data => {
    //     this.spinner.hide();
    //     this.DevicesData = data.ResponseData;
    //     this.FareData = this.DevicesData.FareDetails;
    //     var EffectiveDate=new Date(this.DevicesData.EffectiveDate);
    //     var LEffectiveDate=new Date(this.DevicesData.LastEffectiveDate);
    //     let latest_date =this.datepipe.transform(EffectiveDate, 'yyyy-MM-dd');
    //     let old_date =this.datepipe.transform(LEffectiveDate, 'yyyy-MM-dd');
    //     if(this.FareData.length>0){
    //       if(latest_date!=old_date){
    //         this.effectiveDate=LEffectiveDate;
    //       }
    //       this.effectiveDate=LEffectiveDate;
    //     }
    //     else{
    //       this.ErrorData = [{ AlertMessage: "Configure the vehicle classes." }];
    //       this.emitService.openSnackBar(this.ErrorData, false);
    //        this.effectiveDate = new Date();
    //     }
        
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }

  SaveDetails(){
    
  }
}
