import { AfterViewInit, Compiler, Component, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { Subscription } from 'rxjs';
import { FormControl, FormGroup } from '@angular/forms';
import { DatePipe } from '@angular/common';
import { FasTagUploadPending } from '../upload-pending/fasTag-upload-pending.component';
import { FasTagResponsePending } from '../response-pending/fasTag-response-pending.component';
import { FasTagResponseDeclined } from '../response-declined/fasTag-response-declined.component';

@Component({
  selector: 'et-fasTag-data-pending',
  templateUrl: './fasTag-data-pending.component.html',
  styleUrls: ['./fasTag-data-pending.component.css']
})
export class FasTagDataPending implements OnInit, AfterViewInit, OnDestroy {
  subscription!: Subscription;
  FilterDetailsForm!: FormGroup;
  ShiftData: any;
  LaneUserData: any;
  TransactionTypeData: any;
  LaneDataList: any;
  APIRootPath: any;
  LogedRoleId: any;
  EventHistroyData: any;
  PermissionData: any;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  PlazaDataList: any;
  LaneData: any
  LaneList: any = [];
  UserDetails: any;
  ClassData: any;
  SubClassData: any;
  SubClassList: any = [];
  TotalTransactionCount: any = 0;
  SelectedPlateImage: any;
  SelectedPlateRImage: any;
  SelectedPlateAVCImage: any
  SelectedPlateVideo = '';
  ErrorData: any;
  LogedUserId = 0;
  DataAdd: Number = 0;
  IcdApiData: any;
  SftpStatusData: any;
  SftpCountData:any
  SftpCurrentData: any;
  constructor(private _compiler: Compiler, private dbService: apiIntegrationService, private spinner: NgxSpinnerService, private dm: DataModel,
    public dialog: MatDialog, public datepipe: DatePipe) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }

  ngOnInit(): void {
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date()),
      EndDateTime: new FormControl(new Date()),
      VehicleClassFilterList: new FormControl(''),
      VehicleSubClassFilterList: new FormControl(''),
      PlateNumber: new FormControl(''),
      TransactionId: new FormControl(''),
      TagId: new FormControl('')
    });
  }

  ngAfterViewInit(): void {
    this._compiler.clearCache();
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

    if (tbl.classList.contains("listtablepagging-cf3")) {
      tbl.classList.remove("listtablepagging-cf3")
      tbl.classList.add("listtablepagging")
    }
    else {
      tbl.classList.remove("listtablepagging")
      tbl.classList.add("listtablepagging-cf3")
    }
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
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.dm.unauthorized();
          this.spinner.hide();
        }
        else
          this.GetMasterData();

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
  GetMasterData() {
    this.subscription = this.dbService.FilterMasterGet().subscribe(
      (data: any) => {
        this.spinner.hide();
        var MaserData = data.ResponseData;
        this.ShiftData = MaserData.ShiftTiminingList;
        this.LaneUserData = MaserData.TCMasterList;
        this.PlazaDataList = MaserData.PlazaDataList;
        this.LaneData = MaserData.LaneDataList;
        this.ClassData = MaserData.SystemClassList;
        this.SubClassData = MaserData.SystemSubClassList;
        this.TransactionTypeData = MaserData.TransactionTypeList;
        this.GetDefaultData();
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

  GetDefaultData() {
    this.spinner.show();
    this.subscription = this.dbService.IcdRequestStatus().subscribe(
      data => {
        this.spinner.hide();
        this.masterData(data.ResponseData)
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

  masterData(dataset){
    this.IcdApiData = dataset[0];
    this.SftpStatusData=dataset[1]
    this.SftpCountData=dataset[2]
    this.SftpCurrentData=dataset[4]
  }

  PlazaChange() {
    this.LaneList = [];
    let pl = this.FilterDetailsForm.value.PlazaFilterList;
    for (let index = 0; index < pl.length; index++) {
      var d1 = this.LaneData.filter((e: { ParentId: any; }) => e.ParentId == pl[index]);
      for (let j = 0; j < d1.length; j++) {
        this.LaneList.push(d1[j])
      }
    }
  }

  VehicleClassChange() {
    let vc = this.FilterDetailsForm.value.VehicleClassFilterList;
    this.SubClassList = [];
    for (let index = 0; index < vc.length; index++) {
      var d1 = this.SubClassData.filter((e: { ParentId: any; }) => e.ParentId == vc[index]);
      for (let j = 0; j < d1.length; j++) {
        this.SubClassList.push(d1[j])
      }
    }
  }

  FilterAllData() {
    this.TotalTransactionCount = 0;
    let VehicleClassFilterList = "0"
    if (this.FilterDetailsForm.value.VehicleClassFilterList != null && this.FilterDetailsForm.value.VehicleClassFilterList != '') {
      let crData = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      if (crData.split(',').length != this.ClassData.length) {
        VehicleClassFilterList = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      }
    }

    let VehicleSubClassFilterList = "0"
    if (this.FilterDetailsForm.value.VehicleSubClassFilterList != null && this.FilterDetailsForm.value.VehicleSubClassFilterList != '') {
      let crData = this.FilterDetailsForm.value.VehicleSubClassFilterList.toString();
      if (crData.split(',').length != this.SubClassList.length) {
        VehicleSubClassFilterList = this.FilterDetailsForm.value.VehicleSubClassFilterList.toString();
      }
    }


    let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    var obj = {
      VehicleClassFilterList: VehicleClassFilterList,
      VehicleSubClassFilterList: VehicleSubClassFilterList,
      PlateNumber: this.FilterDetailsForm.value.PlateNumber,
      TransactionId: this.FilterDetailsForm.value.TransactionId,
      TagId: this.FilterDetailsForm.value.TagId,
      StartDateTime: SD,
      EndDateTime: ED
    }
    this.spinner.show();
    this.dbService.IcdTransactionFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalTransactionCount = this.EventHistroyData.length;
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

  onReuploadData() {
    this.spinner.show();
    this.subscription = this.dbService.ICRReuploadFailedData().subscribe(
      data => {
        this.spinner.hide();
        
        this.masterData(data.ResponseData)
      
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

  onUploadPending() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '80%';
    dialogConfig.height = '500px';
    dialogConfig.data = { ClassData: this.ClassData, SubClassData: this.SubClassData};
    const dialogRef = this.dialog.open(FasTagUploadPending, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetDefaultData();
        }
      }
    );
  }

  onResponsePending(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '80%';
    dialogConfig.height = '500px';
    dialogConfig.data = null;
    const dialogRef = this.dialog.open(FasTagResponsePending, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetDefaultData();
        }
      }
    );
  }

  onResponseDeclined(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '80%';
    dialogConfig.height = '500px';
    dialogConfig.data = null;
    const dialogRef = this.dialog.open(FasTagResponseDeclined, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetDefaultData();
        }
      }
    );
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this._compiler.clearCache();
  }
}
