import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { DataModel } from 'src/services/data-model.model';

declare var JSMpeg: any;
@Component({
  selector: 'app-live-view-pop-up',
  templateUrl: './live-view-pop-up.component.html',
  styleUrls: ['./live-view-pop-up.component.css']
})
export class LiveViewPopUpComponent {
  PageTitle: string = 'Live View'
  videoUrl: ''
  DataDetailsForm!: FormGroup;
  DetailsForm!: FormGroup;
  error = errorMessages;
  myWebSocket: any = null;
  player: any = null;
  submitted = false;
  exceptionMap: { [key: string]: string } = {
    "00": "SUCCESS",
    "01": "Hotlist",
    "02": "Exempted",
    "03": "Low Balance",
    "04": "Invalid Carriage",
    "05": "Blacklist",
    "06": "Closed"
  };
  TagDetails: any = null;
  IsProcessAllowed: boolean = false;
  TagStatus: string = '';
  VehicleSubClasss: any;

  constructor(public Dialogref: MatDialogRef<LiveViewPopUpComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dm: DataModel,
    private dbService: apiIntegrationService, private spinner: NgxSpinnerService) {
    this.videoUrl = parentData.videoUrl;
    this.VehicleSubClasss = parentData.VehicleSubClasss;
    this.PageTitle = 'Live View'
  }

  

  ClosePoup() { this.Dialogref.close(false); }

  ngOnInit(): void {
    //, Validators.pattern(regExps["IndianPlateNumber"])
    this.DataDetailsForm = new FormGroup({
      PlateNumber: new FormControl('', [Validators.required])
    });
    this.DetailsForm = new FormGroup({
      TagClassId: new FormControl('', [Validators.required])
    });

    this.newStream()
  }

  newStream() {
    this.myWebSocket = new WebSocket(this.videoUrl);
    this.player = new JSMpeg.Player(this.videoUrl, {
      canvas: document.getElementById("ptz1"),
      onDisconnect: () => console.log('Connection lost!'),
    });
  }

  DisplayMessage(msg, status) {
    const ErrorData = [{ AlertMessage: msg }];
    this.dm.openSnackBar(ErrorData, status);
  }

  getExceptionNames(excCodes: string): string {
    const excCodeList = excCodes.split(',');
    const exceptionNames = excCodeList.map(code => this.exceptionMap[code.trim()] || "Unknown"); // Map codes to exception names
    return exceptionNames.join(', '); 
  }

  submit() {
    this.submitted = true
    if (this.DataDetailsForm.invalid) {
      this.DisplayMessage('Enter vaild plate number!', false)
      return;
    }
    else {
      this.spinner.show();
      const plateNumber = this.DataDetailsForm.value.PlateNumber.trim();
      //this.DataDetailsForm.patchValue({ PlateNumber: plateNumber });
      const obj = { "TagId": "", "TID": "", "VRN": this.DataDetailsForm.value.PlateNumber }
      this.dbService.FeatchTagDetails(obj).subscribe(
        data => {
          this.spinner.hide();
          const returnMessage = data.status;
          if (returnMessage == "success") {
            this.TagDetails = data.VehicleDetails;
            this.IsProcessAllowed = this.TagDetails.Allowed;
            this.TagStatus = this.getExceptionNames(this.TagDetails.EXCCODE);
          }
          else {
            this.DisplayMessage(returnMessage, false)
          }
        },
        (error) => {
          console.error(error)
          this.spinner.hide();
          this.DisplayMessage('Something went wrong !', false)
        }
      );
    }
  }

  reset() {
    this.IsProcessAllowed = false;
    this.submitted = false;
    this.TagStatus = "";
    this.TagDetails = null;
    this.DataDetailsForm.reset()
  }

  process() {
    if (this.IsProcessAllowed) {
      if (this.DetailsForm.invalid) {
        this.DisplayMessage('Vehicle class must be selected!', false)
        return;
      }
      else {
        const obj = {
          "TagId": this.TagDetails["TAGID"],
          "TID": this.TagDetails["TID"],
          "ClassId": this.DetailsForm.value.TagClassId,
          "PlateNumber": this.TagDetails["REGNUMBER"],
        }
        //console.log(obj)
        this.spinner.show();
        this.dbService.ProcessVrn(obj).subscribe(
          data => {
            this.spinner.hide();
            this.reset()
            // const returnMessage = data.message;
            // if (returnMessage == "success") {
            //   this.DisplayMessage(returnMessage, true)
            //   this.reset()
            // }
            // else {
            //   this.DisplayMessage(returnMessage, false)
            // }
          },
          (error) => {
            console.error(error)
            this.spinner.hide();
            this.DisplayMessage('Something went wrong !', false)
          }
        );
      }
    } 
    else{
      const msg = "Tag status " + this.TagStatus + " is not allowed to process !"
      this.DisplayMessage(msg, false)
    }
  }
}