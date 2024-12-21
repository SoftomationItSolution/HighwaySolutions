import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-system-setting',
  templateUrl: './system-setting.component.html',
  styleUrls: ['./system-setting.component.css']
})
export class SystemSettingComponent {
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  PermissionData: any;
  LogedRoleId: number;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  LaneData: any;
  submitted = false;
  TabId = 0
  AllotmentDaysList: any = [];
  PlazaData:any;
  TollingTypeList = [{ DataId: 1, DataName: 'Normal' }, { DataId: 2, DataName: 'Access Control' }, { DataId:3, DataName: 'Free Flow' }];
  FasTagPenaltyList = [{ DataId: 0, DataName: 'None' }, { DataId: 1, DataName: '1x' }, { DataId: 2, DataName: '2x' }, { DataId: 3, DataName: '3x' }, { DataId: 4, DataName: '4x' }, { DataId: 5, DataName: "5x" }];
  CashReturnDiscountList = [{ DataId: 0, DataName: '0%' }, { DataId: 10, DataName: '10%' }, { DataId: 20, DataName: '20%' }, { DataId: 25, DataName: '25%' }, { DataId: 30, DataName: '30%' }, { DataId: 40, DataName: "40%" }, { DataId: 50, DataName: "50%" }];
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel,public Dialogref: MatDialogRef<SystemSettingComponent>) {
      this.LogedUserId = this.dm.getUserId();
      this.LogedRoleId = this.dm.getRoleId();
  }
 
  ngOnInit(): void {
    for (let i = 0; i <= 30; i++) {
      this.AllotmentDaysList.push({ DataId: i, DataName: 'Days ' + i });
    }
    this.DataDetailsForm = new FormGroup({
      DefaultPlazaId: new FormControl('', [Validators.required]),
      AllotmentDays: new FormControl('', [Validators.required]),
      IsAccessControl: new FormControl('', [Validators.required]),
      LoginAccess: new FormControl(false),
      ExemptAccess: new FormControl(false),
      FleetAccess: new FormControl(false),
      TollFareonSubClass: new FormControl(false),
      AutoFasTagProcess: new FormControl(false),
      FasTagPenalty: new FormControl(true),
      FasTagPenaltyMultiply: new FormControl('', [Validators.required]),
      CashReturn: new FormControl(true),
      CashReturnDiscount: new FormControl('', [Validators.required]),
      OpeningBalance: new FormControl('', [Validators.required, Validators.pattern(regExps["Amount"])]),
      MonthlyPassTrips: new FormControl('', [Validators.required, Validators.pattern(regExps["OnlyDigit"])])
    });
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuUrl: "#PopUpSystemSetting",
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
          this.Dialogref.close(false);
          this.dm.unauthorized();
        }else{
          this.GetPlaza();
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

  GetPlaza() {
    this.spinner.show();
    this.dbService.PlazaGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.PlazaData = data.ResponseData;
        this.GetDetails();
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
  

  GetDetails() {
    this.spinner.show();
    this.dbService.SystemSettingGet().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.dm.setSSData(JSON.stringify(this.DetailData));
        this.DataDetailsForm.controls['DefaultPlazaId'].setValue(this.DetailData.DefaultPlazaId);
        this.DataDetailsForm.controls['IsAccessControl'].setValue(this.DetailData.IsAccessControl);
        this.DataDetailsForm.controls['AllotmentDays'].setValue(this.DetailData.AllotmentDays);
        this.DataDetailsForm.controls['FasTagPenalty'].setValue(this.DetailData.FasTagPenalty);
        this.DataDetailsForm.controls['FasTagPenaltyMultiply'].setValue(this.DetailData.FasTagPenaltyMultiply);
        this.DataDetailsForm.controls['CashReturn'].setValue(this.DetailData.CashReturn);
        this.DataDetailsForm.controls['CashReturnDiscount'].setValue(this.DetailData.CashReturnDiscount);
        this.DataDetailsForm.controls['LoginAccess'].setValue(this.DetailData.LoginAccess);
        this.DataDetailsForm.controls['ExemptAccess'].setValue(this.DetailData.ExemptAccess);
        this.DataDetailsForm.controls['FleetAccess'].setValue(this.DetailData.FleetAccess);
        this.DataDetailsForm.controls['TollFareonSubClass'].setValue(this.DetailData.TollFareonSubClass);
        this.DataDetailsForm.controls['AutoFasTagProcess'].setValue(this.DetailData.AutoFasTagProcess);
        this.DataDetailsForm.controls['OpeningBalance'].setValue(this.DetailData.OpeningBalance);
        this.DataDetailsForm.controls['MonthlyPassTrips'].setValue(this.DetailData.MonthlyPassTrips);
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

  FasTagPenaltyChange(event:any){
    if(event.currentTarget.checked){
      this.DataDetailsForm.controls['FasTagPenaltyMultiply'].setValue(this.DetailData.FasTagPenaltyMultiply);
      this.DataDetailsForm.controls['FasTagPenaltyMultiply'].enable();
    }
    else{
      this.DataDetailsForm.controls['FasTagPenaltyMultiply'].setValue(0);
      this.DataDetailsForm.controls['FasTagPenaltyMultiply'].disable();
    }
  }

  CashReturnChange(event:any){
    if(event.currentTarget.checked){
      this.DataDetailsForm.controls['CashReturnDiscount'].setValue(this.DetailData.CashReturnDiscount);
      this.DataDetailsForm.controls['CashReturnDiscount'].enable();
    }
    else{
      this.DataDetailsForm.controls['CashReturnDiscount'].setValue(0);
      this.DataDetailsForm.controls['CashReturnDiscount'].disable();
    }
  }

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      DefaultPlazaId: this.DataDetailsForm.value.DefaultPlazaId,
      IsAccessControl: this.DataDetailsForm.value.IsAccessControl,
      AllotmentDays: this.DataDetailsForm.value.AllotmentDays,
      FasTagPenalty: this.DataDetailsForm.value.FasTagPenalty,
      FasTagPenaltyMultiply: this.DataDetailsForm.value.FasTagPenaltyMultiply,
      CashReturn: this.DataDetailsForm.value.CashReturn,
      CashReturnDiscount: this.DataDetailsForm.value.CashReturnDiscount,
      LoginAccess: this.DataDetailsForm.value.LoginAccess,
      ExemptAccess: this.DataDetailsForm.value.ExemptAccess,
      FleetAccess: this.DataDetailsForm.value.FleetAccess,
      TollFareonSubClass: this.DataDetailsForm.value.TollFareonSubClass,
      AutoFasTagProcess: this.DataDetailsForm.value.AutoFasTagProcess,
      OpeningBalance: this.DataDetailsForm.value.OpeningBalance,
      MonthlyPassTrips: this.DataDetailsForm.value.MonthlyPassTrips,
      DataStatus:1,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.SystemSettingSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.GetDetails();
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error:any) => {
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
