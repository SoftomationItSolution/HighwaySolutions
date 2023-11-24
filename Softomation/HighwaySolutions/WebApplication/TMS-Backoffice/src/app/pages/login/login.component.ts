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
  ProjectDetails: any;
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
      ]),
      RememberMe: new FormControl(false),
    });

    const rm = localStorage.getItem('RememberMe');
    if (rm !== null) {
      if (rm == "true") {
        this.loginForm.controls['UserName'].setValue(localStorage.getItem('LoginId'));
        this.loginForm.controls['RememberMe'].setValue(true);
      }
    }

    this.api.GetUrl();
    this.ProjectDetails = this.dataModel.getProjectDetails();
  }


  onLoginSubmit() {
    if (this.loginForm.invalid) {
      return;
    }

    if (this.loginForm.value.RememberMe) {
      localStorage.setItem('LoginId', this.loginForm.value.UserName);
      localStorage.setItem('RememberMe', this.loginForm.value.RememberMe);
    }
    else {
      localStorage.removeItem('LoginId');
      localStorage.removeItem('RememberMe');
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
          this.ErrorData = error.error.Message;
          this.dataModel.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dataModel.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  login(credentials: any) {

  }
}