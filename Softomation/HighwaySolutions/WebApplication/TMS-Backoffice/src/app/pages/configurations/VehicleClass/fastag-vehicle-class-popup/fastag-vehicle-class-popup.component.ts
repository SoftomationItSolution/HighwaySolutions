import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-fastag-vehicle-class-popup',
  templateUrl: './fastag-vehicle-class-popup.component.html',
  styleUrls: ['./fastag-vehicle-class-popup.component.css']
})
export class FastagVehicleClassPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  FasTagVehicleClassId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<FastagVehicleClassPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.FasTagVehicleClassId = parentData.FasTagVehicleClassId;
  }
  ngOnInit(): void {
    this.PageTitle = "Create FasTag Vehicle Class Details";

    this.DataDetailsForm = new FormGroup({
      FasTagVehicleClassName: new FormControl('', [Validators.required]),
      FasTagVehicleClassDescription: new FormControl('', [Validators.required]),
      PermissibleWeight: new FormControl('', [Validators.required, Validators.pattern(regExps['DecimalThreeDigit'])]),
      DataStatus: new FormControl(true),
    });

    if (this.FasTagVehicleClassId > 0) {
      this.PageTitle = "Update FasTag Vehicle Class Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.FasTagVehicleClassGetById(this.FasTagVehicleClassId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['FasTagVehicleClassName'].setValue(DetailData.FasTagVehicleClassName);
          this.DataDetailsForm.controls['FasTagVehicleClassDescription'].setValue(DetailData.FasTagVehicleClassDescription);
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
      FasTagVehicleClassId: this.FasTagVehicleClassId,
      FasTagVehicleClassName: this.DataDetailsForm.value.FasTagVehicleClassName,
      FasTagVehicleClassDescription: this.DataDetailsForm.value.FasTagVehicleClassDescription,
      PermissibleWeight: this.DataDetailsForm.value.PermissibleWeight,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.FasTagVehicleClassInsertUpdate(Obj).subscribe(
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
