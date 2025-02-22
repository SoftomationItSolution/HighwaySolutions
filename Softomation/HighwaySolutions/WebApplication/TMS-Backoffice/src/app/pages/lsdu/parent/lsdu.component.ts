import { Component, OnInit, ViewChild } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';
@Component({
  selector: 'app-lsdu',
  templateUrl: './lsdu.component.html',
  styleUrls: ['./lsdu.component.css']
})
export class LSDUComponent implements OnInit {
  PermissionData:any;
  LaneData:any;
  EquipmentData:any;
  ErrorData: any;
  LogedRoleId=0;
  LogedUserId=0;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  constructor(private spinner: NgxSpinnerService,private dm: DataModel,
    private dbService: apiIntegrationService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
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
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.spinner.hide();
          this.dm.unauthorized();
        }
        else
          this.GetLaneDetails();
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  ngOnInit(): void {
   
  }

  GetLaneDetails() {
    this.dbService.LaneGetActive().subscribe(
      data => {
        let lanedata= data.ResponseData;
        this.GetEquipmentDetails(lanedata)
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  GetEquipmentDetails(lanedata:any) {
    this.dbService.EquipmentDetailsGetActive().subscribe(
      data => {
        this.spinner.hide();
        let equipmentData = data.ResponseData;
        let final_data=[]
        for (let i = 0; i < lanedata.length; i++) {
          const element = lanedata[i];
          const laneEquipment = equipmentData.filter((e: { LaneId: any; }) => e.LaneId === element.LaneId);
          element["LaneEquipment"]=laneEquipment
          final_data.push(element)
        }

       this.LaneData=final_data

      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  
}