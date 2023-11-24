import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { FormGroup, Validators, FormBuilder, FormControl } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ConfirmPasswordValidator, errorMessages, regExps } from 'src/services/CustomValidation';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';

@Component({
  selector: 'app-chnage-password-pop-up',
  templateUrl: './chnage-password-pop-up.component.html',
  styleUrls: ['./chnage-password-pop-up.component.css']
})
export class ChnagePasswordPopUpComponent implements OnInit {

  error = errorMessages;
  notSame = true;
  ErrorData: any;
  LogedUserId;
  PasswordForm!: FormGroup;
  hide = true;
  hide1 = true;
  userData: any;
  submitted = false;
  constructor(private dm: DataModel, private router: Router,
    public Dialogref: MatDialogRef<ChnagePasswordPopUpComponent>, private dbServive: apiIntegrationService,
    public dialog: MatDialog, private spinner: NgxSpinnerService, private formBuilder: FormBuilder) {
    this.LogedUserId = this.dm.getUserId();
    this.userData = this.dm.getUserData();
  }


  ngOnInit() {
    this.notSame = false;
    this.PasswordForm = this.formBuilder.group(
      {
        CurrentPassword: ["", Validators.required],
        NewPassword: new FormControl('', [
          Validators.required,
          Validators.pattern(regExps['Password'])
        ]),
        ConfirmPassword: ["", Validators.required]
      },
      {
        validator: ConfirmPasswordValidator("NewPassword", "ConfirmPassword")
      }
    );
  }

  UpdatePassword() {
    this.submitted = true;
    if (this.PasswordForm == null)
      return
    if (this.PasswordForm.valid) {
      this.spinner.show();
      const obj = { UserId: this.LogedUserId, LoginPassword: this.PasswordForm.value.CurrentPassword };
      this.dbServive.UserValidatePassword(obj).subscribe(
        data => {
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {

            const obj = {
              UserId: this.LogedUserId,
              LoginPassword: this.PasswordForm.value.NewPassword,
              CreatedBy: this.LogedUserId
            };
            this.dbServive.UserUpdatePassword(obj).subscribe(
              data => {
                this.spinner.hide();
                returnMessage = data.Message[0].AlertMessage;
                if (returnMessage.indexOf('success') > -1) {
                  this.ErrorData = [{ AlertMessage: 'Password changed successfully' }];
                  this.dm.openSnackBar(this.ErrorData, true);
                  this.ClosePoup();
                  this.Logout();
                } else {
                  this.ErrorData = [{ AlertMessage: 'Password not changed' }];
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
          } else {
            this.spinner.hide();
            this.ErrorData = [{ AlertMessage: 'Your current password is invalid' }];
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
  ClosePoup() { this.Dialogref.close(); }
  Logout() {
    const obj = {
      LoginId: this.userData.LoginId,
      UserTypeId: this.userData.UserTypeId,
      UserId: this.userData.UserId
    };
    this.dbServive.LogoutUser(obj).subscribe(
      data => {
        this.dm.clearStorage();
        this.router.navigate(['']);
      },
      (error) => {
        this.dm.clearStorage()
        this.router.navigate(['']);
      }
    );

  }

}
