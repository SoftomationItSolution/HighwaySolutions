import { Component, HostListener, Inject, OnDestroy } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { Subscription } from 'rxjs';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
import { WebSocketService } from 'src/services/WebSocket.service';

@Component({
  selector: 'app-fleet-counter',
  templateUrl: './fleet-counter.component.html'
})
export class FleetCounterComponent implements OnDestroy {
  FleetTrans: any
  class_name: string = 'mdi mdi-road'
  FleetCount = 0
  keyEventList: any
  private messageSubscription: Subscription;
  customEventFunctions: { [key: number]: () => void } = {};
  constructor(public Dialogref: MatDialogRef<FleetCounterComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel,
    private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private webSocketService: WebSocketService) {
    this.FleetTrans = parentData.data;
    this.keyEventList = parentData.KeyCode;
    //this.mapKeyEvents()
    this.messageSubscription = this.webSocketService.getMessages().subscribe(
      (message: string) => {
        this.process_ws_message(message)
      }
    );
  }

  ngOnInit(): void {
  }

  // @HostListener('document:keydown.enter', ['$event'])
  // handleKeyboardEvent(event: KeyboardEvent) {
  //   if (event.key === 'Enter') {
  //     this.onFleetStop()// Close the dialog on Enter key press
  //   }
  // }

  //   @HostListener('document:keydown.enter', ['$event'])
  // handleKeyboardEvent(event: KeyboardEvent) {
  //   if (event.key === 'Enter') {
  //     this.onFleetStop(); // Close the dialog on Enter key press
  //   }
  // }

  @HostListener('document:keydown', ['$event'])
  handleKeyboardEvent(e: Event) {

    const event = e as KeyboardEvent;   // Cast safely

    if (event.key !== 'Enter') return;

    const target = event.target as HTMLElement;

    if (['INPUT', 'TEXTAREA', 'SELECT'].includes(target.tagName)) {
      return;
    }

    this.onFleetStop();
  }



  process_ws_message(msg) {
    try {
      let result = JSON.parse(msg)
      const toppic = result.topic
      //const data = result.data
      if (toppic == "hardware_on_off_status") {
        if (result.EquipmentTypeId == 20) {
          if (result.PositionStatus) {
            this.class_name = 'mdi mdi-car-connected'
          }
          else {
            this.class_name = 'mdi mdi-road'
          }
        }
      }
      else if (toppic == "fleet_count") {
        this.FleetCount = result.fleet_count
      }
    }
    catch (error) {
      console.log(error)
    }
  }

  onFleetStop() {
    this.spinner.show();
    this.dbService.FleetStop(this.FleetTrans).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.message;
        if (returnMessage == "success") {
          this.Dialogref.close();
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

  DisplayMessage(msg, status) {
    const ErrorData = [{ AlertMessage: msg }];
    this.dataModel.openSnackBar(ErrorData, status);
  }

  ngOnDestroy(): void {
    if (this.messageSubscription) {
      this.messageSubscription.unsubscribe();
    }
  }
}