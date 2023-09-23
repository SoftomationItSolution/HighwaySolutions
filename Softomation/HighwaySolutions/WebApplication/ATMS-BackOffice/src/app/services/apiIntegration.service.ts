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
  Prefix = "FastTrackHighway-ATMS";
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
              let mediaPath = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/EventMedia/"
              this.dataModel.setMediaAPI(mediaPath)
              resolve(returnURL);
            },
            error: (err: any) => {
              reject(err);
            },
            complete: () => {
              //console.log('complete');
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

  RolePermissionGetByMenu(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/RolePermissionGetByMenu', data, { headers: headers_object });
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
 
  //#region Dashboard
  DashboardEquipmentGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/Dashboard/Equipment', { headers: headers_object });
  }
  //#endregion
  //#region  User Configuration
  UserConfigurationGetById(UserId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserConfigurationGetById?UserId=' + UserId, { headers: headers_object });
  }

  UserConfigurationGetByUserType(UserTypeId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserConfigurationGetByUserType?UserTypeId=' + UserTypeId, { headers: headers_object });
  }

  UserConfigurationGetBySystemUserType(UserTypeId: any, SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserConfigurationGetByUserType?UserTypeId=' + UserTypeId + '&SystemId=' + SystemId, { headers: headers_object });
  }

  UserGetByIdWithPassword(UserId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/UserGetByIdWithPassword?UserId=' + UserId, { headers: headers_object });
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
  UserProfileChange(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UserProfileChange', data, { headers: headers_object });
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
  VehicleClassGetById(VehicleClassId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VehicleClassGetById?VehicleClassId=' + VehicleClassId, { headers: headers_object });
  }
  VehicleClassGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VehicleClassGetAll', { headers: headers_object });
  }

  VehicleClassGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VehicleClassGetActive', { headers: headers_object });
  }
  VehicleClassInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VehicleClassInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Equipment Details
  EquipmentDetailsGetBySystemId(SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetBySystemId?SystemId=' + SystemId, { headers: headers_object });
  }
  EquipmentDetailsGetById(EquipmentId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetById?EquipmentId=' + EquipmentId, { headers: headers_object });
  }
  EquipmentDetailsGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetAll', { headers: headers_object });
  }

  EquipmentDetailsGetByFilter(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetByFilter', data, { headers: headers_object });
  }

  EquipmentDetailsGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsGetActive', { headers: headers_object });
  }
  EquipmentDetailsInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsInsertUpdate', data, { headers: headers_object });
  }

  EquipmentTypeGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentTypeGetActive', { headers: headers_object });
  }
  //#endregion

  //#region  Equipment Config
  EquipmentConfigGetBySystemId(SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentConfigGetBySystemId?SystemId=' + SystemId, { headers: headers_object });
  }
  EquipmentConfigSetup(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/EquipmentConfigSetup', data, { headers: headers_object });
  }
  //#endregion

  //#region  Packages
  PackagesGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PackageGetAll', { headers: headers_object });
  }
  PackagesSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/PackageInsertUpdate', data, { headers: headers_object });
  }
  PackagesGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PackageGetActive', { headers: headers_object });
  }
  PackagesGetById(PackageId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PackageGetById?PackageId=' + PackageId, { headers: headers_object });
  }
  //#endregion

  //#region  System
  SystemSetup(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/SystemSetup', data, { headers: headers_object });
  }
  SystemGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemGetAll', { headers: headers_object });
  }
  SystemGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemGetActive', { headers: headers_object });
  }
  SystemGetByName(SystemName: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemGetByName?SystemName=' + SystemName, { headers: headers_object });
  }
  //#endregion

  //#region  System
  ReportGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ReportGetAll', { headers: headers_object });
  }
  ReportGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ReportGetActive', { headers: headers_object });
  }
  ReportGetByName(ReportName: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ReportGetByName?ReportName=' + ReportName, { headers: headers_object });
  }
  //#endregion

  //#region  Lane
  LaneGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneGetAll', { headers: headers_object });
  }
  LaneGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneGetActive', { headers: headers_object });
  }
  //#endregion

  //#region System Setting
  SystemSettingSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/SystemSettingSetUp', data, { headers: headers_object });
  }
  SystemSettingGet(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemSettingGet', { headers: headers_object });
  }
  //#endregion

  //#region Incident Details
  IncidentSourceGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IncidentSourceGetActive', { headers: headers_object });
  }
  IncidentCategoryGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IncidentCategoryGetActive', { headers: headers_object });
  }

  IncidentStatusGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IncidentStatusGetActive', { headers: headers_object });
  }

  IncidentCreate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/IMSInsert', data, { headers: headers_object });
  }
  IncidentUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/IMSUpdate', data, { headers: headers_object });
  }
  IMSGetPending(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IMSGetPending?hours=' + data, { headers: headers_object });
  }
  IMSGetClosed(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IMSGetClosed?hours=' + data, { headers: headers_object });
  }
  IMSGetInProgress(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IMSGetInProgress?hours=' + data, { headers: headers_object });
  }
  IMSGetById(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IMSGetById?IncidentId=' + data, { headers: headers_object });
  }

  IMSActionHistoryInsert(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/IMSActionHistoryInsert', data, { headers: headers_object });
  }
  IMSGetByFilter(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/IMSGetByFilter', data, { headers: headers_object });
  }
  //#endregion

  //#region Check List
  MasterCheckListActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/MasterCheckListActive', { headers: headers_object });
  }

  CheckListActionApproveByOperator(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/CheckListActionApproveByOperator', data, { headers: headers_object });
  }
  CheckListGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/CheckListGetAll', { headers: headers_object });
  }

  CheckListSetup(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/CheckListSetup', data, { headers: headers_object });
  }
  //#endregion

  //#region  Equipment Config
  EventsTypeGetBySystemId(SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EventsTypeGetBySystemId?SystemId=' + SystemId, { headers: headers_object });
  }
  EventsTypeSetup(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/EventsTypeSetup', data, { headers: headers_object });
  }
  ChalanTypeGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ChalanTypeGetAll', { headers: headers_object });
  }
  //#endregion

  //#region Filter Master Data 
  FilterMasterGetBySystemId(SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FilterMasterGetBySystemId?SystemId=' + SystemId, { headers: headers_object });
  }
  FilterReportGetBySystemId(SystemId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FilterReportGetBySystemId?SystemId=' + SystemId, { headers: headers_object });
  }
  //#endregion

  //#region  VIDS System
  VIDSEventsGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VIDSEventsGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VIDSPendingReviewGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VIDSPendingReviewGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VIDSEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VIDSEventsGetByFilter', data, { headers: headers_object });
  }

  VIDSEventReviewed(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VIDSEventReviewUpdate', data, { headers: headers_object });
  }

  VIDSReviewedEventsGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VIDSReviewedEventsGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VIDSReviewedEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VIDSReviewedEventsGetByFilter', data, { headers: headers_object });
  }
  //#endregion

  //#region  VSDS System
  VSDSLaneConfigSetUp(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VSDSLaneConfigSetUp', data, { headers: headers_object });
  }
  VSDSLaneConfigGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VSDSLaneConfigGetAll', { headers: headers_object });
  }

  VSDSEventsGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VSDSEventsGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VSDSPendingReviewGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VSDSPendingReviewGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VSDSEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VSDSEventsGetByFilter', data, { headers: headers_object });
  }

  VSDSEventReviewed(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VSDSEventReviewUpdate', data, { headers: headers_object });
  }

  VSDSReviewedEventsGetByHours(Hours: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/VSDSReviewedEventsGetByHours?Hours=' + Hours, { headers: headers_object });
  }

  VSDSReviewedEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/VSDSReviewedEventsGetByFilter', data, { headers: headers_object });
  }
  //#endregion

  //#region  ATCC System
  ATCCEventsGetALLByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ATCCEventsGetALLByFilter', data, { headers: headers_object });
  }
  ATCCReviewedEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ATCCReviewedEventsGetByFilter', data, { headers: headers_object });
  }
  ATCCUnreviewedEventsGetByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ATCCUnreviewedEventsGetByFilter', data, { headers: headers_object });
  }
  ATCCEventReviewed(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ATCCEventReviewUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region  Weather System
  GetWeatherConfig(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/GetWeatherConfig', { headers: headers_object });
  }
  WeatherConfigSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    const token = this.dataModel.getTokenVale();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/WeatherConfigSetUp', data, { headers: headers_object });
  }
  WeatherGetALLByFilter(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/WeatherEventsGetALLByFilter', data, { headers: headers_object });
  }
  //#endregion
}


