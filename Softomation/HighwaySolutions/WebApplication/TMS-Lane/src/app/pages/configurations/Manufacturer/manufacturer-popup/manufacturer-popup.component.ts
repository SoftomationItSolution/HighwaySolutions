import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-manufacturer-popup',
  templateUrl: './manufacturer-popup.component.html',
  styleUrls: ['./manufacturer-popup.component.css']
})
export class ManufacturerPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  ManufacturerId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<ManufacturerPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.ManufacturerId = parentData.ManufacturerId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create manufacturer Details";
    this.DataDetailsForm = new FormGroup({
      Name: new FormControl('', [Validators.required]),
      EmailId: new FormControl('', [Validators.required, Validators.pattern(regExps["EmailId"])]),
      MobileNumber: new FormControl('', [Validators.required, Validators.pattern(regExps["MobileNumber"])]),
      Address: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true),
    });
    
    if (this.ManufacturerId > 0) {
      this.PageTitle = "Update manufacturer Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.ManufacturerGetById(this.ManufacturerId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['Name'].setValue(DetailData.Name);
          this.DataDetailsForm.controls['Address'].setValue(DetailData.Address);
          this.DataDetailsForm.controls['MobileNumber'].setValue(DetailData.MobileNumber);
          this.DataDetailsForm.controls['EmailId'].setValue(DetailData.EmailId);
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
      ManufacturerId: this.ManufacturerId,
      Name: this.DataDetailsForm.value.Name,
      Address: this.DataDetailsForm.value.Address,
      MobileNumber: this.DataDetailsForm.value.MobileNumber,
      EmailId: this.DataDetailsForm.value.EmailId,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.ManufacturerInsertUpdate(Obj).subscribe(
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
