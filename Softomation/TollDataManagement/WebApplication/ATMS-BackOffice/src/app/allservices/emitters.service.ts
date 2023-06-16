import { EventEmitter, Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { SnakbarComponent } from './snakbar/snakbar.component';


@Injectable({
  providedIn: 'root'
})
export class EmittersService {
  public loggedInStatus = JSON.parse(localStorage.getItem('loggedIn') || 'false');
  LogInStatusEmit = new EventEmitter<boolean>();
  PageRefresh = new EventEmitter<boolean>();
  CurrentPage = new EventEmitter<string>();
  InnerHeight = new EventEmitter<any>();
  constructor(private router: Router, public snackBar: MatSnackBar) { }
  setPageRefresh(value: boolean) {
    this.PageRefresh.emit(value);
  }

  setInnerHeightEmit(value: any) {
    this.InnerHeight.emit(value);
  }
  getInnerHeight() {
    return localStorage.getItem('InnerHeight');
  }

  setInnerHeight(value:any) {
    localStorage.setItem('InnerHeight', value);
  }


  getAPI() {
    return localStorage.getItem('toll360API');
  }

  setAPI(value: string) {
    localStorage.setItem('toll360API', value);
  }

  getBaseAPI() {
    return localStorage.getItem('toll360BaseAPI');
  }
  setBaseAPI(value: string) {
    localStorage.setItem('toll360BaseAPI', value);
  }

  setLoggedIn(value: boolean) {
    this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('loggedIn', 'true');
    } else {
      localStorage.setItem('loggedIn', 'false');
    }

    this.LogInStatus(value);
  }
  getLoggedIn() {
    return localStorage.getItem('loggedIn');
  }
  getUserDetails() {
    return localStorage.getItem('userDetails');
  }
  getRoleDetails() {
    return localStorage.getItem('userRoleId');
  }

  getClientId() {
    return localStorage.getItem('ClientId');
  }

  getPlazaId() {
    return localStorage.getItem('PlazaId');
  }

  LogInStatus(status: boolean) {
    this.LogInStatusEmit.emit(status);
  }

  getSessionId() {
    return localStorage.getItem('SessionId');
  }

  getUserType() {
    return localStorage.getItem('UserType');
  }
  getApplicationType() {
    return localStorage.getItem('ApplicationType');
  }

  logout() {
    this.ClearStatus();
    this.router.navigate(['']);
  }

  unauthorized() {
    this.router.navigate(['/unauthorized']);
  }

  loginStatusDeatils(pagename: string, LocationId: string, data: any, LoginId: string) {
    localStorage.setItem('userDetails', data.EntryId);
    localStorage.setItem('userRoleId', data.RoleId);
    localStorage.setItem('FirstName', data.FirstName);
    localStorage.setItem('LastName', data.LastName);
    localStorage.setItem('ClientId', data.ClientId);
    localStorage.setItem('PlazaId', data.PlazaId);
    localStorage.setItem('SessionId', LoginId);
    localStorage.setItem('UserType', data.UserType);
    localStorage.setItem('ApplicationType', data.ApplicationType);
    this.setLoggedIn(true);
    this.router.navigate(['/' + pagename]);
  }

  ClearStatus() {
    this.setLoggedIn(false);
    const innHeight = this.getInnerHeight();
    localStorage.clear();
    this.setInnerHeight(innHeight);
  }

  openSnackBar(message: any, success: boolean) {
    this.snackBar.openFromComponent(SnakbarComponent, {
      duration: 2000,
      data: { success, message }
    });
  }
}


export interface IPermission {
  DataUpdate: Number;
  DataAdd: Number;
  DataView: Number;

}
