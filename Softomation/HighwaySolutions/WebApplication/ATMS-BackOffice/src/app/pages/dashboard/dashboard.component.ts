import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import {ChartComponent,ApexAxisChartSeries,ApexChart,ApexXAxis,ApexDataLabels,ApexTitleSubtitle,ApexStroke,ApexGrid,ApexPlotOptions} from "ng-apexcharts";
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
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
  @ViewChild("map")mapElement!: ElementRef;
  public chartOptions!: Partial<ChartOptions>| any;
  private platform: any;
  public map: any;
  public mapUI: any;
  MapZoom = 14;
  DefaultCordinatelat = 20.0568644;
  DefaultCordinatelong = 85.542642;
  ErrorData: any;
  EquipmentList:any;
  constructor(private dbService: apiIntegrationService,private spinner: NgxSpinnerService,
    private dm: DataModel) { }

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
          fontSize:'8px'
      },
      },
      stroke: {
        curve: "straight"
      },
      title: {
        text: "Product Trends by Month",
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
  }
  ngAfterViewInit(): void {
    this.DefaultCoordinates();
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
    window.addEventListener('resize', () => this.map.getViewPort().resize());
    var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(this.map));
    this.mapUI = H.ui.UI.createDefault(this.map, defaultLayers);

  }

  GetDashboardEquipment() {
    this.dbService.DashboardEquipmentGetAll().subscribe(
      data => {
        this.EquipmentList = data.ResponseData;
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

}
