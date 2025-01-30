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
  IcdUrl: string | undefined;
  ConfigData!: ConfigIntrface;
  Prefix = "FastTrackHighway-lane";
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
        let LiveView = this.ConfigData.ServerUrl;
        this.IcdUrl=this.ConfigData.IcdUrl
        this.ApiCallUrl = apiPath
        this.dataModel.setIcdAPI(this.IcdUrl);
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
  LoginStatusGet(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LoginStatusGet', { headers: headers_object });
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

  LogoutSystem(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/LogoutSystem', { headers: headers_object });
  }

  ProcessTransactions(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/ProcessTransactions', data, { headers: headers_object });
  }

  FleetStart(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FleetStart', data, { headers: headers_object });
  }

  FleetStop(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix + '/FleetStop', data, { headers: headers_object });
  }
  //#endregion


  DashboardGetData(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/DashboardGetData', { headers: headers_object });
  }


  getLaneMasterData(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/getLaneMasterData', { headers: headers_object });
  }

  getLaneRecentData(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/getLaneRecentData', { headers: headers_object });
  }

  getCurrentTransactions(): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.get(this.ApiCallUrl + this.Prefix + '/getCurrentTransactions', { headers: headers_object });
  }

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


  FeatchTagDetails(data: {}): Observable<any> {
    this.IcdUrl=this.dataModel.getICDAPI()
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.IcdUrl, data, { headers: headers_object });
  }

  ProcessVrn(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl +'VRN', data, { headers: headers_object });
  }

  
 
}