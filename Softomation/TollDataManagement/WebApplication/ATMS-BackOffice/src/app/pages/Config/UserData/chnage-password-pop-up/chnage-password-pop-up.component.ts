import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { FormGroup, Validators, FormBuilder, FormControl, FormGroupDirective, NgForm } from '@angular/forms';
import { ConfirmValidParentMatcher, errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-chnage-password-pop-up',
  templateUrl: './chnage-password-pop-up.component.html',
  styleUrls: ['./chnage-password-pop-up.component.css']
})
export class ChnagePasswordPopUpComponent implements OnInit {
  constructor(private emitService: EmittersService, public Dialogref: MatDialogRef<ChnagePasswordPopUpComponent>, private dbServive: ApiService, public dialog: MatDialog, private spinner: NgxSpinnerService) {
    this.LogedUserId = this.emitService.getUserDetails();
  }
  fb: FormBuilder;
  error = errorMessages;
  notSame = true;
  ErrorData: any;
  LogedUserId;
  PasswordForm: FormGroup;
  hide = true;
  hide1 = true;
  confirmValidParentMatcher = new ConfirmValidParentMatcher();
  submitted=false;
  close() {this.Dialogref.close(); }

  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
    const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);

    return (invalidCtrl || invalidParent);
  }


  ngOnInit() {
      this.notSame = false;
      this.PasswordForm = new FormGroup({
        CurrentPassword: new FormControl('', [
          Validators.required
        ]),
        Password: new FormControl('', [
          Validators.required, Validators.pattern(regExps['Password'])
        ]),
        ConfirmPassword: new FormControl('', [
          Validators.required
        ]),
      });
  }

  checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    const password = group.get('Password').value;
    const confirmPassword = group.get('ConfirmPassword').value;
    return password === confirmPassword ? null : { notSame: true };
  }

  UpdatePassword() {
    this.submitted=true;
    if (this.PasswordForm.valid) {
      if (this.PasswordForm.get('Password').value == this.PasswordForm.get('ConfirmPassword').value) {
        this.spinner.show();
        const obj = {EntryId: this.LogedUserId, LoginPassword: this.PasswordForm.get('CurrentPassword').value};
        this.dbServive.UserValidatePassword(obj).subscribe(
          data => {
            let returnMessage = data.Message[0].AlertMessage;
            if (returnMessage == 'success') {
              const obj = {EntryId: this.LogedUserId, LoginPassword: this.PasswordForm.get('Password').value};
              this.dbServive.UserUpdatePassword(obj).subscribe(
                data => {
                  this.spinner.hide();
                  returnMessage = data.Message[0].AlertMessage;
                  if (returnMessage == 'success') {
                    this.ErrorData = [{AlertMessage: 'Password changed successfully'}];
                    this.emitService.openSnackBar(this.ErrorData, true);
                    this.close();
                  } else {
                    this.ErrorData = [{AlertMessage: 'Password not changed'}];
                    this.emitService.openSnackBar(this.ErrorData, false);
                  }

                },
                (error) => {
                  this.spinner.hide();
                  this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
                  this.emitService.openSnackBar(this.ErrorData, false);
                  }
              );
            } else {
              this.spinner.hide();
              this.ErrorData = [{AlertMessage: 'Your current password is invalid'}];
              this.emitService.openSnackBar(this.ErrorData, false);
            }

          },
          (error) => {
            this.spinner.hide();
            this.ErrorData = [{AlertMessage: 'Your current password is invalid'}];
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        );
      } else {
        this.notSame = true;
      }
    }
  }
  ClosePoup() { this.Dialogref.close(); }


}
