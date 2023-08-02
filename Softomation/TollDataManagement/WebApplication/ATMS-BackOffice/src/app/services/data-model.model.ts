import { EventEmitter, Injectable } from "@angular/core";
import { SnakbarComponent } from "../allservices/snakbar/snakbar.component";
import { MatSnackBar } from "@angular/material/snack-bar";
import { Router } from "@angular/router";
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";
import { MediaViewComponent } from "../pages/media-view/media-view.component";
@Injectable({
  providedIn: 'root'
})
export class DataModel {
  PageHeading = new EventEmitter<string>();
  LogInStatusEmit = new EventEmitter<boolean>();
  loggedInStatus = false;
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog) { }
  clearStorage() {
    localStorage.removeItem("Transit360loggedIn");
    localStorage.removeItem("Transit360Token");
    localStorage.removeItem("Transit360UserData");
  }
  
  setLoggedIn(value: boolean) {
    this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('Transit360loggedIn', 'true');
    } else {
      localStorage.setItem('Transit360loggedIn', 'false');
    }
    this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('Transit360loggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('Transit360API', path);
  }
  
  getDataAPI() {
    return localStorage.getItem('Transit360API');
  }

  setMediaAPI(path: string) {
    return localStorage.setItem('Transit360MediaAPI', path);
  }
  getMediaAPI() {
    return localStorage.getItem('Transit360MediaAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('Transit360Token', token);
  }
  getTokenVale() {
    return localStorage.getItem('Transit360Token');
  }

  setUserData(token: string) {
    return localStorage.setItem('Transit360UserData', token);
  }

  getUserId() {
    let result = this.getUserData();
    if (result != null)
      return result.UserId;
    else
      return -1
  }

  getRoleId() {
    let result = this.getUserData();
    if (result != null)
      return result.RoleId;
    else
      return -1
  }

  getUserData() {
    var result = localStorage.getItem('Transit360UserData');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }

  openSnackBar(message: any, success: boolean) {
    this.snackBar.openFromComponent(SnakbarComponent, {
      duration: 2000,
      data: { success, message }
    });
  }

  MediaView(data: any) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.height = '500px';
    dialogConfig.data = data;
    this.dialog.open(MediaViewComponent, dialogConfig);
  }

  unauthorized() {
    this.router.navigate(['/unauthorized']);
  }

  async delay(ms: number) {
    await new Promise<void>(resolve => setTimeout(() => resolve(), ms)).then(() => console.log("fired"));
  }

  async getBase64ImageFromUrl(imageUrl) {
    var res = await fetch(imageUrl);
    var blob = await res.blob();
  
    return new Promise((resolve, reject) => {
      var reader  = new FileReader();
      reader.addEventListener("load", function () {
        resolve(reader.result);

      }, false);
  
      reader.onerror = () => {
        return reject(this);
      };
      reader.readAsDataURL(blob);
    })
  }
}

export interface ConfigIntrface {
  Prefx: string
  BaseURL: string
  ApiPort: Number
  ApiAdminPath: string,
  Latitude: Number,
  Longitude: Number
}