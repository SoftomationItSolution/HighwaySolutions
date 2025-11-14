import { EventEmitter, Injectable } from "@angular/core";
import { MatSnackBar } from "@angular/material/snack-bar";
import { Router } from "@angular/router";
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";

import { DatePipe } from "@angular/common";
import { SnakbarComponent } from "src/app/pages/popups/snakbar/snakbar.component";
import { MediaViewComponent } from "src/app/pages/popups/media-view/media-view.component";

@Injectable({
  providedIn: 'root'
})
export class DataModel {
  PageRefreshJson = { Pagerefreshvalue: false, MenuId: 0 };
  PageHeading = new EventEmitter<string>();
  LogInStatusEmit = new EventEmitter<boolean>();
  loggedInStatus = false;
  PageRefresh = new EventEmitter<any>();
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog, public datepipe: DatePipe) { }

  clearStorage() {
    localStorage.removeItem("FthTmsLaneloggedIn");
    localStorage.removeItem("FthTmsLaneToken");
    localStorage.removeItem("FthTmsLaneUserData");
  }

  setPageRefresh(value: boolean, MenuId: number) {
    this.PageRefreshJson.Pagerefreshvalue = value;
    this.PageRefreshJson.MenuId = MenuId;
    this.PageRefresh.emit(this.PageRefreshJson);
  }



  setLoggedIn(value: boolean) {
    this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('FthTmsLaneloggedIn', 'true');
    } else {
      localStorage.setItem('FthTmsLaneloggedIn', 'false');
    }
    this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('FthTmsLaneloggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('FthTmsLaneAPI', path);
  }

  getDataAPI() {
    return localStorage.getItem('FthTmsLaneAPI');
  }

  setLiveAPI(path: string) {
    return localStorage.setItem('FthTmsLaneLiveAPI', path);
  }

  getLiveAPI() {
    return localStorage.getItem('FthTmsLaneLiveAPI');
  }

  setLock(path: string) {
    return localStorage.setItem('FthTmsLaneLock', path);
  }

  getLock() {
    return localStorage.getItem('FthTmsLaneLock');
  }

  setCamAPI(path: string) {
    return localStorage.setItem('FthTmsLaneCamAPI', path);
  }

  getCamAPI() {
    return localStorage.getItem('FthTmsLaneCamAPI');
  }

  setServerIp(path: string) {
    return localStorage.setItem('FthTmsLaneServer', path);
  }

  getServerIp() {
    return localStorage.getItem('FthTmsLaneServer');
  }


  setIcdAPI(path: string) {
    return localStorage.setItem('FthTmsLaneICDAPI', path);
  }

  getICDAPI() {
    return localStorage.getItem('FthTmsLaneICDAPI');
  }

  setQrAPI(path: string) {
    return localStorage.setItem('FthTmsLaneQrAPI', path);
  }

  getQrAPI() {
    return localStorage.getItem('FthTmsLaneQrAPI');
  }

  setMediaAPI(path: string) {
    return localStorage.setItem('FthTmsLaneMediaAPI', path);
  }

  getMediaAPI() {
    return localStorage.getItem('FthTmsLaneMediaAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('FthTmsLaneToken', token);
  }

  getTokenVale() {
    return localStorage.getItem('FthTmsLaneToken');
  }

  setSSData(token: string) {
    return localStorage.setItem('FthTmsLaneSS', token);
  }

  getSSData() {
    var result = localStorage.getItem('FthTmsLaneSS');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }

  setUserData(token: string) {
    return localStorage.setItem('FthTmsLaneUserData', token);
  }

  getUserData() {
    var result = localStorage.getItem('FthTmsLaneUserData');
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

  setloginTime(token: string) {
    return localStorage.setItem('FthTmsLaneloginTime', token);
  }

  getloginTime() {
    return localStorage.getItem('FthTmsLaneloginTime');
  }

  setProjectDetails(token: {}) {
    return localStorage.setItem('FthTmsLaneProjectDetails', JSON.stringify(token));
  }

  getProjectDetails() {
    var result = localStorage.getItem('FthTmsLaneProjectDetails');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }

  openSnackBar(message: any, success: boolean) {
    if (message == undefined) {
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

  getPath(input: string, LaneNumber): string {
    const date = new Date(input);
    const tDate = this.datepipe.transform(date, 'yyyy-MM-dd');
    const path = "LaneData/" + tDate + '/' + LaneNumber.replace('Lane-', 'L') + '/'
    return path
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
  ServerUrl: string,
  IcdUrl: string,
  QrUrl: string,
  ServerIp: string,
}