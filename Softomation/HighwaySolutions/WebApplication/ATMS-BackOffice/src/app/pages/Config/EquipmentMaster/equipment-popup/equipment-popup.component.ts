import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatStepper } from '@angular/material/stepper';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-equipment-popup',
  templateUrl: './equipment-popup.component.html',
  styleUrls: ['./equipment-popup.component.css']
})
export class EquipmentPopupComponent implements OnInit {
  @ViewChild('stepper') private myStepper: MatStepper | undefined;
  PageTitle: any;
  DeviceCommunicationForm!: FormGroup;
  DeviceDetailsForm!: FormGroup;
  LocationDetailsForm!: FormGroup;
  error = errorMessages;
  EquipmentId: number;
  DataStatus = true;
  LoginUserId: any;
  ErrorData: any;
  DetailData: any;
  DeviceTypeList: any;
  LogedUserId;
  DirectionList = [{ DataId: 0, DataName: 'None' },{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }, { DataId: 3, DataName: 'Median' }];
  ProtocolList = [{ DataId: 1, DataName: 'TCP' }, { DataId: 2, DataName: 'UDP' }, { DataId: 3, DataName: 'Serail' }, { DataId: 4, DataName: 'MQTT' }, { DataId: 5, DataName: 'HTTP' }, { DataId: 6, Name: "RTSP" }, { DataId: 6, DataName: "Other" }];
  BaudRatePort = [{ DataId: 110, DataName: 110 }, { DataId: 300, DataName: 300 }, { DataId: 600, DataName: 600 }, { DataId: 1200, DataName: 1200 },
  { DataId: 2400, DataName: 2400 }, { DataId: 4800, DataName: 4800 }, { DataId: 9600, DataName: 9600 }, { DataId: 14400, DataName: 14400 }, { DataId: 19200, DataName: 19200 },
  { DataId: 38400, DataName: 38400 }, { DataId: 57600, DataName: 57600 }, { DataId: 115200, DataName: 115200 }, { DataId: 128000, DataName: 128000 }, { DataId: 256000, DataName: 256000 }];
  ComPortSetting: any = [];
  DefaultTCPIP = '127.0.0.1';
  DefaultTCPPort = 0;
  DefaultBaudRate = 9600;
  DefaultComPort = 'COM 1';
  ControlRoomData: any;
  EquipmentTypeData: any;
  EquipmentTypeFilter: any;
  SystemTypeData: any;
  PackageData: any;
  PackageFilter: any;
  submitted = false;
  ClosePoup() { this.Dialogref.close(false); }
  isEditable = true;
  selectedIndex = 0
  btnMain = "Next"//Save changes
  btn1 = "Previous"//Close
  ConnectionTypeId = 1
  process=false;
  constructor(private dm: DataModel, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    public datepipe: DatePipe, public Dialogref: MatDialogRef<EquipmentPopupComponent>, public dialog: MatDialog,
    private dbService: apiIntegrationService,) {
    this.LogedUserId = this.dm.getUserId();
    this.EquipmentId = parentData.EquipmentId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Equipment';
    if (this.EquipmentId > 0) {
      this.PageTitle = 'Update Equipment Details';
    }

    for (let i = 1; i <= 10; i++) {
      this.ComPortSetting.push({ DataId: 'COM ' + i, DataName: 'COM ' + i });
    }

    this.LocationDetailsForm = new FormGroup({
      ControlRoomId: new FormControl('', [
        Validators.required
      ]),
      PackageId: new FormControl('', [
        Validators.required
      ]),
      SystemId: new FormControl('', [
        Validators.required
      ]),
      DirectionId: new FormControl('', [
        Validators.required
      ]),
      ChainageNumber: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['ChainageNumber'])
      ]),
      EquipmentName: new FormControl('', [
        Validators.required
      ]),
      Latitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['Latitude'])
      ]),
      Longitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['Longitude'])
      ])
    });

    this.DeviceDetailsForm = new FormGroup({
      MacAddress: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['MacAddress'])
      ]),
      ModelNumber: new FormControl('', Validators.required,),
      SerialNumber: new FormControl('', Validators.required,),
      ManufacturerDetail: new FormControl('', Validators.required,),
      VendorDetail: new FormControl('', Validators.required,),
      ManufacturerDate: new FormControl('', Validators.required,),
      PurchageDate: new FormControl('', Validators.required,),
      WarrantyExpireDate: new FormControl('', Validators.required,),
      DataStatus: new FormControl(true)
    });

    this.DeviceCommunicationForm = new FormGroup({
      EquipmentTypeId: new FormControl('', [
        Validators.required
      ]),
      ProtocolTypeId: new FormControl('', [
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
      LoginId: new FormControl('', Validators.required,),
      Password: new FormControl('', Validators.required,),
      DataStatus: new FormControl(true)
    });

    this.ControlRoom()
  }

  ControlRoom() {
    this.spinner.show();
    this.dbService.ControlRoomGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ControlRoomData = data.ResponseData;
        this.PackageType();

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
        this.Dialogref.close();
      }
    );
  }

  EquipmentType() {
    this.spinner.show();
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.EquipmentTypeData = data.ResponseData;
        if (this.EquipmentId > 0) {
          this.DetailsbyId();
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
        this.Dialogref.close();
      }
    );
  }

  PackageType() {
    this.spinner.show();
    this.dbService.PackagesGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.PackageData = data.ResponseData;
        this.SystemType();
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
        this.Dialogref.close();
      }
    );
  }

  SystemType() {
    this.spinner.show();
    this.dbService.SystemGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.SystemTypeData = data.ResponseData;
        this.EquipmentType();
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
        this.Dialogref.close();
      }
    );
  }

  ControlChange(ControlRoomId: any) {
    this.PackageFilter = this.PackageData.filter((e: { ControlRoomId: any; }) => e.ControlRoomId === ControlRoomId);
  }

  EquipmentTypeChnage(EquipmentTypeId: any) {
    this.EquipmentTypeFilter = this.EquipmentTypeData.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId === EquipmentTypeId)
    if (this.EquipmentTypeFilter.length > 0) {
      this.ConnectionTypeId = this.EquipmentTypeFilter[0].EquipmentConnectionTypeId
    }
    if (this.ConnectionTypeId == 1) {
      this.DeviceCommunicationForm.controls['LoginId'].reset();
      this.DeviceCommunicationForm.controls['Password'].reset();
      this.DeviceCommunicationForm.controls['IpAddress'].reset();
      this.DeviceCommunicationForm.controls['PortNumber'].reset();
      this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
      this.DeviceCommunicationForm.controls['ProtocolTypeId'].setValue(1);
    }
    else if (this.ConnectionTypeId == 2) {
      this.DeviceCommunicationForm.controls['LoginId'].reset();
      this.DeviceCommunicationForm.controls['Password'].reset();
      this.DeviceCommunicationForm.controls['ComPort'].reset();
      this.DeviceCommunicationForm.controls['BaudRate'].reset();
      this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
      this.DeviceCommunicationForm.controls['ProtocolTypeId'].setValue(3);
    }
    else {
      this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
      this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
      this.DeviceCommunicationForm.controls['ProtocolTypeId'].setValue(6);
      this.DeviceCommunicationForm.controls['LoginId'].setValue('NR');
      this.DeviceCommunicationForm.controls['Password'].setValue('NR');
    }
  }


  DetailsbyId() {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetById(this.EquipmentId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.LocationDetailsForm.controls['ControlRoomId'].setValue(this.DetailData.ControlRoomId);
        this.ControlChange(this.DetailData.ControlRoomId)
        this.LocationDetailsForm.controls['PackageId'].setValue(this.DetailData.PackageId);
        this.LocationDetailsForm.controls['SystemId'].setValue(this.DetailData.SystemId);
        this.LocationDetailsForm.controls['DirectionId'].setValue(this.DetailData.DirectionId);
        this.LocationDetailsForm.controls['ChainageNumber'].setValue(this.DetailData.ChainageNumber);
        this.LocationDetailsForm.controls['EquipmentName'].setValue(this.DetailData.EquipmentName);
        this.LocationDetailsForm.controls['Latitude'].setValue(this.DetailData.Latitude);
        this.LocationDetailsForm.controls['Longitude'].setValue(this.DetailData.Longitude);
        this.DeviceDetailsForm.controls['MacAddress'].setValue(this.DetailData.MacAddress);
        this.DeviceDetailsForm.controls['ModelNumber'].setValue(this.DetailData.ModelNumber);
        this.DeviceDetailsForm.controls['SerialNumber'].setValue(this.DetailData.SerialNumber);
        this.DeviceDetailsForm.controls['ManufacturerDetail'].setValue(this.DetailData.ManufacturerDetail);
        this.DeviceDetailsForm.controls['VendorDetail'].setValue(this.DetailData.VendorDetail);
        this.DeviceDetailsForm.controls['ManufacturerDate'].setValue(new Date(this.DetailData.ManufacturerDate));
        this.DeviceDetailsForm.controls['PurchageDate'].setValue(new Date(this.DetailData.PurchageDate));
        this.DeviceDetailsForm.controls['WarrantyExpireDate'].setValue(new Date(this.DetailData.WarrantyExpireDate));
        this.DeviceCommunicationForm.controls['EquipmentTypeId'].setValue(this.DetailData.EquipmentTypeId);
        this.EquipmentTypeChnage(this.DetailData.EquipmentTypeId)
        this.DeviceCommunicationForm.controls['ProtocolTypeId'].setValue(this.DetailData.ProtocolTypeId);
        this.EquipmentTypeFilter = this.EquipmentTypeData.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId === this.DetailData.ProtocolTypeId)
        if (this.EquipmentTypeFilter.length > 0) {
          this.ConnectionTypeId = this.EquipmentTypeFilter[0].EquipmentConnectionTypeId
        }
        if(this.ConnectionTypeId==1){
          this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DetailData.IpAddress);
          this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DetailData.PortNumber);
        }
        else if(this.ConnectionTypeId==2){
        this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DetailData.IpAddress);
        this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DetailData.PortNumber);
        }
        this.DeviceCommunicationForm.controls['LoginId'].setValue(this.DetailData.LoginId);
        this.DeviceCommunicationForm.controls['Password'].setValue(this.DetailData.Password);
        if (this.DetailData.DataStatus == 1) 
          this.DeviceDetailsForm.controls['DataStatus'].setValue(true);
        else 
          this.DeviceDetailsForm.controls['DataStatus'].setValue(false);
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
        this.Dialogref.close();
      }
    );
  }

  goBack() {
    const myStepper = this.myStepper;
    if(myStepper==null)
     return; 
    this.selectedIndex = myStepper.selectedIndex;
    myStepper.previous();
    if (this.selectedIndex == 0 && this.LocationDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
    }
    else if (this.selectedIndex == 1 && this.DeviceDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
    }
    else if (this.selectedIndex == 2 && this.DeviceCommunicationForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
    }
  }

  goForward(event:any) {
    this.submitted=true;
    const myStepper = this.myStepper;
    if(myStepper==null)
     return; 
     myStepper.next();
    this.selectedIndex = myStepper.selectedIndex;
    if (this.selectedIndex == 0 && this.LocationDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
      this.process=false;
    }
    else if (this.selectedIndex == 1 && this.DeviceDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
      this.process=false;
    }
    else if (this.selectedIndex == 2 && this.DeviceCommunicationForm.valid == true) {
      this.btnMain = "Save changes"
      this.btn1 = "Previous"
      this.process=true;
    }
    if(this.process && event.target.textContent=="Save changes"){
      this.SaveDetails()
    }

   

  }

  SaveDetails() {
    if (this.DeviceDetailsForm.invalid) {
      return;
    }
    let ConnectionAddress = '';
    let Port = 0;
    if (this.ConnectionTypeId == 1) {
      ConnectionAddress = this.DeviceCommunicationForm.value.IpAddress;
      Port = this.DeviceCommunicationForm.value.PortNumber;
    } else if (this.ConnectionTypeId == 2) {
      ConnectionAddress = this.DeviceCommunicationForm.value.ComPort;
      Port = this.DeviceCommunicationForm.value.BaudRate;
    }
    else {
      ConnectionAddress = this.DefaultTCPIP;
      Port = this.DefaultTCPPort;
    }
    const Obj = {
      EquipmentId: this.EquipmentId,
      ControlRoomId: this.LocationDetailsForm.value.ControlRoomId,
      PackageId: this.LocationDetailsForm.value.PackageId,
      SystemId: this.LocationDetailsForm.value.SystemId,
      DirectionId: this.LocationDetailsForm.value.DirectionId,
      ChainageNumber: this.LocationDetailsForm.value.ChainageNumber,
      EquipmentName: this.LocationDetailsForm.value.EquipmentName,
      Latitude: this.LocationDetailsForm.value.Latitude,
      Longitude: this.LocationDetailsForm.value.Longitude,
      MacAddress: this.DeviceDetailsForm.value.MacAddress,
      ModelNumber: this.DeviceDetailsForm.value.ModelNumber,
      SerialNumber: this.DeviceDetailsForm.value.SerialNumber,
      ManufacturerDetail: this.DeviceDetailsForm.value.ManufacturerDetail,
      VendorDetail: this.DeviceDetailsForm.value.VendorDetail,
      ManufacturerDate: this.datepipe.transform(this.DeviceDetailsForm.value.ManufacturerDate, 'dd-MMM-yyyy'),
      PurchageDate: this.datepipe.transform(this.DeviceDetailsForm.value.PurchageDate, 'dd-MMM-yyyy'),
      WarrantyExpireDate: this.datepipe.transform(this.DeviceDetailsForm.value.WarrantyExpireDate, 'dd-MMM-yyyy'),
      EquipmentTypeId: this.DeviceCommunicationForm.value.EquipmentTypeId,
      ProtocolTypeId: this.DeviceCommunicationForm.value.ProtocolTypeId,
      IpAddress: ConnectionAddress,
      PortNumber: Port,
      LoginId: this.DeviceCommunicationForm.value.LoginId,
      Password: this.DeviceCommunicationForm.value.Password,
      DataStatus: this.DeviceDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LoginUserId,
      ModifiedBy: this.LoginUserId
    };
    this.spinner.show();
    this.dbService.EquipmentDetailsInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
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
