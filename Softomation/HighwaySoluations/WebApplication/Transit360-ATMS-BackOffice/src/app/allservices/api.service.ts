import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { EmittersService } from './emitters.service';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  ApiCallUrl = '';
  ApiCallBaseUrl = '';
  ConfigData: ConfigIntrface;
  header: any = new Headers({ 'Content-Type': 'pplication/json; charset = utf-8;' });
  constructor(private objHttp: HttpClient, public emitService: EmittersService) {
    this.GetUrl();
  }

  GetUrl() {
    let returnURL = '';
    if (this.ApiCallUrl == '' || this.ApiCallUrl == 'null') {
      returnURL = this.emitService.getAPI();
      if (returnURL == '' || returnURL == null || returnURL == 'null') {
        const curretURL = (window.location.href).split(':');
        const currentIP = curretURL[1].replace('//', '');
        if (this.ConfigData == null || this.ConfigData == undefined) {
          const promise = new Promise((resolve, reject) => {
            this.objHttp.get('/assets/GeneralConfiguration.json',
              {
                headers: new HttpHeaders()
                  .set('Content-Type', 'application/json')
                  .append('Access-Control-Allow-Methods', 'GET')
                  .append('Access-Control-Allow-Origin', '*')
                  .append('Access-Control-Allow-Headers', 'Access-Control-Allow-Headers, Access-Control-Allow-Origin, Access-Control-Request-Method'),
                responseType: 'text'
              })
              .toPromise()
              .then(
                res => {
                  this.ConfigData = JSON.parse(res);
                  if (currentIP != 'localhost') {
                    if (this.ConfigData.BaseURL == 'localhost') {
                      this.ConfigData.BaseURL = currentIP;
                    }
                  }
                  resolve(returnURL);
                  returnURL = curretURL[0] + '://' + this.ConfigData.BaseURL + ':' + this.ConfigData.ApiPort + '/' + this.ConfigData.ApiAdminPath + '/';
                  this.ApiCallUrl = returnURL;
                  this.emitService.setAPI(this.ApiCallUrl);
                },
                reject => {
                  resolve('fail');
                }
              );
          });

        } else {
          if (currentIP != 'localhost') {
            if (this.ConfigData.BaseURL == 'localhost') {
              this.ConfigData.BaseURL = currentIP;
            }
          }
          returnURL = curretURL[0] + '://' + this.ConfigData.BaseURL + ':' + this.ConfigData.ApiPort + '/' + this.ConfigData.ApiAdminPath + '/';
          this.ApiCallUrl = returnURL;
        }
      }
    } else {
      returnURL = this.ApiCallUrl;
    }
    return returnURL;
  }

  GetBasePath() {
    let returnURL = '';
    if (this.ApiCallBaseUrl == '' || this.ApiCallBaseUrl == 'null') {
      returnURL = this.emitService.getBaseAPI();
      if (returnURL == '' || returnURL == null || returnURL == 'null') {
        const curretURL = (window.location.href).split(':');
        const currentIP = curretURL[1].replace('//', '');
        if (this.ConfigData == null || this.ConfigData == undefined) {
          const promise = new Promise((resolve, reject) => {
            this.objHttp.get('/assets/GeneralConfiguration.json',
              {
                headers: new HttpHeaders()
                  .set('Content-Type', 'application/json')
                  .append('Access-Control-Allow-Methods', 'GET')
                  .append('Access-Control-Allow-Origin', '*')
                  .append('Access-Control-Allow-Headers', 'Access-Control-Allow-Headers, Access-Control-Allow-Origin, Access-Control-Request-Method'),
                responseType: 'text'
              })
              .toPromise()
              .then(
                res => {
                  this.ConfigData = JSON.parse(res);
                  if (currentIP != 'localhost') {
                    if (this.ConfigData.BaseURL == 'localhost') {
                      this.ConfigData.BaseURL = currentIP;
                    }
                  }
                  resolve(returnURL);
                  returnURL = curretURL[0] + '://' + this.ConfigData.BaseURL + ':' + this.ConfigData.ApiPort + '/';
                  this.ApiCallBaseUrl = returnURL;
                  this.emitService.setBaseAPI(this.ApiCallBaseUrl);
                },
                reject => {
                  resolve('fail');
                }
              );
          });

        } else {
          if (currentIP != 'localhost') {
            if (this.ConfigData.BaseURL == 'localhost') {
              this.ConfigData.BaseURL = currentIP;
            }
          }
          returnURL = curretURL[0] + '://' + this.ConfigData.BaseURL + ':' + this.ConfigData.ApiPort + '/' + this.ConfigData.ApiAdminPath + '/';
          this.ApiCallUrl = returnURL;
        }
      }
    } else {
      returnURL = this.ApiCallUrl;
    }
    return returnURL;
  }

  GetBaseUrl() {
      const curretURL = (window.location.href).split(':');
      const currentIP = curretURL[1].replace('//', '');
      const promise = new Promise((resolve, reject) => {
        this.objHttp.get('/assets/GeneralConfiguration.json',
          {
            headers: new HttpHeaders()
              .set('Content-Type', 'application/json')
              .append('Access-Control-Allow-Methods', 'GET')
              .append('Access-Control-Allow-Origin', '*')
              .append('Access-Control-Allow-Headers', 'Access-Control-Allow-Headers, Access-Control-Allow-Origin, Access-Control-Request-Method'),
            responseType: 'text'
          })
          .toPromise()
          .then(
            res => {
              this.ConfigData = JSON.parse(res);
              if (currentIP != 'localhost') {
                if (this.ConfigData.BaseURL == 'localhost') {
                  this.ConfigData.BaseURL = currentIP;
                }
              }
              const returnURL = curretURL[0] + '://' + this.ConfigData.BaseURL + ':' + this.ConfigData.ApiPort + '/';
              resolve(returnURL);
            },
            reject => {
              resolve('fail');
            }
          );
      });
      return promise;
  }

  GetMenuMaster(RoleId) {
    const promise = new Promise((resolve, reject) => {
      this.ApiCallUrl = this.GetUrl();
      this.objHttp.get(this.ApiCallUrl + 'AllMenu?RoleId=' + RoleId, { headers: this.header })
        .toPromise()
        .then(
          res => {
            resolve(res);
          },
          reject => {
            resolve('fail');
          }
        );
    });
    return promise;
  }
  GetMenuMasterByRole(RoleId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'AllMenu?RoleId=' + RoleId, { headers: this.header });
  }
  ValidateUser(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    const FullPath = this.ApiCallUrl + 'ValidateUser';
    console.log(FullPath);
    return this.objHttp.post(FullPath, data, { headers: this.header });
  }
  LogoutUser(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'LogoutUser', data, { headers: this.header });
  }

  //#region  Client Configuration
  ClientConfigurationGetById(ClientId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClientConfigurationGetById?ClientId=' + ClientId, { headers: this.header });
  }
  ClientConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClientConfigurationGetAll', { headers: this.header });
  }
  ClientConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ClientConfigurationSetUp', data, { headers: this.header });
  }
  //#endregion

  //#region  Role Configuration
  RoleConfigurationGetById(RoleId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'RoleConfigurationGetById?RoleId=' + RoleId, { headers: this.header });
  }
  RoleConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'RoleConfigurationGetAll', { headers: this.header });
  }
  RoleConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'RoleConfigurationSetUp', data, { headers: this.header });
  }

  RolePermissionGetByRoleId(RoleId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'RolePermissionGetByRoleId?RoleId=' + RoleId, { headers: this.header });
  }

  RolePermissionGetByEventId(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'RolePermissionGetByEventId', data, { headers: this.header });
  }

  RolePermissionSetup(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'RolePermissionSetup', data, { headers: this.header });
  }
  //#endregion

  //#region  User Configuration
  UserConfigurationGetById(UserId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'UserConfigurationGetById?UserId=' + UserId, { headers: this.header });
  }
  UserConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'UserConfigurationGetAll', { headers: this.header });
  }
  UserConfigurationGetAllLaneUsers(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'UserConfigurationGetAllLaneUsers', { headers: this.header });
  }
  UserConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'UserConfigurationSetUp', data, { headers: this.header });
  }
  UserValidatePassword(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'UserValidatePassword', data, { headers: this.header });
  }
  UserUpdatePassword(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'UserUpdatePassword', data, { headers: this.header });
  }
  //#endregion

