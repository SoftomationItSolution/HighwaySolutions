import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
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
      IsAccessControl: new FormControl('', [Validators.required]),
      AllotmentDays: new FormControl('', [Validators.required]),
      CashPenalty: new FormControl(true),
      LoginAccess: new FormControl(false),
      ExemptAccess: new FormControl(false),
      FleetAccess: new FormControl(false),
      SubClassRequired: new FormControl(false),
      OpeningBalance: new FormControl('', [Validators.required, Validators.pattern(regExps["Amount"])])
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
        this.DataDetailsForm.controls['CashPenalty'].setValue(this.DetailData.CashPenalty);
        this.DataDetailsForm.controls['LoginAccess'].setValue(this.DetailData.LoginAccess);
        this.DataDetailsForm.controls['ExemptAccess'].setValue(this.DetailData.ExemptAccess);
        this.DataDetailsForm.controls['FleetAccess'].setValue(this.DetailData.FleetAccess);
        this.DataDetailsForm.controls['SubClassRequired'].setValue(this.DetailData.SubClassRequired);
        this.DataDetailsForm.controls['OpeningBalance'].setValue(this.DetailData.OpeningBalance);
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
      CashPenalty: this.DataDetailsForm.value.CashPenalty,
      LoginAccess: this.DataDetailsForm.value.LoginAccess,
      ExemptAccess: this.DataDetailsForm.value.ExemptAccess,
      FleetAccess: this.DataDetailsForm.value.FleetAccess,
      SubClassRequired: this.DataDetailsForm.value.SubClassRequired,
      OpeningBalance: this.DataDetailsForm.value.OpeningBalance,
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
