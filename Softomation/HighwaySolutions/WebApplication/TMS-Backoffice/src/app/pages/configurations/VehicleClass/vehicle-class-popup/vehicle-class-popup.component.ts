import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-vehicle-class-popup',
  templateUrl: './vehicle-class-popup.component.html',
  styleUrls: ['./vehicle-class-popup.component.css']
})
export class VehicleClassPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  VehicleClassId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<VehicleClassPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.VehicleClassId = parentData.VehicleClassId;
  }
  ngOnInit(): void {
    this.PageTitle = "Create Vehicle Class Details";

    this.DataDetailsForm = new FormGroup({
      VehicleClassName: new FormControl('', [Validators.required]),
      VehicleClassDescription: new FormControl('', [Validators.required]),
      PermissibleWeight: new FormControl('', [Validators.required, Validators.pattern(regExps['DecimalThreeDigit'])]),
      DataStatus: new FormControl(true),
    });

    if (this.VehicleClassId > 0) {
      this.PageTitle = "Update Vehicle Class Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.VehicleClassGetById(this.VehicleClassId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['VehicleClassName'].setValue(DetailData.VehicleClassName);
          this.DataDetailsForm.controls['VehicleClassDescription'].setValue(DetailData.VehicleClassDescription);
          this.DataDetailsForm.controls['PermissibleWeight'].setValue(DetailData.PermissibleWeight);
          if (DetailData.DataStatus == 1)
            this.DataDetailsForm.controls['DataStatus'].setValue(true);
          else
            this.DataDetailsForm.controls['DataStatus'].setValue(false);
        }
        else {
          this.ClosePoup();
          const ErrorData = [{ AlertMessage: "role details not found." }];
          this.dm.openSnackBar(ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(ErrorData, false);
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
      VehicleClassDescription: this.DataDetailsForm.value.VehicleClassDescription,
      PermissibleWeight: this.DataDetailsForm.value.PermissibleWeight,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.VehicleClassInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success') > -1) {
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