//#region Category Master Data
CategoryMasterGetActive(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'CategoryMasterGetActive', { headers: this.header });
}
CategoryMasterGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'CategoryMasterGetById?EntryId=' + EntryId, { headers: this.header });
}
//#endregion

//#region Device Type Master Data
DeviceTypeGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DeviceTypeGetAll', { headers: this.header });
}
DeviceTypeGetActive(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DeviceTypeGetActive', { headers: this.header });
}
DeviceTypeGetByCatId(CategoryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DeviceTypeGetByCatId?CategoryId=' + CategoryId, { headers: this.header });
}
DeviceTypeGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DeviceTypeGetById?EntryId=' + EntryId, { headers: this.header });
}
//#endregion

//#region ControlRoom Data
ControlRoomGetByUserId(UserId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ControlRoomGetByUserId?UserId=' + UserId, { headers: this.header });
}
ControlRoomGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ControlRoomGetAll', { headers: this.header });
}
ControlRoomGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ControlRoomGetById?EntryId=' + EntryId, { headers: this.header });
}
ControlRoomInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'ControlRoomInsertUpdate', data, { headers: this.header });
}

//#endregion

//#region Gantry Data
GantryGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'GantryGetAll', { headers: this.header });
}
GantryGetAllActive(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'GantryGetAllActive', { headers: this.header });
}
GantryGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'GantryGetById?EntryId=' + EntryId, { headers: this.header });
}
GantryInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'GantryInsertUpdate', data, { headers: this.header });
}
//#endregion


