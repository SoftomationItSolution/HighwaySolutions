import { Component } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { VMSMessageDetailsPopupComponent } from '../vms-message-details-popup/vms-message-details-popup.component';
import { EquipmentDetailsPopupComponent } from '../../Config/EquipmentMaster/equipment-details-popup/equipment-details-popup.component';
import { FormControl, FormGroup } from '@angular/forms';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-vms-message-details',
  templateUrl: './vms-message-details.component.html',
  styleUrls: ['./vms-message-details.component.css']
})
export class VMSMessageDetailsComponent {
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  MediaPrefix: any;
  TotalCount = 0;
  FilterDetailsForm!: FormGroup;
  SystemId = 0;
  EquipmentDetails: any;
  MasterData: any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  DirectionList = [{ "DataValue": 1, "DataName": 'LHS' }, { "DataValue": 2, "DataName": 'RHS' }];
  PositionList = [{ "DataValue": 1, "DataName": 'Entry' }, { "DataValue": 2, "DataName": 'Exit' }];
  EventHistroyData: any;
  MessageTypeList = [{ DataId: 1, DataName: "Text" }, { DataId: 2, DataName: "Image" }, { DataId: 3, DataName: "Video" }];
  constructor(public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService, public datepipe: DatePipe) {
      this.LogedRoleId = this.dm.getRoleId();
      this.LogedUserId = this.dm.getUserId();
      this.MediaPrefix = this.dm.getMediaAPI()?.toString();
  }

  ExColl() {
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

  ngOnInit(): void {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      // StartDateTime: new FormControl(new Date(SDDate + " 00:00:00")),
      // EndDateTime: new FormControl(new Date()),
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      PositionFilterList: new FormControl(''),
      MessageFilterList: new FormControl(''),
    });
    this.SystemGetByName()
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
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: 0,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByMenu(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
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
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetVMSList() {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetByTypeId(8).subscribe(
      data => {
        this.spinner.hide();
        this.EquipmentDetails = data.ResponseData;
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

  GetAllData() {
    this.spinner.show();
    this.dbService.VMSMessageGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  onMidiaView(TransactionRowData: any) {
    let imagepath = '';
    let Videopath = '';
    let Process = false;
    if (TransactionRowData.MessageTypeId == 1) {
      var MyWindow = window.open(this.MediaPrefix + TransactionRowData.MediaPath, 'MyWindow', 'width=600,height=300');
      Process = false;
    }
    else if (TransactionRowData.MessageTypeId == 2) {
      imagepath = TransactionRowData.MediaPath;
      Process = true;
    }
    else if (TransactionRowData.MessageTypeId == 3) {
      Videopath = TransactionRowData.MediaPath;
      Process = true;
    }
    if (Process) {
      var obj = {
        PageTitle: "Message media-(" + TransactionRowData.MessageTypeName + ")",

        ImageData: [{
          ImagePath: imagepath
        }],
        VideoData: [{
          VideoPath: Videopath
        }],
        AudioData: [{
          AudioPath: ''
        }]
      }
      this.dm.MediaView(obj);
    }
  }
  NewEntry() {
    if (this.DataAdd == 1) {
      localStorage.setItem('manualData', "");
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '55%';
      dialogConfig.height = '394px';
      dialogConfig.data = { action: 'Save', MessageId: 0 };
      const dialogRef = this.dialog.open(VMSMessageDetailsPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetAllData();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(data: any) {
    if (this.DataUpdate == 1) {
      localStorage.setItem('manualData', "");
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '55%';
      dialogConfig.height = '394px';
      dialogConfig.data = { action: 'Update', MessageId: data.MessageId };
      const dialogRef = this.dialog.open(VMSMessageDetailsPopupComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetAllData();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowViewInit(data: any) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '55%';
    dialogConfig.height = '400px';
    dialogConfig.data = { action: 'Update', EquipmentList: data.EquipmentList };
    const dialogRef = this.dialog.open(EquipmentDetailsPopupComponent, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetAllData();
        }
      }
    );
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
    let DirectionFilterList = "0"
    if (this.FilterDetailsForm.value.DirectionFilterList != null && this.FilterDetailsForm.value.DirectionFilterList != '') {
      let crData = this.FilterDetailsForm.value.DirectionFilterList.toString();
      if (crData.split(',').length != this.DirectionList.length) {
        DirectionFilterList = this.FilterDetailsForm.value.DirectionFilterList.toString();
      }
    }

    let PositionFilterList = "0"
    if (this.FilterDetailsForm.value.PositionFilterList != null && this.FilterDetailsForm.value.PositionFilterList != '') {
      let crData = this.FilterDetailsForm.value.PositionFilterList.toString();
      if (crData.split(',').length != this.PositionList.length) {
        PositionFilterList = this.FilterDetailsForm.value.PositionFilterList.toString();
      }
    }

    let MessageTypeIdFilterList = "0"
    if (this.FilterDetailsForm.value.MessageFilterList != null && this.FilterDetailsForm.value.MessageFilterList != '') {
      let crData = this.FilterDetailsForm.value.MessageFilterList.toString();
      if (crData.split(',').length != this.MessageTypeList.length) {
        MessageTypeIdFilterList = this.FilterDetailsForm.value.MessageFilterList.toString();
      }
    }
   
    var obj = {
      ControlRoomFilterList: ControlRoomFilterList,
      PackageFilterList: PackageFilterList,
      ChainageFilterList: ChainageFilterList,
      DirectionFilterList: DirectionFilterList,
      PositionFilterList: PositionFilterList,
      MessageTypeIdFilterList:MessageTypeIdFilterList,
    }
    this.spinner.show();
    this.dbService.VMSMessageGetByFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalCount = this.EventHistroyData.length;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}