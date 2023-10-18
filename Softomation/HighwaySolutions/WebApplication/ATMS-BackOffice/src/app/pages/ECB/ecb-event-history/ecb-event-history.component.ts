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
  constructor(public dialog: MatDialog, private dm: DataModel, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService, public datepipe: DatePipe) {
    this.LogedRoleId = this.dm.getRoleId();
    //this.PbxRecordingPath = this.dm.getRecordAPI()?.toString();
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
    });
    this.GetAccessPermission();
  }

  GetAccessPermission() {
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
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetAllData() {
    // this.spinner.show();
    // this.dbService.CallHistoryGetLatest().subscribe(
    //   data => {
    //     this.spinner.hide();
    //     this.callHistory = data.ResponseData;
    //     this.TotalCount = this.callHistory.length;
    //     if (this.TotalCount > 0) {
    //       var sd = this.callHistory[this.TotalCount - 1].StartDateTimeStamp;
    //       this.FilterDetailsForm.controls['StartDateTime'].setValue(new Date(sd));
    //     }
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
    //     this.dm.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }

  SearchEntry() {
    // let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    // let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    // const obj = {
    //   StartDateTimeStamp: SD,
    //   EndDateTimeStamp: ED
    // }
    // this.spinner.show();
    // this.dbService.CallHistoryGetFilter(obj).subscribe(
    //   data => {
    //     this.callHistory = data.ResponseData;
    //     this.spinner.hide();
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
    //     this.dm.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }
}