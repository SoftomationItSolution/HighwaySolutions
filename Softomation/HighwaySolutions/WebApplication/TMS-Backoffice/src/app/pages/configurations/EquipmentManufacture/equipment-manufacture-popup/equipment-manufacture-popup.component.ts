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
  EquipmentManufactureId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<EquipmentManufacturePopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.EquipmentManufactureId = parentData.EquipmentManufactureId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create System Integrator Details";
    this.DataDetailsForm = new FormGroup({
      EquipmentManufactureId: new FormControl(this.EquipmentManufactureId, [Validators.required]),
      EquipmentManufactureName: new FormControl('', [Validators.required, Validators.pattern(regExps["AlphaNumericSingleSpace"])]),
      EquipmentManufactureEmailId: new FormControl('', [Validators.required, Validators.pattern(regExps["EmailId"])]),
      EquipmentManufactureMobileNumber: new FormControl('', [Validators.required, Validators.pattern(regExps["MobileNumber"])]),
      EquipmentManufactureAddress: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true),
    });
    if (this.EquipmentManufactureId > 0) {
      this.PageTitle = "Update System Integrator Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.EquipmentManufactureGetById(this.EquipmentManufactureId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['EquipmentManufactureId'].setValue(DetailData.EquipmentManufactureId);
          this.DataDetailsForm.controls['EquipmentManufactureName'].setValue(DetailData.EquipmentManufactureName);
          this.DataDetailsForm.controls['EquipmentManufactureAddress'].setValue(DetailData.EquipmentManufactureAddress);
          this.DataDetailsForm.controls['EquipmentManufactureMobileNumber'].setValue(DetailData.EquipmentManufactureMobileNumber);
          this.DataDetailsForm.controls['EquipmentManufactureEmailId'].setValue(DetailData.EquipmentManufactureEmailId);
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
      EquipmentManufactureId: this.EquipmentManufactureId,
      EquipmentManufactureName: this.DataDetailsForm.value.EquipmentManufactureName,
      EquipmentManufactureAddress: this.DataDetailsForm.value.EquipmentManufactureAddress,
      EquipmentManufactureMobileNumber: this.DataDetailsForm.value.EquipmentManufactureMobileNumber,
      EquipmentManufactureEmailId: this.DataDetailsForm.value.EquipmentManufactureEmailId,
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
