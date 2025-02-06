import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-db-configuration-popup',
  templateUrl: './db-configuration-popup.component.html',
  styleUrls: ['./db-configuration-popup.component.css']
})
export class DBConfigurationPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  DBBackUpDetailId: number = 0;
  LogedUserId: number = 0;
  FileDataBaseTypeId: number = 0;
  DetailData: any=null;
  submitted = false;
  ErrorData: any;
  hide = true;
  DataBaseTypeList = [{ DataId: 1, DataName: 'MS SQL' }, { DataId: 2, DataName: 'MY SQL' }];
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<DBConfigurationPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.DBBackUpDetailId = parentData.DBBackUpDetailId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create new database backup config Details";
    this.DataDetailsForm = new FormGroup({
      DataBaseTypeId: new FormControl('', [Validators.required]),
      HostName: new FormControl('', [Validators.required]),
      HostPort: new FormControl('', [Validators.required, Validators.pattern(regExps['PortNumber'])]),
      DataBaseName: new FormControl('', [Validators.required]),
      LoginId: new FormControl('', [Validators.required]),
      LoginPassword: new FormControl('', [Validators.required]),
      BackUpPreFix: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true)
    });
    if (this.DBBackUpDetailId > 0) {
      this.PageTitle = "Update database backup config Details";
      this.DetailsbyId();
    }

  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.DBBackUpDetailGetById(this.DBBackUpDetailId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.DetailData = data.ResponseData;
          this.fillDataByDB()
        }
        else {
          this.ClosePoup();
          this.ErrorData = [{ AlertMessage: "role details not found." }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  fillDataByDB() {
    this.DataDetailsForm.controls['DataBaseTypeId'].setValue(this.DetailData.DataBaseTypeId);
    this.DataDetailsForm.controls['HostName'].setValue(this.DetailData.HostName);
    this.DataDetailsForm.controls['HostPort'].setValue(this.DetailData.HostPort);
    this.DataDetailsForm.controls['DataBaseName'].setValue(this.DetailData.DataBaseName);
    this.DataDetailsForm.controls['BackUpPreFix'].setValue(this.DetailData.BackUpPreFix);
    this.DataDetailsForm.controls['LoginId'].setValue(this.DetailData.LoginId);
    this.DataDetailsForm.controls['LoginPassword'].setValue(this.DetailData.LoginPassword);
    if (this.DetailData.DataStatus == 1)
      this.DataDetailsForm.controls['DataStatus'].setValue(true);
    else
      this.DataDetailsForm.controls['DataStatus'].setValue(false);
  }

  ClosePoup() { this.Dialogref.close(false); }

  

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      DBBackUpDetailId: this.DBBackUpDetailId,
      DataBaseTypeId: this.DataDetailsForm.value.DataBaseTypeId,
      HostName: this.DataDetailsForm.value.HostName,
      HostPort: this.DataDetailsForm.value.HostPort,
      DataBaseName: this.DataDetailsForm.value.DataBaseName,
      BackUpPreFix: this.DataDetailsForm.value.BackUpPreFix,
      LoginId: this.DataDetailsForm.value.LoginId,
      LoginPassword: this.DataDetailsForm.value.LoginPassword,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.DBBackUpDetailInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success') > -1) {
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
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

}