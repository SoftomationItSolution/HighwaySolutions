import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';

@Component({
  selector: 'app-vehicle-class-popup',
  templateUrl: './vehicle-class-popup.component.html',
  styleUrls: ['./vehicle-class-popup.component.css']
})
export class VehicleClassPopupComponent implements OnInit {
  PageTitle:any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  ClassId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted=false;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any,
              private emitService: EmittersService, public Dialogref: MatDialogRef<VehicleClassPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.ClassId = parentData.ClassId;
  }
  ngOnInit(): void {
    this.PageTitle = 'Create New Vehicle Classification';
    this.DataDetailsForm = new FormGroup({
      VehicleClassId:new FormControl('', [Validators.required, Validators.pattern(regExps['OnlyDigit'])]),
      VehicleClassName: new FormControl('', [Validators.required,Validators.pattern(regExps['AlphaNumericSingleSpace'])],),
      AllowedSpeed:new FormControl('', [Validators.required, Validators.pattern(regExps['OnlyDigit'])]),
      DataStatus: new FormControl(true),
    });
    if (this.ClassId > 0) {
      this.PageTitle = 'Update Vehicle Classification Details';
      this.DetailsbyId();
    }
  }
  DetailsbyId() {
    this.spinner.show();
    this.dbService.VehicleClassGetById(this.ClassId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['VehicleClassId'].setValue(this.DetailData.VehicleClassId);
        this.DataDetailsForm.controls['AllowedSpeed'].setValue(this.DetailData.AllowedSpeed);
        this.DataDetailsForm.controls['VehicleClassName'].setValue(this.DetailData.VehicleClassName);
        if (this.DetailData.DataStatus == 1) {
          this.DataDetailsForm.controls['DataStatus'].setValue(true);
        } else {
          this.DataDetailsForm.controls['DataStatus'].setValue(false);
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

  
  SaveDetails() {
    this.submitted=true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      ClassId: this.ClassId,
      VehicleClassId: this.DataDetailsForm.value.VehicleClassId,
      VehicleClassName: this.DataDetailsForm.value.VehicleClassName,
      AllowedSpeed: this.DataDetailsForm.value.AllowedSpeed,
      DataStatus: this.DataDetailsForm.value.DataStatus==true?1:2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.VehicleClassInsertUpdate(Obj).subscribe(
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
}
