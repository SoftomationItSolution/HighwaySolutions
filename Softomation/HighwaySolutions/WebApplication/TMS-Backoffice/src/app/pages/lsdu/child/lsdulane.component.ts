import { ChangeDetectorRef, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { Subscription } from 'rxjs';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { LiveViewPopUpComponent } from '../../live-view-pop-up/live-view-pop-up.component';
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
  constructor(private spinner: NgxSpinnerService, private dm: DataModel,
    private dbService: apiIntegrationService, private _mqttService: MqttService,
    private cd: ChangeDetectorRef, public dialog: MatDialog) {

  }
  ngOnInit(): void {
    this.LaneSystemIpAddress = this.LaneData.LaneSystemIpAddress
    this.LaneName = this.LaneData.LaneName
    this.LaneTypeId = this.LaneData.LaneTypeId
    this.laneUrl = "http://" + this.LaneSystemIpAddress + ":5002/"
    this.UserData = this.dm.getUserData()
    this.getEqList(this.LaneData.LaneEquipment);
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
        const input = message.payload.toString()
        this.process_events(input)
      });
    } catch (error) {
      console.log(error)
    }
  }


  process_events(input) {
    try {
      var hardwareOnOffData = JSON.parse(input);
      if (hardwareOnOffData != null) {
        if (hardwareOnOffData.event_type == 'dio') {
          this.manage_dio_events(hardwareOnOffData.data)
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
    } catch (error) {
      console.log(error)
    }
  }

  manage_dio_events(event_data) {
    try {
      if (event_data.EquipmentTypeId == 2) {
        this.OHLS_light = event_data.PositionStatus
        this.app_loging = event_data.PositionStatus
      }
      else if (event_data.EquipmentTypeId == 14) {
        this.ViolationStatus = event_data.PositionStatus
      }
      else if (event_data.EquipmentTypeId == 17) {
        this.TrafficLight = event_data.PositionStatus
      }
      else if (event_data.EquipmentTypeId == 19) {
        this.BoomBarrier = event_data.PositionStatus
      }
    } catch (error) {
      console.log(error)
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
    // let url
    // if (this.LaneTypeId == 3) {
    //   if (this.app_loging == true) {
    //     url = this.laneUrl + "app_logout"
    //   } else {
    //     url = this.laneUrl + "app_login"
    //   }
    //   this.spinner.show();
    //   this.dbService.lsduPost(url, this.UserData).subscribe(
    //     data => {
    //       this.spinner.hide();
    //       this.ErrorData = [{ AlertMessage: data.message }];
    //       this.dm.openSnackBar(this.ErrorData, true);
    //       this.wimWeight = ""
    //       this.avc_class = ""
    //     },
    //     (error) => {
    //       this.spinner.hide();
    //       this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
    //       this.dm.openSnackBar(this.ErrorData, false);
    //     }
    //   );
    // }
    // else {
    //   this.ErrorData = [{ AlertMessage: 'Operation not allowed.' }];
    //   this.dm.openSnackBar(this.ErrorData, false);
    // }
  }

  GetLaneStatus() {
    const url = this.laneUrl + "/Softomation/FastTrackHighway-lane/getLaneMasterData"
    //this.mqttPublish()
    this.dbService.lsduGet(url).subscribe(
      data => {
        if (data.ResponseData != null) {
          const equipment_detail = data.ResponseData.equipment_detail
          if (equipment_detail != null) {
            this.getEqList(equipment_detail);
          }
          const hardware_list = data.ResponseData.hardware_list
          console.log(hardware_list)
          hardware_list.forEach(element => {
            //console.log(element)
            this.manage_dio_events(element)
          });

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

  mqttPublish() {
    try {
      const topic = this.LaneName + '/lanerefresh'
      this._mqttService.publish(topic, 'lanerefresh')
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

  liveView(eq: any) {
    if (eq.EquipmentTypeName.indexOf("Camera") > -1) {
      this.cd.detectChanges();
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '45%';
      dialogConfig.height = '540px';
      dialogConfig.data = eq;
      const dialogRef = this.dialog.open(LiveViewPopUpComponent, dialogConfig);
    }
  }


  camer_live_view(detail: any) {
    if (detail.EquipmentTypeName.indexOf("Camera") > -1) {
      if (detail.OnLineStatus) {
        this.cd.detectChanges();
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '50%';
        dialogConfig.height = '900px';
        dialogConfig.data = detail;
        const dialogRef = this.dialog.open(LiveViewPopUpComponent, dialogConfig);
      } else {
        this.ErrorData = [{ AlertMessage: 'Camera is offline.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    }
  }

}