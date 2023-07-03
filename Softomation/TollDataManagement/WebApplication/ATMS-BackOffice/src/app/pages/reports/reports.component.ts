import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent {
  ReportForm!: FormGroup;
  LoginUserId: any;
  submitted = false;
  ErrorData: any;
  ControlRoomData: any;
  PackageFilter: any;
  PackageData: any;
  DirectionList = [{ Id: 0, Name: 'None' }, { Id: 1, Name: 'LHS' }, { Id: 2, Name: 'RHS' }, { Id: 3, Name: 'Median' }];
  constructor(private dm: DataModel, private spinner: NgxSpinnerService,
  public datepipe: DatePipe,private dbService: apiIntegrationService,) {
  this.LoginUserId = this.dm.getUserId();
}

ngOnInit(): void {
  this.ReportForm = new FormGroup({
    ControlRoomId: new FormControl('', [Validators.required]),
    StartDate: new FormControl('', Validators.required,),
    EndDate: new FormControl('', Validators.required,),
    PackageId: new FormControl('', [Validators.required]),
    DirectionId: new FormControl('', [Validators.required]),
    ReportId: new FormControl('', [Validators.required]),
    EventTypeId: new FormControl('', [Validators.required]),
    ClassId: new FormControl('', [Validators.required]),
  });
  this.ControlRoom();
  this.PackageType();
}

ControlRoom() {
  this.spinner.show();
  this.dbService.ControlRoomGetActive().subscribe(
    data => {
      this.spinner.hide();
      this.ControlRoomData = data.ResponseData;

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
PackageType() {
  this.spinner.show();
  this.dbService.PackagesGetActive().subscribe(
    data => {
      this.spinner.hide();
      this.PackageData = data.ResponseData;
      //this.SystemType();
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
ControlChnage(ControlRoomId: any) {
  this.PackageFilter = this.PackageData.filter(e => e.ControlRoomId === ControlRoomId);
}
}
