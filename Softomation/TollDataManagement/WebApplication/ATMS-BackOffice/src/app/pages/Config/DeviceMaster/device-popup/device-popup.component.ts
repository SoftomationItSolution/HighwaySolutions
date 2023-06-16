import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-device-popup',
  templateUrl: './device-popup.component.html',
  styleUrls: ['./device-popup.component.css']
})
export class DevicePopupComponent implements OnInit {
  DeviceDetailsForm!: FormGroup;
  error = errorMessages;
  EntryId: number;
  DataStatus = true;
  DataStatusDs = 1;
  LoginUserId:any;
  ErrorData: any;
  HardwareTypeList: any;
  DeviceCategoryList:any;
  SiteList: any;
  DetailData: any;
  DeviceTypeList:any;
  PermissionData;
  LogedUserId;
  LogedRoleId;
  ButtonShow = false;
  SelectedCategoryId = 0;
  GantryData:any;
  LaneData:any;
  ConnectionTypeData:any;
  SelectedConntionType = 0;
  DirectionList = [{ Id: 0, Name: 'NONE' }, { Id: 1, Name: 'LHS' }, { Id: 2, Name: 'RHS' }, ];
  BaudRatePort = [{ Id: 110, Name: 110 }, { Id: 300, Name: 300 }, { Id: 600, Name: 600 }, { Id: 1200, Name: 1200 },
  { Id: 2400, Name: 2400 }, { Id: 4800, Name: 4800 }, { Id: 9600, Name: 9600 }, { Id: 14400, Name: 14400 }, { Id: 19200, Name: 19200 },
  { Id: 38400, Name: 38400 }, { Id: 57600, Name: 57600 }, { Id: 115200, Name: 115200 }, { Id: 128000, Name: 128000 }, { Id: 256000, Name: 256000 }];
  ComPortSetting:any = [];
  DefaultTCPIP = '192.168.0.0';
  DefaultTCPPort = 0;
  DefaultBaudRate = 9600;
  DefaultComPort = 'COM 1';
  close() { this.Dialogref.close(); }
  constructor(private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any, public datepipe: DatePipe,
              public Dialogref: MatDialogRef<DevicePopupComponent>, public dialog: MatDialog) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.LogedUserId = this.emitService.getUserDetails();
      this.EntryId = parentData.EntryId;
      this.PermissionData = parentData.PermissionData;
      if (this.EntryId == 0) {
        if (this.PermissionData.DataAdd == 1) {
            this.ButtonShow = true;
        }
      } else {
        if (this.PermissionData.DataUpdate == 1) {
         this.ButtonShow = true;
        }
      }

  }

  ngOnInit(): void {
    for (let i = 1; i <= 30; i++) {
      this.ComPortSetting.push({ Id: 'COM ' + i, Name: 'COM ' + i });
    }
    this.DeviceDetailsForm = new FormGroup({
      ControlRoomId: new FormControl('', [
        Validators.required
      ]),
      CategoryId: new FormControl('', [
        Validators.required
      ]),
      DeviceTypeId: new FormControl('', [
        Validators.required
      ]),
      DeviceName: new FormControl('', [
        Validators.required
      ]),
      Direction: new FormControl('', [
        Validators.required
      ]),
      IpAddress: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['IpAddress'])
      ]),
      PortNumber: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['PortNumber'])
      ]),
      ComPort: new FormControl('', [
         Validators.required
      ]),
      BaudRate: new FormControl('', [
         Validators.required
      ]),
      Latitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['Latitude'])
      ]),
      Longitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['Longitude'])
      ]),
      ConnectionTypeId: new FormControl('', [Validators.required]),
      DeviceLoginId: new FormControl(''),
      DevicePassword: new FormControl(''),
      ModelNumber: new FormControl(''),
      Manufacturer: new FormControl(''),
      Vendor: new FormControl(''),
      PurchageDate: new FormControl('', [
        Validators.required
      ]),
      ManufacturerDate: new FormControl('', [
        Validators.required
      ]),
      WarrantyExpireDate: new FormControl('', [
        Validators.required
      ]),
      Remark: new FormControl('', [
        Validators.required
      ]),
      GantryId: new FormControl('', [
        Validators.required
      ]),
      LaneNumber: new FormControl('', [
        Validators.required
      ]),
    });
    this.ControlRoomDetails();

    this.DeviceDetailsForm.controls['GantryId'].setValue(0);
    this.DeviceDetailsForm.controls['LaneNumber'].setValue(0);
    this.DeviceDetailsForm.controls['Direction'].setValue(0);
    this.DeviceDetailsForm.controls['ComPort'].setValue(this.DefaultComPort);
    this.DeviceDetailsForm.controls['BaudRate'].setValue(this.DefaultBaudRate);

  }
  ControlRoomDetails() {
    this.dbService.ControlRoomGetByUserId(this.LogedUserId).subscribe(
      data => {
        this.SiteList = data.ResponceData;
        this.DeviceCategory();
      },
      (error) => {
      }
    );
  }
  DeviceTypeDetails() {
    this.dbService.DeviceTypeGetByCatId(this.SelectedCategoryId).subscribe(
      data => {
        this.DeviceTypeList = data.ResponceData;
        if (this.EntryId != 0) {
          this.DeviceDetailsForm.controls['DeviceTypeId'].setValue(this.DetailData.DeviceTypeId);
        }
      },
      (error) => {
      }
    );
  }
  DeviceCategory() {
    this.dbService.CategoryMasterGetActive().subscribe(
      data => {
        this.DeviceCategoryList = data.ResponceData;
        this.GetGantryData();
        this.GetByConnectionType();
      },
      (error) => {
      }
    );
  }
  GetByConnectionType() {
    this.spinner.show();
    this.dbService.GetByConnectionType().subscribe(
      data => {
        this.spinner.hide();
        this.ConnectionTypeData = data.ResponceData;

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ConnectionTypeChnage(vaue:any) {
    this.SelectedConntionType = vaue;
    if (vaue == 1) {
      this.DeviceDetailsForm.controls['IpAddress'].reset();
      this.DeviceDetailsForm.controls['PortNumber'].reset();

      this.DeviceDetailsForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceDetailsForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
    } else if (vaue == 2) {
      this.DeviceDetailsForm.controls['ComPort'].reset();
      this.DeviceDetailsForm.controls['BaudRate'].reset();

      this.DeviceDetailsForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceDetailsForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
    } else {
      this.DeviceDetailsForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceDetailsForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
      this.DeviceDetailsForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceDetailsForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
    }
  }

  onCategoryChnage(value:any) {
    this.SelectedCategoryId = value;
    this.DeviceTypeDetails();
    if (this.SelectedCategoryId == 5) {
      this.DeviceDetailsForm.controls['IpAddress'].setValue('127.0.0.1');
      this.DeviceDetailsForm.controls['PortNumber'].setValue('80');
      this.DeviceDetailsForm.controls['ConnectionTypeId'].setValue(0);
    } else {
      if (this.EntryId == 0) {
        this.DeviceDetailsForm.controls['IpAddress'].reset();
        this.DeviceDetailsForm.controls['PortNumber'].reset();
        this.DeviceDetailsForm.controls['ConnectionTypeId'].reset();

      } else {
        this.DeviceDetailsForm.controls['IpAddress'].setValue(this.DetailData.IpAddress);
        this.DeviceDetailsForm.controls['PortNumber'].setValue(this.DetailData.PortNumber);
      }
    }
  }

  onGantryChnage(value:any) {
    this.GetLaneData(value, 0);
  }

  onChange(event:any) {
    if (event.checked) {
      this.DataStatus = true;
      this.DataStatusDs = 1;
    } else {
      this.DataStatus = false;
      this.DataStatusDs = 2;
    }
  }

  GetGantryData() {
    this.spinner.show();
    this.dbService.GantryGetAllActive().subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.GantryData = data.ResponceData;
          this.DeviceDetailsForm.controls['GantryId'].setValue(0);
          if (this.EntryId != 0) {
            this.DevicesDataGetById();
          }
        }

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetLaneData(GantryId:any, LaneNumber:any) {
    this.spinner.show();
    this.dbService.LaneConfigurationActiveGetByGantryId(GantryId).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.LaneData = data.ResponceData;
          this.DeviceDetailsForm.controls['LaneNumber'].setValue(LaneNumber);
        }

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  DevicesDataGetById() {
    this.spinner.show();
    this.dbService.DevicesMasterGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponceData;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.DeviceDetailsForm.controls['ControlRoomId'].setValue(this.DetailData.ControlRoomId);
        this.DeviceDetailsForm.controls['CategoryId'].setValue(this.DetailData.CategoryId);
        this.DeviceDetailsForm.controls['DeviceTypeId'].setValue(this.DetailData.DeviceTypeId);
        this.DeviceDetailsForm.controls['DeviceName'].setValue(this.DetailData.DeviceName);
        this.DeviceDetailsForm.controls['Direction'].setValue(this.DetailData.Direction);
        this.DeviceDetailsForm.controls['ConnectionTypeId'].setValue(this.DetailData.ConnectionTypeId);
        this.DeviceDetailsForm.controls['IpAddress'].setValue(this.DetailData.IpAddress);
        this.DeviceDetailsForm.controls['PortNumber'].setValue(this.DetailData.PortNumber);
        this.DeviceDetailsForm.controls['DeviceLoginId'].setValue(this.DetailData.DeviceLoginId);
        this.DeviceDetailsForm.controls['DevicePassword'].setValue(this.DetailData.DevicePassword);
        this.DeviceDetailsForm.controls['Latitude'].setValue(this.DetailData.Latitude);
        this.DeviceDetailsForm.controls['Longitude'].setValue(this.DetailData.Longitude);
        this.DeviceDetailsForm.controls['ModelNumber'].setValue(this.DetailData.ModelNumber);
        this.DeviceDetailsForm.controls['Manufacturer'].setValue(this.DetailData.Manufacturer);
        this.DeviceDetailsForm.controls['Vendor'].setValue(this.DetailData.Vendor);
        this.DeviceDetailsForm.controls['PurchageDate'].setValue(this.DetailData.PurchageDate);
        this.DeviceDetailsForm.controls['ManufacturerDate'].setValue(this.DetailData.ManufacturerDate);
        this.DeviceDetailsForm.controls['WarrantyExpireDate'].setValue(this.DetailData.WarrantyExpireDate);
        this.DeviceDetailsForm.controls['Remark'].setValue(this.DetailData.Remark);
        this.DeviceDetailsForm.controls['GantryId'].setValue(this.DetailData.GantryId);
        this.onCategoryChnage(this.DetailData.CategoryId);
        this.GetLaneData(this.DetailData.GantryId, this.DetailData.LaneNumber);
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

  ClosePoup() { this.Dialogref.close(); }

  SaveDeviceDetails() {
    if (this.DeviceDetailsForm.invalid) {
      return;
    }
    let ConnectionAddress = '';
    let Port = 0;
    if (this.DeviceDetailsForm.value.ConnectionTypeId == 1) {
      ConnectionAddress = this.DeviceDetailsForm.value.IpAddress;
      Port = this.DeviceDetailsForm.value.PortNumber;
    } else if (this.DeviceDetailsForm.value.ConnectionTypeId == 2) {
      ConnectionAddress = this.DeviceDetailsForm.value.ComPort;
      Port = this.DeviceDetailsForm.value.BaudRate;
    }
    const WarrantyExpireDate = this.datepipe.transform(this.DeviceDetailsForm.value.WarrantyExpireDate, 'dd-MMM-yyyy');
    const PurchageDate = this.datepipe.transform(this.DeviceDetailsForm.value.PurchageDate, 'dd-MMM-yyyy');
    const ManufacturerDate = this.datepipe.transform(this.DeviceDetailsForm.value.ManufacturerDate, 'dd-MMM-yyyy');
    const Obj = {
      EntryId: this.EntryId,
      ControlRoomId: this.DeviceDetailsForm.value.ControlRoomId,
      CategoryId: this.DeviceDetailsForm.value.CategoryId,
      DeviceTypeId: this.DeviceDetailsForm.value.DeviceTypeId,
      DeviceName: this.DeviceDetailsForm.value.DeviceName,
      Direction: this.DeviceDetailsForm.value.Direction,
      ConnectionTypeId: this.DeviceDetailsForm.value.ConnectionTypeId,
      IpAddress: ConnectionAddress,
      PortNumber: Port,
      DeviceLoginId: this.DeviceDetailsForm.value.DeviceLoginId,
      DevicePassword: this.DeviceDetailsForm.value.DevicePassword,
      Latitude: this.DeviceDetailsForm.value.Latitude,
      Longitude: this.DeviceDetailsForm.value.Longitude,
      ModelNumber: this.DeviceDetailsForm.value.ModelNumber,
      Manufacturer: this.DeviceDetailsForm.value.Manufacturer,
      Vendor: this.DeviceDetailsForm.value.Vendor,
      Remark: this.DeviceDetailsForm.value.Remark,
      PurchageDate,
      ManufacturerDate,
      WarrantyExpireDate,
      GantryId: this.DeviceDetailsForm.value.GantryId,
      LaneNumber: this.DeviceDetailsForm.value.LaneNumber,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LoginUserId,
      ModifiedBy: this.LoginUserId,
    };
    this.spinner.show();
    this.dbService.DevicesMasterInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.emitService.setPageRefresh(true);
          this.emitService.openSnackBar(this.ErrorData, true);
          this.ClosePoup();
        } else {
          this.ErrorData = data.Message;
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
