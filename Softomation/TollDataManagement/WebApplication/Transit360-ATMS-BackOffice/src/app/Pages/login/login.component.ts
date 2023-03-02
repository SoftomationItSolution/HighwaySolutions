import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  hide = true;
  ErrorData: any;
  loginReposnse: any;
  constructor(private dbService: ApiService, private emitService: EmittersService, private spinner: NgxSpinnerService) { }

  ngOnInit(): void {
    this.emitService.ClearStatus();
    this.loginForm = new FormGroup({
      UserName: new FormControl('', [
        Validators.required
      ]),
      Password: new FormControl('', [
        Validators.required
      ])
    });
    this.dbService.GetUrl();
  }




  onSubmit() {
    if (this.loginForm.invalid) {
      return;
    }
    this.spinner.show();
    const obj = {
      LoginId: this.loginForm.value.UserName,
      LoginPassword: this.loginForm.value.Password
    };
    this.dbService.ValidateUser(obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.loginReposnse = data.ResponceData;
          this.Redirect();
        } else {
          this.ErrorData = data.Message;
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);

      }
    );
  }
  Redirect() {
    this.emitService.loginStatusDeatils('dashboard', this.loginForm.value.LocationId, this.loginReposnse, this.loginForm.value.UserName);

  }

}
