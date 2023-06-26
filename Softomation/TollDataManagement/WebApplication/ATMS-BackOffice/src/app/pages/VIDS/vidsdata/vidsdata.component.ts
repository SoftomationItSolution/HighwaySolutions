import { Component } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { DataModel } from 'src/app/services/data-model.model';


@Component({
  selector: 'app-vidsdata',
  templateUrl: './vidsdata.component.html',
  styleUrls: ['./vidsdata.component.css']
})
export class VidsdataComponent {
  DataAdd=1;
  DataUpdate=1;
  DataView=1;
  LogedRoleId;
  LogedUserId;
  DevicesData:any;
  ErrorData:any;
  PermissionData:any;
  constructor(public dialog: MatDialog, private dbService: ApiService,private dm: DataModel,
    private spinner: NgxSpinnerService) {
      this.LogedUserId = this.dm.getUserId();
      this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit() {
   this.GetPermissionData();
  }

  GetDeviceData() {
    this.spinner.show();
    this.dbService.VIDSGetLatest().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponceData;
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

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 10,
      RoleId: this.LogedRoleId
    }
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponceData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if(this.DataView != 1){
          this.dm.unauthorized();
        }
        this.GetDeviceData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
    }

  NewEntry() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = "60%";
    dialogConfig.height = '450px';
    dialogConfig.data = { "action": 'Update'}
    //this.dialog.open(METConfigPopupComponent, dialogConfig);
  }

  onRowEditInit(TransactionRowData:any) {
    // const dialogConfig = new MatDialogConfig();
    // dialogConfig.disableClose = true;
    // dialogConfig.autoFocus = true;
    // dialogConfig.width = "60%";
    // dialogConfig.data = { "action": 'Update', "EntryId": TransactionRowData.EntryId, "Permission": this.DataUpdate }
    // this.dialog.open(VMSPopupComponent, dialogConfig);
  }
}
