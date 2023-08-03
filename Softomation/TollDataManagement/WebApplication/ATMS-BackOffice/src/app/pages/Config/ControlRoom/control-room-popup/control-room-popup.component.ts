import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-control-room-popup',
  templateUrl: './control-room-popup.component.html',
  styleUrls: ['./control-room-popup.component.css']
})
export class ControlRoomPopupComponent implements OnInit {
  PageTitle:any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  ControlRoomId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted=false;
  DirectionList = [{ Id: 1, Name: 'LHS' }, { Id: 2, Name: 'RHS' }];
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any,
              private dm: DataModel, public Dialogref: MatDialogRef<ControlRoomPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.ControlRoomId = parentData.ControlRoomId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Controlroom';
    this.DataDetailsForm = new FormGroup({
      ControlRoomName: new FormControl('', [Validators.required]),
      ChainageNumber:new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      Latitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      Longitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      DirectionId: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true),
    });
    if (this.ControlRoomId > 0) {
      this.PageTitle = 'Update Controlroom Details';
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.ControlRoomGetById(this.ControlRoomId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['ControlRoomName'].setValue(this.DetailData.ControlRoomName);
        this.DataDetailsForm.controls['ChainageNumber'].setValue(this.DetailData.ChainageNumber);
        this.DataDetailsForm.controls['Latitude'].setValue(this.DetailData.Latitude);
        this.DataDetailsForm.controls['Longitude'].setValue(this.DetailData.Longitude);
        this.DataDetailsForm.controls['DirectionId'].setValue(this.DetailData.DirectionId);
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
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
        this.Dialogref.close();
      }
    );
  }

  ClosePoup() { this.Dialogref.close(false); }

  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    this.submitted=true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      ControlRoomId: this.ControlRoomId,
      ControlRoomName: this.DataDetailsForm.value.ControlRoomName,
      ChainageNumber: this.DataDetailsForm.value.ChainageNumber,
      Latitude: this.DataDetailsForm.value.Latitude,
      Longitude: this.DataDetailsForm.value.Longitude,
      DirectionId: this.DataDetailsForm.value.DirectionId,
      DataStatus: this.DataDetailsForm.value.DataStatus==true?1:2,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.ControlRoomInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.Dialogref.close(true);
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

}
