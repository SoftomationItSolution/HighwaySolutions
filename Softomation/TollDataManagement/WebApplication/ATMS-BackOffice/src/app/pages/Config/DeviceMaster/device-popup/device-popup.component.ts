import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';

@Component({
  selector: 'app-device-popup',
  templateUrl: './device-popup.component.html',
  styleUrls: ['./device-popup.component.css']
})
export class DevicePopupComponent implements OnInit {
  PageTitle: any;
  DeviceDetailsForm!: FormGroup;
  error = errorMessages;
  EquipmentId: number;
  DataStatus = true;
  LoginUserId: any;
  ErrorData: any;
  DetailData: any;
  DeviceTypeList: any;
  LogedUserId;
  DirectionList = [{ Id: 0, Name: 'None' }, { Id: 1, Name: 'LHS' }, { Id: 2, Name: 'RHS' }, { Id: 3, Name: 'Medium' }];
  BaudRatePort = [{ Id: 110, Name: 110 }, { Id: 300, Name: 300 }, { Id: 600, Name: 600 }, { Id: 1200, Name: 1200 },
  { Id: 2400, Name: 2400 }, { Id: 4800, Name: 4800 }, { Id: 9600, Name: 9600 }, { Id: 14400, Name: 14400 }, { Id: 19200, Name: 19200 },
  { Id: 38400, Name: 38400 }, { Id: 57600, Name: 57600 }, { Id: 115200, Name: 115200 }, { Id: 128000, Name: 128000 }, { Id: 256000, Name: 256000 }];
  ComPortSetting: any = [];
  DefaultTCPIP = '192.168.0.0';
  DefaultTCPPort = 0;
  DefaultBaudRate = 9600;
  DefaultComPort = 'COM 1';
  ClosePoup() { this.Dialogref.close(); }
  constructor(private emitService: EmittersService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    public datepipe: DatePipe, public Dialogref: MatDialogRef<DevicePopupComponent>, public dialog: MatDialog,
    private dbService: apiIntegrationService,) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.EquipmentId = parentData.EquipmentId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Equipment';
    if (this.EquipmentId > 0) {
      this.PageTitle = 'Update Equipment Details';
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetById(this.EquipmentId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        //this.DeviceDetailsForm.controls['ControlRoomName'].setValue(this.DetailData.ControlRoomName);
        if (this.DetailData.DataStatus == 1) {
          this.DeviceDetailsForm.controls['DataStatus'].setValue(true);
        } else {
          this.DeviceDetailsForm.controls['DataStatus'].setValue(false);
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
        this.Dialogref.close();
      }
    );
  }

  SaveDetails() {

  }
}
