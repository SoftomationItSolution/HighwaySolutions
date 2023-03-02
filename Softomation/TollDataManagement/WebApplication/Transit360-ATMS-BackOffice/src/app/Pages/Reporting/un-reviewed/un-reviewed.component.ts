import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { UnReviewedPopupComponent } from '../un-reviewed-popup/un-reviewed-popup.component';
declare var $: any;
@Component({
  selector: 'app-un-reviewed',
  templateUrl: './un-reviewed.component.html',
  styleUrls: ['./un-reviewed.component.css']
})
export class UnReviewedComponent implements OnInit {
  DataDetailsForm: FormGroup;
  ErrorData;
  ShiftData;
  LaneUserData;
  TransactionTypeData;
  LaneDataList;
  FilterisOpen = true;
  LogedUserId;
  APIRootPath;
  LogedRoleId;
  DevicesData;
  PermissionData;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  TypeList =
    [
      { Id: 0, Name: 'All Transactions' },
      { Id: 1, Name: 'Review Required' }
    ];
    FilterBar = true;
    public innerHeight: any;
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, private emitService: EmittersService,
              public dialog: MatDialog, public datepipe: DatePipe) {
    this.LogedRoleId =  parseInt(this.emitService.getRoleDetails());
    this.LogedUserId = this.emitService.getUserDetails();
    this.GetBaseAPIPath();
    this.emitService.PageRefresh.subscribe(
      (visibility: boolean) => {
        if (visibility) {
          this.FilterData(0);
        }
      });

    this.emitService.InnerHeight.subscribe(
      (innerHeight: any) => {
        this.innerHeight = innerHeight;
        this.SetPageHeight();
      });
  }
  GetBaseAPIPath() {
    this.dbService.GetBaseUrl().then((val) => {
      this.APIRootPath = val;
      this.GetPermissionData();
      this.GetShiftData();
    },
    (err) => {});
  }
  ngOnInit(): void {

    this.DataDetailsForm = new FormGroup({
      ReviewType: new FormControl('', []),
      ShiftDate: new FormControl('', []),
      ShiftId: new FormControl('', []),
      TCUserId: new FormControl('', []),
      LaneNumber: new FormControl('', []),
      TransactionTypeId: new FormControl('', []),
      PlateNumber: new FormControl('', []),
    });

    this.DataDetailsForm.controls.ShiftDate.setValue(new Date()); // '04-May-2021'
    this.DataDetailsForm.controls.ReviewType.setValue(0);
    this.DataDetailsForm.controls.ShiftId.setValue(0);
    this.DataDetailsForm.controls.TCUserId.setValue(0);
    this.DataDetailsForm.controls.LaneNumber.setValue(0);
    this.DataDetailsForm.controls.TransactionTypeId.setValue(0);
    this.DataDetailsForm.controls.PlateNumber.setValue('');
  }
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 175);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 175);
  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }


  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 13,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponceData;
        this.DataView = this.PermissionData.DataView;
        this.DataUpdate = this.PermissionData.DataUpdate;
        if (this.DataView != 1) {
          this.emitService.unauthorized();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetShiftData() {
    this.dbService.GetShiftDetails().subscribe(
      data => {
        this.ShiftData = data.ResponceData;
        this.DataDetailsForm.controls.ShiftId.setValue(0);
        this.GetLaneUsersData();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetLaneUsersData() {
    this.dbService.UserConfigurationGetAllLaneUsers().subscribe(
      data => {
        this.LaneUserData = data.ResponceData;
        this.GetTransactionTypeData();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetTransactionTypeData() {
    this.dbService.GetTransactionDetails().subscribe(
      data => {
        this.TransactionTypeData = data.ResponceData;
        this.GetLane();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetLane() {
    this.dbService.LaneConfigurationGetByType(2).subscribe(
      data => {
        this.LaneDataList = data.ResponceData;
        this.FilterData(1);
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  FilterData(isOpen) {
    const ShiftDate = this.datepipe.transform(this.DataDetailsForm.value.ShiftDate, 'dd-MMM-yyyy');
    let PlateNumber;
    if (this.DataDetailsForm.value.PlateNumber == undefined) {
      PlateNumber = '';
    } else if (this.DataDetailsForm.value.PlateNumber == null) {
      PlateNumber = '';
    } else {
      PlateNumber = this.DataDetailsForm.value.PlateNumber;
    }
    const Obj = {
      ReviewType: this.DataDetailsForm.value.ReviewType,
      ShiftDate: this.datepipe.transform(this.DataDetailsForm.value.ShiftDate, 'dd-MMM-yyyy'),
      ShiftId: this.DataDetailsForm.value.ShiftId,
      TCUserId: this.DataDetailsForm.value.TCUserId,
      LaneNumber: this.DataDetailsForm.value.LaneNumber,
      TransactionTypeId: this.DataDetailsForm.value.TransactionTypeId,
      BaseUrl: this.APIRootPath,
      PlateNumber
    };
    this.spinner.show();
    this.dbService.GetUnreviewFilter(Obj).subscribe(
      data => {
        this.spinner.hide();

        // this.FilterisOpen =!this.FilterisOpen;
        this.DevicesData = data.ResponceData;
        if (data.ResponceData.length == 0) {
          this.ErrorData = [{ AlertMessage: 'No Data found.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        } else {
          if (isOpen == 1) {
            const dialogConfig = new MatDialogConfig();
            dialogConfig.disableClose = true;
            dialogConfig.autoFocus = true;
            dialogConfig.width = '100%';
            dialogConfig.data = {
              FilterData: Obj,
              Permission: this.DataUpdate,
              EntryId: 0,
              APIRootPath: this.APIRootPath
            };
            this.dialog.open(UnReviewedPopupComponent, dialogConfig);
          }
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  onRowEditInit(row) {
    const ShiftDate = this.datepipe.transform(this.DataDetailsForm.value.ShiftDate, 'dd-MMM-yyyy');
    const Obj = {
        ReviewType: this.DataDetailsForm.value.ReviewType,
        ShiftDate: this.datepipe.transform(this.DataDetailsForm.value.ShiftDate, 'dd-MMM-yyyy'),
        ShiftId: this.DataDetailsForm.value.ShiftId,
        TCUserId: this.DataDetailsForm.value.TCUserId,
        LaneNumber: this.DataDetailsForm.value.LaneNumber,
        TransactionTypeId: this.DataDetailsForm.value.TransactionTypeId,
        BaseUrl: this.APIRootPath
      };
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '80%';
    dialogConfig.data = {
      FilterData: Obj,
      Permission: this.DataUpdate,
      EntryId: row.EntryId,
      APIRootPath: this.APIRootPath
    };
    this.dialog.open(UnReviewedPopupComponent, dialogConfig);
  }

  ResetFilter() {
    this.DataDetailsForm.controls.ShiftDate.setValue(new Date()); // '04-May-2021'
    this.DataDetailsForm.controls.ReviewType.setValue(0);
    this.DataDetailsForm.controls.ShiftId.setValue(0);
    this.DataDetailsForm.controls.TCUserId.setValue(0);
    this.DataDetailsForm.controls.LaneNumber.setValue(0);
    this.DataDetailsForm.controls.TransactionTypeId.setValue(0);
    this.DataDetailsForm.controls.PlateNumber.setValue('');
    // this.FilterData(0);
  }
  FilterPopp() {
  this.FilterisOpen = !this.FilterisOpen;
  if (this.FilterisOpen) {
      $('.tableData').css('width', '85%');
    } else {
    $('.tableData').css('width', '100%');
  }
  }

}
