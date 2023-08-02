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
  submitted=false;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
              private dm: DataModel, public Dialogref: MatDialogRef<SystemSettingComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getRoleId();
    
  }

  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      TotalLane: new FormControl('', [
        Validators.required
      ]),
      IsATCCIndependently: new FormControl(true),
      ATCCByVIDS: new FormControl(false),
      ATCCByVSDS: new FormControl(false),
      TrafficByTime: new FormControl('',[Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
      TrafficCount: new FormControl('',[Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
    });
   this.GetLaneList();
  }
  ATCCChanged(event:any){
    if(event.currentTarget.checked){
      this.DataDetailsForm.controls['ATCCByVIDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].disable();
      this.DataDetailsForm.controls['ATCCByVIDS'].disable();
    }
    else{
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
  // DetailsbyId() {
  //   this.spinner.show();
  //   this.dbService.RoleConfigurationGetById(this.RoleId).subscribe(
  //     data => {
  //       this.spinner.hide();
  //       this.DetailData = data.ResponseData;
  //       this.DataDetailsForm.controls['RoleName'].setValue(this.DetailData.RoleName);
  //       if (this.DetailData.DataStatus == 1) {
  //         this.DataDetailsForm.controls['DataStatus'].setValue(true);
  //       } else {
  //         this.DataDetailsForm.controls['DataStatus'].setValue(false);
  //       }
       
  //     },
  //     (error) => {
  //       this.spinner.hide();
  //       try {
  //         this.ErrorData = error.error;
  //         this.dm.openSnackBar(this.ErrorData, false);
  //       } catch (error) {
  //         this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
  //         this.dm.openSnackBar(this.ErrorData, false);
  //       }
  //       this.Dialogref.close();
  //     }
  //   );
  // }

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
    this.DataDetailsForm.reset();
  }

  SaveDetails() {
    this.submitted=true;
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
    this.dbService.RoleConfigurationSetUp(Obj).subscribe(
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
