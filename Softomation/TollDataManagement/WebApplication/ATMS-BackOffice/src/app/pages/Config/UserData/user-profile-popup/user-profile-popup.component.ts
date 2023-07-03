import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-user-profile-popup',
  templateUrl: './user-profile-popup.component.html',
  styleUrls: ['./user-profile-popup.component.css']
})
export class UserProfilePopupComponent implements OnInit {
  LogedUserId=0;
  DetailData:any;
  ErrorData:any;
  constructor(private dm: DataModel,public Dialogref: MatDialogRef<UserProfilePopupComponent>, 
    public dialog: MatDialog,private spinner: NgxSpinnerService,private dbService: apiIntegrationService) {
      this.LogedUserId = this.dm.getUserId();
  }

  ngOnInit(): void {
    if(this.LogedUserId>0)
      this.DetailsbyId();
    else {
      this.DetailData=this.dm.getUserData();
    }
  }

 
  DetailsbyId() {
    this.spinner.show();
    this.dbService.UserGetByIdWithPassword(this.LogedUserId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
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

  ClosePoup() { this.Dialogref.close(); }

  

 

}
