import { Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-vidsdata',
  templateUrl: './vidsdata.component.html',
  styleUrls: ['./vidsdata.component.css']
})
export class VidsdataComponent {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  LogedRoleId;
  LogedUserId;
  EventHistroyData: any;
  ErrorData: any;
  PermissionData: any;
  constructor(private dbService: apiIntegrationService, private dm: DataModel, private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit() {
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: 0,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByMenu(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.dm.unauthorized();
        }
        this.GetEventHistroy();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetEventHistroy() {
    this.spinner.show();
    this.dbService.VIDSEventsGetByHours(24).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: "Something went wrong." }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  onMidiaView(TransactionRowData: any){
    var obj={
      PageTitle:"VIDS Event media-("+TransactionRowData.EventTypeName+")",
      ImageData:[{
        ImagePath:TransactionRowData.EventImageUrl
      }],
      VideoData:[{
        VideoPath:TransactionRowData.EventVideoUrl
      }],
      AudioData:[{
        AudioPath:''
      }]
    }
    this.dm.MediaView(obj);
  }

  ExColl(event:any){
    document.getElementById("collapseOne").classList.toggle("show")
}
}
