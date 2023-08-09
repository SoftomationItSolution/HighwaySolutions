import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { LanePopupComponent } from '../lane-popup/lane-popup.component';
declare var $: any;
@Component({
  selector: 'app-lane-data',
  templateUrl: './lane-data.component.html',
  styleUrls: ['./lane-data.component.css']
})
export class LaneDataComponent implements OnInit {
  DevicesData: any;
  ErrorData: any;
  LogedRoleId;
  PermissionData;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  ApplicationType = 1;
  LogedClientId;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService) {
      this.ApplicationType =  parseInt(this.emitService.getApplicationType());
      this.LogedRoleId =  this.emitService.getRoleDetails();
      this.LogedClientId =  this.emitService.getClientId();
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
      this.GetPermissionData();
     }

     GetPermissionData() {
      this.spinner.show();
      const Obj = {
        EventId: 5,
        RoleId: this.LogedRoleId
      };
      this.dbService.RolePermissionGetByEventId(Obj).subscribe(
        data => {
          this.spinner.hide();
          this.PermissionData = data.ResponceData;
          this.DataAdd = this.PermissionData.DataAdd;
          this.DataUpdate = this.PermissionData.DataUpdate;
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

  ngOnInit(): void {

  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 175);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 175);
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.LaneConfigurationGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.DevicesData = data.ResponceData;
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
    dialogConfig.data = { action: 'Save', EntryId: 0, PermissionData: this.PermissionData};
    this.dialog.open(LanePopupComponent, dialogConfig);
  }
  onRowEditInit(data) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'Update', EntryId: data.EntryId, PermissionData: this.PermissionData};
    this.dialog.open(LanePopupComponent, dialogConfig);
  }

}
