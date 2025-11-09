import { Component, ElementRef, HostListener, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { Subject, Subscription, takeUntil } from 'rxjs';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { WebSocketService } from 'src/services/WebSocket.service';
import { SubClassSelectionComponent } from '../popups/SubClassSelection/sub-class-selection.component';
import { ExemptSelectionComponent } from '../popups/ExemptSelection/exempt-selection.component';
import { PaymentSelectionComponent } from '../popups/PaymentSelection/payment-selection.component';
import { FleetCounterComponent } from '../popups/FleetCounter/fleet-counter.component';
import { JsonBufferService } from 'src/services/JsonBuffer.service';
import { LiveViewPopUpComponent } from '../popups/live-view-pop-up/live-view-pop-up.component';
import { PaymentQrComponent } from '../popups/PaymentQr/payment-qr.component';
declare var JSMpeg: any;

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit, OnDestroy {
  FormDetails!: FormGroup;
  laneRecentData: any[] = [];
  wimDataQueue: any[] = [];
  rfidDataQueue: any[] = [];
  UserData: any
  equipmentListDetais: any = null
  TransactionTypeMaster: any
  PaymentTypeMaster: any
  ExemptTypeMaster: any
  VehicleClasss: any
  VehicleSubClasss: any
  ShiftTimining: any
  TollFare: any
  SystemSetting: any = null
  PlazaDetails: any
  LaneDetails: any
  keyEventList: any
  selectedVehicleClasss: number = 0
  message: string;
  excludeIds = [24, 6, 25, 13, 8, 11];
  CurrentTransactions: any = null
  ttyselectedButton: string = '';
  tteselectedButton: string = '';
  FleetStart: boolean = false
  TowStart: boolean = false
  apiPath = ''
  lpicViewUrl = ''
  dialogRef: any = null
  TransactionTypeId = 0
  myWebSocket: any = null;
  player: any = null;
  videoUrl = ''
  private messageSubscription: Subscription;
  @ViewChild('plateNumberInput', { static: true }) plateNumberInput: ElementRef;
  @ViewChild('remarkInput', { static: true }) remarkInput: ElementRef;
  constructor(private dbService: apiIntegrationService,
    private dm: DataModel, private spinner: NgxSpinnerService,
    private webSocketService: WebSocketService, public dialog: MatDialog,
    private jsonBufferService: JsonBufferService) {
    this.UserData = this.dm.getUserData()
    this.lpicViewUrl = this.dm.getLiveAPI()
  }
  private readonly destroy$ = new Subject<void>();

  customEventFunctions: { [key: number]: () => void } = {};
  ngOnInit(): void {
    this.FormDetails = new FormGroup({
      TransactionTypeName: new FormControl('', [
        Validators.required
      ]),
      TransactionSubTypeName: new FormControl('', [
        Validators.required
      ]),
      VehicleClassName: new FormControl('', [
        Validators.required
      ]),
      VehicleClassSubName: new FormControl('', [
        Validators.required
      ]),
      JourneyTypeId: new FormControl('S', [
        Validators.required
      ]),
      PlateNumber: new FormControl('', []),
      Remark: new FormControl('', []),
      VehicleWeight: new FormControl('0', []),
      TollFare: new FormControl('0', []),
      OverweightPenalty: new FormControl('0', []),
      TagPenalty: new FormControl('0', []),
    });
    this.getLaneMasterData()
    this.messageSubscription = this.webSocketService.getMessages()
      .pipe(takeUntil(this.destroy$))
      .subscribe(
        message => {
          if (message != '') this.process_ws_message(message);
        },
        error => console.error("WebSocket error:", error)
      );

  }

  start_liveView(UrlAddress) {
    let videoUrl = UrlAddress
    if (this.myWebSocket != null) {
      this.myWebSocket.close();
      this.player.destroy();
    }
    this.dm.delay(100).then(any => {
      this.newStream(videoUrl);
    });

  }

  newStream(videoUrl: string) {
    const wsPath = this.lpicViewUrl;
    let url = encodeURIComponent(videoUrl)
    this.videoUrl = wsPath + url
    this.myWebSocket = new WebSocket(this.videoUrl);
    this.player = new JSMpeg.Player(this.videoUrl, {
      canvas: document.getElementById("ptz0"),
      onDisconnect: () => console.log('Connection lost!'),
    });
  }

  mapKeyEvents() {
    this.keyEventList.forEach(event => {
      this.customEventFunctions[event.KeyCode] = () => this.handleEvent(event);
    });
  }

  @HostListener('window:keydown', ['$event'])
  handleKeyDown(event: KeyboardEvent): void {
    const keyCode = event.keyCode || event.which;
    if (event.key === 'Enter') {
      if (this.dialogRef == null) {
        if (this.TransactionTypeId > 1) {
          this.submit_trans()
        }
        else {
          this.DisplayMessage('this transaction not allowed!', false);
        }
      }
    }
    else if (this.customEventFunctions[keyCode]) {
      event.preventDefault();
      this.customEventFunctions[keyCode]();
    }

  }

  handleEvent(event: any): void {
    if (event.EventTypeId == 1) {
      const subClass = this.VehicleSubClasss.filter(item => item.SystemVehicleSubClassId == event.EventId);
      if (subClass.length > 0) {
        const data = subClass[0];
        this.selectedVehicleClasss = data.SystemVehicleClassId;
        this.createTrans("svc", data, null)
      }
    }
    else if (event.EventTypeId == 2) {
      this.onttySeclect(event.EventId, event.EventName)
    }
    else {
      this.call_general_events(event.EventName)
    }
  }



  select_journey_type(type: string) {
    if (this.CurrentTransactions == null) {
      this.DisplayMessage('Cannot change the journey!', false);
    }
    else {
      if (this.CurrentTransactions.TransactionTypeId == 2) {
        this.FormDetails.controls['JourneyTypeId'].setValue(type);
      }
      else {
        this.DisplayMessage('Cannot change the journey!', false);
      }

    }
  }

  call_general_events(eventName: string) {
    switch (eventName) {
      case 'Digital Payment':
        this.remarkInput.nativeElement.focus();
        break;
      case 'Remark':
        this.remarkInput.nativeElement.focus();
        break;
      case 'Single Journey':
        this.select_journey_type('S')
        //
        break;
      case 'Retrun Journey':
        this.select_journey_type('R')
        //this.FormDetails.controls['JourneyTypeId'].setValue('R');
        break;
      case 'Reset':
        this.reset_form();
        break;
      // case 'Fleet Start':
      //   this.onFleetStart()
      //   break;
      // case 'Bleed Off':
      //   this.bleedOff();
      //   break;
      case 'WIM Reset':
        if (this.wimDataQueue.length > 0) {
          this.wimDataQueue.shift();
        }
        break;
      case 'Plate Number':
        this.plateNumberInput.nativeElement.focus();
        break;
      // case 'Print':
      //   this.print();
      //   break;
      // case 'Alarm':
      //   this.alarm();
      //   break;
      // case 'Camera Zoom':
      //   this.cameraZoom();
      //   break;
      // case 'Logout':
      //   this.logout();
      //   break;
      // case 'Validate Receipt':
      //   this.validateReceipt();
      //   break;
      default:
        console.log(`Unknown event: ${eventName}`);
    }
  }

  reset_form() {
    this.ttyselectedButton = '';
    this.tteselectedButton = '';
    this.FormDetails.reset()
    this.FormDetails.controls['TransactionTypeName'].setValue('');
    this.FormDetails.controls['TransactionSubTypeName'].setValue('');
    this.FormDetails.controls['VehicleClassName'].setValue('');
    this.FormDetails.controls['VehicleClassSubName'].setValue('');
    this.FormDetails.controls['JourneyTypeId'].setValue('S');
    this.FormDetails.controls['PlateNumber'].setValue('');
    this.FormDetails.controls['Remark'].setValue('');
    this.FormDetails.controls['VehicleWeight'].setValue(0);
    this.FormDetails.controls['TollFare'].setValue(0);
    this.FormDetails.controls['OverweightPenalty'].setValue(0);
    this.FormDetails.controls['TagPenalty'].setValue(0);
    this.selectedVehicleClasss = 0
    if (this.dialogRef != null) {
      this.dialogRef.close();
    }
    this.FleetStart = false;
  }

  getLaneMasterData() {
    this.spinner.show();
    this.dbService.getLaneMasterData().subscribe(
      data => {
        this.getLaneRecentData();
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          const datalist = data.ResponseData
          const result = datalist.master_data
          const hardware_list = datalist.hardware_list
          const equipment_detail = datalist.equipment_detail

          let equipmentDetais = result[0]
          let equipmentDioDetais = result[1]
          const filteredItems = equipmentDetais.concat(equipmentDioDetais);
          this.equipmentListDetais = filteredItems.filter(item => !this.excludeIds.includes(item.EquipmentTypeId));
          this.TransactionTypeMaster = result[2]
          this.PaymentTypeMaster = result[3]
          this.ExemptTypeMaster = result[4]
          this.VehicleClasss = result[5]
          this.VehicleSubClasss = result[6]
          this.ShiftTimining = result[7]
          this.TollFare = result[8]
          if (result[9].length > 0) {
            this.SystemSetting = result[9][0]
          }
          else { this.SystemSetting = null }
          this.PlazaDetails = result[10]
          this.LaneDetails = result[11]
          this.keyEventList = result[12]
          this.mapKeyEvents()
          hardware_list.forEach(element => {
            this.updateEquipmentStatus(element.EquipmentTypeId, element.PositionStatus, "hardware_on_off_status")
          });

          equipment_detail.forEach(element => {
            this.updateEquipmentStatus(element.EquipmentTypeId, element.OnLineStatus, "equipment_status")
          });

          const cam_details = equipmentDetais.find(item => item.EquipmentTypeId == 15);
          if (cam_details) {
            this.start_liveView(cam_details.UrlAddress);
          } else {
            console.log('No rows found.');
          }
        }
        else {
          this.DisplayMessage('Somthing went wrong!', false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.DisplayMessage('Somthing went wrong!', false);
      }
    );
  }

  getLaneRecentData() {
    this.dbService.getLaneRecentData().subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          this.laneRecentData = data.ResponseData
        }
        else {
          this.DisplayMessage('Somthing went wrong!', false);
        }

      },
      (error) => {
        this.spinner.hide();
        this.DisplayMessage('Somthing went wrong!', false);
      }
    );
  }

  addTrsnaRow(newRow: any): void {
    this.laneRecentData.unshift(newRow);
    if (this.laneRecentData.length > 10) {
      this.laneRecentData.pop();
    }
  }

  DisplayMessage(msg, status) {
    const ErrorData = [{ AlertMessage: msg }];
    this.dm.openSnackBar(ErrorData, status);
  }

  bindData(dataFor, dataValue, tagDetails) {
    if (dataFor == 'vc') {
      this.CurrentTransactions.VehicleClassId = dataValue.SystemVehicleClassId
      this.CurrentTransactions.VehicleClassName = dataValue.SystemVehicleClassName
      this.CurrentTransactions.PermissibleVehicleWeight = dataValue.PermissibleWeight
      this.FormDetails.controls['VehicleClassName'].setValue(dataValue.SystemVehicleClassName);
      this.getTollFare()
    }
    else if (dataFor == 'svc') {
      if (dataValue.SystemVehicleClassId > 0) {
        this.CurrentTransactions.VehicleClassId = dataValue.SystemVehicleClassId
        this.CurrentTransactions.VehicleClassName = dataValue.SystemVehicleClassName
        this.CurrentTransactions.PermissibleVehicleWeight = dataValue.PermissibleWeight
        this.FormDetails.controls['VehicleClassName'].setValue(dataValue.SystemVehicleClassName);
      }
      this.CurrentTransactions.VehicleSubClassId = dataValue.SystemVehicleSubClassId
      this.CurrentTransactions.VehicleSubClassName = dataValue.SystemVehicleSubClassName
      this.CurrentTransactions.PermissibleVehicleWeight = dataValue.PermissibleWeight
      this.FormDetails.controls['VehicleClassSubName'].setValue(dataValue.SystemVehicleSubClassName);
      this.getTollFare()
    }
    else if (dataFor == 'tt') {
      this.TransactionTypeId = dataValue.TransactionTypeId;
      this.CurrentTransactions.TransactionTypeId = dataValue.TransactionTypeId
      this.CurrentTransactions.TransactionTypeName = dataValue.TransactionTypeName
      this.CurrentTransactions.PaymentTypeId = 0
      this.CurrentTransactions.ExemptTypeId = 0
      this.CurrentTransactions.PaymentTypeName = ''
      this.CurrentTransactions.ExemptTypeName = ''
      this.FormDetails.controls['TransactionTypeName'].setValue(dataValue.TransactionTypeName);
      this.FormDetails.controls['TransactionSubTypeName'].setValue('');
      this.FormDetails.controls['Remark'].setValue('');

      if (tagDetails != null) {
        const ClassId = parseInt(tagDetails.Class);
        this.CurrentTransactions.TagEPC = tagDetails.EPC
        this.CurrentTransactions.RCTNumber = tagDetails.TID
        this.CurrentTransactions.TagPlateNumber = tagDetails.Plate
        this.CurrentTransactions.TagReadDateTime = tagDetails.TransactionDateTime
        this.CurrentTransactions.TagReadCount = 0
        this.CurrentTransactions.TagReadById = tagDetails.TagReadById
        this.CurrentTransactions.TagClassId = ClassId
        let subClass = this.VehicleSubClasss.filter(item => item.SystemVehicleSubClassId == ClassId);
        if (subClass.length > 0) {
          subClass = subClass[0]
          this.CurrentTransactions.VehicleClassId = parseInt(tagDetails.Class)
          this.CurrentTransactions.VehicleSubClassId = parseInt(tagDetails.Class)
          if (subClass.SystemVehicleClassId > 0) {
            this.CurrentTransactions.VehicleClassId = subClass.SystemVehicleClassId
            this.CurrentTransactions.VehicleClassName = subClass.SystemVehicleClassName
            this.CurrentTransactions.PermissibleVehicleWeight = subClass.PermissibleWeight
            this.FormDetails.controls['VehicleClassName'].setValue(subClass.SystemVehicleClassName);
            this.selectedVehicleClasss = subClass.SystemVehicleClassId;
          }
          this.CurrentTransactions.VehicleSubClassId = subClass.SystemVehicleSubClassId
          this.CurrentTransactions.VehicleSubClassName = subClass.SystemVehicleSubClassName
          this.CurrentTransactions.PermissibleVehicleWeight = subClass.PermissibleWeight
          this.FormDetails.controls['VehicleClassSubName'].setValue(subClass.SystemVehicleSubClassName);
        }
      }
      this.getTollFare()
    }
    else if (dataFor == 'pt') {
      this.CurrentTransactions.PaymentTypeId = dataValue.PaymentTypeId
      this.CurrentTransactions.PaymentTypeName = dataValue.PaymentTypeName
      this.FormDetails.controls['TransactionSubTypeName'].setValue(dataValue.PaymentTypeName);
      this.FormDetails.controls['Remark'].setValue('');
    }
    else if (dataFor == 'et') {
      this.CurrentTransactions.ExemptTypeId = dataValue.ExemptTypeId
      this.CurrentTransactions.ExemptTypeName = dataValue.ExemptTypeName
      this.FormDetails.controls['TransactionSubTypeName'].setValue(dataValue.ExemptTypeName);
      this.FormDetails.controls['Remark'].setValue(dataValue.ExemptTypeName);
    }
  }

  getCurrentTransactions(dataFor, dataValue, tagDetails) {
    this.spinner.show();
    this.dbService.getCurrentTransactions().subscribe(
      data => {
        this.spinner.hide();
        this.CurrentTransactions = data.ResponseData
        this.bindData(dataFor, dataValue, tagDetails)
      },
      (error) => {
        this.spinner.hide();
        this.DisplayMessage('Somthing went wrong!', false);
      }
    );
  }

  createTrans(dataFor, dataValue, tagDetails) {
    this.TransactionTypeId = 0;
    if (this.CurrentTransactions == null) {
      this.getCurrentTransactions(dataFor, dataValue, tagDetails)
    } else {
      this.bindData(dataFor, dataValue, tagDetails)
    }

    // if(data.PaymentTypeId){}
  }

  onVehicleChange(event) {
    let vc = this.VehicleClasss.filter(item => item.SystemVehicleClassId == event);
    if (vc.length > 0) {
      vc = vc[0]
    } else {
      vc = null
    }
    if (vc != null) {
      this.createTrans("vc", vc, null)
      const subClass = this.VehicleSubClasss.filter(item => item.SystemVehicleClassId == event);
      if (subClass.length > 1) {
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '25%';
        dialogConfig.data = subClass;
        this.dialogRef = this.dialog.open(SubClassSelectionComponent, dialogConfig);
        this.dialogRef.afterClosed().subscribe(
          data => {
            if (data) {
              if (data != null) {
                this.createTrans("svc", data, null)
                this.dialogRef = null;
              }
              else {
                this.DisplayMessage('Wrong sub class selection!', false);
              }
            }
          }
        );
      }
      else if (subClass.length == 1) {
        this.createTrans("svc", subClass[0], null)
      }
      else {
        this.DisplayMessage('Wrong sub class selection!', false);
      }
    }
    else {
      this.DisplayMessage('Wrong class selection!', false);
    }
  }

  ontteSeclect(event_id) {
    if (event_id == 1) {
      if (this.TowStart) {
        this.DisplayMessage('Stop the tow first!', false);
      } else {
        this.FleetStart = !this.FleetStart
      }
    }
    if (event_id == 2) {
      if (this.FleetStart) {
        this.DisplayMessage('Stop the fleet first!', false);
      } else {
        this.TowStart = !this.TowStart
      }
    }
  }

  onttySeclect(TransactionTypeId, TransactionTypeName) {
    this.ttyselectedButton = TransactionTypeName;
    if (TransactionTypeId != 5) {
      const dataValue = { "TransactionTypeId": TransactionTypeId, "TransactionTypeName": TransactionTypeName }
      this.createTrans("tt", dataValue, null)
      this.FormDetails.controls["JourneyTypeId"].enable()
      this.FormDetails.controls['JourneyTypeId'].setValue('S');
      this.FormDetails.controls["JourneyTypeId"].disable()
      if (TransactionTypeId == 2) {
        this.FormDetails.controls["JourneyTypeId"].enable()
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '25%';
        dialogConfig.data = this.PaymentTypeMaster;
        this.dialogRef = this.dialog.open(PaymentSelectionComponent, dialogConfig);
        this.dialogRef.afterClosed().subscribe(
          data => {
            if (data) {
              if (data != null) {
                this.createTrans("pt", data, null)
                this.dialogRef = null;
                if (data.PaymentTypeId != 1) {
                  this.generateQr();
                }
              }
              else {
                this.DisplayMessage('Wrong payment type selection!', false);
              }
            }
          }
        );
      }
      else if (TransactionTypeId == 3) {
        this.FormDetails.controls["JourneyTypeId"].disable()
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = '25%';
        dialogConfig.data = this.ExemptTypeMaster;
        this.dialogRef = this.dialog.open(ExemptSelectionComponent, dialogConfig);
        this.dialogRef.afterClosed().subscribe(
          data => {
            if (data) {
              if (data != null) {
                this.createTrans("et", data, null)
                this.dialogRef = null;
              }
              else {
                this.DisplayMessage('Wrong exempt type selection!', false);
              }
            }
          }
        );
      }
    }
    else {

    }
  }

  generateQr() {
    if (this.CurrentTransactions == null) {
      this.DisplayMessage("No transactions found!", false)
      return;
    }
    else {
      if (this.CurrentTransactions.VehicleClassId == 0) {
        this.DisplayMessage("Vehicle class is required!", false)
        return
      }
      if (this.CurrentTransactions.TransactionAmount == 0) {
        this.DisplayMessage("Toll fare not found!", false)
        return
      }
      const plate = this.FormDetails.value.PlateNumber;
      if (plate.length < 4) {
        this.DisplayMessage("Plate number is required!", false);
      }
    }
    this.CurrentTransactions.PlateNumber = this.FormDetails.value.PlateNumber || '';
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '50%';
    dialogConfig.data = this.CurrentTransactions;
    this.dialogRef = this.dialog.open(PaymentQrComponent, dialogConfig);
    this.dialogRef.afterClosed().subscribe(
      data => {
        if (data) {
          if (data != null) {
            this.createTrans("pt", data, null)
            this.dialogRef = null;
            if (data.PaymentTypeId != 1) {
              this.generateQr();
            }
          }
          else {
            this.DisplayMessage('Wrong payment type selection!', false);
          }
        }
      }
    );
  }

  preprocessJson(inputString) {
    while (inputString.startsWith('}')) {
      inputString = inputString.substring(1);
    }
    try {
      return JSON.parse(inputString);
    } catch (e) {
      console.error("Error parsing JSON:", e);
      return null;
    }
  }

  process_ws_message(msg: string) {
    try {
      if (msg != '') {
        let result = this.jsonBufferService.preprocessJson(msg);
        if (result) {
          const toppic = result.topic
          if (toppic == "equipment_status") {
            this.updateEquipmentStatus(result.EquipmentTypeId, result.OnLineStatus, toppic)
          }
          else if (toppic == "hardware_on_off_status") {
            this.updateEquipmentStatus(result.EquipmentTypeId, result.PositionStatus, toppic)
          }
          else if (toppic == "wim_processed") {
            this.process_wim_data(result)
          }
          else if (toppic == "rfid_processed") {
            this.process_rfid_data(result)
          }
          else if (toppic == "lane_process_end") {
            this.CurrentTransactions = null
            this.getLaneRecentData()
            this.reset_form()
            if (this.rfidDataQueue.length > 0) {
              const tagDetails = this.rfidDataQueue[0];
              this.rfidDataQueue.shift();
              const dataValue = {
                TransactionTypeId: 1,
                TransactionTypeName: 'FasTag'
              };
              this.ttyselectedButton = dataValue.TransactionTypeName;
              this.createTrans("tt", dataValue, tagDetails);
            }
          }
        }
      }
    } catch (error) {
      console.error("Error parsing JSON:", error, "JSON string:", msg);
    }

  }

  process_wim_data(tagDetails: any) {
    this.wimDataQueue.push(tagDetails)
  }

  process_rfid_data(tagDetails: any) {
    if (this.CurrentTransactions == null) {
      if (this.rfidDataQueue.length == 0) {
        const dataValue = { "TransactionTypeId": 1, "TransactionTypeName": 'FasTag' }
        this.ttyselectedButton = dataValue.TransactionTypeName;
        this.createTrans("tt", dataValue, tagDetails)
      } else {
        this.rfidDataQueue.push(tagDetails)
      }
    }
    else {
      this.rfidDataQueue.push(tagDetails)
    }
  }

  updateEquipmentStatus(EquipmentTypeId: number, status: boolean, toppic): void {
    if (this.equipmentListDetais != null) {
      const item = this.equipmentListDetais.find(equipment => equipment.EquipmentTypeId === EquipmentTypeId);
      if (item) {
        if (toppic == "equipment_status")
          item.OnLineStatus = status;
        else if (toppic == "hardware_on_off_status")
          item.PositionStatus = status;
      }
    }
  }

  ngOnDestroy(): void {
    if (this.messageSubscription) {
      this.messageSubscription.unsubscribe();
    }
  }

  getIconName(item) {
    let EquipmentIcon = item.EquipmentIcon
    const OnLineStatus = item.OnLineStatus === 1 || item.OnLineStatus === true ? true : false;
    const ConnectionStatus = item.ConnectionStatus === 1 || item.ConnectionStatus === true ? true : false;
    const PositionStatus = item.PositionStatus === 1 || item.PositionStatus === true ? true : false;
    try {
      const data = EquipmentIcon.split('/');
      if (data.length == 2) {
        if (PositionStatus) {
          EquipmentIcon = data[1]
        }
        else {
          EquipmentIcon = data[0]
        }
      }
      else {
        EquipmentIcon = data[0]
      }
      if (item.ProtocolTypeId == 1 || item.ProtocolTypeId == 2 || item.ProtocolTypeId == 4 || item.ProtocolTypeId == 5 || item.ProtocolTypeId == 6 || item.ProtocolTypeId == 8) {
        if (OnLineStatus && ConnectionStatus) {
          return EquipmentIcon + ' txt-green';
        }
        else if (OnLineStatus) {
          return EquipmentIcon + ' txt-yellow';
        }
        else {
          return EquipmentIcon + ' txt-red';
        }
      }
      else {

        if (PositionStatus) {
          EquipmentIcon = data[1] + ' txt-green';
        }
        else {
          EquipmentIcon = data[0] + ' txt-red';
        }


        return EquipmentIcon;
      }
    } catch (error) {
      return EquipmentIcon
    }
  }

  getTollFare() {
    let currentFare = null
    let wimData = null

    if (this.CurrentTransactions != null && this.SystemSetting != null && this.TollFare != null && this.CurrentTransactions.TransactionTypeId > 0) {
      if (this.SystemSetting.TollFareonSubClass == 1 || this.SystemSetting.TollFareonSubClass == true) {
        if (this.CurrentTransactions.VehicleSubClassId > 0) {
          currentFare = this.TollFare.filter(item => item.SubVehicleClassId == this.CurrentTransactions.VehicleSubClassId);
        }
      }
      else {
        if (this.CurrentTransactions.VehicleClassId > 0) {
          currentFare = this.TollFare.filter(item => item.SystemVehicleClassId == this.CurrentTransactions.VehicleClassId);
        }
      }
    }

    if (currentFare != null && currentFare.length > 0) {
      if (this.wimDataQueue.length > 0) {
        wimData = this.wimDataQueue[0]
        this.wimDataQueue.shift();
      }
      currentFare = currentFare[0]
      if (this.CurrentTransactions.TransactionTypeId == 2) {
        this.FormDetails.controls['TollFare'].setValue(currentFare.TollFare);
        this.CurrentTransactions.TransactionAmount = currentFare.TollFare
        if (this.SystemSetting.FasTagPenalty == 1 || this.SystemSetting.FasTagPenalty == true) {
          this.CurrentTransactions.TagPenaltyAmount = currentFare.FasTagPenalty
          this.FormDetails.controls['TagPenalty'].setValue(currentFare.FasTagPenalty);
        }
        else {
          this.CurrentTransactions.TagPenaltyAmount = 0
          this.FormDetails.controls['TagPenalty'].setValue(0);
        }
      }
      else {
        this.CurrentTransactions.TransactionAmount = 0
        this.FormDetails.controls['TollFare'].setValue(0);
        this.CurrentTransactions.TagPenaltyAmount = 0
        this.FormDetails.controls['TagPenalty'].setValue(0);
      }
    }
    else {
      this.CurrentTransactions.TransactionAmount = 0
      this.CurrentTransactions.TagPenaltyAmount = 0
      this.CurrentTransactions.OverweightPenalty = 0
      this.FormDetails.controls['TollFare'].setValue(0);
      this.FormDetails.controls['OverweightPenalty'].setValue(0);
      this.FormDetails.controls['TagPenalty'].setValue(0);
      if (this.CurrentTransactions.TransactionTypeId > 0 && (this.CurrentTransactions.VehicleClassId > 0 || this.CurrentTransactions.VehicleSubClassId > 0))
        this.DisplayMessage('Toll Fare not found for selected class !', false);
    }
    if (wimData != null) {
      this.CurrentTransactions.ActualVehicleWeight = wimData.TotalWeight
      if (this.CurrentTransactions.ActualVehicleWeight > this.CurrentTransactions.PermissibleVehicleWeight && currentFare != null) {
        this.CurrentTransactions.OverweightPenalty = currentFare.OverweightPenalty
        this.FormDetails.controls['OverweightPenalty'].setValue(currentFare.OverweightPenalty);
      }
      else {
        this.CurrentTransactions.OverweightPenalty = 0
        this.FormDetails.controls['OverweightPenalty'].setValue(0);
      }
    }
    else {
      this.CurrentTransactions.OverweightPenalty = 0
      this.FormDetails.controls['OverweightPenalty'].setValue(0);
    }
  }

  onFleetStart() {
    if (this.FleetStart) {
      this.DisplayMessage('Fleet already running!', false);
    }
    else {
      this.FleetStart = true;
      const dataValue = { "TransactionTypeId": 3, "TransactionTypeName": "Excempt" }
      this.FormDetails.controls["JourneyTypeId"].enable()
      this.FormDetails.controls['JourneyTypeId'].setValue('S');
      this.FormDetails.controls["JourneyTypeId"].disable()
      this.createTrans("tt", dataValue, null)
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '25%';
      dialogConfig.data = this.ExemptTypeMaster
      this.dialogRef = this.dialog.open(ExemptSelectionComponent, dialogConfig);
      this.dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            if (data != null) {
              this.createTrans("et", data, null)
              this.dialogRef = null;
              this.CurrentTransactions.TCRemark = this.FormDetails.value.Remark
              this.spinner.show();
              this.dbService.FleetStart(this.CurrentTransactions).subscribe(
                data => {
                  this.spinner.hide();
                  const returnMessage = data.message;
                  if (returnMessage == "success") {
                    const dialogConfig = new MatDialogConfig();
                    dialogConfig.disableClose = true;
                    dialogConfig.autoFocus = true;
                    dialogConfig.width = '25%';
                    dialogConfig.data = { "KeyCode": this.keyEventList, "data": data.ResponseData }
                    this.dialogRef = this.dialog.open(FleetCounterComponent, dialogConfig);
                    this.dialogRef.afterClosed().subscribe(
                      data => {
                        this.CurrentTransactions = null
                        this.getLaneRecentData()
                        this.reset_form()
                        this.dialogRef = null;
                      }
                    );
                  }
                  else {
                    this.DisplayMessage(returnMessage, false)
                  }
                },
                (error) => {
                  this.spinner.hide();
                  this.DisplayMessage('Something went wrong !', false)
                }
              );
            }
            else {
              this.DisplayMessage('Wrong exempt type selection!', false);
            }
          }
        }
      );
    }
  }

  onVRN() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { videoUrl: this.videoUrl, VehicleSubClasss: this.VehicleSubClasss }
    this.dialog.open(LiveViewPopUpComponent, dialogConfig);
  }

  submit_trans() {
    if (this.CurrentTransactions == null) {
      this.DisplayMessage("No transactions found!", false)
    }
    else {
      if (this.CurrentTransactions.VehicleClassId == 0) {
        this.DisplayMessage("Vehicle class is required!", false)
        return
      }
      if (this.CurrentTransactions.TransactionTypeId == 0) {
        this.DisplayMessage("Transactions type is required!", false)
      }
      else {
        const plate = this.FormDetails.value.PlateNumber;
        const Remark = this.FormDetails.value.Remark;
        if (plate.length < 4) {
          this.DisplayMessage("Plate number is required!", false);
        }
        else {
          if (this.CurrentTransactions.TransactionTypeId == 3 && Remark == '') {
            this.DisplayMessage("Remark is required!", false);
          }
          this.CurrentTransactions.PlateNumber = plate
          this.CurrentTransactions.TCRemark = Remark
          this.spinner.show();
          this.dbService.ProcessTransactions(this.CurrentTransactions).subscribe(
            data => {
              const returnMessage = data.message;
              if (returnMessage == "success") {

              }
              else {
                this.DisplayMessage(returnMessage, false)
              }
            },
            (error) => {
              this.spinner.hide();
              this.DisplayMessage('Something went wrong !', false)
            }
          );
        }
      }
    }
  }
}