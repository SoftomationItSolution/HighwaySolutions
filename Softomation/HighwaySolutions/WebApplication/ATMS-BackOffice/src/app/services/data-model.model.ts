import { EventEmitter, Injectable, Output } from "@angular/core";
import { SnakbarComponent } from "../allservices/snakbar/snakbar.component";
import { MatSnackBar } from "@angular/material/snack-bar";
import { Router } from "@angular/router";
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";
import { MediaViewComponent } from "../pages/PopUp/media-view/media-view.component";

@Injectable({
  providedIn: 'root'
})
export class DataModel {
  // PageHeading = new EventEmitter<string>();
  // LogInStatusEmit = new EventEmitter<boolean>();
  //loggedInStatus = false;
  
  // private nameSource = new BehaviorSubject<string>('');
  // name = this.nameSource.asObservable()
  // @Output()
  // menuResize= new EventEmitter<boolean>();
  constructor(public snackBar: MatSnackBar, private router: Router, public dialog: MatDialog) {
    //this.menuResize = new EventEmitter<string>(null);
   }
   broadcastMessage(message: boolean): void {
    //this.menuResize.emit(message);
  }
  // changeName(name: string) {
  //   this.nameSource.next(name);
  // }
  // msgToSib(value: boolean) { this.menuResize.emit(value) }
  // getMenuChangeEmitter() {
  //   return this.menuResize;
  // }
  // public setData(data: boolean) {
  //   this._MenuResize.next(data);
  // }

  // public getData(): Observable<boolean> {
  //   return this._MenuResize.asObservable();
  // }

  clearStorage() {
    localStorage.removeItem("FastTrackHighwayATMS360loggedIn");
    localStorage.removeItem("FastTrackHighwayATMS360Token");
    localStorage.removeItem("FastTrackHighwayATMS360UserData");
  }

  setLoggedIn(value: boolean) {
    //this.loggedInStatus = value;
    if (value) {
      localStorage.setItem('FastTrackHighwayATMS360loggedIn', 'true');
    } else {
      localStorage.setItem('FastTrackHighwayATMS360loggedIn', 'false');
    }
    //this.LogInStatusEmit.emit(this.loggedInStatus);
  }

  getLoggedInStatus() {
    let status = localStorage.getItem('FastTrackHighwayATMS360loggedIn');
    if (status == 'true')
      return true;
    else
      return false;
  }

  LogInStatus(status: boolean) {
    //this.LogInStatusEmit.emit(status);
  }

  setDataAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMS360API', path);
  }

  getDataAPI() {
    return localStorage.getItem('FastTrackHighwayATMS360API');
  }

  setLock(path: string) {
    return localStorage.setItem('FastTrackHighwayATMS360Lock', path);
  }
  getLock() {
    return localStorage.getItem('FastTrackHighwayATMS360Lock');
  }


  setMediaAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMS360MediaAPI', path);
  }
  getMediaAPI() {
    return localStorage.getItem('FastTrackHighwayATMS360MediaAPI');
  }

  setLiveAPI(path: string) {
    return localStorage.setItem('FastTrackHighwayATMS360LiveAPI', path);
  }
  getLiveAPI() {
    return localStorage.getItem('FastTrackHighwayATMS360LiveAPI');
  }

  setTokenVale(token: string) {
    return localStorage.setItem('FastTrackHighwayATMS360Token', token);
  }
  getTokenVale() {
    return localStorage.getItem('FastTrackHighwayATMS360Token');
  }

  setUserData(token: string) {
    return localStorage.setItem('FastTrackHighwayATMS360UserData', token);
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
    var result = localStorage.getItem('FastTrackHighwayATMS360UserData');
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
  Longitude: Number
}