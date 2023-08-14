import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService } from 'primeng/api';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-shift-details-popup',
  templateUrl: './shift-details-popup.component.html',
  styleUrls: ['./shift-details-popup.component.css']
})
export class ShiftDetailsPopupComponent implements OnInit {
  ShiftDetails;
  LogedUserId;
  ErrorData;
  LogedClientId;
  LogedRoleId;
  PermissionData;

  constructor(private emitService: EmittersService, private dbService: ApiService, private spinner: NgxSpinnerService,
              @Inject(MAT_DIALOG_DATA) parentData, private confirmationService: ConfirmationService, public datepipe: DatePipe) {
    this.LogedRoleId =  this.emitService.getRoleDetails();
    this.LogedUserId = this.emitService.getUserDetails();
    this.LogedClientId = this.emitService.getClientId();
    this.PermissionData = parentData.PermissionData.DataUpdate;
    this.GetOpenSiftDetails();
   }

  ngOnInit(): void {
  }

  GetOpenSiftDetails() {
    this.spinner.show();
    this.dbService.GetShiftStatusDetails(1).subscribe(
      data => {
        this.spinner.hide();
        this.ShiftDetails = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  onRowPermissionInit(row) {
    const ShiftDate = this.datepipe.transform(row.ShiftDate, 'dd-MMM-yyyy');
    const message = 'Are you want to close shift ' + row.ShiftId + ' for date: ' + ShiftDate;
    this.confirmationService.confirm({
      message,
      accept: () => {
        const Obj = {
          EntryId: row.EntryId,
          ShiftDate,
          ShiftId: row.ShiftId,
          CreatedBy: this.LogedUserId
        };
        this.spinner.show();
        this.dbService.ShiftClosedSetUp(Obj).subscribe(
          data => {
            this.spinner.hide();
            const returnMessage = data.Message[0].AlertMessage;
            if (returnMessage == 'success') {
              this.ErrorData = [{ AlertMessage: 'Success' }];
              this.emitService.openSnackBar(this.ErrorData, true);

              setTimeout( () => {
                this.emitService.setPageRefresh(true);
              }, 500 );
              setTimeout( () => {
                this.GetOpenSiftDetails();
              }, 500 );

            } else {
              this.ErrorData = data.Message;
              this.emitService.openSnackBar(this.ErrorData, false);
            }
          },
          (error) => {
            this.spinner.hide();
            this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        );
      }
    });
  }

}
