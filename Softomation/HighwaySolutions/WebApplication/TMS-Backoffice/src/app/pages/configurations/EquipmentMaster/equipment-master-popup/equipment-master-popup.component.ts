import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatStepper } from '@angular/material/stepper';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-equipment-master-popup',
  templateUrl: './equipment-master-popup.component.html',
  styleUrls: ['./equipment-master-popup.component.css']
})
export class EquipmentMasterPopupComponent implements OnInit {
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
  DirectionList = [{ DataId: 0, DataName: 'None' }, { DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }, { DataId: 3, DataName: 'Median' }];
  ProtocolList = [{ DataId: 1, DataName: 'TCP' }, { DataId: 2, DataName: 'UDP' }, { DataId: 3, DataName: 'Serail' }, { DataId: 4, DataName: 'MQTT' }, { DataId: 5, DataName: 'HTTP' }, { DataId: 6, DataName: "RTSP" }, { DataId: 7, DataName: "Other" }];
  BaudRatePort = [{ DataId: 110, DataName: 110 }, { DataId: 300, DataName: 300 }, { DataId: 600, DataName: 600 }, { DataId: 1200, DataName: 1200 },
  { DataId: 2400, DataName: 2400 }, { DataId: 4800, DataName: 4800 }, { DataId: 9600, DataName: 9600 }, { DataId: 14400, DataName: 14400 }, { DataId: 19200, DataName: 19200 },
  { DataId: 38400, DataName: 38400 }, { DataId: 57600, DataName: 57600 }, { DataId: 115200, DataName: 115200 }, { DataId: 128000, DataName: 128000 }, { DataId: 256000, DataName: 256000 }];
  ComPortSetting: any = [];
  DefaultTCPIP = '127.0.0.1';
  DefaultTCPPort = 0;
  DefaultBaudRate = 9600;
  DefaultComPort = 'COM 1';
  PlazaList: any;
  LaneList: any;
  LaneFilter: any;
  EquipmentTypeData: any;
  EquipmentTypeFilter: any;
  ManufactureList: any;
  SystemTypeData: any;

