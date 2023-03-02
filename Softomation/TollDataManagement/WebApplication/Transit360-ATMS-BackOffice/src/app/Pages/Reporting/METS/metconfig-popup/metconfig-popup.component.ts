import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService } from 'primeng/api';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-metconfig-popup',
  templateUrl: './metconfig-popup.component.html',
  styleUrls: ['./metconfig-popup.component.css']
})
export class METConfigPopupComponent implements OnInit {
  DeviceDetailsForm: FormGroup;
  error = errorMessages;
  EntryId = 0;
  LoginUserId;
  ErrorData: any;
  DevicesData: any;

  close() { this.Dialogref.close(); }
  constructor(private dbService: ApiService, private emitService: EmittersService, private spinner: NgxSpinnerService,
              public Dialogref: MatDialogRef<METConfigPopupComponent>, public dialog: MatDialog,
              private confirmationService: ConfirmationService) {
    this.LoginUserId = this.emitService.getUserDetails();

  }

  ngOnInit(): void {
    this.DeviceDetailsForm = new FormGroup({
      AirTemperatureMin: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      AirTemperatureMax: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      HumidityRH: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      HumidityAH: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      Visibility: new FormControl(0, [
        Validators.required
      ]),
      RoadTemperature: new FormControl(0, [
        Validators.required
      ]),
      WindDirectionValue: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      WindSpeedValue: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      RainValue: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.DecimalTwoDigit)
      ]),
      SynchronizeTime: new FormControl(0, [
        Validators.required,
        Validators.pattern(regExps.OnlyDigit)
      ]),
    });
    this.DevicesDataGetById();
  }
  DevicesDataGetById() {
    this.spinner.show();
    this.dbService.METConfigurationGet().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponceData;
        if (this.DevicesData.EntryId > 0) {
          this.EntryId = this.DevicesData.EntryId;
          this.DeviceDetailsForm.controls.AirTemperatureMin.setValue(this.DevicesData.AirTemperatureMin);
          this.DeviceDetailsForm.controls.AirTemperatureMax.setValue(this.DevicesData.AirTemperatureMax);
          this.DeviceDetailsForm.controls.HumidityRH.setValue(this.DevicesData.HumidityRH);
          this.DeviceDetailsForm.controls.HumidityAH.setValue(this.DevicesData.HumidityAH);
          this.DeviceDetailsForm.controls.Visibility.setValue(this.DevicesData.Visibility);
          this.DeviceDetailsForm.controls.RoadTemperature.setValue(this.DevicesData.RoadTemperature);
          this.DeviceDetailsForm.controls.WindDirectionValue.setValue(this.DevicesData.WindDirectionValue);
          this.DeviceDetailsForm.controls.WindSpeedValue.setValue(this.DevicesData.WindSpeedValue);

          this.DeviceDetailsForm.controls.RainValue.setValue(this.DevicesData.RainValue);
          this.DeviceDetailsForm.controls.SynchronizeTime.setValue(this.DevicesData.SynchronizeTime);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  SaveDeviceDetails() {
    if (this.DeviceDetailsForm.invalid) {
      return;
    }
    const message = 'Do you want to proceed with current configuration?';
    this.confirmationService.confirm({
      message,
      accept: () => {
        this.OnSubmit();
      }
    });
  }
  OnSubmit() {

    const Obj = {
      EntryId: this.EntryId,
      AirTemperatureMin: this.DeviceDetailsForm.value.AirTemperatureMin,
      AirTemperatureMax: this.DeviceDetailsForm.value.AirTemperatureMax,
      HumidityRH: this.DeviceDetailsForm.value.HumidityRH,
      HumidityAH: this.DeviceDetailsForm.value.HumidityAH,
      Visibility: this.DeviceDetailsForm.value.Visibility,
      RoadTemperature: this.DeviceDetailsForm.value.RoadTemperature,
      WindDirectionValue: this.DeviceDetailsForm.value.WindDirectionValue,
      WindSpeedValue: this.DeviceDetailsForm.value.WindSpeedValue,
      RainValue: this.DeviceDetailsForm.value.RainValue,
      SynchronizeTime: this.DeviceDetailsForm.value.SynchronizeTime,
      CreatedBy: this.LoginUserId,
      ModifiedBy: this.LoginUserId,
    };
    this.spinner.show();
    this.dbService.METConfigurationInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.emitService.openSnackBar(this.ErrorData, true);
          this.close();
        } else {
          this.ErrorData = data;
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  ClearData() {
    this.DeviceDetailsForm.reset();
  }
}
