import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-vehicle-class-popup',
  templateUrl: './vehicle-class-popup.component.html',
  styleUrls: ['./vehicle-class-popup.component.css']
})
export class VehicleClassPopupComponent implements OnInit {
  PageTitle;
  DataDetailsForm: FormGroup;
  error = errorMessages;
  EntryId: number;
  ClientId;
  DataStatus = true;
  DataStatusDs = 1;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  PermissionData;
  ButtonShow = false;
  ApplicationType = 1;
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData,
              private emitService: EmittersService, public Dialogref: MatDialogRef<VehicleClassPopupComponent>, public dialog: MatDialog) {
    this.ApplicationType =  parseInt(this.emitService.getApplicationType());
    this.LogedUserId = this.emitService.getUserDetails();
    this.ClientId = this.emitService.getClientId();
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
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Vehicle Class';
    this.DataDetailsForm = new FormGroup({
      ClassName: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AlphaNumericSingleSpace)
      ]),
      VehicleSpeed: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.OnlyDigit)
      ]),
      ClassDescription: new FormControl(''),
    });
    if (this.EntryId > 0) {
      this.DetailsbyId();
    }
  }
  DetailsbyId() {
    this.spinner.show();
    this.dbService.VehicleClassGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        debugger;
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.DetailData = data.ResponceData;
          this.DataStatusDs = this.DetailData.DataStatus;
          if (this.DetailData.DataStatus == 1) {
            this.DataStatus = true;
          } else {
            this.DataStatus = false;
          }
          this.DataDetailsForm.controls.ClassName.setValue(this.DetailData.ClassName);
          this.DataDetailsForm.controls.ClassDescription.setValue(this.DetailData.ClassDescription);
          this.DataDetailsForm.controls.VehicleSpeed.setValue(this.DetailData.VehicleSpeed);
        } else {
          this.ErrorData = [{ AlertMessage: 'lane details not found.' }];
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
      ClassName: this.DataDetailsForm.value.ClassName,
      ClassDescription: this.DataDetailsForm.value.ClassDescription,
      VehicleSpeed: this.DataDetailsForm.value.VehicleSpeed,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.VehicleClassInsertUpdate(Obj).subscribe(
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
