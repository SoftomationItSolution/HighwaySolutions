import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-equipment-manufacture-popup',
  templateUrl: './equipment-manufacture-popup.component.html',
  styleUrls: ['./equipment-manufacture-popup.component.css']
})
export class EquipmentManufacturePopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  ManufactureId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<EquipmentManufacturePopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.ManufactureId = parentData.ManufactureId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create System Integrator Details";
    this.DataDetailsForm = new FormGroup({
      ManufactureId: new FormControl(this.ManufactureId, [Validators.required]),
      ManufactureName: new FormControl('', [Validators.required, Validators.pattern(regExps["AlphaNumericSingleSpace"])]),
      ManufactureEmailId: new FormControl('', [Validators.required, Validators.pattern(regExps["EmailId"])]),
      ManufactureMobileNumber: new FormControl('', [Validators.required, Validators.pattern(regExps["MobileNumber"])]),
      ManufactureAddress: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true),
    });
    if (this.ManufactureId > 0) {
      this.PageTitle = "Update System Integrator Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.EquipmentManufactureGetById(this.ManufactureId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['ManufactureId'].setValue(DetailData.ManufactureId);
          this.DataDetailsForm.controls['ManufactureName'].setValue(DetailData.ManufactureName);
          this.DataDetailsForm.controls['ManufactureAddress'].setValue(DetailData.ManufactureAddress);
          this.DataDetailsForm.controls['ManufactureMobileNumber'].setValue(DetailData.ManufactureMobileNumber);
          this.DataDetailsForm.controls['ManufactureEmailId'].setValue(DetailData.ManufactureEmailId);
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
      ManufactureId: this.ManufactureId,
      ManufactureName: this.DataDetailsForm.value.ManufactureName,
      ManufactureAddress: this.DataDetailsForm.value.ManufactureAddress,
      ManufactureMobileNumber: this.DataDetailsForm.value.ManufactureMobileNumber,
      ManufactureEmailId: this.DataDetailsForm.value.ManufactureEmailId,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.EquipmentManufactureInsertUpdate(Obj).subscribe(
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
