import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ConfigIntrface, DataModel } from './data-model.model';

@Injectable({
  providedIn: 'root'
})
export class apiIntegrationService {
  ApiCallUrl: string | undefined;
  BaseApiUrl: string | undefined;
  ImageApiURL: string | undefined;
  ConfigData!: ConfigIntrface;
  Prefix = "Transit360-ATMS";
  header: any = new Headers({ 'Content-Type': 'application/json; charset = utf-8;' });
  TokenHeader: any;
  constructor(private objHttp: HttpClient, public dataModel: DataModel) {
    //#region Data API URL
    if (this.dataModel.getDataAPI() == '' ||
      this.dataModel.getDataAPI() == 'null' ||
      this.dataModel.getDataAPI() == null ||
      this.dataModel.getDataAPI() == undefined) {
      this.GetUrl();
    }
    else {
      this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    }
    //#endregion 
  }

  GetUrl() {
    let returnURL;
    returnURL = this.dataModel.getDataAPI();
    if (returnURL == "" || returnURL == null || returnURL == 'null' || returnURL == undefined) {
      var curretURL = (window.location.href).split(':')
      var currentIP = curretURL[1].replace("//", "");
      if (this.ConfigData == null || this.ConfigData == undefined) {
        const promise = new Promise<any>((resolve, reject) => {
          const apiURL = '/assets/GeneralConfiguration.json';
          this.objHttp.get(apiURL).subscribe({
            next: (res: any) => {
              this.ConfigData = res;
              if (currentIP != "localhost") {
                if (this.ConfigData.BaseURL == "localhost")
                  this.ConfigData.BaseURL = currentIP;
              }
              returnURL = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/" + this.ConfigData.ApiAdminPath + "/"
              this.ApiCallUrl = returnURL;
              this.dataModel.setDataAPI(this.ApiCallUrl)
              resolve(returnURL);
            },
            error: (err: any) => {
              reject(err);
            },
            complete: () => {
              console.log('complete');
            },
          });
        });
        return promise;
      }
      else {
        if (currentIP != "localhost") {
          if (this.ConfigData.BaseURL == "localhost")
            this.ConfigData.BaseURL = currentIP;
        }
        returnURL = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/" + this.ConfigData.ApiAdminPath + "/"
        this.ApiCallUrl = returnURL;
      }
    }
    return returnURL
  }

  //#region Login
  Login(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ValidateUser', data, { headers: headers_object });
  }

  LogoutUser(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/LogoutUser', data, { headers: headers_object });
  }

  GetMenuMasterByRole(RoleId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/GetMenu?RoleId=' + RoleId, { headers: headers_object });
  }

  RolePermissionGetByEventId(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/RolePermissionGetByEventId', data, { headers: headers_object });
  }

  RoleConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/RoleConfigurationGetAll', { headers: headers_object });
  }

  RoleConfigurationGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/RoleConfigurationGetActive', { headers: headers_object });
  }

  RoleConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/RoleConfigurationSetUp', data, { headers: headers_object });
  }

  RoleConfigurationGetById(RoleId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/RoleConfigurationGetById?RoleId=' + RoleId, { headers: headers_object });
  }

  RolePermissionGetByRoleId(RoleId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/RolePermissionGetByRoleId?RoleId=' + RoleId, { headers: headers_object });
  }
  RolePermissionSetup(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/RolePermissionSetup', data, { headers: headers_object });
  }
//#endregion

  //#region  User Configuration
  UserConfigurationGetById(UserId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserConfigurationGetById?UserId=' + UserId, { headers: headers_object });
  }
  UserConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserConfigurationGetAll', { headers: headers_object });
  }

  UserConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UserConfigurationSetUp', data, { headers: headers_object });
  }
  UserValidatePassword(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UserValidatePassword', data, { headers: headers_object });
  }
  UserUpdatePassword(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UserUpdatePassword', data, { headers: headers_object });
  }
  //#endregion

  //#region  ControlRoom
  ControlRoomGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ControlRoomGetAll', { headers: headers_object });
  }
  ControlRoomGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ControlRoomGetActive', { headers: headers_object });
  }
  ControlRoomGetById(EntryId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ControlRoomGetById?ControlRoomId=' + EntryId, { headers: headers_object });
  }
  ControlRoomInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ControlRoomInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region  Vehicle Class
  VehicleClassGetById(EntryId: any): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VehicleClassGetById?EntryId=' + EntryId, { headers: headers_object });
  }
  VehicleClassGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VehicleClassGetAll', { headers: headers_object });
  }
  VehicleClassInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VehicleClassInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Equipment Details
  EquipmentDetailsGetById(EquipmentId: any): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetById?EquipmentId=' + EquipmentId, { headers: headers_object });
  }
  EquipmentDetailsGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetAll', { headers: headers_object });
  }
  EquipmentDetailsGetActive(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetActive', { headers: headers_object });
  }
  EquipmentDetailsInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsInsertUpdate', data, { headers: headers_object });
  }

  EquipmentTypeGetActive(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentTypeGetActive', { headers: headers_object });
  }
  //#endregion

  //#region  Packages
  PackagesGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    const token =this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PackagesGetAll', { headers: headers_object});
  }
  PackagesSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    const token =this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/PackagesSetUp', data, { headers: headers_object});
  }
  PackagesGetActive(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    const token =this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PackageGetActive', { headers: headers_object});
  }
//#endregion

//#region  System
SystemGetActive(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
  return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemGetActive', { headers: headers_object});
}

//#endregion
}
