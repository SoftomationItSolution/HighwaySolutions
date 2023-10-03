import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmEventType, ConfirmationService } from 'primeng/api';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-atcc-validation',
  templateUrl: './atcc-validation.component.html',
  styleUrls: ['./atcc-validation.component.css'],
  providers: [ConfirmationService]
})
export class AtccValidationComponent {
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
  FilterDetailsForm!: FormGroup;
  Reviewedform!: FormGroup;
  MasterData: any;
  EventData: any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  SelectedIndex: number = 0;
  DirectionList = [{ "DataValue": 1, "DataName": 'LHS' }, { "DataValue": 2, "DataName": 'RHS' }];
  PositionList = [{ "DataValue": 1, "DataName": 'Entry' }, { "DataValue": 2, "DataName": 'Exit' }, { "DataValue": 3, "DataName": 'Main Carriageway' }];
  SelectedRow: any = null;
  MediaPrefix: any;
  VehicleClass: any;
  VideoFound = false;
  TotalCount = 0;
  VehicleClassDataList:any;
  LaneDetailsList:any;
  constructor(private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService, public datepipe: DatePipe, private confirmationService: ConfirmationService) {
    this.MediaPrefix = this.dm.getMediaAPI()?.toString();
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit() {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date(SDDate + " 00:00:00")),
      EndDateTime: new FormControl(new Date()),
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      PositionFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      LaneFilterList: new FormControl(''),
      VehicleClassFilterList: new FormControl(''),
    });
    this.Reviewedform = new FormGroup({
      ReviewedPlateNumber: new FormControl(''),
      ReviewedEventTypeId: new FormControl(''),
      ReviewedVehicleClassId: new FormControl(''),
      IsChallanRequired: new FormControl(false)
    });
    this.SystemGetByName()
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
        this.GetVehicleClass();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetVehicleClass() {
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        this.VehicleClass = data.ResponseData;
        this.GetEventHistroy();
       
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetEventHistroy() {
    this.dbService.ATCCPendingReviewGetByHours(24).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalCount = this.EventHistroyData.length;
        if (this.TotalCount > 0) {
          var sd = this.EventHistroyData[this.TotalCount - 1].EventDateStamp;
          this.FilterDetailsForm.controls['StartDateTime'].setValue(new Date(sd));
        }
        this.SelectedIndex = 0;
        this.AutoSelected();
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

  onMidiaView(TransactionRowData: any) {
    var obj = {
      PageTitle: "ATCC Event media-(" + TransactionRowData.VehicleClassName + ")",
      ImageData: [{
        ImagePath: TransactionRowData.VehicleImageUrl
      }],
      VideoData: [{
        VideoPath: TransactionRowData.VehicleVideoUrl
      }],
      AudioData: [{
        AudioPath: ''
      }]
    }
    this.dm.MediaView(obj);
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
      tbl.classList.add("listtablepagging")
    }
    else {
      tbl.classList.remove("listtablepagging")
      tbl.classList.add("listtablepagging-c")
    }
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

    let PositionFilterList = "0"
    if (this.FilterDetailsForm.value.PositionFilterList != null && this.FilterDetailsForm.value.PositionFilterList != '') {
      let crData = this.FilterDetailsForm.value.PositionFilterList.toString();
      if (crData.split(',').length != this.PositionList.length) {
        PositionFilterList = this.FilterDetailsForm.value.PositionFilterList.toString();
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
      let crData=this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      if (crData.split(',').length != this.VehicleClassDataList.length) {
        VehicleClassFilterList = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      }
    }
    let LaneFilterList = "0"
    if (this.FilterDetailsForm.value.LaneFilterList != null && this.FilterDetailsForm.value.LaneFilterList != '') {
      let crData=this.FilterDetailsForm.value.LaneFilterList.toString();
      if (crData.split(',').length != this.LaneDetailsList.length) {
        LaneFilterList = this.FilterDetailsForm.value.LaneFilterList.toString();
      }
    }
    let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    var obj = {
      ControlRoomFilterList: ControlRoomFilterList,
      PackageFilterList: PackageFilterList,
      ChainageFilterList: ChainageFilterList,
      PositionFilterList: PositionFilterList,
      DirectionFilterList: DirectionFilterList,
      LaneFilterList: LaneFilterList,
      VehicleClassFilterList: VehicleClassFilterList,
      StartDateTime: SD,
      EndDateTime: ED,
      IsReviewedRequired:false
    }
    this.spinner.show();
    this.dbService.ATCCReviewedEventsGetByFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalCount = this.EventHistroyData.length;
        this.SelectedIndex = 0;
        this.AutoSelected();
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

  AutoSelected() {
    this.SelectedRow = this.EventHistroyData[this.SelectedIndex];
    this.Reviewedform.controls['ReviewedVehicleClassId'].setValue(this.SelectedRow.VehicleClassId);
    if (this.SelectedRow.EventVideoUrl != "") {
      this.dm.delay(100).then(any => {
        this.VideoFound = true;
      });
    }
  }

  onRowSelect(index: number) {
    this.SelectedIndex = index;
    this.AutoSelected();
  }

  SaveEntry() {
    let process = true;
    if (this.Reviewedform.value.ReviewedVehicleClassId == 0) {
      this.ErrorData = [{ AlertMessage: 'Vehicle Class is required!.' }];
      this.dm.openSnackBar(this.ErrorData, false);
      process = false
    }
    if (process) {
      var obj = {
        TransactionId: this.SelectedRow.TransactionId,
        ReviewedVehicleClassId: this.Reviewedform.value.ReviewedVehicleClassId
      }
      this.dbService.ATCCEventReviewed(obj).subscribe(
        data => {
          this.spinner.hide();
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.ErrorData = [{ AlertMessage: 'Event is Audit successfully!.' }];
            this.dm.openSnackBar(this.ErrorData, true);
            this.ProcessNextRecord();
          }
          else {
            this.confirmBox(returnMessage + " Do you want to reload data?")
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
  }

  ProcessNextRecord() {
    this.TotalCount = this.EventHistroyData.length;
    if (this.TotalCount > 1) {
      this.EventHistroyData.splice(this.SelectedIndex, 1);
    }
    this.TotalCount = this.EventHistroyData.length;
    this.SelectedIndex = 0;
    this.AutoSelected();
  }

  confirmBox(msg: string) {
    this.confirmationService.confirm({
      message: msg,
      icon: 'fa fa-exclamation-triangle',
      accept: () => {
        this.SearchEntry();
      },
      reject: (type: ConfirmEventType) => {
        this.ProcessNextRecord();
      }
    });
  }

  viewImage() {
    var myWindow = window.open(this.MediaPrefix + this.SelectedRow.EventImageUrl, "", "width=600");
  }
}
