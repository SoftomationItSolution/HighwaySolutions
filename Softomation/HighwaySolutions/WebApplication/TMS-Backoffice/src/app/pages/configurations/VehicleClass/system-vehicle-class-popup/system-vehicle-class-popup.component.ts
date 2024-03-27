import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-system-vehicle-class-popup',
  templateUrl: './system-vehicle-class-popup.component.html',
  styleUrls: ['./system-vehicle-class-popup.component.css']
})
export class SystemVehicleClassPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  SystemVehicleClassId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  FasTagVehicleClassList: any;
  SystemSubVehicleClassList:any
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<SystemVehicleClassPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.SystemVehicleClassId = parentData.SystemVehicleClassId;
  }
  ngOnInit(): void {
    this.PageTitle = "Create Vehicle Class Details";
    this.DataDetailsForm = new FormGroup({
      FasTagVehicleClassId: new FormControl('', [Validators.required]),
      SystemVehicleClassName: new FormControl('', [Validators.required]),
      SystemVehicleClassDescription: new FormControl('', [Validators.required]),
      SystemSubClassIds: new FormControl('', [Validators.required]),
      PermissibleWeight: new FormControl('', [Validators.required, Validators.pattern(regExps['DecimalThreeDigit'])]),
      AvcVehicleClassId: new FormControl('', [Validators.required, Validators.pattern(regExps['OnlyDigit'])]),
      DataStatus: new FormControl(true),
    });
    this.GetActiveClass();

  }

  GetActiveClass() {
    this.spinner.show();
    this.dbService.FasTagVehicleClassGetActive().subscribe(
      data => {
        this.FasTagVehicleClassList = data.ResponseData;
        this.GetActiveSubClass();
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

  GetActiveSubClass() {
    this.dbService.FasTagVehicleClassGetActive().subscribe(
      data => {
        this.SystemSubVehicleClassList = data.ResponseData;
        if (this.SystemVehicleClassId > 0) {
          this.PageTitle = "Update Vehicle Class Details";
          this.DetailsbyId();
        }
        else {
          this.spinner.hide();
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

  FasTagVehicleClassChange(value:any){
    const classList = this.FasTagVehicleClassList.filter((e: { FasTagVehicleClassId: any; }) => e.FasTagVehicleClassId === value);
    if (classList!=undefined && classList.length>0) {
      this.DataDetailsForm.controls['SystemVehicleClassName'].setValue(classList[0].FasTagVehicleClassName);
      this.DataDetailsForm.controls['SystemVehicleClassDescription'].setValue(classList[0].FasTagVehicleClassDescription);
      this.DataDetailsForm.controls['PermissibleWeight'].setValue(classList[0].PermissibleWeight);
    }
  }

  DetailsbyId() {
    this.dbService.SystemVehicleClassGetById(this.SystemVehicleClassId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['SystemVehicleClassName'].setValue(DetailData.SystemVehicleClassName);
          this.DataDetailsForm.controls['SystemVehicleClassDescription'].setValue(DetailData.SystemVehicleClassDescription);
          this.DataDetailsForm.controls['PermissibleWeight'].setValue(DetailData.PermissibleWeight);
          this.DataDetailsForm.controls['AvcVehicleClassId'].setValue(DetailData.AvcVehicleClassId);
          this.DataDetailsForm.controls['SystemSubClassIds'].setValue(DetailData.SystemSubClassIds.split(','));//DetailData.SystemSubClassIdList
          if (DetailData.DataStatus == 1)
            this.DataDetailsForm.controls['DataStatus'].setValue(true);
          else
            this.DataDetailsForm.controls['DataStatus'].setValue(false);
            this.DataDetailsForm.controls['FasTagVehicleClassId'].setValue(DetailData.FasTagVehicleClassId);
        }
        else {
          this.ClosePoup();
          const ErrorData = [{ AlertMessage: "role details not found." }];
          this.dm.openSnackBar(ErrorData, false);
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
      SystemVehicleClassId: this.SystemVehicleClassId,
      FasTagVehicleClassId: this.DataDetailsForm.value.FasTagVehicleClassId,
      SystemVehicleClassName: this.DataDetailsForm.value.SystemVehicleClassName,
      SystemVehicleClassDescription: this.DataDetailsForm.value.SystemVehicleClassDescription,
      PermissibleWeight: this.DataDetailsForm.value.PermissibleWeight,
      AvcVehicleClassId: this.DataDetailsForm.value.AvcVehicleClassId,
      SystemSubClassIds: this.DataDetailsForm.value.SystemSubClassIds.toString(),
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.SystemVehicleClassInsertUpdate(Obj).subscribe(
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