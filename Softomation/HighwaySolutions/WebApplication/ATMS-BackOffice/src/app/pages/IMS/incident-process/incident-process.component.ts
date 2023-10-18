import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages } from 'src/app/services/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-incident-process',
  templateUrl: './incident-process.component.html',
  styleUrls: ['./incident-process.component.css']
})
export class IncidentProcessComponent {
  PageTitle: string = "Incident Action Process";
  LogedUserId;
  dataDetails: any;
  IncidentId:any;
  ErrorData: any;
  Masterform!: FormGroup;
  error = errorMessages;
  submitted=false;
  ActionList:any;
  uploadedFiles:any=[];
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    @Inject(MAT_DIALOG_DATA) parentData: any, private dm: DataModel, public Dialogref: MatDialogRef<IncidentProcessComponent>,
    public dialog: MatDialog) {
    this.IncidentId= parentData.IncidentId;
    this.LogedUserId = this.dm.getUserId();
  }

  ngOnInit(): void {
    this.Masterform = new FormGroup({
      ActionStatusId: new FormControl('', [Validators.required]),
      ActionTakenRemark: new FormControl('', [Validators.required]),
    });
    this.GetIncidentStatus();
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.IMSGetById(this.IncidentId).subscribe(
      data => {
        this.spinner.hide();
        this.dataDetails = data.ResponseData;
        this.PageTitle = this.dataDetails.IncidentStatusName + "(" + this.IncidentId + ")";
        //this.Masterform.controls['ActionStatusId'].setValue(this.dataDetails.IncidentStatusId);
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

  GetIncidentStatus() {
    this.spinner.show();
    this.dbService.IncidentStatusGetActive().subscribe(
      data => {
        this.spinner.hide();
        var dataresult = data.ResponseData;
        this.ActionList = dataresult.filter((e: { IncidentStatusId: any; }) => e.IncidentStatusId == 2 || e.IncidentStatusId == 3 || e.IncidentStatusId == 6);
        this.DetailsbyId();
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
       this.ClosePoup();
      }
    );
  }

  uploadFileEvt(imgFile: any) {
    this.uploadedFiles = [];
    for (let file of imgFile.currentFiles) {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        const Obj = {
          Base64: reader.result,
          file: file
        }
        this.uploadedFiles.push(Obj);
      };
    }
  }

  removeFileEvt() {
    this.uploadedFiles = [];
  }

  ClosePoup() { this.Dialogref.close(false); }

  SaveProcess(){
    this.submitted=true;
    if (this.Masterform.invalid) {
      return;
    }
    if(this.uploadedFiles.length==0 && this.Masterform.value.ActionStatusId){
      this.ErrorData = [{ AlertMessage: 'Incident Image is required.' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    const Obj = {
      IncidentId: this.IncidentId,
      ActionImagePath: this.uploadedFiles[0].Base64,
      ActionTakenById:this.LogedUserId,
      ActionTakenRemark: this.Masterform.value.ActionTakenRemark,
      ActionStatusId: this.Masterform.value.ActionStatusId,
    };
    this.spinner.show();
    this.dbService.IMSActionHistoryInsert(Obj).subscribe(
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