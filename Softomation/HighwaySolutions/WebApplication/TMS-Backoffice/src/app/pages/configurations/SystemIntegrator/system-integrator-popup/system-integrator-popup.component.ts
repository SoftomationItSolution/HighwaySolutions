import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-system-integrator-popup',
  templateUrl: './system-integrator-popup.component.html',
  styleUrls: ['./system-integrator-popup.component.css']
})
export class SystemIntegratorPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  SystemIntegratorId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<SystemIntegratorPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.SystemIntegratorId = parentData.SystemIntegratorId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create System Integrator Details";
    this.DataDetailsForm = new FormGroup({
      SystemIntegratorId: new FormControl(this.SystemIntegratorId, [Validators.required]),
      SystemIntegratorName: new FormControl('', [Validators.required, Validators.pattern(regExps["AlphaNumericSingleSpace"])]),
      SystemIntegratorEmailId: new FormControl('', [Validators.required, Validators.pattern(regExps["EmailId"])]),
      SystemIntegratorMobileNumber: new FormControl('', [Validators.required, Validators.pattern(regExps["MobileNumber"])]),
      SystemIntegratorAddress: new FormControl('', [Validators.required]),
      SystemIntegratorLoginId: new FormControl(''),
      SystemIntegratorLoginPassword: new FormControl(''),
      DataStatus: new FormControl(true),
    });
    if (this.SystemIntegratorId > 0) {
      this.PageTitle = "Update System Integrator Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.SystemIntegratorGetById(this.SystemIntegratorId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['SystemIntegratorId'].setValue(DetailData.SystemIntegratorId);
          this.DataDetailsForm.controls['SystemIntegratorName'].setValue(DetailData.SystemIntegratorName);
          this.DataDetailsForm.controls['SystemIntegratorAddress'].setValue(DetailData.SystemIntegratorAddress);
          this.DataDetailsForm.controls['SystemIntegratorMobileNumber'].setValue(DetailData.SystemIntegratorMobileNumber);
          this.DataDetailsForm.controls['SystemIntegratorEmailId'].setValue(DetailData.SystemIntegratorEmailId);
          this.DataDetailsForm.controls['SystemIntegratorLoginId'].setValue(DetailData.SystemIntegratorLoginId);
          this.DataDetailsForm.controls['SystemIntegratorLoginPassword'].setValue(DetailData.SystemIntegratorLoginPassword);
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
      SystemIntegratorId: this.SystemIntegratorId,
      SystemIntegratorName: this.DataDetailsForm.value.SystemIntegratorName,
      SystemIntegratorAddress: this.DataDetailsForm.value.SystemIntegratorAddress,
      SystemIntegratorMobileNumber: this.DataDetailsForm.value.SystemIntegratorMobileNumber,
      SystemIntegratorEmailId: this.DataDetailsForm.value.SystemIntegratorEmailId,
      SystemIntegratorLoginId: this.DataDetailsForm.value.SystemIntegratorLoginId,
      SystemIntegratorLoginPassword: this.DataDetailsForm.value.SystemIntegratorLoginPassword,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.SystemIntegratorInsertUpdate(Obj).subscribe(
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
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }
}
