import { Component, OnInit, ViewChild } from '@angular/core';
import {
  ChartComponent,
  ApexAxisChartSeries,
  ApexChart,
  ApexXAxis,
  ApexDataLabels,
  ApexTitleSubtitle,
  ApexStroke,
  ApexGrid,
  ApexPlotOptions
} from "ng-apexcharts";

export type ChartOptions = {
  series: ApexAxisChartSeries;
  chart: ApexChart;
  xaxis: ApexXAxis;
  dataLabels: ApexDataLabels;
  grid: ApexGrid;
  stroke: ApexStroke;
  title: ApexTitleSubtitle;
  plotOptions: ApexPlotOptions;
};

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  @ViewChild("chart") chart: ChartComponent;
  public chartOptions: Partial<ChartOptions>;
  constructor() { }

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
  }

}
