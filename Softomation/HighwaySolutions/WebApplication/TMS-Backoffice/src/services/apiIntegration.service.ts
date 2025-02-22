import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ConfigIntrface, DataModel } from './data-model.model';
import { NgxSpinnerService } from 'ngx-spinner';

@Injectable({
  providedIn: 'root'
})
export class apiIntegrationService {
  ApiCallUrl: string | undefined;
  BaseApiUrl: string | undefined;
  ImageApiURL: string | undefined;
  ConfigData!: ConfigIntrface;
  Prefix = "FastTrackHighway-TMS";
  header: any = new Headers({ 'Content-Type': 'application/json; charset = utf-8;' });
  TokenHeader: any;
  constructor(private objHttp: HttpClient, public dataModel: DataModel, private spinner: NgxSpinnerService) {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    if (this.ApiCallUrl == '' ||
      this.ApiCallUrl == 'null' ||
      this.ApiCallUrl == null ||
      this.ApiCallUrl == undefined) {
      this.GetApiUrl()
    }
    //#endregion 
  }

  GetApiUrl() {
    this.spinner.show();
    this.appConfigGet().subscribe(
      data => {
        this.spinner.hide();
        let curretURL = (window.location.href).split(':')
        let mediaPath = "";
        let apiPath = "";
        let currentIP = curretURL[1].replace("//", "").replace("/", "");
        this.ConfigData = data;
        if (currentIP != "localhost") {
          if (this.ConfigData.BaseURL == "localhost")
            this.ConfigData.BaseURL = currentIP;
        }
        if (this.ConfigData.ApiPort == 0) {
          apiPath = curretURL[0] + "://" + this.ConfigData.BaseURL + "/" + this.ConfigData.ApiAdminPath + "/";
          mediaPath = curretURL[0] + "://" + this.ConfigData.BaseURL + "/EventMedia/"
        }
        else {
          apiPath = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/" + this.ConfigData.ApiAdminPath + "/"
          mediaPath = curretURL[0] + "://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/EventMedia/"
          
        }
        let camApi = curretURL[0] + "://" + this.ConfigData.BaseURL + ":9999/"
        //let LiveView = 'ws://' + this.ConfigData.BaseURL + ':/';
        let LiveView = "ws://" + this.ConfigData.BaseURL + ":" + this.ConfigData.ApiPort + "/"
        
        this.ApiCallUrl = apiPath
        this.dataModel.setCamAPI(camApi);
        this.dataModel.setMediaAPI(mediaPath);
        this.dataModel.setDataAPI(apiPath)
        this.dataModel.setLiveAPI(LiveView);
      },
      (error) => {
        this.spinner.hide();
        this.dataModel.openSnackBar([{ AlertMessage: 'Something went wrong.' }], false);
      }
    );
  }


  ProjectDetails() {
    let returnURL;
    returnURL = this.dataModel.getProjectDetails();
    if (returnURL == "" || returnURL == null || returnURL == 'null' || returnURL == undefined) {
      if (this.ConfigData == null || this.ConfigData == undefined) {
        const promise = new Promise<any>((resolve, reject) => {
          const apiURL = '/assets/ProjectConfiguration.json';
          this.objHttp.get(apiURL).subscribe({
            next: (res: any) => {
              this.ConfigData = res;
              this.dataModel.setProjectDetails(res);
              resolve(res);
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
    }
    return returnURL
  }

  UpdateProjectConfig(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UpdateProjectConfig', data, { headers: headers_object });
  }

  ProjectConfigGet(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ProjectConfigGet', { headers: headers_object });
  }

  appConfigGet(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get('/assets/GeneralConfiguration.json', { headers: headers_object });
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


  DashboardGetData(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/DashboardGetData', { headers: headers_object });
  }

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

  //#region  System Integrator
  SystemIntegratorGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemIntegratorGetAll', { headers: headers_object });
  }
  SystemIntegratorGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemIntegratorGetActive', { headers: headers_object });
  }
  SystemIntegratorGetById(SystemIntegratorId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemIntegratorGetById?SystemIntegratorId=' + SystemIntegratorId, { headers: headers_object });
  }
  SystemIntegratorInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/SystemIntegratorInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region  Plaza Master
  PlazaGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PlazaGetAll', { headers: headers_object });
  }
  PlazaGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PlazaGetActive', { headers: headers_object });
  }
  PlazaGetById(PlazaId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PlazaGetById?PlazaId=' + PlazaId, { headers: headers_object });
  }
  PlazaInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/PlazaInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region  Lane Master
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
  LaneGetById(LaneId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneGetById?LaneId=' + LaneId, { headers: headers_object });
  }
  LaneGetByPlazaId(PlazaId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneGetByPlazaId?PlazaId=' + PlazaId, { headers: headers_object });
  }
  LaneInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/LaneInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Equipment Manufacturer
  ManufacturerGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/manufacturerGetAll', { headers: headers_object });
  }
  ManufacturerGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ManufacturerGetActive', { headers: headers_object });
  }
  ManufacturerGetById(ManufacturerId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ManufacturerGetById?ManufacturerId=' + ManufacturerId, { headers: headers_object });
  }
  ManufacturerInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ManufacturerInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Equipment Details
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

  EquipmentDetailsByLaneId(LaneId): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/EquipmentDetailsByLaneId?LaneId='+LaneId, { headers: headers_object });
  }

