import { EventEmitter, Injectable } from "@angular/core";
import { MatSnackBar } from "@angular/material/snack-bar";
import { Router } from "@angular/router";
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";
import { SnakbarComponent } from "src/app/pages/snakbar/snakbar.component";
import { MediaViewComponent } from "src/app/pages/media-view/media-view.component";

@Injectable({
  providedIn: 'root'
})
export class DataModel {
  PageHeading = new EventEmitter<string>();
  LogInStatusEmit = new EventEmitter<boolean>();
  loggedInStatus = false;
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog) { }
  clearStorage() {
    localStorage.removeItem("Toll360loggedIn");
    localStorage.removeItem("Toll360Token");
    localStorage.removeItem("Toll360UserData");
  }
  
  setLoggedIn(value: boolean) {
    this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('Toll360loggedIn', 'true');
    } else {
      localStorage.setItem('Toll360loggedIn', 'false');
    }
    this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('Toll360loggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('Toll360API', path);
  }
  
  getDataAPI() {
    return localStorage.getItem('Toll360API');
  }

  setLock(path: string) {
    return localStorage.setItem('Toll360Lock', path);
  }
  getLock() {
    return localStorage.getItem('Toll360Lock');
  }


  setMediaAPI(path: string) {
    return localStorage.setItem('Toll360MediaAPI', path);
  }
  getMediaAPI() {
    return localStorage.getItem('Toll360MediaAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('Toll360Token', token);
  }
  getTokenVale() {
    return localStorage.getItem('Toll360Token');
  }

  setUserData(token: string) {
    return localStorage.setItem('Toll360UserData', token);
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
    var result = localStorage.getItem('Toll360UserData');
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

  async getBase64ImageFromUrl(imageUrl:any) {
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