import { Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-payment-qr',
  templateUrl: './payment-qr.component.html'
})
export class PaymentQrComponent implements OnInit, OnDestroy {
  TransDetails: any
  BankQrUrl = "assets/images/waiting.gif";
  QrPayloadData: any;
  ExpirySeconds = 60;   // from bank response (QR_Expiry)
  RemainingTime = 0;
  timer: any;
  expired = false;
  constructor(public Dialogref: MatDialogRef<PaymentQrComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel, private dm: DataModel,
    private spinner: NgxSpinnerService, private dbService: apiIntegrationService) {
    this.TransDetails = parentData;

  }

  ngOnInit(): void {
    if (this.TransDetails == null) {
      this.DisplayMessage('this QR transaction not allowed!', false);
    }
    else {

      this.generateQR();
    }
  }

  generateQR() {
    this.QrPayloadData = {
      TransactionAmount: this.TransDetails.TransactionAmount,
      TagPenaltyAmount: 0,
      TransactionDateTime: this.TransDetails.TransactionDateTime,
      PlateNumber: this.TransDetails.PlateNumber,
      VehicleClassId: this.TransDetails.VehicleClassId,
      LaneTransactionId: this.TransDetails.LaneTransactionId,
      LaneId: this.TransDetails.LaneId,
      PaymentTypeId: this.TransDetails.PaymentTypeId,
    }
    this.spinner.show();
    this.dbService.GenerateQr(this.QrPayloadData).subscribe(
      data => {
        this.spinner.hide();
        if (data.IsSuccessful) {
          this.BankQrUrl = data.QRData || 'assets/images/waiting.gif';
          this.TransDetails.TagPenaltyAmount = data.TagPenaltyAmount;
          this.ExpirySeconds = data.expiry || 60;
          this.startTimer();
        }
        else {
          this.DisplayMessage(data.QRReferenceNumber, false)
        }
      },
      (error) => {
        console.error(error);
        this.spinner.hide();
        this.DisplayMessage('Something went wrong !', false)
      }
    );
  }

  startTimer() {
    this.RemainingTime = this.ExpirySeconds;
    this.expired = false;

    this.timer = setInterval(() => {
      this.RemainingTime--;
      if (this.RemainingTime <= 0) {
        clearInterval(this.timer);
        this.expired = true;
      }
    }, 1000);
  }



  checkStatus() {

  }
  ClosePoup() {
    clearInterval(this.timer);
    this.BankQrUrl = '';
    this.Dialogref.close(false);
  }

  DisplayMessage(msg, status) {
    const ErrorData = [{ AlertMessage: msg }];
    this.dm.openSnackBar(ErrorData, status);
  }

  ngOnDestroy(): void {
    clearInterval(this.timer);
  }
}