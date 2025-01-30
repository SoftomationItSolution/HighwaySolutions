import { AfterViewInit, Compiler, Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { Subscription } from 'rxjs';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'et-fasTag-response-pending',
  templateUrl: './fasTag-response-pending.component.html',
  styleUrls: ['./fasTag-response-pending.component.css']
})
export class FasTagResponsePending implements OnInit, AfterViewInit, OnDestroy {
  subscription!: Subscription;
  EventHistroyData: any
  ErrorData: any;
  PermissionData: any;
  LogedRoleId: any;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  LogedUserId = 0;
  DataAdd: Number = 0;
  TotalRecords=0;
  isProcessing = false;
  finalOutput: any[] = [];
  batchSize = 10;
  constructor(private _compiler: Compiler, private dbService: apiIntegrationService,
    private spinner: NgxSpinnerService, private dm: DataModel,
    public dialog: MatDialog, public datepipe: DatePipe,
    @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<FasTagResponsePending>) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
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
    this.subscription = this.dbService.ICDResponsePending().subscribe(
      (data: any) => {
        this.EventHistroyData = data.ResponseData;
        this.TotalRecords=this.EventHistroyData.length;
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

  SaveDetails() {
    this.isProcessing = true;
    const totalBatches = Math.ceil(this.EventHistroyData.length / this.batchSize);
    let currentBatch = 0;
    this.spinner.show();
    const processNextBatch = () => {
      if (currentBatch < totalBatches) {
        const start = currentBatch * this.batchSize;
        const end = start + this.batchSize;
        const batch = this.EventHistroyData.slice(start, end);
        this.dbService.ICDUpdatedforCheckStatus(batch).subscribe(
          (response) => {
            currentBatch++;
            processNextBatch();
          },
          (error) => {
            this.isProcessing = false; // Stop processing on error
            this.ErrorData = [{ AlertMessage: 'Getting error to updated request' }];
            this.dm.openSnackBar(this.ErrorData, true);
            this.spinner.hide();
          }
        );
      } else {
        this.isProcessing = false;
        this.ErrorData = [{ AlertMessage: 'More than one hours all request updated successfully' }];
        this.dm.openSnackBar(this.ErrorData, true);
        this.spinner.hide();
        this.ClosePoup()
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
