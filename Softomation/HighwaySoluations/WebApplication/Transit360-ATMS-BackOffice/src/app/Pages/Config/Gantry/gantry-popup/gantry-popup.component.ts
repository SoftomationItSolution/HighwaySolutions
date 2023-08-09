import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-gantry-popup',
  templateUrl: './gantry-popup.component.html',
  styleUrls: ['./gantry-popup.component.css']
})
export class GantryPopupComponent implements OnInit {
  PageTitle;
  DataDetailsForm: FormGroup;
  SiteList;
  error = errorMessages;
  EntryId: number;
  DataStatus = true;
  DataStatusDs = 1;
  LoginUserId;
  ErrorData: any;
  DetailData: any;
  ClientData: any;
  PermissionData;
  ButtonShow = false;
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData,
              private emitService: EmittersService, public Dialogref: MatDialogRef<GantryPopupComponent>, public dialog: MatDialog) {
    this.LoginUserId = this.emitService.getUserDetails();
    this.EntryId = parentData.EntryId;
    this.PermissionData = parentData.PermissionData;
    if (this.EntryId == 0) {
      if (this.PermissionData.DataAdd == 1) {
          this.ButtonShow = true;
      }
    } else {
      if (this.PermissionData.DataUpdate == 1) {
       this.ButtonShow = true;
      }
    }
    this.ControlRoomDetails();
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Gantry';
    this.DataDetailsForm = new FormGroup({
      ControlRoomId: new FormControl('', [
        Validators.required
      ]),
      GantryName: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AlphaNumericSingleSpace)
      ]),
      Latitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.Latitude)
      ]),
      Longitude: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.Longitude)
      ]),

    });

  }
  ControlRoomDetails() {
    this.dbService.ControlRoomGetByUserId(this.LoginUserId).subscribe(
      data => {
        this.SiteList = data.ResponceData;
        if (this.EntryId > 0) {
          if (this.PermissionData.DataUpdate == 1) {
            this.PageTitle = 'Update Gantry Details';
          } else {
            this.PageTitle = 'View Gantry Details';
          }
          this.DetailsbyId();
        }

      },
      (error) => {
      }
    );
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.GantryGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
        this.DetailData = data.ResponceData;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.DataDetailsForm.controls.ControlRoomId.setValue(this.DetailData.ControlRoomId);
        this.DataDetailsForm.controls.GantryName.setValue(this.DetailData.GantryName);
        this.DataDetailsForm.controls.Latitude.setValue(this.DetailData.Latitude);
        this.DataDetailsForm.controls.Longitude.setValue(this.DetailData.Longitude);
      } else {
        this.ErrorData = [{ AlertMessage: 'user details not found.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
        this.ClosePoup();
      }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
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
      ControlRoomId: this.DataDetailsForm.value.ControlRoomId,
      GantryName: this.DataDetailsForm.value.GantryName,
      Latitude: this.DataDetailsForm.value.Latitude,
      Longitude: this.DataDetailsForm.value.Longitude,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LoginUserId,
      ModifiedBy: this.LoginUserId,
    };
    this.spinner.show();
    this.dbService.GantryInsertUpdate(Obj).subscribe(
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
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

}
