import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService, SelectItem } from 'primeng/api';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';
declare var $: any;
@Component({
  selector: 'app-gantry-mapping',
  templateUrl: './gantry-mapping.component.html',
  styleUrls: ['./gantry-mapping.component.css']
})
export class GantryMappingComponent implements OnInit {
  DevicesData: any;
  CloneData = [];
  statuses: SelectItem[];
  ErrorData: any;
  LastValue = 0;
  LogedUserId;
  LogedRoleId;
  PermissionData;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  public innerHeight: any;
  constructor(public dialog: MatDialog, private dbService: ApiService, private emitService: EmittersService,
              private spinner: NgxSpinnerService, private confirmationService: ConfirmationService) {
    this.LogedRoleId =  this.emitService.getRoleDetails();
    this.LogedUserId = this.emitService.getUserDetails();
    this.GetPermissionData();
    this.emitService.InnerHeight.subscribe(
      (innerHeight: any) => {
        this.innerHeight = innerHeight;
        this.SetPageHeight();
      });
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      EventId: 3,
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
    this.statuses = [{label: 'Active', value: 1}, {label: 'Inactive', value: 2}];

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
    this.dbService.GantryMappingGetAll().subscribe(
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

  onRowEditInit(rowData, index) {
    if (this.CloneData.length == 0) {
      this.CloneData.push({ index: index, LastValue: rowData.GantryDistance, LastStatus: rowData.DataStatus });
    } else {
      let result = this.CloneData.filter(e => e.index == index);
      if (result.length > 0) {
        this.CloneData.splice(result[0], 1);
      }
      this.CloneData.push({ index: index, LastValue: rowData.GantryDistance, LastStatus: rowData.DataStatus });
    }


  }

  onRowEditSave(rowData, index) {
    this.ValidateRow(rowData, index);
  }

  onRowEditCancel(rowData, index: number) {
    let result = this.CloneData.filter(e => e.index == index);
    if (result.length > 0) {
      this.DevicesData[index].GantryDistance = result[0].LastValue;
      this.DevicesData[index].DataStatus = result[0].LastStatus;
      this.CloneData.splice(result[0], 1);
    }

  }

  ValidateRow(rowData, index) {
    if (rowData.GantryDistance > 0) {
      rowData.CreatedBy = this.LogedUserId;
      rowData.ModifiedBy = this.LogedUserId;
      this.spinner.show();
      this.dbService.GantryMappingValidateSetUp(rowData).subscribe(
        data => {
          this.spinner.hide();
          if (data.Message.length == 0) {
            this.UpdateRow(rowData, index);
          } else {
            this.confirm(rowData, index, data.Message[0].AlertMessage);
          }
        },
        (error) => {
          this.spinner.hide();
          let result = this.CloneData.filter(e => e.index == index);
          if (result.length > 0) {
            this.DevicesData[index].GantryDistance = result[0].LastValue;
            this.DevicesData[index].DataStatus = result[0].LastStatus;
            this.CloneData.splice(result[0], 1);
          }
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      );
    } else {
      let result = this.CloneData.filter(e => e.index == index);
      if (result.length > 0) {
        this.DevicesData[index].GantryDistance = result[0].LastValue;
        this.DevicesData[index].DataStatus = result[0].LastStatus;
        this.CloneData.splice(result[0], 1);
      }
      this.ErrorData = [{ AlertMessage: 'Invalid distance' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
  UpdateRow(rowData, index) {
    if (rowData.GantryDistance > 0) {
      rowData.CreatedBy = this.LogedUserId;
      rowData.ModifiedBy = this.LogedUserId;
      this.spinner.show();
      this.dbService.GantryMappingSetUp(rowData).subscribe(
        data => {
          this.spinner.hide();
          let result = this.CloneData.filter(e => e.index == index);
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.GetAllData();
            if (result.length > 0) {
              this.CloneData.splice(result[0], 1);
            }
            this.ErrorData = [{ AlertMessage: 'Success' }];
            this.emitService.openSnackBar(this.ErrorData, true);
          } else {
            if (result.length > 0) {
              this.DevicesData[index].GantryDistance = result[0].LastValue;
              this.DevicesData[index].DataStatus = result[0].LastStatus;
              this.CloneData.splice(result[0], 1);
            }
            this.ErrorData = data.Message;
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        },
        (error) => {
          this.spinner.hide();
          let result = this.CloneData.filter(e => e.index == index);
          if (result.length > 0) {
            this.DevicesData[index].GantryDistance = result[0].LastValue;
            this.DevicesData[index].DataStatus = result[0].LastStatus;
            this.CloneData.splice(result[0], 1);
          }
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      );
    } else {
      let result = this.CloneData.filter(e => e.index == index);
      if (result.length > 0) {
        this.DevicesData[index].GantryDistance = result[0].LastValue;
        this.DevicesData[index].DataStatus = result[0].LastStatus;
        this.CloneData.splice(result[0], 1);
      }
      this.ErrorData = [{ AlertMessage: 'Invalid distance' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
  confirm(rowData, index, responce) {
    this.confirmationService.confirm({
        message: responce + ', Are you sure that you want to perform this action?',
        accept: () => {
          this.UpdateRow(rowData, index);
        },
        reject: () => {
          let result = this.CloneData.filter(e => e.index == index);
          if (result.length > 0) {
            this.DevicesData[index].GantryDistance = result[0].LastValue;
            this.DevicesData[index].DataStatus = result[0].LastStatus;
            this.CloneData.splice(result[0], 1);
          }
        }

    });
}

}
