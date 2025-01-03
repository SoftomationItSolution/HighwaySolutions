import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-incident-history',
  templateUrl: './incident-history.component.html',
  styleUrls: ['./incident-history.component.css']
})
export class IncidentHistoryComponent {
  PageTitle: string = "Incident Action Histroy";
  dataDetails: any;
  IncidentId:any;
  ErrorData: any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    @Inject(MAT_DIALOG_DATA) parentData: any, private dm: DataModel, public Dialogref: MatDialogRef<IncidentHistoryComponent>,
    public dialog: MatDialog) {
    this.IncidentId= parentData.IncidentId;
    this.PageTitle = this.PageTitle + "(" + this.IncidentId + ")";
    this.DetailsbyId();
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.IMSGetById(this.IncidentId).subscribe(
      data => {
        this.spinner.hide();
        this.dataDetails = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
        this.Dialogref.close();
      }
    );
  }

  ClosePoup() { this.Dialogref.close(); }

  onMidiaView(TransactionRowData: any){
    var obj={
      PageTitle:"Incident action media-("+TransactionRowData.ActionStatusName+")",
      ImageData:[{
        ImagePath:TransactionRowData.ActionImagePath
      }],
      VideoData:[{
        VideoPath:TransactionRowData.ActionVideoPath
      }],
      AudioData:[{
        AudioPath:TransactionRowData.ActionAudioPath
      }]
    }
    this.dm.MediaView(obj);
  }
}
