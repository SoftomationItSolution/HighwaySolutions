import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-lane-popup',
  templateUrl: './lane-popup.component.html',
  styleUrls: ['./lane-popup.component.css']
})
export class LanePopupComponent implements OnInit {
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
  GantryData: any;
  DirectionList = [{Id: 1, Name: 'LHS'}, {Id: 2, Name: 'RHS'}];
  LaneNmberList = [];
  PermissionData;
  ButtonShow = false;
  ApplicationType = 1;
  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData,
              private emitService: EmittersService, public Dialogref: MatDialogRef<LanePopupComponent>, public dialog: MatDialog) {
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
    for (let i = 1; i <= 30; i++) {
      this.LaneNmberList.push({Id: i, Name: i});
    }
    this.PageTitle = 'Create New Lane';
    this.DataDetailsForm = new FormGroup({
      GantryId: new FormControl('', [
        Validators.required
      ]),
      LaneNumber: new FormControl('', [
        Validators.required
      ]),
      LaneDirection: new FormControl('', [
        Validators.required
      ]),
    });
    this.GetGantryData();
  }


  GetGantryData() {
    this.spinner.show();
    this.dbService.GantryGetAllActive().subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
        this.GantryData = data.ResponceData;
        }
        if (this.EntryId > 0) {
          if (this.PermissionData.DataUpdate == 1) {
            this.PageTitle = 'Update Lane Details';
          } else {
            this.PageTitle = 'View Lane Details';
          }
          this.DetailsbyId();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }



  DetailsbyId() {
    this.spinner.show();
    this.dbService.LaneConfigurationGetById(this.EntryId).subscribe(
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
          this.DataDetailsForm.controls.GantryId.setValue(this.DetailData.GantryId);
          this.DataDetailsForm.controls.LaneNumber.setValue(this.DetailData.LaneNumber);
          this.DataDetailsForm.controls.LaneDirection.setValue(this.DetailData.LaneDirection);
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
    let ControlRoomId = 0;
    let result = this.GantryData.filter(e => e.EntryId == this.DataDetailsForm.value.GantryId);
    if (result.length > 0) {
      ControlRoomId = result[0].ControlRoomId;
    }
    const Obj = {
      EntryId: this.EntryId,
      ControlRoomId,
      GantryId: this.DataDetailsForm.value.GantryId,
      LaneNumber: this.DataDetailsForm.value.LaneNumber,
      LaneDirection: this.DataDetailsForm.value.LaneDirection,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.LaneConfigurationSetUp(Obj).subscribe(
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
