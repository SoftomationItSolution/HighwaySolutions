import { ChangeDetectorRef, Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ChartComponent, ApexAxisChartSeries, ApexChart, ApexXAxis, ApexDataLabels, ApexTitleSubtitle, ApexStroke, ApexGrid, ApexPlotOptions } from "ng-apexcharts";
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { LiveViewPopUpComponent } from '../live-view-pop-up/live-view-pop-up.component';
declare var H: any;
export type ChartOptions = {
  series?: ApexAxisChartSeries;
  chart?: ApexChart;
  xaxis?: ApexXAxis;
  dataLabels?: ApexDataLabels;
  grid?: ApexGrid;
  stroke?: ApexStroke;
  title?: ApexTitleSubtitle;
  plotOptions?: ApexPlotOptions;
};

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  @ViewChild("chart") chart!: ChartComponent;
  @ViewChild("map") mapElement!: ElementRef;
  @HostListener('window:resize', ['$event'])
  onResize() {
    this.map.getViewPort().resize()
  }
  public chartOptions!: Partial<ChartOptions> | any;
  private platform: any;
  public map: any;
  public mapUI: any;
  MapZoom = 14;
  DefaultCordinatelat = 20.0568644;
  DefaultCordinatelong = 85.542642;
  ErrorData: any;
  EquipmentList: any;
  VehicleTrafficCount:any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel,private cd: ChangeDetectorRef,public dialog: MatDialog) { }

  ngOnInit(): void {
    this.chartOptions = {
      series: [
        {
          name: "paid",
          data: [10, 5, 15, 12, 11, 9, 18, 16, 9],
          color: "#0073cf"

        }, {
          name: "earning",
          data: [10, 5, 15, 12, 11, 9, 18, 16, 9],
          color: "#c2c2c2"
        }
      ],
      chart: {
        height: 350,
        type: "bar",
        zoom: {
          enabled: false
        },
        stacked: true
      },
      plotOptions: {
        bar: {
          horizontal: false,
          columnWidth: '20%',
          borderRadius: 3,
          borderRadiusApplication: 'end',
          dataLabels: {
            position: 'center'
          }
        },

      },
      dataLabels: {
        enabled: true,
        style: {
          colors: ['#c23c23'],
          fontSize: '8px'
        },
      },
      stroke: {
        curve: "straight"
      },
      title: {
        text: "VIDS Incident Details",
        align: "left"
      },
      grid: {
        row: {
          colors: ["#f3f3f3", "transparent"], // takes an array which will be repeated on columns
          opacity: 0.5
        }
      },
      xaxis: {
        categories: [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep"
        ],
      }
    };
    this.GetDashboardEquipment();
    this.DashboardATCC();
  }

  GetDashboardEquipment() {
    this.dbService.DashboardEquipmentGetAll().subscribe(
      data => {
        this.EquipmentList = data.ResponseData;
        this.DefaultCoordinates();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.DefaultCoordinates();
      }
    );
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
        //center: { lat: 48.8567, lng: 2.3508 },
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
    for (let i = 0; i < this.EquipmentList.length; i++) {
      const element = this.EquipmentList[i];
      this.addMarkersToMap(this.map, this.mapUI, element)

    }
  }

  addMarkersToMap(map: any, mapUI: any, data: any) {
    var svgMarkup = 'assets/icons/' + data.EquipmentTypeName.replace(" ", "") + '.svg';
    var icon = new H.map.Icon(svgMarkup, { size: { w: 40, h: 40 } })
    var parisMarker = new H.map.Marker({ lat: data.Latitude, lng: data.Longitude }, { icon: icon });
    let bubble: any;
    parisMarker.addEventListener('pointerenter', function (evt: any) {
      bubble = new H.ui.InfoBubble({ lat: data.Latitude, lng: data.Longitude }, {
      content:'<div class="d-flex flex-row justify-content-start" style="width:147px">'+
      '<div style="border-radius: 3px; background-color: rgba(57, 192, 237,.2);">'+
      '<p class="small mb-0">Location:'+data.ChainageName+'-'+data.DirectionName+'</p>'+
      '<p class="small mb-0">IP-Address:'+data.IpAddress+'</p>'+
      '</div>'+
      '</div>'
      });
      mapUI.addBubble(bubble);
    }, false);
    parisMarker.addEventListener('pointerleave', function (evt: any) {
      bubble.close();
    }, false);
    parisMarker.addEventListener('tap',  {
      data:data,
      handleEvent:(evt:any) => this.tap(data)
    });
    map.addObject(parisMarker);
  }

  tap(detail:any){
    if(detail.EquipmentTypeName.indexOf("Camera")>-1 && detail.OnLineStatus){
      this.cd.detectChanges();
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '50%';
      dialogConfig.height = '500px';
      dialogConfig.data = detail;
      const dialogRef = this.dialog.open(LiveViewPopUpComponent, dialogConfig);
    }
  }

  DashboardATCC(){
    this.dbService.DashboardATCC().subscribe(
      data => {
        var ATCCData = data.ResponseData;
        this.VehicleTrafficCount=ATCCData.VehicleTrafficCount;
        console.log(ATCCData)
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.DefaultCoordinates();
      }
    );
  }
}
