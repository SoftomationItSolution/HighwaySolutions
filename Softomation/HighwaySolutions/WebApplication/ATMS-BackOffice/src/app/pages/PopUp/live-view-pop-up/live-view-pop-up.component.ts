import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DataModel } from 'src/app/services/data-model.model';
declare var JSMpeg: any;
@Component({
  selector: 'app-live-view-pop-up',
  templateUrl: './live-view-pop-up.component.html',
  styleUrls: ['./live-view-pop-up.component.css']
})
export class LiveViewPopUpComponent {
  PageTitle: string = 'Live View'
  CameraDetails: any
  myWebSocket: any = null;
  player: any = null;
  constructor(public Dialogref: MatDialogRef<LiveViewPopUpComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any,public dataModel: DataModel) {
    this.CameraDetails = parentData;
    let MediaPrefix = this.dataModel.getLiveAPI()?.toString();

    var videoUrl = MediaPrefix+'frame/' + this.CameraDetails.IpAddress + '/' + this.CameraDetails.LoginId + '/' + this.CameraDetails.Password + '';
    if (this.myWebSocket != null) {
      this.myWebSocket.close();
      this.player.destroy();
    }
    this.dataModel.delay(100).then(any => {
      this.newStream(videoUrl);
    });
  }
  ClosePoup() { this.Dialogref.close(false); }

  newStream(videoUrl: string) {
    this.myWebSocket = new WebSocket(videoUrl);
    this.player = new JSMpeg.Player(videoUrl, {
      canvas: document.getElementById("ptz0"),
      onDisconnect: () => console.log('Connection lost!'),
    });
  }
}
