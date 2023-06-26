import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { apiIntegrationService } from '../services/apiIntegration.service';
import { DataModel } from '../services/data-model.model';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from '../allservices/emitters.service';

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
          this.router.navigate(['/dashboard']);
        } else {
          this.ErrorData = data.Message;
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dataModel.openSnackBar(this.ErrorData, false);

      }
    );
  }



}
