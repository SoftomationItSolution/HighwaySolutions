import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-create-incident',
  templateUrl: './create-incident.component.html',
  styleUrls: ['./create-incident.component.css']
})
export class CreateIncidentComponent {
  PageTitle: any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  ControlRoomId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<CreateIncidentComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.ControlRoomId = parentData.ControlRoomId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Incident';
    this.DataDetailsForm = new FormGroup({
      ControlRoomName: new FormControl('', [
        Validators.required
      ]),
      DataStatus: new FormControl(true),
    });
    if (this.ControlRoomId > 0) {
      this.PageTitle = 'Update Incident Details';
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

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      ControlRoomId: this.ControlRoomId,
      ControlRoomName: this.DataDetailsForm.value.ControlRoomName,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
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
          this.ClosePoup();
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
