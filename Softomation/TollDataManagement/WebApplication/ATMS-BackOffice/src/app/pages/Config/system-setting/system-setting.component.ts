import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-system-setting',
  templateUrl: './system-setting.component.html',
  styleUrls: ['./system-setting.component.css']
})
export class SystemSettingComponent {
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  RoleId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  LaneData: any;
  submitted = false;
  TabId = 0
  SystemDetails: any;
  ReportDetails: any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel) {
    this.LogedUserId = this.dm.getRoleId();

  }
  tabChange(id: number) {
    if (id == 0)
      console.log(id)
    //this.GetPending();
    else
      console.log(id)
    //this.GetInProgress()
    this.TabId = id;
  }

  handleCheck(event, data, type) {
    if (type == 1) {
      if (!event) {
        for (let i = 0; i < this.SystemDetails.length; i++) {
          const element = this.SystemDetails[i];
          if (element.SystemId == data.SystemId) {
            this.SystemDetails[i].DashBoard = event;
            break;
          }
        }
      }
    }
    else {
      if (event) {
        for (let i = 0; i < this.SystemDetails.length; i++) {
          const element = this.SystemDetails[i];
          if (element.SystemId == data.SystemId) {
            this.SystemDetails[i].DataStatus = event;
            break;
          }
        }
      }
    }
  }
  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      TotalLane: new FormControl('', [
        Validators.required
      ]),
      IsATCCIndependently: new FormControl(true),
      ATCCByVIDS: new FormControl(false),
      ATCCByVSDS: new FormControl(false),
      TrafficByTime: new FormControl('', [Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
      TrafficCount: new FormControl('', [Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
    });
    this.GetLaneList();
    this.GetSystemDetails();
  }
  ATCCChanged(event: any) {
    if (event.currentTarget.checked) {
      this.DataDetailsForm.controls['ATCCByVIDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].disable();
      this.DataDetailsForm.controls['ATCCByVIDS'].disable();
    }
    else {
      this.DataDetailsForm.controls['ATCCByVIDS'].setValue(true);
      this.DataDetailsForm.controls['ATCCByVSDS'].setValue(true);
      this.DataDetailsForm.controls['ATCCByVSDS'].enable();
      this.DataDetailsForm.controls['ATCCByVIDS'].enable();
    }
  }

  GetLaneList() {
    this.spinner.show();
    this.dbService.LaneGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.LaneData = data.ResponseData;
        this.GetDetails();
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
  GetDetails() {
    this.spinner.show();
    this.dbService.SystemSettingGet().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['TotalLane'].setValue(this.DetailData.TotalLane);
        this.DataDetailsForm.controls['TrafficCount'].setValue(this.DetailData.TrafficCount);
        this.DataDetailsForm.controls['TrafficByTime'].setValue(this.DetailData.TrafficByTime);
        this.DataDetailsForm.controls['IsATCCIndependently'].setValue(this.DetailData.IsATCCIndependently);
        if (this.DetailData.IsATCCIndependently) {
          this.DataDetailsForm.controls['ATCCByVIDS'].setValue(false);
          this.DataDetailsForm.controls['ATCCByVSDS'].setValue(false);
          this.DataDetailsForm.controls['ATCCByVSDS'].disable();
          this.DataDetailsForm.controls['ATCCByVIDS'].disable();
        }
        else {
          this.DataDetailsForm.controls['ATCCByVSDS'].setValue(this.DetailData.ATCCByVSDS);
          this.DataDetailsForm.controls['ATCCByVIDS'].setValue(this.DetailData.ATCCByVIDS);
          this.DataDetailsForm.controls['ATCCByVSDS'].enable();
          this.DataDetailsForm.controls['ATCCByVIDS'].enable();
        }


        // if (this.DetailData.DataStatus == 1) {
        //   this.DataDetailsForm.controls['DataStatus'].setValue(true);
        // } else {
        //   this.DataDetailsForm.controls['DataStatus'].setValue(false);
        // }

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

  GetSystemDetails() {
    this.spinner.show();
    this.dbService.SystemGetAll().subscribe(
      data => {
        this.SystemDetails = data.ResponseData;
        this.GetReportDetails();
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

  GetReportDetails() {
    this.dbService.ReportGetActive().subscribe(
      data => {
        this.ReportDetails = data.ResponseData;
        this.spinner.hide();
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


  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      TotalLane: this.DataDetailsForm.value.TotalLane,
      IsATCCIndependently: this.DataDetailsForm.value.IsATCCIndependently,
      ATCCByVIDS: this.DataDetailsForm.value.ATCCByVIDS,
      ATCCByVSDS: this.DataDetailsForm.value.ATCCByVSDS,
      TrafficCount: this.DataDetailsForm.value.TrafficCount,
      TrafficByTime: this.DataDetailsForm.value.TrafficByTime,
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.SystemSettingSetUp(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
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
