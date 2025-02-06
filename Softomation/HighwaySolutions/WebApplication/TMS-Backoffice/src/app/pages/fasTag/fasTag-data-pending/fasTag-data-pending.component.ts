import { AfterViewInit, Compiler, Component, IterableDiffers, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { Subscription } from 'rxjs';
import { FormControl, FormGroup, Validators } from '@angular/forms';
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
  DataDetailsForm!: FormGroup;
  submitted: boolean = false
  subscription!: Subscription;
  FilterDetailsForm!: FormGroup;
  LaneDataList: any;
  LogedRoleId: any;
  EventHistroyData: any;
  PermissionData: any;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  PlazaDataList: any;
  ClassData: any;
  SubClassData: any;
  TotalTransactionCount: any = 0;
  ErrorData: any;
  LogedUserId = 0;
  DataAdd: Number = 0;
  IcdApiData: any;
  SftpStatusData: any;
  SftpCountData: any
  SftpCurrentData: any;
  constructor(private _compiler: Compiler, private dbService: apiIntegrationService, private spinner: NgxSpinnerService, private dm: DataModel,
    public dialog: MatDialog, public datepipe: DatePipe) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }

  ngOnInit(): void {

    this.DataDetailsForm = new FormGroup({
      PlateNumber: new FormControl('', [Validators.required]),
      LaneId: new FormControl('', [Validators.required]),
      VehicleSubClassId: new FormControl('', [Validators.required]),
      TransactionDateTime: new FormControl('', [Validators.required]),
    });
  }

  ngAfterViewInit(): void {
    this._compiler.clearCache();
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
        this.LaneDataList = MaserData.LaneDataList;
        this.ClassData = MaserData.SystemClassList
        this.SubClassData = MaserData.SystemSubClassList;
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

  masterData(dataset) {
    this.IcdApiData = dataset[0];
    this.SftpStatusData = dataset[1]
    this.SftpCountData = dataset[2]
    this.SftpCurrentData = dataset[4]
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
    dialogConfig.data = { ClassData: this.ClassData, SubClassData: this.SubClassData };
    const dialogRef = this.dialog.open(FasTagUploadPending, dialogConfig);
    dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          this.GetDefaultData();
        }
      }
    );
  }

  onResponsePending() {
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

  onResponseDeclined() {
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

  get_plaza_id() {
    let PlazaId = 0;
    const LaneId = this.DataDetailsForm.value.LaneId;
    const laneDetails = this.LaneDataList.filter((item: { DataId: Number; }) => item.DataId == LaneId);
    if (laneDetails.length > 0) {
      PlazaId = laneDetails[0].ParentId;
    }
    return PlazaId;
  }

  get_vc_id() {
    let vc = 0;
    const VehicleSubClassId = this.DataDetailsForm.value.VehicleSubClassId;
    const vcDetails = this.SubClassData.filter((item: { DataId: Number; }) => item.DataId == VehicleSubClassId);
    if (vcDetails.length > 0) {
      vc = vcDetails[0].ParentId;
    }
    return vc;
  }

  submit() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const transactionDateTime = this.DataDetailsForm.value.TransactionDateTime;
    let formattedDate = this.datepipe.transform(transactionDateTime, 'dd-MMM-yyyy HH:mm:ss');
    const milliseconds = new Date().getMilliseconds();
    formattedDate += '.' + milliseconds.toString().padStart(3, '0'); 
    const obj = {
      PlateNumber: this.DataDetailsForm.value.PlateNumber,
      PlazaId: this.get_plaza_id(),
      LaneId: this.DataDetailsForm.value.LaneId,
      VehicleSubClassId: this.DataDetailsForm.value.VehicleSubClassId,
      VehicleClassId: this.get_vc_id(),
      VehicleAvcClassId: this.get_vc_id(),
      TransactionDateTime:formattedDate,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.subscription = this.dbService.ICDManualProcess(obj).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.DataDetailsForm.reset()
          this.submitted=false;
          const ErrorData = [{ AlertMessage: returnMessage }];
          this.dm.openSnackBar(ErrorData, true);
        }else{
          const ErrorData = [{ AlertMessage: returnMessage }];
          this.dm.openSnackBar(ErrorData, false);
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


  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this._compiler.clearCache();
  }
}
