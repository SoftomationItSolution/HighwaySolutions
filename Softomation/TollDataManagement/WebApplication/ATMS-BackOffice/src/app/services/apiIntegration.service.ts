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
  Prefix="Transit360-ATMS";
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
    return this.objHttp.post(this.ApiCallUrl + this.Prefix+'/ValidateUser', data, { headers: headers_object });
  }

  LogoutUser(data: {}): Observable<any> {
    this.ApiCallUrl = this.dataModel.getDataAPI()?.toString();
    var headers_object = new HttpHeaders().set('Content-Type', 'application/json');
    return this.objHttp.post(this.ApiCallUrl + this.Prefix+'/LogoutUser', data, { headers: headers_object });
  }

  
}