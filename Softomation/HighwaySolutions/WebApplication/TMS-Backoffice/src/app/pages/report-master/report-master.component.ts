import { DatePipe } from '@angular/common';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, RequiredValidator, Validators } from '@angular/forms';
import { MatOption } from '@angular/material/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { Subscription } from 'rxjs';
import { errorMessages } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-report-master',
  templateUrl: './report-master.component.html',
  styleUrls: ['./report-master.component.css']
})
export class ReportMasterComponent implements OnInit{
  FilterDetailsForm!: FormGroup;
  subscription!: Subscription;
  error = errorMessages;
  ErrorData: any;
  MediaPrefix:any;
  ReportMasterData:any;
  SubReportMasterData:any
  LogedUserId = 0;
  LogedRoleId: any;
  PermissionData: any;
  DataAdd: Number = 0;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  PlazaDataList: any;
  ShiftData: any;
  LaneUserData: any;
  TransactionTypeData: any;
  LaneDataList: any;
  LaneData:any;
  LaneList: any = [];
  ClassData:any;
  SubClassData:any;
  SubClassList:any=[];
  SubCategoryId:any;
  ExemptTypeData:any
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, 
    private dm: DataModel,
    public datepipe: DatePipe) {
      this.MediaPrefix = this.dm.getMediaAPI()?.toString();
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
      TransactionTypeFilterList: new FormControl(''),
      VehicleClassFilterList: new FormControl(''),
      VehicleSubClassFilterList: new FormControl(''),
      PlateNumber: new FormControl(''),
      TransactionId: new FormControl(''),
      CategoryId :new FormControl('', [Validators.required]),
      ReportId :new FormControl('', [Validators.required]),
    });
    const today = new Date();
    const month = today.getMonth();
    const year = today.getFullYear();
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
          this.GetReportMasterData();
          this.GetMasterData();
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

  GetMasterData() {
    this.subscription = this.dbService.FilterMasterGet().subscribe(
      data => {
        var MaserData=data.ResponseData;
        this.ShiftData=MaserData.ShiftTiminingList;
        this.LaneUserData=MaserData.TCMasterList;
        this.PlazaDataList=MaserData.PlazaDataList;
        this.LaneData=MaserData.LaneDataList;
        this.ClassData = MaserData.SystemClassList;
        this.SubClassData = MaserData.SystemSubClassList;
        this.TransactionTypeData = MaserData.TransactionTypeList;
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

  GetReportMasterData() {
    this.spinner.show();
    this.subscription =this.dbService.GetReportCategory().subscribe(
      data => {
        this.spinner.hide();
        this.ReportMasterData = data.ResponseData;
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

  CategoryChange(vale:any) {
    this.spinner.show();
    this.dbService.GetSubReportCategory(this.FilterDetailsForm.value.CategoryId).subscribe(
      data => {
        this.spinner.hide();
        this.SubReportMasterData = data.ResponseData;
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

  SubCategoryChange(vale) {
    this.SubCategoryId = vale;
    if (vale == 22) {
      var op = this.ExemptTypeData.map(function (item) {
        return item.EntryId;
      });
      this.FilterDetailsForm.controls['ExemptTypeId'].setValue(op);
    }
    else {
      this.FilterDetailsForm.controls['ExemptTypeId'].reset();
    }
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

    let TransactionTypeFilterList = "0"
    if (this.FilterDetailsForm.value.TransactionTypeFilterList != null && this.FilterDetailsForm.value.TransactionTypeFilterList != '') {
      let crData = this.FilterDetailsForm.value.TransactionTypeFilterList.toString();
      if (crData.split(',').length != this.TransactionTypeData.length) {
        TransactionTypeFilterList = this.FilterDetailsForm.value.TransactionTypeFilterList.toString();
      }
    }
    let AuditerFilterList = "0"
    let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    var obj = {
      ReportId:this.FilterDetailsForm.value.ReportId,
      ShiftFilterList: ShiftFilterList,
      TCUserFilterList: TCUserFilterList,
      PlazaFilterList: PlazaFilterList,
      LaneFilterList: LaneFilterList,
      VehicleClassFilterList: VehicleClassFilterList,
      VehicleSubClassFilterList: VehicleSubClassFilterList,
      TransactionTypeFilterList: TransactionTypeFilterList,
      PlateNumber:this.FilterDetailsForm.value.PlateNumber,
      TransactionId:this.FilterDetailsForm.value.TransactionId,
      StartDateTime: SD,
      EndDateTime: ED,
      AuditerFilterList:AuditerFilterList
    }
    this.spinner.show();
    this.dbService.GetReport(obj).subscribe(
      data => {
        this.spinner.hide();
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
