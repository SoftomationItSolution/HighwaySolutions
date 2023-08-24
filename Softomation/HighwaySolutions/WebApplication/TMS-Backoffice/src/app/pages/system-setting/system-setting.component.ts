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
      AllotmentDays: new FormControl('', [Validators.required]),
      CashPenalty: new FormControl(true),
      LoginAccess: new FormControl(false),
      ExemptAccess: new FormControl(false),
      FleetAccess: new FormControl(false),
      OpeningBalance: new FormControl('', [Validators.required, Validators.pattern(regExps["DecimalTwoDigit"])]),
      ClosingBalance: new FormControl('', [Validators.required, Validators.pattern(regExps["DecimalTwoDigit"])]),
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
          this.dm.unauthorized();
        }else{
          this.GetDetails();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  

  

  GetDetails() {
    this.spinner.show();
    this.dbService.SystemSettingGet().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['AllotmentDays'].setValue(this.DetailData.AllotmentDays);
        this.DataDetailsForm.controls['CashPenalty'].setValue(this.DetailData.CashPenalty);
        this.DataDetailsForm.controls['LoginAccess'].setValue(this.DetailData.LoginAccess);
        this.DataDetailsForm.controls['ExemptAccess'].setValue(this.DetailData.ExemptAccess);
        this.DataDetailsForm.controls['FleetAccess'].setValue(this.DetailData.FleetAccess);
        this.DataDetailsForm.controls['OpeningBalance'].setValue(this.DetailData.OpeningBalance);
        this.DataDetailsForm.controls['ClosingBalance'].setValue(this.DetailData.ClosingBalance);
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

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      AllotmentDays: this.DataDetailsForm.value.AllotmentDays,
      CashPenalty: this.DataDetailsForm.value.CashPenalty,
      LoginAccess: this.DataDetailsForm.value.LoginAccess,
      ExemptAccess: this.DataDetailsForm.value.ExemptAccess,
      FleetAccess: this.DataDetailsForm.value.FleetAccess,
      OpeningBalance: this.DataDetailsForm.value.OpeningBalance,
      ClosingBalance: this.DataDetailsForm.value.ClosingBalance,
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
