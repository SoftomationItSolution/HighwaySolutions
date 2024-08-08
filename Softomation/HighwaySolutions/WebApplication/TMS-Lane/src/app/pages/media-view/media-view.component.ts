import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-media-view',
  templateUrl: './media-view.component.html',
  styleUrls: ['./media-view.component.css']
})
export class MediaViewComponent {
  PageTitle: string = "Media View"
  finalData: any = [];
  className = "col-md-";
  constructor(public Dialogref: MatDialogRef<MediaViewComponent>, @Inject(MAT_DIALOG_DATA)
  parentData: any,private dm: DataModel) {
    let MediaPrefix = this.dm.getMediaAPI()?.toString();
    this.PageTitle = parentData.PageTitle;
   
    for (let i = 0; i < parentData.AudioData.length; i++) {
      if (parentData.AudioData[i].AudioPath != '') {
        var obj = {
          type: "audio",
          path: MediaPrefix+parentData.AudioData[i].AudioPath,
          name:parentData.AudioData[i].Name
        }
        this.finalData.push(obj)
      }
    }
    for (let i = 0; i < parentData.ImageData.length; i++) {
      if (parentData.ImageData[i].ImagePath != ''){
        var obj1 = {
          type: "image",
          path: MediaPrefix+parentData.ImageData[i].ImagePath,
          name:parentData.ImageData[i].Name
        }
        this.finalData.push(obj1)
      }
    }
    for (let i = 0; i < parentData.VideoData.length; i++) {
      if (parentData.VideoData[i].VideoPath != ''){
        var obj2 = {
          type: "video",
          path: MediaPrefix+parentData.VideoData[i].VideoPath,
          name:parentData.VideoData[i].Name
        }
        this.finalData.push(obj2)
      }
    }
   
    this.className = this.className + (12 /this.finalData.length).toString();
  }
  ClosePoup() { this.Dialogref.close(); }
}
