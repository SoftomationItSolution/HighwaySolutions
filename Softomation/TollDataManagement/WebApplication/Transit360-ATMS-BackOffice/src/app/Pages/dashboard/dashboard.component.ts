import { Component, OnInit, ViewChild } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { Color, Label } from 'ng2-charts';
import { ChartDataSets, ChartOptions, ChartType } from 'chart.js';

declare var $: any;
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  LineData: any;
  TimeOut = 5000;
  LinechartReady = false;
  TranTypechartReady = false;
  LanechartReady = false;
  refresh = false;
  public innerHeight: any;


  constructor(private dbService: ApiService, private emitService: EmittersService, private spinner: NgxSpinnerService) {
    this.emitService.CurrentPage.subscribe(
      (pageName: string) => {
        if (pageName == 'dashboard') {
          this.refresh = true;

        } else {
          this.refresh = false;
        }
      });

    this.emitService.InnerHeight.subscribe(
      (innerHeight: any) => {
        this.innerHeight = innerHeight;
        this.SetPageHeight();
      });

  }
  lineChartData: ChartDataSets[];
  lineChartLabels: Label[];
  lineChartOptions = {
    responsive: true,
  };
  lineChartColors: Color[] = [
    {
      borderColor: 'black',
      backgroundColor: 'rgba(255,255,0,0.28)',
    },
  ];
  lineChartLegend = true;
  lineChartPlugins = [];
  lineChartType = 'line';
  colorCode;
  public barChartLabels: Label[];
  public barChartType: ChartType = 'bar';
  public barChartLegend = true;
  public barChartPlugins = [];
  public barChartData: ChartDataSets[];
  public barChartOptions: ChartOptions = {
    responsive: true,
    scales: { xAxes: [{}], yAxes: [{}] },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'end',
      }
    }
  };

  public pieChartOptions: ChartOptions = {
    responsive: true,
    legend: {
      position: 'top',
    },
    plugins: {
      datalabels: {
        formatter: (value, ctx) => {
          const label = ctx.chart.data.labels[ctx.dataIndex];
          return label;
        },
      },
    }
  };
  public pieChartLabels: Label[];
  public pieChartData: number[];
  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  public pieChartPlugins = [];
  public pieChartColors = [
    {
      backgroundColor: ['rgba(255,0,0,0.3)', 'rgba(0,255,0,0.3)', 'rgba(0,0,255,0.3)'],
    },
  ];


  ngOnInit(): void {
  }

  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
    // try {
    //   this.GetDashHourlyTraffic();
    // } catch (error) {

    // }
    // try {
    //   this.GetTransTypeTraffic();
    // } catch (error) {

    // }
    // try {
    //   this.GetLaneRevenue();
    // } catch (error) {

    // }


  }

  SetPageHeight() {
    $('.main-content').css('height', this.innerHeight - 55);
    $('.side-content').css('height', this.innerHeight - 23);
    $('.chart-responsive').css('max-height', this.innerHeight - 100);
    $('.chart-responsive').css('min-height', this.innerHeight - 100);


  }

  GetDashHourlyTraffic() {
    this.dbService.GetHourlyTrafic().subscribe(
      data => {
        let LineLabel;
        let TraficCountData;
        for (let i = 0; i < data.ResponceData.length; i++) {
          if (i == 0) {
            LineLabel = data.ResponceData[i].StatusTime;
            TraficCountData = data.ResponceData[i].TraficCount;
          } else {
            LineLabel = LineLabel + ',' + data.ResponceData[i].StatusTime;
            TraficCountData = TraficCountData + ',' + data.ResponceData[i].TraficCount;
          }
        }
        let LineLabelArray, LineNetworkDataArray;
        if (data.ResponceData.length == 1) {
          LineLabelArray = LineLabel;
          LineNetworkDataArray = TraficCountData;
        } else {
          LineLabelArray = LineLabel.split(',');
          LineNetworkDataArray = TraficCountData.split(',');
        }
        if (this.LinechartReady) {
          this.lineChartLabels = LineLabelArray;
          this.lineChartData[0].data = LineNetworkDataArray;
          // this.chart.chart.data.datasets[0].data = LineNetworkDataArray;
          // this.chart.chart.update()
        } else {
        this.lineChartLabels = LineLabelArray;
        this.lineChartData = [{ data: LineNetworkDataArray, label: 'Hourly Trafic' }];
        this.LinechartReady = true;
        }
        if (this.refresh) {
          setTimeout(() => { this.GetDashHourlyTraffic(); }, this.TimeOut);
        }

      },
      () => {
        // setTimeout(() => { this.GetDashHourlyTraffic() }, this.TimeOut);
      }
    );
  }

  GetTransTypeTraffic() {
    this.dbService.GetTransTypeCount().subscribe(
      data => {
        let LineLabel;
        let TraficCountData;
        for (let i = 0; i < data.ResponceData.length; i++) {
          if (i == 0) {
            LineLabel = data.ResponceData[i].StatusTime;
            TraficCountData = data.ResponceData[i].TraficCount;
          } else {
            LineLabel = LineLabel + ',' + data.ResponceData[i].StatusTime;
            TraficCountData = TraficCountData + ',' + data.ResponceData[i].TraficCount;
          }
        }
        let LineLabelArray, LineNetworkDataArray;
        if (data.ResponceData.length == 1) {
          LineLabelArray = LineLabel;
          LineNetworkDataArray = TraficCountData;
        } else {
          LineLabelArray = LineLabel.split(',');
          LineNetworkDataArray = TraficCountData.split(',');
        }
        if (this.TranTypechartReady) {
          this.barChartData[0].data = LineNetworkDataArray;
        } else {
        this.barChartLabels = LineLabelArray;
        this.barChartData = [{ data: LineNetworkDataArray, label: 'Transaction Type' }];
        this.TranTypechartReady = true;
        }
        if (this.refresh) {
          setTimeout(() => { this.GetTransTypeTraffic(); }, this.TimeOut);
        }

      },
      () => {
        // setTimeout(() => { this.GetTransTypeTraffic() }, this.TimeOut);
      }
    );
  }

  GetLaneRevenue() {

    this.dbService.GetLaneRevenue().subscribe(
      data => {
        let LineLabel;
        let TraficCountData;
        for (let i = 0; i < data.ResponceData.length; i++) {
          if (i == 0) {
            if (data.ResponceData.length == 1) {
              LineLabel = data.ResponceData[i].StatusTime + ',No Lane';
              TraficCountData = data.ResponceData[i].AverageAmount + ',0';
            } else {
            LineLabel = data.ResponceData[i].StatusTime;
            TraficCountData = data.ResponceData[i].AverageAmount;
            }
          } else {
            LineLabel = LineLabel + ',' + data.ResponceData[i].StatusTime;
            TraficCountData = TraficCountData + ',' + data.ResponceData[i].AverageAmount;
          }
        }
        let LineLabelArray, LineNetworkDataArray;
        if (data.ResponceData.length > 0) {
          LineLabelArray = LineLabel.split(',');
          LineNetworkDataArray = TraficCountData.split(',');
        }
        if (this.colorCode == undefined) {
          for (let i = 0; i < LineLabelArray.length; i++) {
            if (i == 0) {
              this.colorCode = this.GetRandomColor();
            } else {
              this.colorCode = this.colorCode + ',' + this.GetRandomColor();
            }
          }
        } else {

          if (this.colorCode.split(',').length != LineLabelArray.length) {
            this.colorCode = undefined;
            for (let i = 0; i < LineLabelArray.length; i++) {
              if (i == 0) {
                this.colorCode = this.GetRandomColor();
              } else {
                this.colorCode = this.colorCode + ',' + this.GetRandomColor();
              }
            }
          }
        }
        this.pieChartColors[0].backgroundColor = this.colorCode.split(',');
        this.pieChartLabels = LineLabelArray;
        this.pieChartData = LineNetworkDataArray;
        this.LanechartReady = true;
        if (this.refresh) {
          setTimeout(() => { this.GetLaneRevenue(); }, this.TimeOut);
        }

      },
      () => {
        // setTimeout(() => { this.GetLaneRevenue() }, this.TimeOut);
      }
    );
  }



  GetRandomColor() {
    let letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
  }


}
