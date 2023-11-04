import { ChangeDetectorRef, Component, ElementRef, HostListener, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { Subscription } from 'rxjs';
import { LiveViewPopUpComponent } from '../../PopUp/live-view-pop-up/live-view-pop-up.component';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
declare var H: any;

@Component({
  selector: 'app-dashboard-map',
  templateUrl: './dashboard-map.component.html',
  styleUrls: ['./dashboard-map.component.css']
})
export class DashboardMapComponent implements OnInit,OnDestroy {
  @ViewChild("map") mapElement!: ElementRef;
  @HostListener('window:resize', ['$event'])
  onResize() {
    this.map.getViewPort().resize();
  }
  private platform: any;
  public map: any;
  public mapUI: any;
  MapZoom = 14;
  DefaultCordinatelat = 20.0568644;
  DefaultCordinatelong = 85.542642;
  ErrorData: any;
  EquipmentList: any;
  EquipmentTypeList: any;
  selectedEquipment: any;
  selectedEquipmentType: any;
  selectedEquipmentList: any = [];
  markerList: any = [];
  NMSDataSubscribe!: Subscription;
  show = true;

  constructor(private dbService: apiIntegrationService, private dm: DataModel, private cd: ChangeDetectorRef,
    public dialog: MatDialog, private _mqttService: MqttService) {
  }

  ngOnInit(): void {
    this.GetDashboardEquipment();
  }
  ngOnDestroy() {
    if (this.NMSDataSubscribe != null)
      this.NMSDataSubscribe.unsubscribe();
  }

  GetDashboardEquipment() {
    this.dbService.DashboardEquipmentGetAll().subscribe(
      data => {
        this.EquipmentList = data.ResponseData.EquipmentDetails;
        this.EquipmentTypeList = data.ResponseData.EquipmentTypeDetails;
        this.selectedEquipmentType = this.EquipmentTypeList;
        this.DefaultCoordinates();
        this.ChnageEquipmentType();
        this.MQTTNMS();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.DefaultCoordinates();
      }
    );
  }

  MQTTNMS() {
    try {
      this.NMSDataSubscribe = this._mqttService.observe("NMS/DeviceStatus").subscribe((message: IMqttMessage) => {
        var nsmData = JSON.parse(message.payload.toString());
        for (let l = 0; l < this.EquipmentList.length; l++) {
          let d=this.EquipmentList[l];
          if(d.EquipmentId==nsmData.EquipmentId){
            d.OnLineStatus=nsmData.OnLineStatus;
            break;
          }
        }
        this.ChnageEquipmentType();
      });
    } catch (error) {

    }
  }

  DefaultCoordinates() {
    this.platform = new H.service.Platform({
      "apikey": "97IzKs6qDY3ZxrIClkXxieDxFK1w78t9PG3YqZUQpzE"
    });
    let defaultLayers = this.platform.createDefaultLayers();
    this.map = new H.Map(this.mapElement.nativeElement,
      defaultLayers.vector.normal.map,
      {
        zoom: this.MapZoom,
        center: { lat: this.DefaultCordinatelat, lng: this.DefaultCordinatelong },
        pixelRatio: window.devicePixelRatio || 1
      }
    );
    let mapView = this.map.getViewModel();
    mapView.setLookAtData({
      heading: 170
    });

    window.addEventListener('resize', () => this.map.getViewPort().resize());
    var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(this.map));
    this.mapUI = H.ui.UI.createDefault(this.map, defaultLayers);

  }

  createmarker() {
    for (let i = 0; i < this.selectedEquipmentList.length; i++) {
      const element = this.selectedEquipmentList[i];
      this.addMarkersToMap(this.map, this.mapUI, element)
    }
  }

  addMarkersToMap(map: any, mapUI: any, data: any) {
    var svgMarkup = 'assets/icons/' + data.OnLineStatus + '/' + data.EquipmentTypeName.replace(" ", "") + '.svg';
    //console.log(svgMarkup)
    var icon = new H.map.Icon(svgMarkup, { size: { w: 40, h: 40 } })
    var parisMarker = new H.map.Marker({ lat: data.Latitude, lng: data.Longitude }, { icon: icon });
    let bubble: any;
    parisMarker.addEventListener('pointerenter', function (evt: any) {
      bubble = new H.ui.InfoBubble({ lat: data.Latitude, lng: data.Longitude }, {
        content: '<div class="d-flex flex-row justify-content-start" style="width:147px">' +
          '<div style="border-radius: 3px; background-color: rgba(57, 192, 237,.2);">' +
          '<p class="small mb-0">Location:' + data.ChainageName + '-' + data.DirectionName + '</p>' +
          '<p class="small mb-0">IP-Address:' + data.IpAddress + '</p>' +
          '<p class="small mb-0">' + data.EquipmentTypeName + ':' + data.EquipmentName + '</p>' +
          '</div>' +
          '</div>'
      });
      mapUI.addBubble(bubble);
    }, false);
    parisMarker.addEventListener('pointerleave', function (evt: any) {
      bubble.close();
    }, false);
    parisMarker.addEventListener('tap', {
      data: data,
      handleEvent: (evt: any) => this.tap(data)
    });
    map.addObject(parisMarker);
    this.markerList.push(parisMarker);
  }

  tap(detail: any) {
    if (detail.EquipmentTypeName.indexOf("Camera") > -1) {
      if (detail.OnLineStatus) {
        this.cd.detectChanges();
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '50%';
        dialogConfig.height = '500px';
        dialogConfig.data = detail;
        const dialogRef = this.dialog.open(LiveViewPopUpComponent, dialogConfig);
      } else {
        this.ErrorData = [{ AlertMessage: 'Camera is offline.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    }
  }

  ChnageEquipmentType() {
    this.selectedEquipmentList = [];
    for (let l = 0; l < this.markerList.length; l++) {
      this.map.removeObject(this.markerList[l]);
    }
    for (let index = 0; index < this.selectedEquipmentType.length; index++) {
      const element = this.selectedEquipmentType[index];
      var filterdata = this.EquipmentList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId === element.EquipmentTypeId);
      for (let k = 0; k < filterdata.length; k++) {
        const element1 = filterdata[k];
        this.selectedEquipmentList.push(element1)
      }
    }
    this.markerList = [];
    this.createmarker();
  }

  setfocus() {
    var filterdata = this.EquipmentList.filter((e: { EquipmentId: any; }) => e.EquipmentId === this.selectedEquipment);
    if (filterdata.length > 0) {
      let center = { lat: filterdata[0].Latitude, lng: filterdata[0].Longitude };
      let zoom = 20;
      this.setMapCenter(center, zoom);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'Location not found.' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  setMapCenter(center: any, zoom: any) {
    this.map.setCenter(center, true);
    this.mapUI.setZoom(zoom, true);
  }
}