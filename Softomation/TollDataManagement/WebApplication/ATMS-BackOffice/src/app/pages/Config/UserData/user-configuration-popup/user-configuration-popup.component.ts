import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';

@Component({
  selector: 'app-user-configuration-popup',
  templateUrl: './user-configuration-popup.component.html',
  styleUrls: ['./user-configuration-popup.component.css']
})
export class UserConfigurationPopupComponent implements OnInit {
  PageTitle: any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  UserId: any;
  DataStatus = true;
  DataStatusDs = 1;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  ClientData: any;
  RoleData: any;
  PlazaData: any;
  selectedUserType = 0;
  onsub = false
  UserTypeList = [{ Id: 1, Name: 'Administrator' }, { Id: 2, Name: 'Manager' }, { Id: 3, Name: 'Operator' }];

  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData,
    private emitService: EmittersService, public Dialogref: MatDialogRef<UserConfigurationPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.UserId = parentData.UserId;
    this.GetRoleData();
  }

  ngOnInit(): void {
    this.PageTitle = 'Creae New User';
    this.DataDetailsForm = new FormGroup({
      RoleId: new FormControl('', [
        Validators.required
      ]),
      FirstName: new FormControl('', [
        Validators.required
      ]),
      LastName: new FormControl('', [
        Validators.required
      ]),
      MobileNumber: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['MobileNumber'])
      ]),
      EmailId: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['EmailId'])
      ]),
      AccountExpiredDate: new FormControl('', [
        Validators.required
      ]),
      LoginId: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['LoginId'])
      ]),
      LoginPassword: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps['Password'])
      ]),
      UserType: new FormControl('', [
        Validators.required
      ]),
      DataStatus: new FormControl(true),
    });
    if (this.UserId > 0) {
      this.PageTitle = 'Update User Details';
      this.DetailsbyId();
    }
  }


  GetRoleData() {
    this.dbService.RoleConfigurationGetActive().subscribe(
      data => {
        this.RoleData = data.ResponseData;
        this.spinner.hide();
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



  DetailsbyId() {
    this.spinner.show();
    this.dbService.UserConfigurationGetById(this.UserId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.selectedUserType = this.DetailData.UserType;
        this.DataDetailsForm.controls['LoginId'].setValue(this.DetailData.LoginId);
        this.DataDetailsForm.controls['LoginPassword'].setValue(this.DetailData.LoginPassword);
        this.DataDetailsForm.controls['MobileNumber'].setValue(this.DetailData.MobileNumber);
        this.DataDetailsForm.controls['RoleId'].setValue(this.DetailData.RoleId);
        this.DataDetailsForm.controls['EmailId'].setValue(this.DetailData.EmailId);
        this.DataDetailsForm.controls['FirstName'].setValue(this.DetailData.FirstName);
        this.DataDetailsForm.controls['LastName'].setValue(this.DetailData.LastName);
        this.DataDetailsForm.controls['AccountExpiredDate'].setValue(this.DetailData.AccountExpiredDate);
        this.DataDetailsForm.controls['UserType'].setValue(this.DetailData.UserType);
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

  onChange(event: any) {
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
    this.onsub = true;
    this.DataDetailsForm.errors;
    if (this.DataDetailsForm.valid == true) {

      const Obj = {
        UserId: this.UserId,
        LoginId: this.DataDetailsForm.value.LoginId,
        LoginPassword: this.DataDetailsForm.value.LoginPassword,
        FirstName: this.DataDetailsForm.value.FirstName,
        LastName: this.DataDetailsForm.value.LastName,
        MobileNumber: this.DataDetailsForm.value.MobileNumber,
        EmailId: this.DataDetailsForm.value.EmailId,
        UserTypeId: this.DataDetailsForm.value.UserType,
        AccountExpiredDate: this.DataDetailsForm.value.AccountExpiredDate,
        RoleId: this.DataDetailsForm.value.RoleId,
        DataStatus: this.DataStatusDs,
        CreatedBy: this.LogedUserId
      };
      this.spinner.show();
      this.dbService.UserConfigurationSetUp(Obj).subscribe(
        data => {
          this.spinner.hide();
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage.indexOf('success')>-1) {
            this.ErrorData = [{ AlertMessage: 'Success' }];
            this.emitService.setPageRefresh(true);
            this.emitService.openSnackBar(this.ErrorData, true);
            this.ClosePoup();
          } else {
            this.ErrorData = data;
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

}