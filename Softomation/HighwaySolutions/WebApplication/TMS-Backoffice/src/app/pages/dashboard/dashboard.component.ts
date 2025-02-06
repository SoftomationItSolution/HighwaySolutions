import { Component, OnInit, ViewChild } from '@angular/core';
import { ChartComponent, ApexAxisChartSeries, ApexChart, ApexXAxis, ApexDataLabels, ApexTitleSubtitle, ApexStroke, ApexGrid, ApexPlotOptions, ApexNonAxisChartSeries, ApexResponsive, ApexTheme, ApexYAxis, ApexMarkers, ApexFill, ApexForecastDataPoints, ApexLegend } from "ng-apexcharts";
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
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
  public laneDetailsOptions!: Partial<LineChartOptions> | any;
  public transactionTypeOptions!: Partial<LineChartOptions> | any;
  public vehicleClassOptions!: Partial<LineChartOptions> | any;

  DashboardGetData: any;
  ErrorData: any;
  laneDetails: any
  transactionType: any;
  vehicleClassMaster: any;

  constructor(private dbService: apiIntegrationService, private dm: DataModel,private spinner: NgxSpinnerService) { }

  ngOnInit(): void {
    this.DashboardData();
  }

  DashboardData() {
    this.spinner.show();
    this.dbService.DashboardGetData().subscribe(
      data => {
        this.spinner.hide();
        var DashboardGetData = data.ResponseData;
        this.laneDetails = DashboardGetData[0];
        this.transactionType = DashboardGetData[1];
        this.vehicleClassMaster = DashboardGetData[2];
        this.laneBarChart(DashboardGetData[0])
        this.transactionTypePieChat(DashboardGetData[1])
        this.VehicleClassBarChat(DashboardGetData[2])

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);

      }
    );
  }

  laneBarChart(data: any) {
    let LaneName = []
    let LaneTransactionCount = []
    for (let index = 0; index < data.length; index++) {
      const element = data[index];
      LaneName.push(element.LaneName)
      LaneTransactionCount.push(element.LaneTransactionCount)
    }
    this.laneDetailsOptions = {
      series: [{
        data: LaneTransactionCount
      }],
      chart: {
        type: 'bar',
        height: 300
      },
      plotOptions: {
        bar: {
          borderRadius: 4,
          horizontal: true,
          columnWidth: '10%',
        }
      },
      dataLabels: {
        enabled: true
      },
      xaxis: {
        categories: LaneName,
      },
      title: {
        text: "Shift Lane Details",
        align: "left"
      },
    };
  }

  transactionTypePieChat(data: any){
    let TransactionTypeName = []
    let TransactionTypeCount = []
    for (let index = 0; index < data.length; index++) {
      const element = data[index];
      TransactionTypeName.push(element.TransactionTypeName)
      TransactionTypeCount.push(parseInt(element.TransactionTypeCount))
    }

    this.transactionTypeOptions = {
      series: TransactionTypeCount,
      chart: {
        width: "100%",
        type: "pie",
        height: 300
      },
      labels: TransactionTypeName,
      responsive: [
        {
          breakpoint: 300,
          options: {
            chart: {
              width: 200,
              innerHeight:200
            },
            legend: {
              position: "bottom"
            }
          }
        }
      ],
      title: {
        text: "Transaction Type Details",
        align: "right"
      },
    };
  }

  VehicleClassBarChat(data: any) {
    let FasTagVehicleClassName = []
    let VehicleClassCount = []
    for (let index = 0; index < data.length; index++) {
      const element = data[index];
      FasTagVehicleClassName.push(element.FasTagVehicleClassName)
      VehicleClassCount.push(element.VehicleClassCount)
    }
    this.vehicleClassOptions = {
      series: [{
        data: VehicleClassCount
      }],
      chart: {
        type: 'bar',
        height: 300
      },
      plotOptions: {
        bar: {
          borderRadius: 4,
          horizontal: true,
          columnWidth: '10%',
        }
      },
      dataLabels: {
        enabled: true
      },
      xaxis: {
        categories: FasTagVehicleClassName,
      },
      title: {
        text: "Vehicle Class Details",
        align: "left"
      },
    };
  }
}