  getCamDetails(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/getDetailsByCamera', data, { headers: headers_object });
  }

  getCameraLiveView(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/getCameraLiveView', data, { headers: headers_object });
  }

  //#endregion

  //#region Transection Type
  TransactionTypeGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/TransactionTypeGetAll', { headers: headers_object });
  }

  TransactionTypeGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/TransactionTypeGetActive', { headers: headers_object });
  }
  TransactionTypeUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/TransactionTypeUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Payment Method Type
  PaymentMethodTypeGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PaymentMethodTypeGetAll', { headers: headers_object });
  }

  PaymentMethodTypeGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/PaymentMethodTypeGetActive', { headers: headers_object });
  }
  PaymentMethodTypeUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/PaymentMethodTypeUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region Exempt Method Type
  ExemptTypeGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ExemptTypeGetAll', { headers: headers_object });
  }

  ExemptTypeGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ExemptTypeGetActive', { headers: headers_object });
  }
  ExemptTypeUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ExemptTypeUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region FasTag  Vehicle Class
  FasTagVehicleClassGetById(FasTagVehicleClassId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagVehicleClassGetById?FasTagVehicleClassId=' + FasTagVehicleClassId, { headers: headers_object });
  }
  FasTagVehicleClassGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagVehicleClassGetAll', { headers: headers_object });
  }

  FasTagVehicleClassGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagVehicleClassGetActive', { headers: headers_object });
  }
  FasTagVehicleClassInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FasTagVehicleClassInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region System Vehicle Class
  SystemVehicleClassGetById(SystemVehicleClassId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemVehicleClassGetById?SystemVehicleClassId=' + SystemVehicleClassId, { headers: headers_object });
  }
  SystemVehicleClassGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemVehicleClassGetAll', { headers: headers_object });
  }

  SystemVehicleClassGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/SystemVehicleClassGetActive', { headers: headers_object });
  }
  SystemVehicleClassInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/SystemVehicleClassInsertUpdate', data, { headers: headers_object });
  }
  //#endregion

  //#region  Toll Fare
  TollFareGetByEffectedFrom(EffectedFrom: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/TollFareGetByEffectedFrom?EffectedFrom=' + EffectedFrom, { headers: headers_object });
  }

  TollFareSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/TollFareSetUp', data, { headers: headers_object });
  }
  //#endregion

    //#region  Kayboard
    KeyboardDetailGetAll(): Observable<any> {
      this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
      var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
      return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/KeyboardDetailGetAll', { headers: headers_object });
    }
  
    KeyboardDetailUpdate(data: {}): Observable<any> {
      this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
      var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
      return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/KeyboardDetailUpdate', data, { headers: headers_object });
    }
    //#endregion

  //#region Shift Timming
  GetShiftTimining(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ShiftTiminingGetActive', { headers: headers_object });
  }
  //#endregion

  //#region Float Process 
  DenominationGetActive(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/DenominationGetActive', { headers: headers_object });
  }

  FloatProcessGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FloatProcessGetAll', { headers: headers_object });
  }

  FloatProcessGetById(FloatProcessId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FloatProcessGetById?FloatProcessId=' + FloatProcessId, { headers: headers_object });
  }

  FloatProcessSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FloatProcessSetUp', data, { headers: headers_object });
  }
  //#endregion

  //#region Shift Status
  ShiftStatusGetClose(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ShiftStatusGetClose', { headers: headers_object });
  }

  ShiftStatusGetOpen(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ShiftStatusGetOpen', { headers: headers_object });
  }

  ShiftStatusClose(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ShiftStatusClose',data, { headers: headers_object });
  }
  //#endregion
  FilterMasterGet(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FilterMasterGet', { headers: headers_object });
  }
  //#region Lane Transactions
  LaneTransactionGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneTransactionGetAll', { headers: headers_object });
  }

  LaneTransactionGetLatest(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LaneTransactionGetLatest', { headers: headers_object });
  }
  ReviewPendingGetLatest(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ReviewPendingGetLatest', { headers: headers_object });
  }
  ReviewedGetLatest(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ReviewedGetLatest', { headers: headers_object });
  }
  LaneTransactionFilter(FilterData: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/LaneTransactionGetByFilter', FilterData, { headers: headers_object });
  }

  LaneTransactionValidation(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/LaneTransactionValidation', data, { headers: headers_object });
  }

  LaneTransactionCancel(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/LaneTransactionCancel', data, { headers: headers_object });
  }
  //#endregion

  //#region FasTag Transaction
  FasTagRequestCode(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagRequestCode', { headers: headers_object });
  }
  FasTagGetByStatus(RequestStatusId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagGetByStatus?RequestStatusId=' + RequestStatusId, { headers: headers_object });
  }
  FasTagProcessedGetLatest(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FasTagProcessedGetLatest', { headers: headers_object });
  }
  //#endregion

  //#region report Category
  GetReportCategory(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/GetReportCategory', { headers: headers_object });
  }
  GetSubReportCategory(ReportId: number): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/GetReportCategoryById?ReportId=' + ReportId, { headers: headers_object });
  }
  ReportFilter(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FilterReportGet', { headers: this.header });
  }
  GetReport(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/GetReport', data, { headers: headers_object });
  }
  //#endregion

  //#region LSDU
  lsduPost(url,data): Observable<any> {
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(url,data, { headers: headers_object });
  }

  lsduGet(url): Observable<any> {
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(url, { headers: headers_object });
  }
  //#endregion

  //#region  ICD Config
  IcdPlazaGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IcdPlazaGetAll', { headers: headers_object });
  }

  IcdRequestStatus(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/IcdRequestStatus', { headers: headers_object });
  }

  ICRReuploadFailedData(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ICRReuploadFailedData', { headers: headers_object });
  }

  ICDRequestUploadDiff(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ICDRequestUploadDiff', { headers: headers_object });
  }
  ICDResponsePending(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ICDResponsePending', { headers: headers_object });
  }

  ICDResponseDeclined(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/ICDResponseDeclined', { headers: headers_object });
  }

  ICDUpdatedforCheckStatus(data: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ICDUpdatedforCheckStatus',data, { headers: headers_object });
  }

  IcdTransactionFilter(FilterData: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/IcdTransactionFilter', FilterData, { headers: headers_object });
  }
  
  UpdateIcdConfig(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/UpdateIcdConfig', data, { headers: headers_object });
  }

  ICDReProcessData(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ICDReProcessData', data, { headers: headers_object });
  }

  ICDManualProcess(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ICDManualProcess', data, { headers: headers_object });
  }
  //#endregion

  //#region  Db backup and file uploder details
  FileUploadDetailInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FileUploadDetailInsertUpdate', data, { headers: headers_object });
  }
  FileUploadDetailGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FileUploadDetailGetAll', { headers: headers_object });
  }
  FileUploadDetailGetById(FileUploadDetailId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/FileUploadDetailGetById?FileUploadDetailId=' + FileUploadDetailId, { headers: headers_object });
  }

  DBBackUpDetailInsertUpdate(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/DBBackUpDetailInsertUpdate', data, { headers: headers_object });
  }
  DBBackUpDetailGetAll(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/DBBackUpDetailGetAll', { headers: headers_object });
  }
  DBBackUpDetailGetById(DBBackUpDetailId: any): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/DBBackUpDetailGetById?DBBackUpDetailId=' + DBBackUpDetailId, { headers: headers_object });
  }
  //#endregion

}