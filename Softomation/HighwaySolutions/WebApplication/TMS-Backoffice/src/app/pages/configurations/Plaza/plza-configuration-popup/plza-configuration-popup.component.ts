import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-plza-configuration-popup',
  templateUrl: './plza-configuration-popup.component.html',
  styleUrls: ['./plza-configuration-popup.component.css']
})
export class PlzaConfigurationPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  PlazaId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  SIData: any;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<PlzaConfigurationPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.PlazaId = parentData.PlazaId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create Plaza Master Details";
    this.DataDetailsForm = new FormGroup({
      SystemIntegratorId: new FormControl('', [Validators.required]),
      PlazaName: new FormControl('', [Validators.required]),
      PlazaServerIpAddress: new FormControl('', [Validators.required, Validators.pattern(regExps["IpAddress"])]),
      ChainageNumber: new FormControl('', [Validators.required,Validators.pattern(regExps['ChainageNumber'])]),
      Latitude: new FormControl('', [Validators.required,Validators.pattern(regExps['Latitude'])]),
      Longitude: new FormControl('', [Validators.required,Validators.pattern(regExps['Longitude'])]),
      DataStatus: new FormControl(true),
    });
    this.GetSIData();
    
  }
  GetSIData() {
    this.spinner.show();
    this.dbService.SystemIntegratorGetActive().subscribe(
      data => {
        
        this.SIData = data.ResponseData;
        if (this.PlazaId > 0) {
          this.PageTitle = "Update Plaza Master Details";
          this.DetailsbyId();
        }
        else
          this.spinner.hide();
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

  DetailsbyId() {
    this.dbService.PlazaGetById(this.PlazaId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['SystemIntegratorId'].setValue(DetailData.SystemIntegratorId);
          this.DataDetailsForm.controls['PlazaName'].setValue(DetailData.PlazaName);
          this.DataDetailsForm.controls['PlazaServerIpAddress'].setValue(DetailData.PlazaServerIpAddress);
          this.DataDetailsForm.controls['ChainageNumber'].setValue(DetailData.ChainageNumber);
          this.DataDetailsForm.controls['Latitude'].setValue(DetailData.Latitude);
          this.DataDetailsForm.controls['Longitude'].setValue(DetailData.Longitude);
          if (DetailData.DataStatus == 1)
            this.DataDetailsForm.controls['DataStatus'].setValue(true);
          else
            this.DataDetailsForm.controls['DataStatus'].setValue(false);
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

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      PlazaId: this.PlazaId,
      SystemIntegratorId: this.DataDetailsForm.value.SystemIntegratorId,
      PlazaName: this.DataDetailsForm.value.PlazaName,
      PlazaServerIpAddress: this.DataDetailsForm.value.PlazaServerIpAddress,
      ChainageNumber: this.DataDetailsForm.value.ChainageNumber,
      Latitude: this.DataDetailsForm.value.Latitude,
      Longitude: this.DataDetailsForm.value.Longitude,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.PlazaInsertUpdate(Obj).subscribe(
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