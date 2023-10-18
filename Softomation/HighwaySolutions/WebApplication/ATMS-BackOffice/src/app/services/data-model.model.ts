import { Injectable } from "@angular/core";

import { MatSnackBar } from "@angular/material/snack-bar";
import { Router } from "@angular/router";
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";
import { MediaViewComponent } from "../pages/PopUp/media-view/media-view.component";
import { SnakbarComponent } from "./snakbar/snakbar.component";

@Injectable({
  providedIn: 'root'
})
export class DataModel {
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog) {
   }

  setProjectDetails(token: {}) {
    return localStorage.setItem('FastTrackHighwayATMSProjectDetails', JSON.stringify(token));
  }
  getProjectDetails() {
    var result = localStorage.getItem('FastTrackHighwayATMSProjectDetails');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
  }
  clearStorage() {
    localStorage.removeItem("FastTrackHighwayATMSloggedIn");
    localStorage.removeItem("FastTrackHighwayATMSToken");
    localStorage.removeItem("FastTrackHighwayATMSUserData");
  }

  setLoggedIn(value: boolean) {
    //this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('FastTrackHighwayATMSloggedIn', 'true');
    } else {
      localStorage.setItem('FastTrackHighwayATMSloggedIn', 'false');
    }
    //this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('FastTrackHighwayATMSloggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    //this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMSAPI', path);
  }

  getDataAPI() {
    return localStorage.getItem('FastTrackHighwayATMSAPI');
  }

  setLock(path: string) {
    return localStorage.setItem('FastTrackHighwayATMSLock', path);
  }
  getLock() {
    return localStorage.getItem('FastTrackHighwayATMSLock');
  }


  setMediaAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMSMediaAPI', path);
  }
  getMediaAPI() {
    return localStorage.getItem('FastTrackHighwayATMSMediaAPI');
  }

  setLiveAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMSLiveAPI', path);
  }
  getLiveAPI() {
    return localStorage.getItem('FastTrackHighwayATMSLiveAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('FastTrackHighwayATMSToken', token);
  }
  getTokenVale() {
    return localStorage.getItem('FastTrackHighwayATMSToken');
  }

  setUserData(token: string) {
    return localStorage.setItem('FastTrackHighwayATMSUserData', token);
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
    var result = localStorage.getItem('FastTrackHighwayATMSUserData');
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
    dialogConfig.height = '300px';
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