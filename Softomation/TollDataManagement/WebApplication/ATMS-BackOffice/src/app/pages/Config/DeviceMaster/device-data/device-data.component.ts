import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { DevicePopupComponent } from '../device-popup/device-popup.component';
declare var $: any;
@Component({
  selector: 'app-device-data',
  templateUrl: './device-data.component.html',
  styleUrls: ['./device-data.component.css']
})
export class DeviceDataComponent implements OnInit {
  MapStatus = true;
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  DevicesData: any;
  ErrorData: any;
  PermissionData: any;
  LogedRoleId;
  ConrtolRoomId = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private emitService: EmittersService, private dbService: ApiService,
              private spinner: NgxSpinnerService) {
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.emitService.PageRefresh.subscribe(
        (visibility: boolean) => {
          if (visibility) {
            this.GetAllData();
          }
        });

      this.emitService.InnerHeight.subscribe(
        (innerHeight: any) => {
          this.innerHeight = innerHeight;
          this.SetPageHeight();
        });
  }
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 190);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 190);
  }
  ngOnInit() {
    this.GetPermissionData();

  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }
  GetAllData() {
    this.spinner.show();
    this.dbService.DevicesMasterGetByControlRoom(this.ConrtolRoomId).subscribe(
      data => {
        this.DevicesData = data.ResponceData;
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.emitService.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 2,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponceData;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.emitService.unauthorized();
        }
        this.GetAllData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  NewEntry() {
  const dialogConfig = new MatDialogConfig();
  dialogConfig.disableClose = true;
  dialogConfig.autoFocus = true;
  dialogConfig.width = '60%';
  dialogConfig.height = '450px';
  dialogConfig.data = { action: 'Save', EntryId: 0, PermissionData: this.PermissionData};
  this.dialog.open(DevicePopupComponent, dialogConfig);
  }

  onRowEditInit(TransactionRowData:any) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.height = '450px';
    dialogConfig.data = { action: 'Update', EntryId: TransactionRowData.EntryId, PermissionData: this.PermissionData};
    this.dialog.open(DevicePopupComponent, dialogConfig);
  }


}
