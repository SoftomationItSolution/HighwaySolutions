import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/services/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vehicle-class-popup',
  templateUrl: './vehicle-class-popup.component.html',
  styleUrls: ['./vehicle-class-popup.component.css']
})
export class VehicleClassPopupComponent implements OnInit {
  PageTitle: any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  VehicleClassId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted = false;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, 
    @Inject(MAT_DIALOG_DATA) parentData: any,private dm: DataModel, public Dialogref: MatDialogRef<VehicleClassPopupComponent>,
    public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.VehicleClassId = parentData.VehicleClassId;
  }
  ngOnInit(): void {
    this.PageTitle = 'Create New Vehicle Classification';
    this.DataDetailsForm = new FormGroup({
     
      VehicleClassName: new FormControl('', [Validators.required, Validators.pattern(regExps['AlphaNumericSingleSpace'])],),
      AllowedSpeed: new FormControl('', [Validators.required, Validators.pattern(regExps['OnlyDigit'])]),
      DataStatus: new FormControl(true),
    });
    if (this.VehicleClassId > 0) {
      this.PageTitle = 'Update Vehicle Classification Details';
      this.DetailsbyId();
    }
  }
  DetailsbyId() {
    this.spinner.show();
    this.dbService.VehicleClassGetById(this.VehicleClassId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
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
        this.dm.openSnackBar(this.ErrorData, false);
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
      VehicleClassId: this.VehicleClassId,
      VehicleClassName: this.DataDetailsForm.value.VehicleClassName,
      AllowedSpeed: this.DataDetailsForm.value.AllowedSpeed,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
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
          this.dm.openSnackBar(this.ErrorData, true);
          this.Dialogref.close(true);
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}