  submitted = false;
  ClosePoup() { this.Dialogref.close(false); }
  isEditable = true;
  selectedIndex = 0
  btnMain = "Next"//Save changes
  btn1 = "Previous"//Close
  ProtocolTypeId = 1
  process = false;
  constructor(private dm: DataModel, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    public datepipe: DatePipe, public Dialogref: MatDialogRef<EquipmentMasterPopupComponent>, public dialog: MatDialog,
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
      PlazaId: new FormControl('', [Validators.required]),
      LaneId: new FormControl('', [Validators.required]),
      ChainageNumber: new FormControl('', [Validators.required,Validators.pattern(regExps['ChainageNumber'])]),
      EquipmentName: new FormControl('', [Validators.required]),
      Latitude: new FormControl('', [Validators.required,Validators.pattern(regExps['Latitude'])]),
      Longitude: new FormControl('', [Validators.required,Validators.pattern(regExps['Longitude'])])
    });

    this.DeviceDetailsForm = new FormGroup({
      MacAddress: new FormControl('', [Validators.required,Validators.pattern(regExps['MacAddress'])]),
      ModelNumber: new FormControl('', Validators.required,),
      SerialNumber: new FormControl('', Validators.required,),
      ManufactureId: new FormControl('', Validators.required,),
      ManufacturerDate: new FormControl('', Validators.required,),
      PurchageDate: new FormControl('', Validators.required,),
      WarrantyExpireDate: new FormControl('', Validators.required,),
      DataStatus: new FormControl(true)
    });

    this.DeviceCommunicationForm = new FormGroup({
      EquipmentTypeId: new FormControl('', [Validators.required]),
      ProtocolTypeId: new FormControl('', [Validators.required]),
      IpAddress: new FormControl('', [Validators.required,Validators.pattern(regExps['IpAddress'])]),
      PortNumber: new FormControl('', [Validators.required,Validators.pattern(regExps['PortNumber'])]),
      ComPort: new FormControl('', [Validators.required]),
      BaudRate: new FormControl('', [Validators.required]),
      OtherAddress: new FormControl('', [Validators.required]),
      LoginId: new FormControl('', Validators.required,),
      LoginPassword: new FormControl('', Validators.required,),
      DataStatus: new FormControl(true)
    });

    this.GetPlazaList()
  }

  GetPlazaList() {
    this.spinner.show();
    this.dbService.PlazaGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.PlazaList = data.ResponseData;
        this.GetLane();
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
        this.Dialogref.close();
      }
    );
  }

  GetLane() {
    this.spinner.show();
    this.dbService.LaneGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.LaneList = data.ResponseData;
        this.GetEquipmentType();
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
        this.Dialogref.close();
      }
    );
  }

  GetEquipmentType() {
    this.spinner.show();
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.EquipmentTypeData = data.ResponseData;
        this.GetManufacture();
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
        this.Dialogref.close();
      }
    );
  }

  GetManufacture() {
    this.spinner.show();
    this.dbService.EquipmentManufactureGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ManufactureList = data.ResponseData;
        if (this.EquipmentId > 0) {
          this.DetailsbyId();
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
        this.Dialogref.close();
      }
    );
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetById(this.EquipmentId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        console.log(this.DetailData)
        this.LocationDetailsForm.controls['PlazaId'].setValue(this.DetailData.PlazaId);
        this.PlazaChange(this.DetailData.PlazaId)
        this.LocationDetailsForm.controls['LaneId'].setValue(this.DetailData.LaneId);
        this.LocationDetailsForm.controls['EquipmentName'].setValue(this.DetailData.EquipmentName);
        this.DeviceDetailsForm.controls['MacAddress'].setValue(this.DetailData.MacAddress);
        this.DeviceDetailsForm.controls['ModelNumber'].setValue(this.DetailData.ModelNumber);
        this.DeviceDetailsForm.controls['SerialNumber'].setValue(this.DetailData.SerialNumber);
        this.DeviceDetailsForm.controls['ManufactureId'].setValue(this.DetailData.ManufactureId);
        this.DeviceDetailsForm.controls['ManufacturerDate'].setValue(new Date(this.DetailData.ManufacturerDate));
        this.DeviceDetailsForm.controls['PurchageDate'].setValue(new Date(this.DetailData.PurchageDate));
        this.DeviceDetailsForm.controls['WarrantyExpireDate'].setValue(new Date(this.DetailData.WarrantyExpireDate));
        this.DeviceCommunicationForm.controls['EquipmentTypeId'].setValue(this.DetailData.EquipmentTypeId);
        this.DeviceCommunicationForm.controls['ProtocolTypeId'].setValue(this.DetailData.ProtocolTypeId);
        this.ProtocolTypeId=this.DetailData.ProtocolTypeId
        if (this.ProtocolTypeId === 1 || this.ProtocolTypeId == 2 || this.ProtocolTypeId == 4) {
          this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DetailData.IpAddress);
          this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DetailData.PortNumber);
          this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
          this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
          this.DeviceCommunicationForm.controls['OtherAddress'].setValue('N/R');
        }
        else if (this.ProtocolTypeId == 3) {
          this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DetailData.IpAddress);
          this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DetailData.PortNumber);
          this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
          this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
          this.DeviceCommunicationForm.controls['OtherAddress'].setValue('N/R');
        }
        else {
          this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
          this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
          this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
          this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
          this.DeviceCommunicationForm.controls['OtherAddress'].reset(this.DetailData.IpAddress);
        }
        this.DeviceCommunicationForm.controls['LoginId'].setValue(this.DetailData.LoginId);
        this.DeviceCommunicationForm.controls['LoginPassword'].setValue(this.DetailData.LoginPassword);
        if (this.DetailData.DataStatus == 1)
          this.DeviceDetailsForm.controls['DataStatus'].setValue(true);
        else
          this.DeviceDetailsForm.controls['DataStatus'].setValue(false);
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
        this.Dialogref.close();
      }
    );
  }

  PlazaChange(PlazaId: any) {
    const plaza = this.PlazaList.filter((e: { PlazaId: any; }) => e.PlazaId === PlazaId);
    this.LaneFilter = this.LaneList.filter((e: { PlazaId: any; }) => e.PlazaId === PlazaId);
    if (plaza.length > 0) {
      const DetailData = plaza[0];
      this.LocationDetailsForm.controls['ChainageNumber'].setValue(DetailData.ChainageNumber);
      this.LocationDetailsForm.controls['Latitude'].setValue(DetailData.Latitude);
      this.LocationDetailsForm.controls['Longitude'].setValue(DetailData.Longitude);
    }
  }

  ProtocolTypeChnage(ProtocolTypeId: any) {
    this.ProtocolTypeId = ProtocolTypeId;
    if (this.ProtocolTypeId === 1 || this.ProtocolTypeId == 2 || this.ProtocolTypeId == 4) {
      this.DeviceCommunicationForm.controls['IpAddress'].reset();
      this.DeviceCommunicationForm.controls['PortNumber'].reset();
      this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
      this.DeviceCommunicationForm.controls['OtherAddress'].setValue('N/R');
    }
    else if (this.ProtocolTypeId == 3) {
      this.DeviceCommunicationForm.controls['ComPort'].reset();
      this.DeviceCommunicationForm.controls['BaudRate'].reset();
      this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
      this.DeviceCommunicationForm.controls['OtherAddress'].setValue('N/R');
    }
    else {
      this.DeviceCommunicationForm.controls['ComPort'].setValue(this.DefaultComPort);
      this.DeviceCommunicationForm.controls['BaudRate'].setValue(this.DefaultBaudRate);
      this.DeviceCommunicationForm.controls['IpAddress'].setValue(this.DefaultTCPIP);
      this.DeviceCommunicationForm.controls['PortNumber'].setValue(this.DefaultTCPPort);
      this.DeviceCommunicationForm.controls['OtherAddress'].reset();
    }
  }

  

  goBack() {
    const myStepper = this.myStepper;
    if (myStepper == null)
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

  goForward(event: any) {
    this.submitted = true;
    const myStepper = this.myStepper;
    if (myStepper == null)
      return;
    myStepper.next();
    this.selectedIndex = myStepper.selectedIndex;
    if (this.selectedIndex == 0 && this.LocationDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
      this.process = false;
    }
    else if (this.selectedIndex == 1 && this.DeviceDetailsForm.valid == true) {
      this.btnMain = "Next"
      this.btn1 = "Previous"
      this.process = false;
    }
    else if (this.selectedIndex == 2 && this.DeviceCommunicationForm.valid == true) {
      this.btnMain = "Save changes"
      this.btn1 = "Previous"
      this.process = true;
    }
    if (this.process && event.target.textContent == "Save changes") {
      this.SaveDetails()
    }



  }

  SaveDetails() {
    if (this.DeviceDetailsForm.invalid) {
      return;
    }
    let ConnectionAddress = '';
    let Port = 0;
    if (this.ProtocolTypeId === 1 || this.ProtocolTypeId == 2 || this.ProtocolTypeId == 4) {
      ConnectionAddress = this.DeviceCommunicationForm.value.IpAddress;
      Port = this.DeviceCommunicationForm.value.PortNumber;
    } else if (this.ProtocolTypeId == 3) {
      ConnectionAddress = this.DeviceCommunicationForm.value.ComPort;
      Port = this.DeviceCommunicationForm.value.BaudRate;
    }
    else {
      ConnectionAddress = this.DeviceCommunicationForm.value.OtherAddress;
      Port = this.DefaultTCPPort;
    }
    const Obj = {
      EquipmentId: this.EquipmentId,
      PlazaId: this.LocationDetailsForm.value.PlazaId,
      LaneId: this.LocationDetailsForm.value.LaneId,
      EquipmentName: this.LocationDetailsForm.value.EquipmentName,
      MacAddress: this.DeviceDetailsForm.value.MacAddress,
      ModelNumber: this.DeviceDetailsForm.value.ModelNumber,
      SerialNumber: this.DeviceDetailsForm.value.SerialNumber,
      ManufactureId: this.DeviceDetailsForm.value.ManufactureId,
      ManufacturerDate: this.datepipe.transform(this.DeviceDetailsForm.value.ManufacturerDate, 'dd-MMM-yyyy'),
      PurchageDate: this.datepipe.transform(this.DeviceDetailsForm.value.PurchageDate, 'dd-MMM-yyyy'),
      WarrantyExpireDate: this.datepipe.transform(this.DeviceDetailsForm.value.WarrantyExpireDate, 'dd-MMM-yyyy'),
      EquipmentTypeId: this.DeviceCommunicationForm.value.EquipmentTypeId,
      ProtocolTypeId: this.DeviceCommunicationForm.value.ProtocolTypeId,
      IpAddress: ConnectionAddress,
      PortNumber: Port,
      LoginId: this.DeviceCommunicationForm.value.LoginId,
      LoginPassword: this.DeviceCommunicationForm.value.LoginPassword,
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
