import { Component } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-app-lock',
  templateUrl: './app-lock.component.html',
  styleUrls: ['./app-lock.component.css']
})
export class AppLockComponent {
  LogedUserId:any;
  DetailData:any;
  UserTypeName:any;
  LoginPassword:any
  LoginId:any;
  ErrorData:any;
  constructor(private dm: DataModel, public Dialogref: MatDialogRef<AppLockComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService) {
    this.LogedUserId = this.dm.getUserId();
    this.DetailData = this.dm.getUserData();
    this.UserTypeName=this.DetailData.UserTypeName;
    this.LoginId=this.DetailData.LoginId;
  }

  onLoginSubmit() {
    const obj = {
      LoginId: this.LoginId,
      LoginPassword: this.LoginPassword
    };
    this.dbService.Login(obj).subscribe(
      data => {
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.dm.setTokenVale(data.ResponseData.AccessToken);
          this.dm.setUserData(JSON.stringify(data.ResponseData.UserData));
          this.Dialogref.close(true);
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}
