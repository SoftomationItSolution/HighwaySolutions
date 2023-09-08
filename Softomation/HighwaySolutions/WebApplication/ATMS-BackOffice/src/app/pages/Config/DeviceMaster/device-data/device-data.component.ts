import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DevicePopupComponent } from '../device-popup/device-popup.component';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { FormControl, FormGroup } from '@angular/forms';
declare var $: any;
@Component({
  selector: 'app-device-data',
  templateUrl: './device-data.component.html',
  styleUrls: ['./device-data.component.css']
})
export class DeviceDataComponent implements OnInit {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  DevicesData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  TotalCount:0 | undefined;
  FilterDetailsForm!: FormGroup;
  MasterData: any;
  EquipmentTypeData: any;
  SystemData:any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  DirectionList = [{ DataId: 0, DataName: 'None' },{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }, { DataId: 3, DataName: 'Median' }];
  ProtocolList = [{ DataId: 1, DataName: 'TCP' }, { DataId: 2, DataName: 'UDP' }, { DataId: 3, DataName: 'Serail' }, { DataId: 4, DataName: 'MQTT' }, { DataId: 5, DataName: 'HTTP' }, { DataId: 6, DataName: "RTSP" }, { DataId: 6, DataName: "Other" }];
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService) {
    this.LogedRoleId = this.dm.getRoleId();
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


  ngOnInit() {
    this.FilterDetailsForm = new FormGroup({
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      SystemFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      EquipmentTypeFilterList: new FormControl(''),
    });
    this.GetPermissionData();
  }
  GetPermissionData() {
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId:0,
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
        else{
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
    this.dbService.FilterMasterGetBySystemId(0).subscribe(
      data => {
        this.MasterData = data.ResponseData;
        this.SystemData=this.MasterData.SystemDataList
        this.ControlRoomData = this.MasterData.ControlRoomDataList;
        this.PackageFilter = this.MasterData.PackageDataList;
        this.ChainageFilter = this.MasterData.ChainageDataList;
        this.EquipmentType();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  EquipmentType() {
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        this.EquipmentTypeData = data.ResponseData;
        this.GetAllData();
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

  GetAllData() {
    this.dbService.EquipmentDetailsGetAll().subscribe(
      data => {
        this.DevicesData = data.ResponseData;
        this.TotalCount = this.DevicesData.length;   
        this.spinner.hide();
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

  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Save', EquipmentId: 0 };
      const dialogRef = this.dialog.open(DevicePopupComponent, dialogConfig);
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

  onRowEditInit(TransactionRowData: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '500px';
      dialogConfig.data = { action: 'Update', EquipmentId: TransactionRowData.EquipmentId };
      const dialogRef = this.dialog.open(DevicePopupComponent, dialogConfig);
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

  SearchEntry() {
    let ControlRoomFilterList = "0"
    if (this.FilterDetailsForm.value.ControlRoomFilterList != null && this.FilterDetailsForm.value.ControlRoomFilterList != '') {
      let crData=this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      if (crData.split(',').length != this.ControlRoomData.length) {
        ControlRoomFilterList = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      }
    }

    let PackageFilterList = "0"
    if (this.FilterDetailsForm.value.PackageFilterList != null && this.FilterDetailsForm.value.PackageFilterList != '') {
      let crData=this.FilterDetailsForm.value.PackageFilterList.toString();
      if (crData.split(',').length != this.PackageFilter.length) {
        PackageFilterList = this.FilterDetailsForm.value.PackageFilterList.toString();
      }
    }

    let ChainageFilterList = "0"
    if (this.FilterDetailsForm.value.ChainageFilterList != null && this.FilterDetailsForm.value.ChainageFilterList != '') {
      let crData=this.FilterDetailsForm.value.ChainageFilterList.toString();
      if (crData.split(',').length != this.ChainageFilter.length) {
        ChainageFilterList = this.FilterDetailsForm.value.ChainageFilterList.toString();
      }
    }

    let DirectionFilterList = "0"
    if (this.FilterDetailsForm.value.DirectionFilterList != null && this.FilterDetailsForm.value.DirectionFilterList != '') {
      let crData=this.FilterDetailsForm.value.DirectionFilterList.toString();
      if (crData.split(',').length != this.DirectionList.length) {
        DirectionFilterList = this.FilterDetailsForm.value.DirectionFilterList.toString();
      }
    }

    let EquipmentTypeFilterList = "0"
    if (this.FilterDetailsForm.value.EquipmentTypeFilterList != null && this.FilterDetailsForm.value.EquipmentTypeFilterList != '') {
      let crData=this.FilterDetailsForm.value.EquipmentTypeFilterList.toString();
      if (crData.split(',').length != this.EquipmentTypeData.length) {
        EquipmentTypeFilterList = this.FilterDetailsForm.value.EquipmentTypeFilterList.toString();
      }
    }

    let SystemFilterList="0";
    if (this.FilterDetailsForm.value.SystemFilterList != null && this.FilterDetailsForm.value.SystemFilterList != '') {
      let crData=this.FilterDetailsForm.value.SystemFilterList.toString();
      if (crData.split(',').length != this.SystemData.length) {
        SystemFilterList = this.FilterDetailsForm.value.SystemFilterList.toString();
      }
    }
    var obj= {
      ControlRoomFilterList: ControlRoomFilterList,
      PackageFilterList:PackageFilterList,
      ChainageFilterList:ChainageFilterList,
      SystemFilterList:SystemFilterList,
      DirectionFilterList:DirectionFilterList,
      EquipmentTypeFilterList:EquipmentTypeFilterList,
    }
    this.spinner.show();
    this.dbService.EquipmentDetailsGetByFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponseData;    
        this.TotalCount = this.DevicesData.length;   
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
