import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ChartComponent, ApexAxisChartSeries, ApexChart, ApexXAxis, ApexDataLabels, ApexTitleSubtitle, ApexStroke, ApexGrid, ApexPlotOptions, ApexNonAxisChartSeries, ApexResponsive, ApexTheme, ApexYAxis, ApexMarkers, ApexFill, ApexForecastDataPoints, ApexLegend } from "ng-apexcharts";
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { Subscription } from 'rxjs';
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
  selector: 'app-dashboard-graph',
  templateUrl: './dashboard-graph.component.html',
  styleUrls: ['./dashboard-graph.component.css']
})
export class DashboardGraphComponent implements OnInit {
  @ViewChild("chart") chart!: ChartComponent;
  public vidsEventOptions!: Partial<ChartOptions> | any;
  public vidsLocationOptions!: Partial<PieChartOptions> | any;
  public vidsTimeOptions!: Partial<LineChartOptions> | any;
  public atccTimeOptions!: Partial<LineChartOptions> | any;

  
  ErrorData: any;
  VehicleTrafficCount: any;
  ChainageList: any = [];
  SelectedChainage: any;
  VIDSEventCount: any;
  message: any;
  DashDataSubscribe!:Subscription;
  constructor(private dbService: apiIntegrationService, private dm: DataModel, private cd: ChangeDetectorRef, 
    public dialog: MatDialog, private _mqttService: MqttService) {
  }

  ngOnInit(): void {
    this.DashboardATCC();
    this.DashboardVIDS();
  }
  ngOnDestroy() {
    if(this.DashDataSubscribe!=null)
      this.DashDataSubscribe.unsubscribe();
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
       
      }
    );
  }
  MQTTATCC() {
    try {
      this.DashDataSubscribe = this._mqttService.observe("Dashboard/ATCC").subscribe((message: IMqttMessage) => {
        var ATCCData = JSON.parse(message.payload.toString());
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
    let LHSEvent = [];
    let RHSEvent = [];
    let TEvent = [];
    let TimeSloat = [];
    for (let i = 0; i < data.length; i++) {
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
    let LHSEvent = [];
    let RHSEvent = [];
    let TEvent = [];
    let TimeSloat = [];
    for (let i = 0; i < data.length; i++) {
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