import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-role-permission-popup',
  templateUrl: './role-permission-popup.component.html',
  styleUrls: ['./role-permission-popup.component.css']
})
export class RolePermissionPopupComponent implements OnInit {
  LogedUserId;
  RoleId;
  PageTitle: any;
  ErrorData: any;
  DetailData: any;
  UpdatePermission = 0;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    @Inject(MAT_DIALOG_DATA) parentData: any, private dm: DataModel, public Dialogref: MatDialogRef<RolePermissionPopupComponent>,
    public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.RoleId = parentData.RoleId;
    this.UpdatePermission = parentData.UpdatePermission;
  }

  ngOnInit(): void {
    this.PageTitle = 'Role & Rights Permission';

    this.PermissionbyRoleId();
  }

  PermissionbyRoleId() {
    this.spinner.show();
    this.dbService.RolePermissionGetByRoleId(this.RoleId).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.DetailData = data.ResponseData;
          //console.log(this.DetailData)
        } else {
          this.ClosePoup();
          this.ErrorData = [{ AlertMessage: 'permission details not found.' }];
          this.dm.openSnackBar(this.ErrorData, false);

        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  handleCheck(event: any, rowData: any, eventfor: any) {
    let result = this.DetailData.filter((e: any) => e.EventId == rowData.EventId);
    if (eventfor == 1) {
      if (!event) {
        result[0].DataView = 0;
        if (result.length > 0) {
          if (result[0].DataAdd != 2) {
            result[0].DataAdd = 0;
          }
          if (result[0].DataUpdate != 2) {
            result[0].DataUpdate = 0;
          }
        }
      } else {
        result[0].DataView = 1;
      }
    } else if (eventfor == 2) {
      if (event) {
        result[0].DataAdd = 1;
        if (result.length > 0) {
          if (result[0].DataView != 2) {
            result[0].DataView = 1;
          }
        }
      } else {
        result[0].DataAdd = 0;
      }
    } else if (eventfor == 3) {
      if (event) {
        result[0].DataUpdate = 1;
        if (result.length > 0) {
          if (result[0].DataView != 2) {
            result[0].DataView = 1;
          }
        }
      } else {
        result[0].DataUpdate = 0;
      }
    }
  }
  SaveDetails() {
    this.spinner.show();
    for (let index = 0; index < this.DetailData.length; index++) {
      if (this.DetailData[index].DataView != 2) {
        if (this.DetailData[index].DataView) {
          this.DetailData[index].DataView = 1;
        } else {
          this.DetailData[index].DataView = 0;
        }
      }

      if (this.DetailData[index].DataAdd != 2) {
        if (this.DetailData[index].DataAdd) {
          this.DetailData[index].DataAdd = 1;
        } else {
          this.DetailData[index].DataAdd = 0;
        }
      }

      if (this.DetailData[index].DataUpdate != 2) {
        if (this.DetailData[index].DataUpdate) {
          this.DetailData[index].DataUpdate = 1;
        } else {
          this.DetailData[index].DataUpdate = 0;
        }
      }

    }
    const Obj = {
      RoleId: this.RoleId,
      CreatedBy: this.LogedUserId,
      DataStatus: 1,
      RolePermission: this.DetailData
    };
    this.dbService.RolePermissionSetup(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.ClosePoup();
        } else {
          this.ErrorData = data;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ClosePoup() { this.Dialogref.close(); }

}
