import { AfterViewInit, Compiler, Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { Subscription } from 'rxjs';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'et-fasTag-upload-pending',
  templateUrl: './fasTag-upload-pending.component.html',
  styleUrls: ['./fasTag-upload-pending.component.css']
})
export class FasTagUploadPending implements OnInit, AfterViewInit, OnDestroy {
  subscription!: Subscription;
  EventHistroyData: any
  ClassData: any;
  SubClassData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId: any;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  LogedUserId = 0;
  DataAdd: Number = 0;
  isProcessing = false;
  finalOutput: any[] = [];
  batchSize = 10;
  constructor(private _compiler: Compiler, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService, private dm: DataModel,
    public dialog: MatDialog, public datepipe: DatePipe,
    @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<FasTagUploadPending>) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.ClassData = parentData.ClassData;
    this.SubClassData = parentData.SubClassData;
    console.log(this.SubClassData)
    this.GetPermissionData();
  }

  ngOnInit(): void {

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
    this.subscription = this.dbService.ICDRequestUploadDiff().subscribe(
      (data: any) => {
        this.EventHistroyData = data.ResponseData;
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

  UpdateClassChange(updatedClassId, row) {
    const parentData = this.SubClassData.filter((e: { DataId: any; }) => e.DataId === updatedClassId)
    if (parentData != undefined && parentData.length > 0) {
      row.TagClassId = updatedClassId;
      row.VehicleClassId = updatedClassId;
      row.VehicleSubClassId = parentData[0].ParentId;
      row.VehicleAvcClassId = parentData[0].ParentId;
    }

  }

  SaveDetails() {
    this.isProcessing = true;
    this.finalOutput = [];
    const totalBatches = Math.ceil(this.EventHistroyData.length / this.batchSize);
    let currentBatch = 0;
    this.spinner.show();
    const processNextBatch = () => {
      if (currentBatch < totalBatches) {
        const start = currentBatch * this.batchSize;
        const end = start + this.batchSize;
        const batch = this.EventHistroyData.slice(start, end);
        this.dbService.ICDReProcessData(batch).subscribe(
          (response) => {
            this.finalOutput = [...this.finalOutput, ...response];
            currentBatch++;
            processNextBatch();
          },
          (error) => {
            this.isProcessing = false; // Stop processing on error
            this.spinner.hide();
          }
        );
      } else {
        this.isProcessing = false;
        this.spinner.hide();
      }
    };
    processNextBatch();
  }

 

  ClosePoup() { this.Dialogref.close(true); }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this._compiler.clearCache();
  }
}
