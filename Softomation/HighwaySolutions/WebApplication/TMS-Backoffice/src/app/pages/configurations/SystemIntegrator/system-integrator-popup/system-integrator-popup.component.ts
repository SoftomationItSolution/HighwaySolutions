import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-system-integrator-popup',
  templateUrl: './system-integrator-popup.component.html',
  styleUrls: ['./system-integrator-popup.component.css']
})
export class SystemIntegratorPopupComponent implements OnInit {
  PageTitle:string="";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  SystemIntegratorId: number=0;
  PermissionData:any;
  UserDetails:any;
  DataStatus: boolean = true;
  DataStatusDs = 1;
  LogedUserId:number=0;
  DetailData: any;
  ButtonShow = false;
  UpdateResetShow = true;
  submitted=false;
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData:any,public Dialogref: MatDialogRef<SystemIntegratorPopupComponent>, 
  public dialog: MatDialog,private dbService: apiIntegrationService,private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.SystemIntegratorId = parentData.SystemIntegratorId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create System Integrator Details";
    this.DataDetailsForm = new FormGroup({
      SystemIntegratorId: new FormControl('', [Validators.required]),
      SystemIntegratorName: new FormControl('', [Validators.required,Validators.pattern(regExps["AlphaNumericSingleSpace"])]),
      EmailId: new FormControl('', [Validators.required,Validators.pattern(regExps["EmailId"])]),
      MobileNumber: new FormControl('', [Validators.required,Validators.pattern(regExps["MobileNumber"])]),
      SystemIntegratorAddress: new FormControl('', [Validators.required]),
      DataStatus: new FormControl(true),
    });
    if (this.SystemIntegratorId > 0) {
      if (this.PermissionData.DataUpdate == 1){
        this.PageTitle = "Update System Integrator Details";
        this.UpdateResetShow=false;
      }
      else
        this.PageTitle = "View System Integrator Details";
      this.DetailsbyId();
    }
  }

  DetailsbyId() {
    // this.spinner.show();
    // this.dbService.SystemIntegratorGetById(this.EntryId).subscribe(
    //   data => {
    //     this.spinner.hide();
    //     var returnMessage = data.Message[0].AlertMessage;
    //     if (returnMessage == 'success') {
    //       var DetailData = data.ResponseData;
    //       this.DataStatusDs = DetailData.DataStatus;
    //       if (DetailData.DataStatus == 1)
    //         this.DataStatus = true;
    //       else
    //         this.DataStatus = false;
    //       this.DataDetailsForm.controls['SystemIntegratorId'].setValue(DetailData.SystemIntegratorId);
    //       this.DataDetailsForm.controls['SystemIntegratorName'].setValue(DetailData.SystemIntegratorName);
    //       this.DataDetailsForm.controls['SystemIntegratorAddress'].setValue(DetailData.SystemIntegratorAddress);
    //       this.DataDetailsForm.controls['MobileNumber'].setValue(DetailData.MobileNumber);
    //       this.DataDetailsForm.controls['EmailId'].setValue(DetailData.EmailId);
    //     }
    //     else {
    //       this.ClosePoup();
    //       const ErrorData = [{ AlertMessage: "role details not found." }];
    //       this.emitService.openSnackBar(ErrorData, false);
    //     }
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     const ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(ErrorData, false);
    //   }
    // );
  }

  onChange(event:any) {
    if (event.checked) {
      this.DataStatus = true;
      this.DataStatusDs = 1;
    }
    else {
      this.DataStatus = false;
      this.DataStatusDs = 2;
    }
  }

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
   this.DataDetailsForm.reset();
  }

  SaveDetails() {
    this.submitted=true;
    // if (this.DataDetailsForm.invalid) {
    //   return;
    // }
    // const Obj = {
    //   EntryId: this.EntryId,
    //   SystemIntegratorId: this.DataDetailsForm.value.SystemIntegratorId,
    //   SystemIntegratorName: this.DataDetailsForm.value.SystemIntegratorName,
    //   SystemIntegratorAddress: this.DataDetailsForm.value.SystemIntegratorAddress,
    //   MobileNumber: this.DataDetailsForm.value.MobileNumber,
    //   EmailId: this.DataDetailsForm.value.EmailId,
    //   DataStatus: this.DataStatusDs,
    //   CreatedBy: this.LogedUserId
    // }
    // this.spinner.show();
    // this.dbService.SystemIntegratorSetUp(Obj).subscribe(
    //   data => {
    //     this.spinner.hide();
    //     var returnMessage = data.Message[0].AlertMessage;
    //     if (returnMessage == 'success') {
    //       const ErrorData = [{ AlertMessage: "Success" }];
    //       this.emitService.setPageRefresh(true,10);
    //       this.emitService.openSnackBar(ErrorData, true);
    //       this.ClosePoup();
    //     }
    //     else {
    //       const ErrorData = data.Message;
    //       this.emitService.openSnackBar(ErrorData, false);
    //     }
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     try {
    //       const ErrorData = error.error;
    //       this.emitService.openSnackBar(ErrorData, false);
    //     } catch (error) {
    //       const ErrorData = [{ AlertMessage: "Something went wrong." }];
    //       this.emitService.openSnackBar(ErrorData, false);
    //     }
    //   }
    // );
  }


}
