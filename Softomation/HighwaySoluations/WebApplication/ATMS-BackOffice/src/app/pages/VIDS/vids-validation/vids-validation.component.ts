import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmEventType, ConfirmationService } from 'primeng/api';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vids-validation',
  templateUrl: './vids-validation.component.html',
  styleUrls: ['./vids-validation.component.css'],
  providers: [ConfirmationService]
})
export class VidsValidationComponent {
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
  PositionList = [{ "DataValue": 1, "DataName": 'Entry' }, { "DataValue": 2, "DataName": 'Exit' }, { "DataValue": 3, "DataName": 'Main Carriageway' }, { "DataValue": 4, "DataName": 'Parking Spot' }];
  SelectedRow: any = null;
  MediaPrefix: any;
  VehicleClass: any;
  VideoFound = false;
  TotalCount = 0;
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
      EventFilterList: new FormControl(''),
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
        this.GetEventData();
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
    this.dbService.VIDSPendingReviewGetByHours(24).subscribe(
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

  onMidiaView(TransactionRowData: any) {
    var obj = {
      PageTitle: "VIDS Event media-(" + TransactionRowData.EventTypeName + ")",
      ImageData: [{
        ImagePath: TransactionRowData.EventImageUrl
      }],
      VideoData: [{
        VideoPath: TransactionRowData.EventVideoUrl
      }],
      AudioData: [{
        AudioPath: ''
      }]
    }
    this.dm.MediaView(obj);
  }

  ExColl(event: any) {
    // document.getElementById("collapseOne").classList.toggle("show")
    // if (document.getElementById("datafilterIcon").classList.contains("fa-chevron-circle-up")) {
    //   document.getElementById("datafilterIcon").classList.remove("fa-chevron-circle-up")
    //   document.getElementById("datafilterIcon").classList.add("fa-chevron-circle-down")
    // }
    // else {
    //   document.getElementById("datafilterIcon").classList.remove("fa-chevron-circle-down")
    //   document.getElementById("datafilterIcon").classList.add("fa-chevron-circle-up")
    // }

    // if (document.getElementById("tbl").classList.contains("listtablepagging-c")) {
    //   document.getElementById("tbl").classList.remove("listtablepagging-c")
    //   document.getElementById("tbl").classList.add("listtablepagging")
    // }
    // else {
    //   document.getElementById("tbl").classList.remove("listtablepagging")
    //   document.getElementById("tbl").classList.add("listtablepagging-c")
    // }
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
      PositionFilterList: PositionFilterList,
      DirectionFilterList: DirectionFilterList,
      EventFilterList: EventFilterList,
      StartDateTime: SD,
      EndDateTime: ED
    }
    this.spinner.show();
    this.dbService.VIDSEventsGetByFilter(obj).subscribe(
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
    this.Reviewedform.controls['ReviewedPlateNumber'].setValue(this.SelectedRow.PlateNumber);
    this.Reviewedform.controls['ReviewedEventTypeId'].setValue(this.SelectedRow.EventTypeId);
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
    if (this.Reviewedform.value.IsChallanRequired) {
      if (this.Reviewedform.value.ReviewedPlateNumber == "") {
        this.ErrorData = [{ AlertMessage: 'Plate Number is required!.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        process = false
      }
      if (this.Reviewedform.value.ReviewedVehicleClassId == 0) {
        this.ErrorData = [{ AlertMessage: 'Vehicle Class is required!.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        process = false
      }
    }
    if (process) {
      var obj = {
        TransactionId: this.SelectedRow.TransactionId,
        ReviewedPlateNumber: this.Reviewedform.value.ReviewedPlateNumber,
        ReviewedEventTypeId: this.Reviewedform.value.ReviewedEventTypeId,
        ReviewedVehicleClassId: this.Reviewedform.value.ReviewedVehicleClassId,
        IsChallanRequired: this.Reviewedform.value.IsChallanRequired
      }
      this.dbService.VIDSEventReviewed(obj).subscribe(
        data => {
          this.spinner.hide();
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.ErrorData = [{ AlertMessage: 'Event is received successfully!.' }];
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
