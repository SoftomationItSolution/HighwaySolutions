import { Component ,Inject} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vms-popup',
  templateUrl: './vms-popup.component.html',
  styleUrls: ['./vms-popup.component.css']
})
export class VmsPopupComponent {
  PageTitle: any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  PackageId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted = false;
  ControlRoomData: any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<VmsPopupComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.PackageId = parentData.PackageId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New VMS';
    this.DataDetailsForm = new FormGroup({
      ControlRoomId: new FormControl('', Validators.required),
      PackageName: new FormControl('', Validators.required),
      StartChainageNumber: new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      EndChainageNumber: new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      StartLatitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      StartLongitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      EndLatitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      EndLongitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      DataStatus: new FormControl(true),
    });
    this.ControlRoom();
    if (this.PackageId > 0) {
      this.PageTitle = 'Update VMS Details';
    }
  }

  ControlRoom() {
    this.spinner.show();
    this.dbService.ControlRoomGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ControlRoomData = data.ResponseData;
        if (this.PackageId > 0) {
          this.DetailsbyId();
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

  DetailsbyId() {
    this.spinner.show();
    this.dbService.PackagesGetById(this.PackageId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['ControlRoomId'].setValue(this.DetailData.ControlRoomId);
        this.DataDetailsForm.controls['PackageName'].setValue(this.DetailData.PackageName);
        this.DataDetailsForm.controls['StartLatitude'].setValue(this.DetailData.StartLatitude);
        this.DataDetailsForm.controls['StartLongitude'].setValue(this.DetailData.StartLongitude);
        this.DataDetailsForm.controls['EndLatitude'].setValue(this.DetailData.EndLatitude);
        this.DataDetailsForm.controls['EndLongitude'].setValue(this.DetailData.EndLongitude);
        this.DataDetailsForm.controls['StartChainageNumber'].setValue(this.DetailData.StartChainageNumber);
        this.DataDetailsForm.controls['EndChainageNumber'].setValue(this.DetailData.EndChainageNumber);
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
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      PackageId: this.PackageId,
      ControlRoomId: this.DataDetailsForm.value.ControlRoomId,
      PackageName: this.DataDetailsForm.value.PackageName,
      StartLatitude: this.DataDetailsForm.value.StartLatitude,
      StartLongitude: this.DataDetailsForm.value.StartLongitude,
      EndLatitude: this.DataDetailsForm.value.EndLatitude,
      EndLongitude: this.DataDetailsForm.value.EndLongitude,
      StartChainageNumber: this.DataDetailsForm.value.StartChainageNumber,
      EndChainageNumber: this.DataDetailsForm.value.EndChainageNumber,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.PackagesSetUp(Obj).subscribe(
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

