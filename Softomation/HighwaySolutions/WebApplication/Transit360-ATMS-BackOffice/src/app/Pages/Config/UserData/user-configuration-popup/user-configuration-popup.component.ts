import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-user-configuration-popup',
  templateUrl: './user-configuration-popup.component.html',
  styleUrls: ['./user-configuration-popup.component.css']
})
export class UserConfigurationPopupComponent implements OnInit {
  PageTitle;
  DataDetailsForm: FormGroup;
  error = errorMessages;
  EntryId: number;
  DataStatus = true;
  DataStatusDs = 1;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  ClientData: any;
  RoleData: any;
  PlazaData: any;
  selectedUserType = 0;
  UserTypeList = [{Id: 1, Name: 'Central Server'}, {Id: 2, Name: 'Plaza Server'}, {Id: 3, Name: 'Lane Server'}];
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData,
              private emitService: EmittersService, public Dialogref: MatDialogRef<UserConfigurationPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.EntryId = parentData.EntryId;
    this.GetClientData();
    this.GetRoleData();
  }

  ngOnInit(): void {
    this.PageTitle = 'Creae New User';
    this.DataDetailsForm = new FormGroup({
      ClientId: new FormControl('', [
        Validators.required
      ]),
      PlazaId: new FormControl('', [
        Validators.required
      ]),
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
        Validators.pattern(regExps.MobileNumber)
      ]),
      EmailId: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.EmailId)
      ]),
      AccountExpiredDate: new FormControl('', [
        Validators.required
      ]),
      LoginId: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.LoginId)
      ]),
      UserType: new FormControl('', [
        Validators.required
      ]),
    });
    if (this.EntryId > 0) {
      this.PageTitle = 'Update User Details';
      this.DetailsbyId();
    }
  }

  GetClientData() {
    this.dbService.ClientConfigurationGetAll().subscribe(
      data => {
        this.ClientData = data;
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

  GetRoleData() {
    this.dbService.RoleConfigurationGetAll().subscribe(
      data => {
        this.RoleData = data;
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
  ClientChnage(value) {
    this.GetPlazaDetails(value, 0);
  }
  UserTypeChnage(value) {
    this.DataDetailsForm.controls.PlazaId.enable();
    this.selectedUserType = value;
    if (this.selectedUserType == 1) {
      this.DataDetailsForm.controls.PlazaId.setValue(0);
      this.DataDetailsForm.controls.PlazaId.disable();
    } else {
    this.DataDetailsForm.controls.PlazaId.reset();
    }
  }
  GetPlazaDetails(ClientId, val) {


  }

  PlazaChnage(value) {
    // this.GetLaneDetails(value,0);
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.UserConfigurationGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.selectedUserType = this.DetailData.UserType;
        this.DataDetailsForm.controls.ClientId.setValue(this.DetailData.ClientId);
        this.GetPlazaDetails(this.DetailData.ClientId, this.DetailData.PlazaId);
        this.DataDetailsForm.controls.LoginId.setValue(this.DetailData.LoginId);
        this.DataDetailsForm.controls.MobileNumber.setValue(this.DetailData.MobileNumber);
        this.DataDetailsForm.controls.RoleId.setValue(this.DetailData.RoleId);
        this.DataDetailsForm.controls.EmailId.setValue(this.DetailData.EmailId);
        this.DataDetailsForm.controls.FirstName.setValue(this.DetailData.FirstName);
        this.DataDetailsForm.controls.LastName.setValue(this.DetailData.LastName);
        this.DataDetailsForm.controls.AccountExpiredDate.setValue(this.DetailData.AccountExpiredDate);
        this.DataDetailsForm.controls.UserType.setValue(this.DetailData.UserType);
        this.DataDetailsForm.controls.PlazaId.enable();
        if (this.selectedUserType == 1) {
          this.DataDetailsForm.controls.PlazaId.disable();
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

  onChange(event) {
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
      ClientId: this.DataDetailsForm.value.ClientId,
      PlazaId: this.DataDetailsForm.value.PlazaId,
      LoginId: this.DataDetailsForm.value.LoginId,
      LoginPassword: 'tolSol@789',
      FirstName: this.DataDetailsForm.value.FirstName,
      LastName: this.DataDetailsForm.value.LastName,
      MobileNumber: this.DataDetailsForm.value.MobileNumber,
      EmailId: this.DataDetailsForm.value.EmailId,
      UserType: this.DataDetailsForm.value.UserType,
      AccountExpiredDate: this.DataDetailsForm.value.AccountExpiredDate,
      RoleId: this.DataDetailsForm.value.RoleId,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.UserConfigurationSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnObject = data;
        let returnMessage = (returnObject)[0].AlertMessage;
        if (returnMessage == 'success') {
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
