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
  hide = true;
  ConfigData: any;
  constructor(public router: Router, public api: apiIntegrationService, public dm: DataModel,
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
    this.dm.clearStorage();
    const rm = localStorage.getItem('RememberMe');
    if (rm !== null) {
      if (rm == "true") {
        this.loginForm.controls['UserName'].setValue(localStorage.getItem('LoginId'));
        this.loginForm.controls['RememberMe'].setValue(true);
      }
    }
    this.GetDetails();
  }

  GetDetails() {
    this.spinner.show();
    this.api.appConfigGet().subscribe(
      data => {
        let curretURL = (window.location.href).split(':')
        let mediaPath = "";
        let apiPath = "";
        let currentIP = curretURL[1].replace("//", "").replace("/", "");
        this.ConfigData = data;
        if (currentIP != "localhost") {
          if (this.ConfigData.BaseURL == "localhost")
            this.ConfigData.BaseURL = currentIP;
        }
        if (this.ConfigData.ApiPort == 0) {
          apiPath = curretURL[0] + "://" + this.ConfigData.BaseURL + "/" + this.ConfigData.ApiAdminPath + "/";
          mediaPath = curretURL[0] + "://" + this.ConfigData.BaseURL + "/EventMedia/"
        }
        else {
          apiPath = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/" + this.ConfigData.ApiAdminPath + "/"
          mediaPath = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/EventMedia/"
        }

        this.dm.setMediaAPI(mediaPath);
        this.dm.setDataAPI(apiPath)
        this.GetProjectDetails();
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

  GetProjectDetails() {
    this.api.ProjectConfigGet().subscribe(
      data => {
        this.spinner.hide();
        this.ProjectDetails = data.ResponseData;
        this.dm.setProjectDetails(JSON.stringify(data.ResponseData));
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


  onLoginSubmit() {
    if (this.loginForm.invalid) {
      return;
    }
    this.dm.clearStorage();
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
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          this.dm.setLoggedIn(true);
          this.dm.setUserData(JSON.stringify(data.ResponseData.userData));
          this.dm.setSSData(JSON.stringify(data.ResponseData.shiftDetails));
          this.dm.setloginTime(data.ResponseData.loginTime);
          if (data.ResponseData.LaneTypeId == 3) {
            this.router.navigate(['/etcdashboard']);
          }
          else { this.router.navigate(['/dashboard']); }

        } else {
          this.ErrorData = [{ AlertMessage: data.message }];;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}