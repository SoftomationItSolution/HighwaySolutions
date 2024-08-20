import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-float-process-popup',
  templateUrl: './float-process-popup.component.html',
  styleUrls: ['./float-process-popup.component.css']
})
export class FloatProcessPopupComponent implements OnInit {

  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  FloatProcessId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  TCList: any;
  LaneList: any;
  ShiftTimmingList: any;
  DefaultPlazaId = 0;
  DenominationData: any;
  AmountAlloted = 0;
  FloatTransactionTypeId = 0;
  LoginId = '';
  MediaPrefix = ''
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<FloatProcessPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel, public datepipe: DatePipe,) {
    const UserData = this.dm.getUserData()
    this.MediaPrefix = this.dm.getMediaAPI()?.toString();
    this.LogedUserId = UserData.UserId;
    this.LoginId = UserData.LoginId;
    this.FloatProcessId = parentData.FloatProcessId;
    this.FloatTransactionTypeId = parentData.FloatTransactionTypeId;

    this.DefaultPlazaId = this.dm.getDefaultPlazaId();
  }

  ngOnInit(): void {
    if (this.FloatTransactionTypeId == 3)
      this.PageTitle = "New Float Process";
    else if (this.FloatTransactionTypeId == 4)
      this.PageTitle = "New mid-shift Float Process";
    else if (this.FloatTransactionTypeId == 5)
      this.PageTitle = "New end-shift Float Process";
    this.DataDetailsForm = new FormGroup({
      LaneId: new FormControl('', [Validators.required]),
      ShiftId: new FormControl('', [Validators.required]),
      TransactionDateStamp: new FormControl('', [Validators.required]),
      AssignedTo: new FormControl('', [Validators.required]),

    });
    this.GetLaneList();

  }

  GetLaneList() {
    this.spinner.show();
    this.dbService.LaneGetByPlazaId(this.DefaultPlazaId).subscribe(
      data => {
        this.LaneList = data.ResponseData;
        this.GetTCList();
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

  GetTCList() {
    this.dbService.UserConfigurationGetByUserType(4).subscribe(
      data => {
        this.TCList = data.ResponseData;
        this.GetShiftTimining();
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

  GetShiftTimining() {
    this.dbService.GetShiftTimining().subscribe(
      data => {
        this.ShiftTimmingList = data.ResponseData;
        if (this.FloatProcessId > 0) {
          if (this.FloatTransactionTypeId == 3)
            this.PageTitle = "Update Float Process";
          else if (this.FloatTransactionTypeId == 4)
            this.PageTitle = "Update mid-shift Float Process";
          else if (this.FloatTransactionTypeId == 5)
            this.PageTitle = "Update end-shift Float Process";
          this.DetailsbyId();
        }
        else
          this.DenominationGetActive();
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

  DenominationGetActive() {
    this.dbService.DenominationGetActive().subscribe(
      data => {
        this.DenominationData = data.ResponseData;
        this.spinner.hide();
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

  DetailsbyId() {
    this.dbService.FloatProcessGetById(this.FloatProcessId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DenominationData = DetailData.FloatProcessDenominationList;
          this.AmountAlloted = DetailData.TransactionAmount;
          this.DataDetailsForm.controls['LaneId'].setValue(DetailData.LaneId);
          this.DataDetailsForm.controls['ShiftId'].setValue(DetailData.ShiftId);
          this.DataDetailsForm.controls['AssignedTo'].setValue(parseInt(DetailData.AssignedTo));
          this.DataDetailsForm.controls['TransactionDateStamp'].setValue(new Date(DetailData.TransactionDateStamp));

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

  CalculateAmount() {
    let total: number = 0;
    for (let index = 0; index < this.DenominationData.length; index++) {
      total = total + ((this.DenominationData[index].DenominationValue) * (this.DenominationData[index].DenominationCount))
    }
    this.AmountAlloted = total;
  }

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      ReceiptNumber: this.generateReceiptNumber(),
      FloatProcessId: this.FloatProcessId,
      PlazaId: this.DefaultPlazaId,
      TransactionAmount: this.AmountAlloted,
      AssignedBy: this.LogedUserId,
      LaneId: this.DataDetailsForm.value.LaneId,
      ShiftId: this.DataDetailsForm.value.ShiftId,
      AssignedTo: this.DataDetailsForm.value.AssignedTo,
      TransactionDateStamp: this.datepipe.transform(this.DataDetailsForm.value.TransactionDateStamp, 'dd-MMM-yyyy'),
      FloatProcessDenominationList: this.DenominationData,
      FloatTransactionTypeId: this.FloatTransactionTypeId,
      DataStatus: 1,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId,
      GeneratedBy: this.LoginId
    }
    this.spinner.show();
    this.dbService.FloatProcessSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success') > -1) {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          const url = `${this.MediaPrefix}/reports/${Obj.ReceiptNumber}.pdf`;
          window.open(url)
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

  generateReceiptNumber(): string {
    const timestamp: number = Date.now(); // Get current timestamp
    const random: number = Math.floor(Math.random() * 10000); // Generate random number between 0 and 9999
    const paddedRandom: string = random.toString().padStart(4, '0'); // Pad random number to have 4 digits
    const receiptNumber: string = `${timestamp}${paddedRandom}`; // Concatenate timestamp and padded random number
    return receiptNumber.substring(0, 20); // Ensure the length is 20 characters
  }
}