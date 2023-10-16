import { ChangeDetectorRef, Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ChartComponent, ApexAxisChartSeries, ApexChart, ApexXAxis, ApexDataLabels, ApexTitleSubtitle, ApexStroke, ApexGrid, ApexPlotOptions, ApexNonAxisChartSeries, ApexResponsive, ApexTheme, ApexYAxis, ApexMarkers, ApexFill, ApexForecastDataPoints, ApexLegend } from "ng-apexcharts";
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { LiveViewPopUpComponent } from '../PopUp/live-view-pop-up/live-view-pop-up.component';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { Subscription } from 'rxjs';
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

export type PieChartOptions = {
  series: ApexNonAxisChartSeries;
  chart: ApexChart;
  responsive: ApexResponsive[];
  labels: any;
  theme: ApexTheme;
  title: ApexTitleSubtitle;
};

export type LineChartOptions = {
  series: ApexAxisChartSeries;
  chart: ApexChart;
  xaxis: ApexXAxis;
  stroke: ApexStroke;
  dataLabels: ApexDataLabels;
  markers: ApexMarkers;
  tooltip: any; // ApexTooltip;
  yaxis: ApexYAxis;
  grid: ApexGrid;
  legend: ApexLegend;
  title: ApexTitleSubtitle;
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
    this.map.getViewPort().resize();
  }
  public vidsEventOptions!: Partial<ChartOptions> | any;
  public vidsLocationOptions!: Partial<PieChartOptions> | any;
  public vidsTimeOptions!: Partial<LineChartOptions> | any;
  public atccTimeOptions!: Partial<LineChartOptions> | any;

  private platform: any;
  public map: any;
  public mapUI: any;
  MapZoom = 14;
  DefaultCordinatelat = 20.0568644;
  DefaultCordinatelong = 85.542642;
  ErrorData: any;
  EquipmentList: any;
  VehicleTrafficCount: any;
  ChainageList: any = [];
  SelectedChainage: any;
  VIDSEventCount: any;
  subscription: any;
  message:any;
  private DashDataSubscribe!: Subscription;
  private readonly _eventService: DataModel;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel, private cd: ChangeDetectorRef, public dialog: MatDialog,private _mqttService: MqttService) {
      this._eventService = dm;
      //  this._eventService.menuResize.subscribe( (message: any) => 
      //  {
      //   this.message = message 
      //   console.log(this.message)
      // });
    //   this.dm.menuResize().subscribe(data=>{
    //    console.log(data);
    // })

    //this.subscription = this.dm.menuResize().subscribe(item => console.log(item));
   
  }

  ngOnInit(): void {
    // this.subscription = this.dm.getMenuChangeEmitter()
    // .subscribe(item => console.log(item));

    // this.dm.name.subscribe(data=>{
    //   debugger;
    //   //this.newName = data;
    // });

    this.GetDashboardEquipment();
    this.DashboardATCC();
    this.DashboardVIDS();
    
  }
  ngOnDestroy() {
    this.subscription.unsubscribe();
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
        content: '<div class="d-flex flex-row justify-content-start" style="width:147px">' +
          '<div style="border-radius: 3px; background-color: rgba(57, 192, 237,.2);">' +
          '<p class="small mb-0">Location:' + data.ChainageName + '-' + data.DirectionName + '</p>' +
          '<p class="small mb-0">IP-Address:' + data.IpAddress + '</p>' +
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
  }

  tap(detail: any) {
    if (detail.EquipmentTypeName.indexOf("Camera") > -1 && detail.OnLineStatus) {
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

  DashboardATCC() {
    this.dbService.DashboardATCC().subscribe(
      data => {
        var ATCCData = data.ResponseData;
        this.VehicleTrafficCount = ATCCData.VehicleTrafficCount;
        this.ChainageList = [
          ...new Set(this.VehicleTrafficCount.map((element: { ChainageName: any }) =>
            element.ChainageName)),
        ];
        this.SelectedChainage = this.ChainageList[0];
        this.ATCCHourTrafficCount(ATCCData.HourTrafficCount)
        this.MQTTATCC();
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.DefaultCoordinates();
      }
    );
  }
  MQTTATCC(){
    try {
      this.DashDataSubscribe = this._mqttService.observe("Dashboard/ATCC").subscribe((message: IMqttMessage) => {
       var ATCCData =JSON.parse(message.payload.toString());
       this.VehicleTrafficCount = ATCCData.VehicleTrafficCount;
       this.SelectedChainage = this.ChainageList[0];
       this.ATCCHourTrafficCount(ATCCData.HourTrafficCount)
      });
    } catch (error) {

    }
  }

  DashboardVIDS() {
    this.dbService.DashboardVIDS().subscribe(
      data => {
        var VIDSData = data.ResponseData;
        this.VIDSEventCountFun(VIDSData.EventCount);
        this.VIDSLocationCountFun(VIDSData.LocationTrafficCount);
        this.VIDSHourEventCount(VIDSData.HourTrafficCount);
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.DefaultCoordinates();
      }
    );
  }

  VIDSEventCountFun(data: any) {
    let EventTypeName = [
      ...new Set(data.map((element: { EventTypeName: any }) =>
        element.EventTypeName)),
    ];

    let LHSEvent = [
      ...new Set(data.map((element: { LEventCount: any }) =>
        element.LEventCount)),
    ];
    let RHSEvent = [
      ...new Set(data.map((element: { REventCount: any }) =>
        element.REventCount)),
    ];

    this.vidsEventOptions = {
      series: [
        {
          name: "LHS",
          data: LHSEvent,
          color: "#0073cf"

        }, {
          name: "RHS",
          data: RHSEvent,
          color: "#c2c2c2"
        }
      ],
      chart: {
        height: 300,
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
        text: "VIDS Events Details",
        align: "left"
      },
      grid: {
        row: {
          colors: ["#f3f3f3", "transparent"], // takes an array which will be repeated on columns
          opacity: 0.5
        }
      },
      xaxis: {
        categories: EventTypeName,
      }
    };
  }

  VIDSLocationCountFun(data: any) {
    let ChainageNumber = [
      ...new Set(data.map((element: { ChainageName: any }) =>
        element.ChainageName)),
    ];


    let EventCount = [
      ...new Set(data.map((element: { EventCount: any }) =>
        element.EventCount)),
    ];

    this.vidsLocationOptions = {
      series: EventCount,
      chart: {
        height: 200,
        width: "100%",
        type: "pie"
      },
      labels: ChainageNumber,
      theme: {
        monochrome: {
          enabled: true
        }
      },
      title: {
        text: "VIDS Event by Chainage"
      },
      responsive: [
        {
          breakpoint: 480,
          options: {
            chart: {
              width: 200
            },
            legend: {
              position: "bottom"
            }
          }
        }
      ]
    };
  }

  VIDSHourEventCount(data: any) {
    let LHSEvent=[];
    let RHSEvent=[];
    let TEvent=[];
    let TimeSloat=[];
    for (let i = 0; i < data.length; i++){
        LHSEvent.push(data[i].LEventCount);
        RHSEvent.push(data[i].REventCount);
        TEvent.push(data[i].EventCount);
        TimeSloat.push(data[i].TimeSloat);
    } 
    this.vidsTimeOptions = {
      series: [
        {
          name: "LHS",
          data: LHSEvent
        },
        {
          name: "RHS",
          data: RHSEvent
        },
        {
          name: "Total Event",
          data: TEvent
        }
      ],
      chart: {
        height: 250,
        type: "line"
      },
      dataLabels: {
        enabled: false
      },
      stroke: {
        width: 5,
        curve: "straight",
        dashArray: [0, 8, 5]
      },
      title: {
        text: "Last 24 Hours VIDS Events",
        align: "left"
      },
      legend: {
        tooltipHoverFormatter: function (val: string, opts: { w: { globals: { series: { [x: string]: { [x: string]: string; }; }; }; }; seriesIndex: string | number; dataPointIndex: string | number; }) {
          return (
            val +
            " - <strong>" +
            opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] +
            "</strong>"
          );
        }
      },
      markers: {
        size: 0,
        hover: {
          sizeOffset: 12
        }
      },
      xaxis: {
        labels: {
          trim: false
        },
        categories: TimeSloat
      },
      tooltip: {
        y: [
          {
            title: {
              formatter: function (val: string) {
                return val + " (mins)";
              }
            }
          },
          {
            title: {
              formatter: function (val: string) {
                return val + " events";
              }
            }
          },
          {
            title: {
              formatter: function (val: any) {
                return val;
              }
            }
          }
        ]
      },
      grid: {
        borderColor: "#f1f1f1"
      }
    };
  }

  ATCCHourTrafficCount(data: any) {
    let LHSEvent=[];
    let RHSEvent=[];
    let TEvent=[];
    let TimeSloat=[];
    for (let i = 0; i < data.length; i++){
        LHSEvent.push(data[i].LEventCount);
        RHSEvent.push(data[i].REventCount);
        TEvent.push(data[i].EventCount);
        TimeSloat.push(data[i].TimeSloat);
    } 
    this.atccTimeOptions = {
      series: [
        {
          name: "LHS",
          data: LHSEvent
        },
        {
          name: "RHS",
          data: RHSEvent
        },
        {
          name: "Total Event",
          data: TEvent
        }
      ],
      chart: {
        height: 250,
        type: "line"
      },
      dataLabels: {
        enabled: false
      },
      stroke: {
        width: 5,
        curve: "straight",
        dashArray: [0, 8, 5]
      },
      title: {
        text: "Last 24 Hours ATCC Traffic",
        align: "left"
      },
      legend: {
        tooltipHoverFormatter: function (val: string, opts: { w: { globals: { series: { [x: string]: { [x: string]: string; }; }; }; }; seriesIndex: string | number; dataPointIndex: string | number; }) {
          return (
            val +
            " - <strong>" +
            opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] +
            "</strong>"
          );
        }
      },
      markers: {
        size: 0,
        hover: {
          sizeOffset: 12
        }
      },
      xaxis: {
        labels: {
          trim: false
        },
        categories: TimeSloat
      },
      tooltip: {
        y: [
          {
            title: {
              formatter: function (val: string) {
                return val + " (mins)";
              }
            }
          },
          {
            title: {
              formatter: function (val: string) {
                return val + " events";
              }
            }
          },
          {
            title: {
              formatter: function (val: any) {
                return val;
              }
            }
          }
        ]
      },
      grid: {
        borderColor: "#f1f1f1"
      }
    };
  }

  ChainageChange(data: any) {

  }
}
