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
  UserData: any;
  equipmentList: any;
  laneUrl = "";
  wimWeight = '';
  ufd_message = '';
  avc_class = '';
  LaneSystemIpAddress = '';
  LaneName = '';
  isOverlayVisible = false;
  app_loging = false;
  OHLS_light = false;
  TrafficLight = false;
  BoomBarrier = false;
  ViolationStatus = false;
  protocolTypeIds = [1, 2, 6];
  LaneTypeId = 1;
  hardwareOnOffSubscribe!: Subscription;
  constructor(private spinner: NgxSpinnerService, private dm: DataModel, private dbService: apiIntegrationService, private _mqttService: MqttService) {

  }
  ngOnInit(): void {
    this.LaneSystemIpAddress = this.LaneData.LaneSystemIpAddress
    this.LaneName = this.LaneData.LaneName
    this.LaneTypeId = this.LaneData.LaneTypeId
    this.laneUrl = "http://" + this.LaneSystemIpAddress + ":5002/"
    this.UserData = this.dm.getUserData()
    this.hardwareStatus()
    this.GetLaneStatus()
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
        if (hardwareOnOffData != null) {
          if (hardwareOnOffData.event_type == 'dio') {
            if (hardwareOnOffData.data != null) {
              this.app_loging = hardwareOnOffData.data.app_loging;
              this.OHLS_light = hardwareOnOffData.data.OHLS_light;
              this.TrafficLight = hardwareOnOffData.data.TrafficLight;
              this.BoomBarrier = hardwareOnOffData.data.BoomBarrier;
              this.ViolationStatus = hardwareOnOffData.data.ViolationStatus;
              if (hardwareOnOffData.data.equipment_detail != null) {
                this.getEqList(hardwareOnOffData.data.equipment_detail);
              }
            }
          }
          else if (hardwareOnOffData.event_type == 'rfid') {

          }
          else if (hardwareOnOffData.event_type == 'ufd') {
            this.ufd_message = hardwareOnOffData.data;
          }
          else if (hardwareOnOffData.event_type == 'wim') {
            this.wimWeight = "Weight:" + hardwareOnOffData.data.TotalWeight.toString()
          }
          else if (hardwareOnOffData.event_type == 'avc') {
            this.avc_class = "AVC-Class:" + hardwareOnOffData.data.AvcClassId.toString()
          }
          else if (hardwareOnOffData.event_type == 'ping') {
            const eq_status = hardwareOnOffData.data;
            const item = this.equipmentList.find(d => d.IpAddress === eq_status.IpAddress);
            if (item) {
              item.OnLineStatus = eq_status.OnLineStatus;
            }
          }
        }

      });
    } catch (error) {

    }
  }

  GetEquipment() {
    this.spinner.show();
    this.dbService.EquipmentDetailsByLaneId(this.LaneData.LaneId).subscribe(
      data => {
        this.spinner.hide();
        this.getEqList(data.ResponseData);
      },
      (error) => {
        this.spinner.hide();
        console.log(error)
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  laneLogin() {
    let url
    if (this.LaneTypeId == 3) {
      if (this.app_loging == true) {
        url = this.laneUrl + "app_logout"
      } else {
        url = this.laneUrl + "app_login"
      }
      this.spinner.show();
      this.dbService.lsduPost(url, this.UserData).subscribe(
        data => {
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: data.message }];
          this.dm.openSnackBar(this.ErrorData, true);
        },
        (error) => {
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'Operation not allowed.' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  GetLaneStatus() {
    this.spinner.show();
    const url = this.laneUrl + "get_status"
    this.mqttPublish()
    this.dbService.lsduGet(url).subscribe(
      data => {
        this.spinner.hide();
        if (data != null) {
          this.app_loging = data.app_loging;
          this.OHLS_light = data.OHLS_light;
          this.TrafficLight = data.TrafficLight;
          this.BoomBarrier = data.BoomBarrier;
          this.ViolationStatus = data.ViolationStatus;
          if (data.equipment_detail != null) {
            this.getEqList(data.equipment_detail);
          }
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.GetEquipment()
      }
    );
  }

  mqttPublish(){
    try {
      const topic = this.LaneName + '/lanerefresh'
      this._mqttService.publish(topic,'lanerefresh')  
    } catch (error) {
      console.log(error)
    }
  }

  getEquipmentClass(equipment) {
    if (!equipment.OnLineStatus || equipment.OnLineStatus === 0) {
      return 'offline';
    } else if (equipment.OnLineStatus === true || equipment.OnLineStatus === 1) {
      if (!equipment.ConnectionStatus || equipment.ConnectionStatus === 0) {
        return 'disconnected';
      } else if (equipment.ConnectionStatus === true || equipment.ConnectionStatus === 1) {
        return 'connected';
      }
    }
    return '';
  }

  getEqList(data: any) {
    this.equipmentList = data.filter(equipment => this.protocolTypeIds.includes(equipment.ProtocolTypeId));
  }
}