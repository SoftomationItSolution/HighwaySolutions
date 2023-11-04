import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  LogedRoleId;
  LogedUserId;
  EventHistroyData: any;
  ErrorData: any;
  PermissionData: any;
  SystemId = 0;
  hourFormat = 24
  TotalCount = 0;
  FilterDetailsForm!: FormGroup;
  MasterData: any;
  EventData: any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  VehicleClassDataList: any;
  DirectionList = [{ "DataValue": 1, "DataName": 'LHS' }, { "DataValue": 2, "DataName": 'RHS' }];
  PositionList = [{ "DataValue": 1, "DataName": 'Entry' }, { "DataValue": 2, "DataName": 'Exit' }, { "DataValue": 3, "DataName": 'Main Carriageway' }, { "DataValue": 4, "DataName": 'Parking Spot' }];
  SystemData: any;
  ReportList: any;
  submitted = false;
  pdfSrc: any;
  CallTypeList = [{ "DataValue": 1, "DataName": 'Incomming' }, { "DataValue": 2, "DataName": 'Outgoing' }, { "DataValue": 3, "DataName": 'Missed' }, { "DataValue": 4, "DataName": 'Rejected' }];
  constructor(private dm: DataModel, private spinner: NgxSpinnerService,
    public datepipe: DatePipe, private dbService: apiIntegrationService, private sanitizer: DomSanitizer) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit(): void {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date(SDDate + " 00:00:00")),
      EndDateTime: new FormControl(new Date()),
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      PositionFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      EventFilterList: new FormControl(''),
      VehicleClassFilterList: new FormControl(''),
      CallTypeFilterList: new FormControl(''),
      SystemId: new FormControl('', [Validators.required]),
      ReportId: new FormControl('', [Validators.required]),
    });
    this.SystemGetByName();
  }
  SystemGetByName() {
    this.spinner.show();
    let MenuUrl = window.location.pathname.replace('/', '');
    let systenname = MenuUrl.substring(0, 4)
    this.dbService.SystemGetByName(systenname).subscribe(
      data => {
        let SystemDetails = data.ResponseData;
        this.SystemId = SystemDetails.SystemId;
        this.GetPermissionData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetPermissionData() {
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: 0,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByMenu(Obj).subscribe(
      data => {
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.spinner.hide();
          this.dm.unauthorized();
        }
        else {
          this.GetMasterData();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetMasterData() {
    this.dbService.FilterMasterGetBySystemId(this.SystemId).subscribe(
      data => {
        this.MasterData = data.ResponseData;
        this.ControlRoomData = this.MasterData.ControlRoomDataList;
        this.PackageFilter = this.MasterData.PackageDataList;
        this.ChainageFilter = this.MasterData.ChainageDataList;
        this.SystemData = this.MasterData.SystemDataList
        this.VehicleClassDataList = this.MasterData.VehicleTypeList
        this.GetEventData();
        this.GetSystemList();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetSystemList() {
    this.dbService.SystemGetActive().subscribe(
      data => {
        this.SystemData = data.ResponseData.filter((e: { ReportIds: any; }) => e.ReportIds != '');
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetEventData() {
    this.dbService.EventsTypeGetBySystemId(this.SystemId).subscribe(
      data => {
        this.EventData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetMasterReportData() {
    this.dbService.FilterReportGetBySystemId(this.FilterDetailsForm.value.SystemId).subscribe(
      data => {
        this.ReportList = data.ResponseData.ReportTypeList;

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  FillPackages() {
    if (this.FilterDetailsForm.value.ControlRoomFilterList == null) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else if (this.FilterDetailsForm.value.ControlRoomFilterList.length == 0) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else if (this.FilterDetailsForm.value.ControlRoomFilterList.length == this.ControlRoomData.length) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else {
      var SelectedCR = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      var SelectedCRList = SelectedCR.split(',');
      var PackageData = this.MasterData.PackageDataList;
      this.PackageFilter = [];
      for (let i = 0; i < this.ControlRoomData.length; i++) {
        const crRow = this.ControlRoomData[i];
        for (let j = 0; j < SelectedCRList.length; j++) {
          if (SelectedCRList[j] == crRow.DataId.toString()) {
            var d1 = PackageData.filter((e: { ParentId: any; }) => e.ParentId == crRow.DataId);
            if (d1.length > 0) {
              for (let k = 0; k < d1.length; k++) {
                const element = d1[k];
                this.PackageFilter.push(element);
              }
            }
          }
        }
      }
    }
  }

  FillChainage() {
    if (this.FilterDetailsForm.value.PackageFilterList == null) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else if (this.FilterDetailsForm.value.PackageFilterList.length == 0) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else if (this.FilterDetailsForm.value.PackageFilterList.length == this.PackageFilter.length) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else {
      var SelectedPK = this.FilterDetailsForm.value.PackageFilterList.toString();
      var SelectedPKList = SelectedPK.split(',');
      var ChainageData = this.MasterData.ChainageDataList;
      this.ChainageFilter = [];
      for (let i = 0; i < this.PackageFilter.length; i++) {
        const pkgRow = this.PackageFilter[i];
        for (let j = 0; j < SelectedPKList.length; j++) {
          if (SelectedPKList[j] == pkgRow.DataId.toString()) {
            var d1 = ChainageData.filter((e: { DataValue: any; }) => e.DataValue >= pkgRow.MinValue && e.DataValue <= pkgRow.MaxValue);
            if (d1.length > 0) {
              for (let k = 0; k < d1.length; k++) {
                const element = d1[k];
                this.ChainageFilter.push(element);
              }
            }
          }
        }
      }
    }
  }
  SearchEntry() {
    this.submitted = true;
    if (this.FilterDetailsForm.valid) {
      let ControlRoomFilterList = "0"
      if (this.FilterDetailsForm.value.ControlRoomFilterList != null && this.FilterDetailsForm.value.ControlRoomFilterList != '') {
        let crData = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
        if (crData.split(',').length != this.ControlRoomData.length) {
          ControlRoomFilterList = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
        }
      }

      let PackageFilterList = "0"
      if (this.FilterDetailsForm.value.PackageFilterList != null && this.FilterDetailsForm.value.PackageFilterList != '') {
        let crData = this.FilterDetailsForm.value.PackageFilterList.toString();
        if (crData.split(',').length != this.PackageFilter.length) {
          PackageFilterList = this.FilterDetailsForm.value.PackageFilterList.toString();
        }
      }

      let ChainageFilterList = "0"
      if (this.FilterDetailsForm.value.ChainageFilterList != null && this.FilterDetailsForm.value.ChainageFilterList != '') {
        let crData = this.FilterDetailsForm.value.ChainageFilterList.toString();
        if (crData.split(',').length != this.ChainageFilter.length) {
          ChainageFilterList = this.FilterDetailsForm.value.ChainageFilterList.toString();
        }
      }

      let DirectionFilterList = "0"
      if (this.FilterDetailsForm.value.DirectionFilterList != null && this.FilterDetailsForm.value.DirectionFilterList != '') {
        let crData = this.FilterDetailsForm.value.DirectionFilterList.toString();
        if (crData.split(',').length != this.DirectionList.length) {
          DirectionFilterList = this.FilterDetailsForm.value.DirectionFilterList.toString();
        }
      }
      let VehicleClassFilterList = "0"
      if (this.FilterDetailsForm.value.VehicleClassFilterList != null && this.FilterDetailsForm.value.VehicleClassFilterList != '') {
        let crData = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
        if (crData.split(',').length != this.VehicleClassDataList.length) {
          VehicleClassFilterList = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
        }
      }
      let PositionFilterList = "0"
      if (this.FilterDetailsForm.value.PositionFilterList != null && this.FilterDetailsForm.value.PositionFilterList != '') {
        let crData = this.FilterDetailsForm.value.PositionFilterList.toString();
        if (crData.split(',').length != this.PositionList.length) {
          PositionFilterList = this.FilterDetailsForm.value.PositionFilterList.toString();
        }
      }

      let EventFilterList = "0"
      if (this.FilterDetailsForm.value.EventFilterList != null && this.FilterDetailsForm.value.EventFilterList != '') {
        let crData = this.FilterDetailsForm.value.EventFilterList.toString();
        if (crData.split(',').length != this.EventData.length) {
          EventFilterList = this.FilterDetailsForm.value.EventFilterList.toString();
        }
      }

      let CallTypeFilterList = "0"
    if (this.FilterDetailsForm.value.CallTypeFilterList != null && this.FilterDetailsForm.value.CallTypeFilterList != '') {
      let crData = this.FilterDetailsForm.value.CallTypeFilterList.toString();
      if (crData.split(',').length != this.CallTypeList.length) {
        CallTypeFilterList = this.FilterDetailsForm.value.CallTypeFilterList.toString();
      }
    }

      let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
      let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
      var obj = {
        ControlRoomFilterList: ControlRoomFilterList,
        PackageFilterList: PackageFilterList,
        ChainageFilterList: ChainageFilterList,
        DirectionFilterList: DirectionFilterList,
        PositionFilterList: PositionFilterList,
        EventFilterList: EventFilterList,
        VehicleClassFilterList: VehicleClassFilterList,
        CallTypeFilterList:CallTypeFilterList,
        ReportId: this.FilterDetailsForm.value.ReportId,
        SystemId: this.FilterDetailsForm.value.SystemId,
        StartDateTime: SD,
        EndDateTime: ED
      }
      this.spinner.show();
      this.dbService.ReportGetByFilter(obj).subscribe(
        data => {
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage.indexOf('pdf') > -1) {
            //this.pdfSrc=returnMessage;
            //this.pdfSrc=this.sanitizer.bypassSecurityTrustUrl(returnMessage)
            //this.pdfSrc = this._base64ToArrayBuffer(returnMessage);
            window.open(returnMessage);

            this.pdfSrc = {
              url: returnMessage,
              withCredentials: true
            };

          }
          this.spinner.hide();
        },
        (error) => {
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: "Something went wrong." }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      );
    }

  }

  _base64ToArrayBuffer(base64: string) {
    const binary_string = window.atob(base64);
    const len = binary_string.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; i++) {
      bytes[i] = binary_string.charCodeAt(i);
    }
    return bytes.buffer;
  }

  ReportTypeChange(value:any){
    if(value==1){
      this.FilterDetailsForm.get(["ControlRoomFilterList"])?.reset();
      this.FilterDetailsForm.get(["ControlRoomFilterList"])?.disable();

      this.FilterDetailsForm.get(["PackageFilterList"])?.reset();
      this.FilterDetailsForm.get(["PackageFilterList"])?.disable();

      this.FilterDetailsForm.get(["ChainageFilterList"])?.reset();
      this.FilterDetailsForm.get(["ChainageFilterList"])?.disable();

      this.FilterDetailsForm.get(["DirectionFilterList"])?.reset();
      this.FilterDetailsForm.get(["DirectionFilterList"])?.disable();

      this.FilterDetailsForm.get(["PositionFilterList"])?.reset();
      this.FilterDetailsForm.get(["PositionFilterList"])?.disable();

      this.FilterDetailsForm.get(["EventFilterList"])?.reset();
      this.FilterDetailsForm.get(["EventFilterList"])?.disable();

      this.FilterDetailsForm.get(["VehicleClassFilterList"])?.reset();
      this.FilterDetailsForm.get(["VehicleClassFilterList"])?.disable();

      this.FilterDetailsForm.get(["CallTypeFilterList"])?.reset();
      this.FilterDetailsForm.get(["CallTypeFilterList"])?.disable();
    }
    else{
      this.FilterDetailsForm.get(["ControlRoomFilterList"])?.reset();
      this.FilterDetailsForm.get(["ControlRoomFilterList"])?.enable();

      this.FilterDetailsForm.get(["PackageFilterList"])?.reset();
      this.FilterDetailsForm.get(["PackageFilterList"])?.enable();

      this.FilterDetailsForm.get(["ChainageFilterList"])?.reset();
      this.FilterDetailsForm.get(["ChainageFilterList"])?.enable();

      this.FilterDetailsForm.get(["DirectionFilterList"])?.reset();
      this.FilterDetailsForm.get(["DirectionFilterList"])?.enable();

      this.FilterDetailsForm.get(["PositionFilterList"])?.reset();
      this.FilterDetailsForm.get(["PositionFilterList"])?.enable();

      this.FilterDetailsForm.get(["EventFilterList"])?.reset();
      this.FilterDetailsForm.get(["EventFilterList"])?.enable();

      this.FilterDetailsForm.get(["VehicleClassFilterList"])?.reset();
      this.FilterDetailsForm.get(["VehicleClassFilterList"])?.enable();

      this.FilterDetailsForm.get(["CallTypeFilterList"])?.reset();
      this.FilterDetailsForm.get(["CallTypeFilterList"])?.enable();
    }

  }
}
