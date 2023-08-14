import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-incident-assigne',
  templateUrl: './incident-assigne.component.html',
  styleUrls: ['./incident-assigne.component.css']
})
export class IncidentAssigneComponent {
  PageTitle: string = "Incident Action Process";
  AssignedToName: string = "Assigned To";
  LogedUserId;
  dataDetails: any;
  IncidentId:any;
  ErrorData: any;
  PetrollingTeamList:any;
  Masterform!: FormGroup;
  error = errorMessages;
  submitted=false;
  ActionList:any;
  uploadedFiles:any=[];
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    @Inject(MAT_DIALOG_DATA) parentData: any, private dm: DataModel, public Dialogref: MatDialogRef<IncidentAssigneComponent>,
    public dialog: MatDialog) {
    this.IncidentId= parentData.IncidentId;
    this.LogedUserId = this.dm.getUserId();
  }

  ngOnInit(): void {
    this.Masterform = new FormGroup
    ({
      ActionStatusId: new FormControl('', [Validators.required]),
      AssignedToId: new FormControl('', [Validators.required]),
      ActionTakenRemark: new FormControl('', [Validators.required]),
    });
    this.GetIncidentStatus();
  }

  GetPetrollingTeam() {
    this.dbService.UserConfigurationGetByUserType(5).subscribe(
      data => {
        this.PetrollingTeamList = data.ResponseData;
        this.DetailsbyId();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ActionChange(val:any){
    let res=this.ActionList.filter((e: { IncidentStatusId: any; }) => e.IncidentStatusId == val);
    if(res.length>0){
      this.AssignedToName=res[0].IncidentStatusName;
    }

  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.IMSGetById(this.IncidentId).subscribe(
      data => {
        this.spinner.hide();
        this.dataDetails = data.ResponseData;
        this.PageTitle = "Manage Assigne: (" + this.IncidentId + ")";
        // debugger;
        // this.Masterform.controls['ActionStatusId'].setValue(this.dataDetails.IncidentStatusId);
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
        this.ActionList = dataresult.filter((e: { IncidentStatusId: any; }) => e.IncidentStatusId == 4 || e.IncidentStatusId == 5 || e.IncidentStatusId == 9);
        this.GetPetrollingTeam();
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
    // if(this.uploadedFiles.length==0 && this.Masterform.value.ActionStatusId==){
    //   this.ErrorData = [{ AlertMessage: 'Incident Image is required.' }];
    //   this.dm.openSnackBar(this.ErrorData, false);
    //   return;
    // }
    const Obj = {
      IncidentId: this.IncidentId,
      ActionTakenById:this.LogedUserId,
      AssignedToId: this.Masterform.value.AssignedToId,
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
