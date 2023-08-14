import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-incident-pop-up',
  templateUrl: './incident-pop-up.component.html',
  styleUrls: ['./incident-pop-up.component.css']
})
export class IncidentPopUpComponent implements OnInit {
  IncidentDetailsForm: FormGroup;
  error = errorMessages;
  EntryId: number;
  DataStatus = true;
  DataStatusDs = 1;
  LoginUserId;
  ErrorData: any;
  IncidentCategoryList = [{ Id: 1, Name: 'Accident' },
  { Id: 2, Name: 'Vehicle Parked on Expressway' },
  { Id: 3, Name: 'Road Asset Theft' },
  { Id: 4, Name: 'Traffic Congestion' },
  { Id: 5, Name: 'Human System Failure' },
  { Id: 6, Name: 'Traffic Rule violation' },
  { Id: 7, Name: 'Toll Plaza Related' },
  { Id: 8, Name: 'Animal On Road' },
  { Id: 9, Name: 'Break Down' },
  { Id: 10, Name: 'Law & Order Issue' },
  { Id: 11, Name: 'General Copmlaints' },
  { Id: 12, Name: 'Bad Road' }, ];
  DetailData: any;
  PermissionData;
  LogedUserId;
  LogedRoleId;
  ButtonShow = false;
  SelectedCategoryId = 0;
  minFromDate = new Date(1947, 1, 1);
  maxToDate = new Date();
  close() { this.Dialogref.close(); }
  constructor(private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData, public datepipe: DatePipe,
              public Dialogref: MatDialogRef<IncidentPopUpComponent>, public dialog: MatDialog) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.LogedUserId = this.emitService.getUserDetails();
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
        this.IncidentDataGetByID();
      }

  }

  ngOnInit(): void {
    this.IncidentDetailsForm = new FormGroup({
      IncidentName: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AllowSingleSpaceWithCharOnly)
      ]),
      ReportDate: new FormControl('', [
        Validators.required
      ]),
      IncidentDate: new FormControl('', [
        Validators.required
      ]),
      IncidentRefNo: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.NotAllowSplChar)
      ]),
      IncidentSourceType: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AllowOnlyCharacter)
      ]),
      IncidentSourceDevice: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AllowOnlyCharacter)
      ]),
      VehicleRegNo: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.NotAllowSplChar)
      ]),
      PersonName: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AllowOnlyCharacter)
      ]),
      PhoneNo: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.MobileNumber)
      ]),
      Remark: new FormControl('', [
        Validators.required,
        // Validators.pattern(regExps.AllowOnlyCharacter)
      ]),
      IncidentLocation: new FormControl('', [
        Validators.required,
        Validators.pattern(regExps.AllowOnlyCharacter)
      ]),
      Latitude: new FormControl('', [
       // Validators.required,
        Validators.pattern(regExps.Latitude)
      ]),
      Longitude: new FormControl('', [
        // Validators.required,
        Validators.pattern(regExps.Longitude)
      ]),
      IncidentCategory: new FormControl('', [
        Validators.required
      ]),
    });

    // this.DeviceDetailsForm.controls['GantryId'].setValue(0);
    // this.DeviceDetailsForm.controls['LaneNumber'].setValue(0);
    // this.DeviceDetailsForm.controls['Direction'].setValue(0);
  }

  // DeviceCategory() {
  //   this.dbService.CategoryMasterGetActive().subscribe(
  //     data => {
  //       this.IncidentCategoryList = data.ResponceData;
  //     },
  //     (error) => {
  //     }
  //   );
  // }

  IncidentDataGetByID() {
    this.spinner.show();
    this.dbService.IncidentDataGetById(this.EntryId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponceData;
        this.DataStatusDs = this.DetailData.DataStatus;
        if (this.DetailData.DataStatus == 1) {
          this.DataStatus = true;
        } else {
          this.DataStatus = false;
        }
        this.IncidentDetailsForm.controls.IncidentName.setValue(this.DetailData.IncidentName);
        this.IncidentDetailsForm.controls.ReportDate.setValue(this.DetailData.IncidentReportDate);
        this.IncidentDetailsForm.controls.IncidentDate.setValue(this.DetailData.IncidentDate);
        this.IncidentDetailsForm.controls.IncidentCategory.setValue(this.DetailData.IncidentCategoryId);
        this.IncidentDetailsForm.controls.IncidentRefNo.setValue(this.DetailData.IncidentRefNo);
        this.IncidentDetailsForm.controls.IncidentSourceType.setValue(this.DetailData.IncidentSourceType);
        this.IncidentDetailsForm.controls.IncidentSourceDevice.setValue(this.DetailData.IncidentSourceDevice);
        this.IncidentDetailsForm.controls.VehicleRegNo.setValue(this.DetailData.VehicleRegNo);
        this.IncidentDetailsForm.controls.PersonName.setValue(this.DetailData.PersonName);
        this.IncidentDetailsForm.controls.Latitude.setValue(this.DetailData.IncidentLat);
        this.IncidentDetailsForm.controls.Longitude.setValue(this.DetailData.IncidentLong);
        this.IncidentDetailsForm.controls.PhoneNo.setValue(this.DetailData.PhoneNo);
        this.IncidentDetailsForm.controls.IncidentLocation.setValue(this.DetailData.IncidentLocation);
        this.IncidentDetailsForm.controls.Remark.setValue(this.DetailData.Comments);
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

  SaveDeviceDetails() {
    if (this.IncidentDetailsForm.invalid) {
      return;
    }
    const Obj = {
      EntryId: this.EntryId,
      IncidentName: this.IncidentDetailsForm.value.IncidentName,
      IncidentReportDate: this.datepipe.transform(this.IncidentDetailsForm.value.ReportDate, 'dd-MMM-yyyy'),
      IncidentDate: this.datepipe.transform(this.IncidentDetailsForm.value.IncidentDate, 'dd-MMM-yyyy'),
      IncidentCategoryId: this.IncidentDetailsForm.value.IncidentCategory,
      IncidentRefNo: this.IncidentDetailsForm.value.IncidentRefNo,
      IncidentSourceType: this.IncidentDetailsForm.value.IncidentSourceType,
      IncidentSourceDevice: this.IncidentDetailsForm.value.IncidentSourceDevice,
      VehicleRegNo: this.IncidentDetailsForm.value.VehicleRegNo,
      PersonName: this.IncidentDetailsForm.value.PersonName,
      PhoneNo: this.IncidentDetailsForm.value.PhoneNo,
      IncidentLocation: this.IncidentDetailsForm.value.IncidentLocation,
      IncidentLat: this.IncidentDetailsForm.value.Latitude,
      IncidentLong: this.IncidentDetailsForm.value.Longitude,
      Comments: this.IncidentDetailsForm.value.Remark,
      DataStatus: this.DataStatusDs,
      CreatedBy: this.LoginUserId,
      ModifiedBy: this.LoginUserId,
    };
    this.spinner.show();
    this.dbService.IncidentInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.emitService.setPageRefresh(true);
          this.emitService.openSnackBar(this.ErrorData, true);
          this.close();
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

  ClearData() {
    this.IncidentDetailsForm.reset();
  }

}
