import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
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
  CameraDetails: any
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  myWebSocket: any = null;
  player: any = null;
  EquipmentTypeId = 0
  submitted = false;
  constructor(public Dialogref: MatDialogRef<LiveViewPopUpComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel) {
    this.CameraDetails = parentData;
    this.PageTitle = 'Live View(' + this.CameraDetails.EquipmentName + ')'
    this.EquipmentTypeId = this.CameraDetails.EquipmentTypeId
    let MediaPrefix = this.dataModel.getLiveAPI()?.toString();
    var videoUrl = MediaPrefix + 'frame/' + this.CameraDetails.IpAddress + '/' + this.CameraDetails.LoginId + '/' + this.CameraDetails.LoginPassword + '';
    if (this.myWebSocket != null) {
      this.myWebSocket.close();
      this.player.destroy();
    }
    this.dataModel.delay(100).then(any => {
      this.newStream(videoUrl);
    });



  }
  ClosePoup() { this.Dialogref.close(false); }

  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      PlateNumber: new FormControl('', [Validators.required, Validators.pattern(regExps["IndianPlateNumber"])])
    });
  }

  newStream(videoUrl: string) {
    let url=encodeURIComponent('rtsp://admin:kits%402023@192.168.1.201:554/avstream/channel=1/stream=0.sdp')
    videoUrl = 'ws://localhost:5001/frame/'+url
    this.myWebSocket = new WebSocket(videoUrl);
    this.player = new JSMpeg.Player(videoUrl, {
      canvas: document.getElementById("ptz0"),
      onDisconnect: () => console.log('Connection lost!'),
    });
  }

  submit() {
    this.submitted = true
    if (this.DataDetailsForm.invalid) {
     console.log("invaild")
      return;
    }
  }
}