import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { retry, Subscription } from 'rxjs';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { WebSocketService } from 'src/services/WebSocket.service';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit, OnDestroy {
  FormDetails!: FormGroup;
  laneRecentData: any[] = [];
  wimDataQueue: any[] = [];
  rfidDataQueue: any[] = [];
  equipmentListDetais: any
  TransactionTypeMaster: any
  PaymentTypeMaster: any
  ExemptTypeMaster: any
  VehicleClasss: any
  VehicleSubClasss: any
  ShiftTimining: any
  TollFare: any
  selectedVehicleClasss: number = 0
  selectedSubVehicleClasss: any
  selectedTransactionType: any
  message: string;
  excludeIds = [24, 6, 25, 13, 8, 11];

  private messageSubscription: Subscription;
  constructor(private dbService: apiIntegrationService,
    private dm: DataModel, private spinner: NgxSpinnerService,
    private webSocketService: WebSocketService) { }

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
      ReceiptNumber: new FormControl('', []),
      PlateNumber: new FormControl('', []),
      Remark: new FormControl('', []),
      VehicleWeight: new FormControl('0', []),
      TollFare: new FormControl('0', []),
      OverweightPenalty: new FormControl('0', []),
      TagPenalty: new FormControl('0', []),
    });
    this.getLaneMasterData()

    this.messageSubscription = this.webSocketService.getMessages().subscribe(
      (message: string) => {
        this.message = message; // Update the component with the received message
        //console.log('Received in component:', message);
      }
    );
   
  }

  getLaneMasterData() {
    this.spinner.show();
    this.dbService.getLaneMasterData().subscribe(
      data => {
        this.getLaneResentData();
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          let result = data.ResponseData
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
        }
        else {
          this.error_msg()
        }
      },
      (error) => {
        this.spinner.hide();
        this.error_msg()
      }
    );
  }

  getLaneResentData() {
    this.dbService.getLaneResentData().subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          this.laneRecentData = data.ResponseData
        }
        else {
          this.error_msg()
        }

      },
      (error) => {
        this.spinner.hide();
        this.error_msg()
      }
    );
  }

  addTrsnaRow(newRow: any): void {
    this.laneRecentData.unshift(newRow);
    if (this.laneRecentData.length > 10) {
      this.laneRecentData.pop();
    }
  }


  error_msg() {
    const ErrorData = [{ AlertMessage: 'Something went wrong.' }];
    this.dm.openSnackBar(ErrorData, false);
  }

  onVehicleChange(event) {
    console.log(event)
  }


  ngOnDestroy(): void {
    if (this.messageSubscription) {
      this.messageSubscription.unsubscribe();
    }
  }

  getIconName(input) {
    try {
      const data = input.split('/');
      return data[0]
    } catch (error) {
      console.log(input)
      return input
    }
  }


}