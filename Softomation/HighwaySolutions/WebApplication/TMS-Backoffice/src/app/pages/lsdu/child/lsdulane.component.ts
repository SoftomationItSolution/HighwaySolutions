import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { Subscription } from 'rxjs';
@Component({
  selector: 'app-lsdulane',
  templateUrl: './lsdulane.component.html',
  styleUrls: ['./lsdulane.component.css']
})
export class LsduLaneComponent implements OnInit, OnDestroy {
  @Input() LaneData: any;
  ErrorData: any;
  wimWeight = ''
  ufd_message = ''
  avc_class = ''
  isOverlayVisible = false;
  LaneSystemIpAddress = ''
  LaneName = ''
  LoginStatus = false
  hardwareOnOffSubscribe!: Subscription;
  app_loging = false;
  OHLS_light = false;
  TrafficLight = false;
  BoomBarrier = false;
  constructor(private spinner: NgxSpinnerService, private dm: DataModel, private dbService: apiIntegrationService, private _mqttService: MqttService) {

  }
  ngOnInit(): void {
    this.LaneSystemIpAddress = this.LaneData.LaneSystemIpAddress
    this.LaneName = this.LaneData.LaneName
    this.GetLaneStatus()
    this.hardwareStatus()
  }

  ngOnDestroy() {
    if (this.hardwareOnOffSubscribe != null)
      this.hardwareOnOffSubscribe.unsubscribe();
  }

  toggleOverlay() {
    this.isOverlayVisible = !this.isOverlayVisible;
  }

  hardwareStatus() {
    try {
      const topic = this.LaneName + '/laneStatus'
      this.hardwareOnOffSubscribe = this._mqttService.observe(topic).subscribe((message: IMqttMessage) => {
        var hardwareOnOffData = JSON.parse(message.payload.toString());
        //console.log(hardwareOnOffData)
        if (hardwareOnOffData != null) {
          if (hardwareOnOffData.event_type == 'dio') {
            this.app_loging = hardwareOnOffData.data.app_loging;
            this.OHLS_light = hardwareOnOffData.data.OHLS_light;
            this.TrafficLight = hardwareOnOffData.data.TrafficLight;
            this.BoomBarrier = hardwareOnOffData.data.BoomBarrier;
          }
          else if (hardwareOnOffData.event_type == 'rfid') {

          }
          else if (hardwareOnOffData.event_type == 'ufd') {
            this.ufd_message=hardwareOnOffData.data;
          }
          else if (hardwareOnOffData.event_type == 'wim') {
            this.avc_class="Weight:"+hardwareOnOffData.data.TotalWeight.toString()
          }
          else if (hardwareOnOffData.event_type == 'avc') {
            this.avc_class="AVC-Class:"+hardwareOnOffData.data.AvcClassId.toString()
          }
        }

      });
    } catch (error) {

    }
  }

  GetLaneStatus() {
    this.spinner.show();
    const url = "http://" + this.LaneSystemIpAddress + ":5002/get_status"
    this.dbService.lsduGet(url).subscribe(
      data => {
        this.spinner.hide();
        if (data = !null) {
          this.app_loging = data.app_loging;
          this.OHLS_light = data.OHLS_light;
          this.TrafficLight = data.TrafficLight;
          this.BoomBarrier = data.BoomBarrier;
        }

      },
      (error) => {
        this.spinner.hide();
        console.log(error)
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }


}