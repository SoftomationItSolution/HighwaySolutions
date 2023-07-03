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
  constructor(private dm: DataModel, private spinner: NgxSpinnerService,
  public datepipe: DatePipe,private dbService: apiIntegrationService,) {
  this.LoginUserId = this.dm.getUserId();
}

ngOnInit(): void {
  this.ReportForm = new FormGroup({
    ControlRoomId: new FormControl('', [Validators.required]),
    VendorDetail: new FormControl('', Validators.required,),
    ManufacturerDate: new FormControl('', Validators.required,),
    PurchageDate: new FormControl('', Validators.required,),
    WarrantyExpireDate: new FormControl('', Validators.required,),
    DataStatus: new FormControl(true)
  });
  this.ControlRoom();
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
}
