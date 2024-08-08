import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService } from 'primeng/api';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-shift-clearance-details-popup',
  templateUrl: './shift-clearance-details-popup.component.html',
  styleUrls: ['./shift-clearance-details-popup.component.css']
})
export class ShiftClearanceDetailsPopupComponent implements OnInit {
  UserDetails: any;
  PermissionData: any;
  DevicesData: any;
  LogedUserId;
  ButtonShow = false;
  PageTitle = 'Clearance Details';
  EntryId=0;
  ErrorData: any;
  constructor(@Inject(MAT_DIALOG_DATA) parentData:any,public datepipe: DatePipe, private spinner: NgxSpinnerService,
   public Dialogref: MatDialogRef<ShiftClearanceDetailsPopupComponent>,private dbService: apiIntegrationService, 
   private confirmationService: ConfirmationService,private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    // this.FloatProcessId = parentData.FloatProcessId;
    // this.FloatTransactionTypeId = parentData.FloatTransactionTypeId;
    // this.DefaultPlazaId = this.dm.getDefaultPlazaId();
    if (parentData.Data.DifferenceAmount == 0) {
      this.ButtonShow = true;
    }
    this.PageTitle = this.PageTitle + " [" + this.datepipe.transform(parentData.Data.TransactionDate, 'dd-MMM-yyyy') + " Shift " + parentData.Data.ShiftId + "]";
    this.PermissionData = parentData.PermissionData;
  }

  ngOnInit(): void {
    this.GetAllData();
  }

  GetAllData() {
    // this.spinner.show();
    // this.dbService.CashFlowShiftClearanceGetById(this.EntryId).subscribe(
    //   data => {
    //     this.spinner.hide();
    //     this.DevicesData = data.ResponseData;

    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }
  SaveDetails() {
    const message = 'Are you sure you want to do close this shift';
    this.confirmationService.confirm({
      message: message,
      accept: () => {
        this.OnSubmit();
      }
    });
  }

  OnSubmit() {
    // const Obj = {
    //   EntryId: this.EntryId,
    //   DataStatus: 1,
    //   CreatedBy: this.LogedUserId
    // }
    // this.spinner.show();
    // this.dbService.CashFlowShiftClearanceUpdate(Obj).subscribe(
    //   data => {
    //     this.spinner.hide();
    //     var returnMessage = data.Message[0].AlertMessage;
    //     if (returnMessage == 'success') {
    //       this.ErrorData = [{ AlertMessage: "Success" }];
    //       this.emitService.setPageRefresh(true,29);
    //       this.emitService.openSnackBar(this.ErrorData, true);
    //       this.ClosePoup();
    //     }
    //     else if (returnMessage.includes('.pdf')) {
    //       this.ErrorData = [{ AlertMessage: "Success" }];
    //       window.open(returnMessage, "_blank",);
    //       this.emitService.setPageRefresh(true,29);
    //       this.emitService.openSnackBar(this.ErrorData, true);
    //       this.ClosePoup();
    //     }
    //     else {
    //       this.ErrorData = data.Message;
    //       this.emitService.openSnackBar(this.ErrorData, false);
    //     }
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     this.ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(this.ErrorData, false);
    //   }
    // );
  }

  ClosePoup() { this.Dialogref.close(); }


}