//#region  Gantry Mapping
GantryMappingGetByGantryId(GantryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'GantryMappingGetByGantryId?GantryId=' + GantryId, { headers: this.header });
}
GantryMappingGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'GantryMappingGetAll', { headers: this.header });
}
GantryMappingValidateSetUp(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'GantryMappingValidateSetUp', data, { headers: this.header });
}
GantryMappingSetUp(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'GantryMappingSetUp', data, { headers: this.header });
}
//#endregion

 //#region  Lane Mapping
 LaneConfigurationGetByType(LaneType): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'LaneConfigurationGetByType?LaneType=' + LaneType, { headers: this.header });
}
LaneConfigurationGetById(LaneId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'LaneConfigurationGetById?LaneId=' + LaneId, { headers: this.header });
}
LaneConfigurationGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'LaneConfigurationGetAll', { headers: this.header });
}
LaneConfigurationSetUp(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'LaneConfigurationSetUp', data, { headers: this.header });
}
LaneConfigurationGetByPlazaId(PlazaId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'LaneConfigurationGetByPlazaId?PlazaId=' + PlazaId, { headers: this.header });
}
LaneConfigurationActiveGetByGantryId(GantryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'LaneConfigurationActiveGetByGantryId?GantryId=' + GantryId, { headers: this.header });
}
//#endregion

 //#region  Vehicle Class
 VehicleClassGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'VehicleClassGetById?EntryId=' + EntryId, { headers: this.header });
}
VehicleClassGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'VehicleClassGetAll', { headers: this.header });
}
VehicleClassInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'VehicleClassInsertUpdate', data, { headers: this.header });
}

//#endregion

//#region Devices Data
DefaultCoordinates(ControlRoomId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DefaultCoordinates?ControlRoomId=' + ControlRoomId, { headers: this.header });
}
DevicesMasterGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetAll', { headers: this.header });
}
DevicesMasterGetAllActive(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetAllActive', { headers: this.header });
}
DevicesMasterGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetById?EntryId=' + EntryId, { headers: this.header });
}
DevicesMasterGetByType(DeviceTypeId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetByType?DeviceTypeId=' + DeviceTypeId, { headers: this.header });
}
DevicesMasterGetByControlRoom(ControlRoomId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetByControlRoom?ControlRoomId=' + ControlRoomId, { headers: this.header });
}
DevicesMasterGetByControlRoomActive(ControlRoomId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'DevicesMasterGetByControlRoomActive?ControlRoomId=' + ControlRoomId, { headers: this.header });
}
DevicesMasterInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'DevicesMasterInsertUpdate', data, { headers: this.header });
}
//#endregion

//#region VMS Data
SystemFont(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'SystemFont', { headers: this.header });
}
VMSGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'VMSGetAll', { headers: this.header });
}

VMSGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'VMSGetById?EntryId=' + EntryId, { headers: this.header });
}
VMSInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'VMSInsertUpdate', data, { headers: this.header });
}
//#endregion

//#region MET Data
METConfigurationGet(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'METConfigurationGet', { headers: this.header });
}
METConfigurationInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'METConfiguration', data, { headers: this.header });
}
METGetLatest(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'METGetLatest', { headers: this.header });
}
//#endregion

//#region VIDS Data

VIDSGetLatest(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'VidsGetLatest', { headers: this.header });
}
//#endregion
//#region ECB Data
ECBCallGetLatest(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ECBCallGetLatest', { headers: this.header });
}
//#endregion

//#region ATCC Data
ATCCGetLatest(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ATCCGetLatest', { headers: this.header });
}
//#endregion


 //#region  Site Configuration
 ClientSiteGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ClientSiteGetById?EntryId=' + EntryId, { headers: this.header });
}
ClientSiteGetByClientId(tmsId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'ClientSiteGetByClientId?EntryId=' + tmsId, { headers: this.header });
}
ClientSiteDataInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'ClientSiteInsertUpdate', data, { headers: this.header });
}
//#endregion

//#region Integration Methodology GetAll
IntegrationMethodologyGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'master-IntegrationMethodologyGetAll', { headers: this.header });
}
//#endregion

  //#region  IHMCL Class
  IHMCLClassGetByClassId(ClassId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'IHMCLClassGetByClassId?ClassId=' + ClassId, { headers: this.header });
  }

  IHMCLClassGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'IHMCLClassGetAll', { headers: this.header });
  }
  //#endregion

  //#region  Class Mapping
  ClassMappingGetByClassId(ClassId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClassMappingGetByClassId?ClassId=' + ClassId, { headers: this.header });
  }
  ClassMappingGetByClientId(ClientId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClassMappingGetByClientId?ClientId=' + ClientId, { headers: this.header });
  }
  ClassMappingGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClassMappingGetAll', { headers: this.header });
  }
  ClassMappingSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ClassMappingSetUp', data, { headers: this.header });
  }
  ClassMappingGetActive(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'ClassMappingGetActive', { headers: this.header });
  }
  //#endregion

  //#region  Fare Mapping
  FareMappingSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'FareMappingSetUp', data, { headers: this.header });
  }
  FareGetAllByClientId(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'FareGetAllByClientId', data, { headers: this.header });
  }
  FareGetAllByDate(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'FareGetAllByDate', data, { headers: this.header });
  }
  //#endregion

  //#region  Hardware Mapping
  HardwareConfigurationGetById(HardwareId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'HardwareConfigurationGetById?HardwareId=' + HardwareId, { headers: this.header });
  }
  HardwareConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'HardwareConfigurationGetAll', { headers: this.header });
  }
  HardwareConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'HardwareConfigurationSetUp', data, { headers: this.header });
  }
  HardwareConfigurationGetByClientId(ClientId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'HardwareConfigurationGetByClientId?ClientId=' + ClientId, { headers: this.header });
  }

  GetByConnectionType(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetByConnectionType', { headers: this.header });
  }

  GetByHardwareType(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetByHardwareType', { headers: this.header });
  }
  //#endregion



   //#region  Shift Details
  GetShiftDetails(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetShiftDetails', { headers: this.header });
  }
  GetShiftStatusDetails(ShiftStatus): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetShiftStatusDetails?ShiftStatus=' + ShiftStatus, { headers: this.header });
  }
  GetShiftStatusDetailsAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetShiftStatusDetailsAll', { headers: this.header });
  }
  ShiftClosedSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ShiftClosed', data, { headers: this.header });
  }
  //#endregion

  //#region  Cash Flow
  GetMasterDenomination(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetMasterDenomination', { headers: this.header });
  }
  CashFlowConfigurationGetAll(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'CashFlowConfigurationGetAll', { headers: this.header });
  }
  CashFlowConfigurationGetAllPending(UserId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'CashFlowConfigurationGetAllPending?UserId=' + UserId, { headers: this.header });
  }
  CashFlowConfigurationGetById(CashFlowId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'CashFlowConfigurationGetById?CashFlowId=' + CashFlowId, { headers: this.header });
  }
  CashFlowConfigurationPrint(type, RNmber): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'CashFlowConfigurationPrint?Type=' + type + '&Number=' + RNmber, { headers: this.header });
  }
  CashFlowConfigurationSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'CashFlowConfigurationSetUp', data, { headers: this.header });
  }
  CashFlowConfigurationClearance(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'CashFlowConfigurationClearance', data, { headers: this.header });
  }
  CashFlowConfigurationFinish(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'CashFlowConfigurationFinish', data, { headers: this.header });
  }
  CashFlowConfigurationGetByOpenShift(ShiftMasterId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'CashFlowConfigurationGetByOpenShift?ShiftMasterId=' + ShiftMasterId, { headers: this.header });
  }
  //#endregion

  //#region Exempt Type
  GetExemptDetails(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetExemptDetails', { headers: this.header });
  }
  //#endregion

  //#region Payment Type
  GetPaymentDetails(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetPaymentDetails', { headers: this.header });
  }
  //#endregion

  //#region Transaction Type
   GetTransactionDetails(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetTransactionDetails', { headers: this.header });
  }
  //#endregion

  //#region Lane Transaction
  DemoTransaction(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'DemoTransaction', data, { headers: this.header });
  }
  TransactionDataFilter(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'GetTransactionDataFilter', data, { headers: this.header });
  }
  GetUnreviewFilter(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'GetUnreviewFilter', data, { headers: this.header });
  }
  ReviewTransaction(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ReviewTransaction', data, { headers: this.header });
  }
  CancelTransaction(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ReviewCancelTransaction', data, { headers: this.header });
  }
  ScrapTransaction(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ReviewScrapTransaction', data, { headers: this.header });
  }
   //#endregion

   //#region report Category
   GetReportCategory(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetReportCategory', { headers: this.header });
  }
  GetSubReportCategory(CategoryId): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetSubReportCategory?CategoryId=' + CategoryId, { headers: this.header });
  }
  ReportFilter(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'ReportFilter', data, { headers: this.header });
  }
  //#endregion

  //#region Dash Board
  GetHourlyTrafic(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetHourlyTrafic', { headers: this.header });
  }
  GetTransTypeCount(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetTransTypeCount', { headers: this.header });
  }
  GetLaneRevenue(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLaneRevenue', { headers: this.header });
  }
  GetLiveStatus(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLiveStatus', { headers: this.header });
  }
  GetLiveStatusByLane(LaneNumber): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLiveStatusByLane?LaneNumber=' + LaneNumber, { headers: this.header });
  }
  LiveOutputDeveiceByLane(LaneNumber): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'LiveOutputDeveiceByLane?LaneNumber=' + LaneNumber, { headers: this.header });
  }
  GetLiveSystemStatus(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLiveSystemStatus', { headers: this.header });
  }
  GetLiveSystemStatusByLane(LaneNumber): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLiveSystemStatusByLane?LaneNumber=' + LaneNumber, { headers: this.header });
  }
  GetLanePermission(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetLanePermission', { headers: this.header });
  }

  OperatorAccessPermission(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'OperatorAccessPermission', data, { headers: this.header });
  }
   //#endregion

    //#region  System Setting
    SystemSettingSetUp(data: {}): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.post(this.ApiCallUrl + 'SystemSettingSetUp', data, { headers: this.header });
  }
  GetSystemSetting(): Observable<any> {
    this.ApiCallUrl = this.GetUrl();
    return this.objHttp.get(this.ApiCallUrl + 'GetSystemSetting', { headers: this.header });
  }

  //#endregion
 //#region   Incident

 IncidentDataGetAll(): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'IncidentMasterGetAll', { headers: this.header });
}
IncidentDataGetById(EntryId): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.get(this.ApiCallUrl + 'IncidentMasterGetById?EntryId=' + EntryId, { headers: this.header });
}
IncidentInsertUpdate(data: {}): Observable<any> {
  this.ApiCallUrl = this.GetUrl();
  return this.objHttp.post(this.ApiCallUrl + 'IncidentMasterInsertUpdate', data, { headers: this.header });
}
 //#endregion

}
export interface ConfigIntrface {
  Prefx: string;
  BaseURL: string;
  ApiPort: Number;
  ApiAdminPath: string;
  Latitude: Number;
  Longitude: Number;
  MapZoom: Number;
  TMSId: Number;
}
