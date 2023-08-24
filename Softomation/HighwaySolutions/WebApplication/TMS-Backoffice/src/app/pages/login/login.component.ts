import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
})
export class LoginComponent implements OnInit {
  CurrentYear: number = ((new Date()).getFullYear());
  loginForm!: FormGroup;
  ErrorData: any;
  loginReposnse: any;
  constructor(public router: Router, public api: apiIntegrationService, public dataModel: DataModel,
    private spinner: NgxSpinnerService) { }

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      UserName: new FormControl('', [
        Validators.required
      ]),
      Password: new FormControl('', [
        Validators.required
      ])
    });
    this.api.GetUrl();
  }


  onLoginSubmit() {
    if (this.loginForm.invalid) {
      return;
    }
    this.spinner.show();
    const obj = {
      LoginId: this.loginForm.value.UserName,
      LoginPassword: this.loginForm.value.Password
    };
    this.api.Login(obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.loginReposnse = data.ResponseData;
          this.dataModel.setLoggedIn(true);
          this.dataModel.setTokenVale(data.ResponseData.AccessToken);
          this.dataModel.setUserData(JSON.stringify(data.ResponseData.UserData));
          this.GetSystemSetting();
        } else {
          this.ErrorData = data.Message;
          this.dataModel.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dataModel.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetSystemSetting() {
    this.api.SystemSettingGet().subscribe(
      data => {
        this.dataModel.setSSData(JSON.stringify(data.ResponseData));
        this.router.navigate(['/dashboard']);
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dataModel.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dataModel.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }
}