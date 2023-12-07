import { AfterViewInit, Compiler, Component, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { Subscription } from 'rxjs';
import { FormControl, FormGroup } from '@angular/forms';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'et-fasTag-data-processed',
  templateUrl: './fasTag-data-processed.component.html',
  styleUrls: ['./fasTag-data-processed.component.css']
})
export class FasTagDataProcessed implements OnInit, AfterViewInit, OnDestroy {
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
  CodeList:any;
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
      ShiftFilterList: new FormControl('', []),
      TCUserFilterList: new FormControl('', []),
      PlazaFilterList: new FormControl('', []),
      LaneFilterList: new FormControl('', []),
      VehicleClassFilterList: new FormControl(''),
      VehicleSubClassFilterList: new FormControl(''),
      PlateNumber: new FormControl(''),
      TransactionId: new FormControl(''),
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
      (data:any) => {
        var MaserData=data.ResponseData;
        this.ShiftData=MaserData.ShiftTiminingList;
        this.LaneUserData=MaserData.TCMasterList;
        this.PlazaDataList=MaserData.PlazaDataList;
        this.LaneData=MaserData.LaneDataList;
        this.ClassData = MaserData.SystemClassList;
        this.SubClassData = MaserData.SystemSubClassList;
        this.TransactionTypeData = MaserData.TransactionTypeList;
        this.FasTagRequestCode();
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

  FasTagRequestCode() {
    this.subscription = this.dbService.FasTagRequestCode().subscribe(
      data => {
        this.spinner.hide();
        this.CodeList=data.ResponseData;
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
    this.subscription = this.dbService.FasTagProcessedGetLatest().subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalTransactionCount = this.EventHistroyData.length;
        if(this.TotalTransactionCount>0){
          var sd=this.EventHistroyData[this.TotalTransactionCount-1].TransactionDateTimeStamp;
          this.FilterDetailsForm.controls['StartDateTime'].setValue(new Date(sd));
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
    let ShiftFilterList = "0"
    if (this.FilterDetailsForm.value.ShiftFilterList != null && this.FilterDetailsForm.value.ShiftFilterList != '') {
      let crData = this.FilterDetailsForm.value.ShiftFilterList.toString();
      if (crData.split(',').length != this.ShiftData.length) {
        ShiftFilterList = this.FilterDetailsForm.value.ShiftFilterList.toString();
      }
    }

    let TCUserFilterList = "0"
    if (this.FilterDetailsForm.value.TCUserFilterList != null && this.FilterDetailsForm.value.TCUserFilterList != '') {
      let crData = this.FilterDetailsForm.value.TCUserFilterList.toString();
      if (crData.split(',').length != this.LaneUserData.length) {
        TCUserFilterList = this.FilterDetailsForm.value.TCUserFilterList.toString();
      }
    }

    let PlazaFilterList = "0"
    if (this.FilterDetailsForm.value.PlazaFilterList != null && this.FilterDetailsForm.value.PlazaFilterList != '') {
      let crData = this.FilterDetailsForm.value.PlazaFilterList.toString();
      if (crData.split(',').length != this.PlazaDataList.length) {
        PlazaFilterList = this.FilterDetailsForm.value.PlazaFilterList.toString();
      }
    }

    let LaneFilterList = "0"
    if (this.FilterDetailsForm.value.LaneFilterList != null && this.FilterDetailsForm.value.LaneFilterList != '') {
      let crData = this.FilterDetailsForm.value.LaneFilterList.toString();
      if (crData.split(',').length != this.LaneList.length) {
        LaneFilterList = this.FilterDetailsForm.value.LaneFilterList.toString();
      }
    }

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
      PlazaFilterList: PlazaFilterList,
      LaneFilterList: LaneFilterList,
      VehicleClassFilterList: VehicleClassFilterList,
      VehicleSubClassFilterList: VehicleSubClassFilterList,
      PlateNumber:this.FilterDetailsForm.value.PlateNumber,
      TransactionId:this.FilterDetailsForm.value.TransactionId,
      StartDateTime: SD,
      EndDateTime: ED
    }
    this.spinner.show();
    this.dbService.LaneTransactionFilter(obj).subscribe(
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

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this._compiler.clearCache();
  }

  onMidiaView(TransactionRowData: any) {
    var obj = {
      PageTitle: "Lane Transaction-(" + TransactionRowData.TransactionTypeName + ")",
      ImageData: [{
        ImagePath: TransactionRowData.TransactionFrontImage,
      },
      {
        ImagePath: TransactionRowData.TransactionBackImage,
      },
      {
        ImagePath: TransactionRowData.TransactionAvcImage
      }],
      VideoData: [{
        VideoPath: TransactionRowData.TransactionVideo
      }],
      AudioData: [{
        AudioPath: ''
      }]
    }
    this.dm.MediaView(obj);
  }
}
