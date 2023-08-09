import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-system-setting',
  templateUrl: './system-setting.component.html',
  styleUrls: ['./system-setting.component.css']
})
export class SystemSettingComponent implements OnInit {
  DataUpdate = 0;
  LogedUserId;
  cities;
  LoginChecked = false;
  ExemptChecked = false;
  DaysCount = 4;
  DaysList = [];
  DataDetailsForm: FormGroup;
  ErrorData;
  DetailData;
  constructor(@Inject(MAT_DIALOG_DATA) data, private dbService: ApiService, private spinner: NgxSpinnerService,
              private emitService: EmittersService, public Dialogref: MatDialogRef<SystemSettingComponent>) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.DataUpdate = data.Update;
   }

  ngOnInit(): void {
    for (let i = 1; i <= 30; i++) {
      this.DaysList.push({Id: i, Name: i + ' Days'});
    }

    this.DataDetailsForm = new FormGroup({
      AllotmentDays: new FormControl('', [
        Validators.required
      ]),
      LoginAccess: new FormControl('', [
        Validators.required
      ]),
      ExemptAccess: new FormControl('', [
        Validators.required
      ]),
    });
    this.DataDetailsForm.controls.AllotmentDays.setValue(this.DaysCount);

    this.GetSystemSetting();

  }

  GetSystemSetting() {
    this.spinner.show();
    this.dbService.GetSystemSetting().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponceData;
        this.DaysCount = this.DetailData.AllotmentDays;
        this.LoginChecked = this.DetailData.LoginAccess;
        this.ExemptChecked = this.DetailData.ExemptAccess;
        this.DataDetailsForm.controls.AllotmentDays.setValue(this.DaysCount);
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  UpdateSetting() {
    let LoginAccess = 0;
    if (this.LoginChecked) {LoginAccess = 1; }
    let ExemptAccess = 0;
    if (this.ExemptChecked) {ExemptAccess = 1; }
    const Obj = {
      AllotmentDays: this.DataDetailsForm.value.AllotmentDays,
      LoginAccess,
      ExemptAccess,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    debugger;
    this.dbService.SystemSettingSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.emitService.setPageRefresh(true);
          this.emitService.openSnackBar(this.ErrorData, true);
          this.ClosePoup();
        } else {
          this.ErrorData = data.Message;
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  ClosePoup() { this.Dialogref.close(); }
}
