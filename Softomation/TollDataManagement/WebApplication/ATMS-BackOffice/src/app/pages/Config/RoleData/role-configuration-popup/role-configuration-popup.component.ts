import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-role-configuration-popup',
  templateUrl: './role-configuration-popup.component.html',
  styleUrls: ['./role-configuration-popup.component.css']
})
export class RoleConfigurationPopupComponent implements OnInit {
  PageTitle:any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  EntryId: number;
  DataStatus = true;
  DataStatusDs = 1;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any,
              private emitService: EmittersService, public Dialogref: MatDialogRef<RoleConfigurationPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.EntryId = parentData.EntryId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Role';
    this.DataDetailsForm = new FormGroup({
      RoleName: new FormControl('', [
        Validators.required
      ])
    });
    if (this.EntryId > 0) {
      this.PageTitle = 'Update Role Details';
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.RoleConfigurationGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponceData;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.DataDetailsForm.controls['RoleName'].setValue(this.DetailData.RoleName);
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  onChange(event:any) {
    if (event.checked) {
      this.DataStatus = true;
      this.DataStatusDs = 1;
    } else {
      this.DataStatus = false;
      this.DataStatusDs = 2;
    }
  }

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      EntryId: this.EntryId,
      RoleName: this.DataDetailsForm.value.RoleName,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.RoleConfigurationSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.emitService.setPageRefresh(true);
          this.emitService.openSnackBar(this.ErrorData, true);
          this.ClosePoup();
        } else {
          this.ErrorData = data.Message;
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

}
