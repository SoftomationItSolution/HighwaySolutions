import { Component, Inject, NgZone, OnDestroy, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { MQTTService } from 'src/services/mqtt.service';

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
  RemainingTimeMS = 0;
  PaymentAmount = 0;
  timer: any;
  expired = false;
  QRReferenceNumber: string = '';
  private mqttSubscription: any;
  constructor(public Dialogref: MatDialogRef<PaymentQrComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel, private dm: DataModel,
    private spinner: NgxSpinnerService, private dbService: apiIntegrationService,
    private _mqttService: MqttService, private zone: NgZone) {
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
          this.PaymentAmount = this.TransDetails.TransactionAmount + this.TransDetails.TagPenaltyAmount;
          this.ExpirySeconds = data.QrExpiry || 60;
          this.QRReferenceNumber = data.QRReferenceNumber;
          this.startTimer();
          this.subsMqtt(data.OrderId)
        }
        else {
          this.DisplayMessage(data.TransactionStatus, false)
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
    this.RemainingTimeMS = this.RemainingTime * 1000;

    this.expired = false;

    this.timer = setInterval(() => {
      this.RemainingTime--;

      // convert to ms for date pipe
      this.RemainingTimeMS = this.RemainingTime * 1000;

      if (this.RemainingTime <= 0) {
        clearInterval(this.timer);
        this.expired = true;
        this.RemainingTimeMS = 0;
      }
    }, 1000);
  }



  checkStatus() {
    const StatusPayloadData = {
      QRReferenceNumber: this.QRReferenceNumber,
      LaneId: this.TransDetails.LaneId,
      PaymentTypeId: this.TransDetails.PaymentTypeId
    }
    this.spinner.show();
    this.dbService.CheckQrStatus(StatusPayloadData).subscribe(
      data => {
        debugger;
        this.spinner.hide();
        if (data.IsSuccessful) {
          clearInterval(this.timer);
          this.BankQrUrl = '';
          this.Dialogref.close(this.TransDetails);
        }
        else {
          this.DisplayMessage(data.TransactionStatus, false)
        }
      },
      (error) => {
        console.error(error);
        this.spinner.hide();
        this.DisplayMessage('Something went wrong !', false)
      }
    );
  }
  ClosePoup() {
    clearInterval(this.timer);
    this.BankQrUrl = '';
    this.Dialogref.close(null);
  }

  DisplayMessage(msg, status) {
    const ErrorData = [{ AlertMessage: msg }];
    this.dm.openSnackBar(ErrorData, status);
  }

  ngOnDestroy(): void {
    clearInterval(this.timer);
  }

  subsMqtt(orderId: string) {
    debugger;
    const topic = `qrStatus/${orderId}`;
    if (this.mqttSubscription) {
      this.mqttSubscription.unsubscribe();
    }

    this.mqttSubscription = this._mqttService.observe(topic).subscribe((msg: IMqttMessage) => {
      this.zone.run(() => {
        if (msg.topic === topic) {

          let data: any;

          try {
            data = JSON.parse(msg.payload.toString());
          } catch (err) {
            console.error("Invalid JSON from MQTT:", msg.payload.toString());
            return;
          }

          // Payment Success
          if (data.IsSuccessful) {

            clearInterval(this.timer);
            this.BankQrUrl = '';

            // Avoid double close
            if (this.Dialogref) {
              this.Dialogref.close(this.TransDetails);
              this.Dialogref = null;
            }

            // Unsubscribe after success
            this.mqttSubscription.unsubscribe();
            return;
          }

          // Payment Failed or Pending
          if (data.TransactionStatus) {
            this.DisplayMessage(data.TransactionStatus, false);
          }
        }
      });
    });
  }
}