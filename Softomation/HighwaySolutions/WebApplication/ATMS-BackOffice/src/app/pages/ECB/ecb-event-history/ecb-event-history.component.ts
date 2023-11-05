import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-ecb-event-history',
  templateUrl: './ecb-event-history.component.html',
  styleUrls: ['./ecb-event-history.component.css']
})
export class ECBEventHistoryComponent implements OnInit {
  callHistory: any;
  PbxRecordingPath: any;
  LogedRoleId: any;
  ErrorData: any;
  TotalCount = 0;
  FilterDetailsForm!: FormGroup;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  PermissionData: any;
  SystemId: any;
  MasterData: any;
  EventData: any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  LaneDetailsList: any;
  VehicleClassDataList: any;
  DirectionList = [{ "DataValue": 1, "DataName": 'LHS' }, { "DataValue": 2, "DataName": 'RHS' }];
  CallTypeList = [{ "DataValue": 1, "DataName": 'Incomming' }, { "DataValue": 2, "DataName": 'Outgoing' }, { "DataValue": 3, "DataName": 'Missed' }, { "DataValue": 4, "DataName": 'Rejected' }];
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService, public datepipe: DatePipe) {
    this.LogedRoleId = this.dm.getRoleId();
    this.PbxRecordingPath = this.dm.getPBXRecordAPI()?.toString();
    this.SystemGetByName()
  }
  ExColl(event: any) {
    const collapseOne = document.getElementById("collapseOne")!
    collapseOne.classList.toggle("show")
    const datafilterIcon = document.getElementById("datafilterIcon")!
    const tbl = document.getElementById("tbl")!
    if (datafilterIcon.classList.contains("mdi-arrow-up-circle")) {
      datafilterIcon.classList.remove("mdi-arrow-up-circle")
      datafilterIcon.classList.add("mdi-arrow-down-circle")
    }
    else {
      datafilterIcon.classList.remove("mdi-arrow-down-circle")
      datafilterIcon.classList.add("mdi-arrow-up-circle")
    }

    if (tbl.classList.contains("listtablepagging-c")) {
      tbl.classList.remove("listtablepagging-c")
      tbl.classList.add("listtablepagging-1")
    }
    else {
      tbl.classList.remove("listtablepagging-1")
      tbl.classList.add("listtablepagging-c")
    }
  }

  ngOnInit() {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date(SDDate + " 00:00:00")),
      EndDateTime: new FormControl(new Date()),
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      EventFilterList: new FormControl(''),
    });
  }

  SystemGetByName() {
    this.spinner.show();
    let MenuUrl = window.location.pathname.replace('/', '');
    let systenname = MenuUrl.substring(0, 3)
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
        this.GetEventData();
        this.GetCallHistroy();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.GetCallHistroy();
      }
    );
  }

  GetCallHistroy() {
    this.dbService.ECBEventsGetByHours(24).subscribe(
      data => {
        this.spinner.hide();
        this.callHistory = data.ResponseData;
        this.TotalCount = this.callHistory.length;
        if (this.TotalCount > 0) {
          var sd = this.callHistory[this.TotalCount - 1].StartDateTimeStamp;
          this.FilterDetailsForm.controls['StartDateTime'].setValue(new Date(sd));
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: "Something went wrong." }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
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

  SearchEntry() {
    let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    
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

    let EventFilterList = "0"
      if (this.FilterDetailsForm.value.EventFilterList != null && this.FilterDetailsForm.value.EventFilterList != '') {
        let crData = this.FilterDetailsForm.value.EventFilterList.toString();
        if (crData.split(',').length != this.EventData.length) {
          EventFilterList = this.FilterDetailsForm.value.EventFilterList.toString();
        }
      }

    const obj = {
      StartDateTime: SD,
      EndDateTime: ED,
      ControlRoomFilterList: ControlRoomFilterList,
      PackageFilterList: PackageFilterList,
      ChainageFilterList: ChainageFilterList,
      DirectionFilterList: DirectionFilterList,
      EventFilterList: EventFilterList,
    }
    this.spinner.show();
    this.dbService.ECBEventsGetByFilter(obj).subscribe(
      data => {
        this.callHistory = data.ResponseData;
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}