import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';

@Component({
  selector: 'app-role-configuration-popup',
  templateUrl: './role-configuration-popup.component.html',
  styleUrls: ['./role-configuration-popup.component.css']
})
export class RoleConfigurationPopupComponent implements OnInit {
  PageTitle:any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  RoleId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted=false;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any,
              private emitService: EmittersService, public Dialogref: MatDialogRef<RoleConfigurationPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.RoleId = parentData.RoleId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Role';
    this.DataDetailsForm = new FormGroup({
      RoleName: new FormControl('', [
        Validators.required
      ]),
      DataStatus: new FormControl(true),
    });
    if (this.RoleId > 0) {
      this.PageTitle = 'Update Role Details';
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.RoleConfigurationGetById(this.RoleId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['RoleName'].setValue(this.DetailData.RoleName);
        if (this.DetailData.DataStatus == 1) {
          this.DataDetailsForm.controls['DataStatus'].setValue(true);
        } else {
          this.DataDetailsForm.controls['DataStatus'].setValue(false);
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
        this.Dialogref.close();
      }
    );
  }

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    this.submitted=true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      RoleId: this.RoleId,
      RoleName: this.DataDetailsForm.value.RoleName,
      DataStatus: this.DataDetailsForm.value.DataStatus==true?1:2,
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
