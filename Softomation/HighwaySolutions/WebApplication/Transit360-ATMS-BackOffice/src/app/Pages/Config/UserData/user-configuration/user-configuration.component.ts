import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { UserConfigurationPopupComponent } from '../user-configuration-popup/user-configuration-popup.component';
declare var $: any;
@Component({
  selector: 'app-user-configuration',
  templateUrl: './user-configuration.component.html',
  styleUrls: ['./user-configuration.component.css']
})
export class UserConfigurationComponent implements OnInit {
  DevicesData: any;
  ErrorData: any;
  LogedRoleId;
  PermissionData;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: ApiService, private emitService: EmittersService,
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
      this.GetPermissionData();
     }

     GetPermissionData() {
      this.spinner.show();
      const Obj = {
        EventId: 11,
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
  SetPageHeight() {
    $('.table-height-master .p-datatable-scrollable-body').css('max-height', (this.innerHeight) - 175);
    $('.table-height-master .p-datatable-scrollable-body').css('min-height', (this.innerHeight) - 175);
  }
  ngAfterViewInit(): void {
    this.innerHeight = this.emitService.getInnerHeight();
    this.SetPageHeight();
  }
  GetAllData() {
    this.spinner.show();
    this.dbService.UserConfigurationGetAll().subscribe(
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
    dialogConfig.data = { action: 'Save', EntryId: 0};
    this.dialog.open(UserConfigurationPopupComponent, dialogConfig);
  }
  onRowEditInit(data) {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '60%';
    dialogConfig.data = { action: 'Update', EntryId: data.EntryId};
    this.dialog.open(UserConfigurationPopupComponent, dialogConfig);
  }

}
