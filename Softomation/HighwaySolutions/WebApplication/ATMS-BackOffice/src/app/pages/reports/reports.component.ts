import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
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
  constructor(private dm: DataModel, private spinner: NgxSpinnerService,
    public datepipe: DatePipe, private dbService: apiIntegrationService,) {
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
        this.GetEventData();
        this.GetVehicleList();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetVehicleList() {
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        this.VehicleClassDataList = data.ResponseData;
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
      let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
      let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
      var obj = {
        ControlRoomFilterList: ControlRoomFilterList,
        PackageFilterList: PackageFilterList,
        ChainageFilterList: ChainageFilterList,
        DirectionFilterList: DirectionFilterList,
        PositionFilterList:PositionFilterList,
        EventFilterList:EventFilterList,
        VehicleClassFilterList: VehicleClassFilterList,
        ReportId: this.FilterDetailsForm.value.ReportId,
        SystemId: this.FilterDetailsForm.value.SystemId,
        StartDateTime: SD,
        EndDateTime: ED
      }
      this.spinner.show();
      this.dbService.ReportGetByFilter(obj).subscribe(
        data => {
          let returnMessage = data.Message[0].AlertMessage;
          if(returnMessage.indexOf('pdf')>-1){
            window.open(returnMessage);
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
}
