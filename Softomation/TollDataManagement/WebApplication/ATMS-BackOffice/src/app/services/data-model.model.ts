import { EventEmitter, Injectable } from "@angular/core";
@Injectable({
  providedIn: 'root'
})
export class DataModel {
  PageHeading = new EventEmitter<string>();
  LogInStatusEmit = new EventEmitter<boolean>();
  loggedInStatus = false;
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

  setTokenVale(token: string) {
    return localStorage.setItem('Transit360Token', token);
  }
  getTokenVale() {
    return localStorage.getItem('Transit360Token');
  }

  setUserData(token: string) {
    return localStorage.setItem('Transit360UserData', token);
  }
  getUserData() {
    var result = localStorage.getItem('Transit360UserData');
    if (result != undefined)
      return JSON.parse(result);
    else
      return null;
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