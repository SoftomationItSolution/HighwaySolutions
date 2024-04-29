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
  PageRefreshJson = { Pagerefreshvalue: false, MenuId: 0 };
  PageHeading = new EventEmitter<string>();
  LogInStatusEmit = new EventEmitter<boolean>();
  loggedInStatus = false;
  PageRefresh = new EventEmitter<any>();
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog) { }
  clearStorage() {
    localStorage.removeItem("FthTmsloggedIn");
    localStorage.removeItem("FthTmsToken");
    localStorage.removeItem("FthTmsUserData");
  }
  setPageRefresh(value: boolean, MenuId: number) {
    this.PageRefreshJson.Pagerefreshvalue = value;
    this.PageRefreshJson.MenuId = MenuId;
    this.PageRefresh.emit(this.PageRefreshJson);
  }
  setLoggedIn(value: boolean) {
    this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('FthTmsloggedIn', 'true');
    } else {
      localStorage.setItem('FthTmsloggedIn', 'false');
    }
    this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('FthTmsloggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('FthTmsAPI', path);
  }

  getDataAPI() {
    return localStorage.getItem('FthTmsAPI');
  }

  setLock(path: string) {
    return localStorage.setItem('FthTmsLock', path);
  }
  getLock() {
    return localStorage.getItem('FthTmsLock');
  }

  setCamAPI(path: string) {
    return localStorage.setItem('FthTmsCamAPI', path);
  }
  getCamAPI() {
    return localStorage.getItem('FthTmsCamAPI');
  }


  setMediaAPI(path: string) {
    return localStorage.setItem('FthTmsMediaAPI', path);
  }
  getMediaAPI() {
    return localStorage.getItem('FthTmsMediaAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('FthTmsToken', token);
  }
  getTokenVale() {
    return localStorage.getItem('FthTmsToken');
  }
  setSSData(token: string) {
    return localStorage.setItem('FthTmsSS', token);
  }
  getSSData() {
    var result = localStorage.getItem('FthTmsSS');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }
  setUserData(token: string) {
    return localStorage.setItem('FthTmsUserData', token);
  }
  getUserData() {
    var result = localStorage.getItem('FthTmsUserData');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }
  getUserId() {
    let result = this.getUserData();
    if (result != null)
      return result.UserId;
    else
      return -1
  }

  getDefaultPlazaId() {
    let result = this.getSSData();
    if (result != null)
      return result.DefaultPlazaId;
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

  setProjectDetails(token: {}) {
    return localStorage.setItem('FthTmsProjectDetails', JSON.stringify(token));
  }
  getProjectDetails() {
    var result = localStorage.getItem('FthTmsProjectDetails');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }

  openSnackBar(message: any, success: boolean) {
    if(message==undefined){
      message = [{ AlertMessage: 'Something went wrong.' }];
    }
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

  async getBase64ImageFromUrl(imageUrl: any) {
    var res = await fetch(imageUrl);
    var blob = await res.blob();

    return new Promise((resolve, reject) => {
      var reader = new FileReader();
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
  Longitude: Number,
  RoadName: string,
  ProjectName: string,
  ControlRoomName: string,
  Address: string,
  State: string,
  Pincode: string,
}