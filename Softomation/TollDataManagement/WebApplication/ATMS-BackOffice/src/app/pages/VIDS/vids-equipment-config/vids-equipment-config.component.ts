import { Component, OnInit } from '@angular/core';
import { TreeDragDropService } from 'primeng/api';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vids-equipment-config',
  templateUrl: './vids-equipment-config.component.html',
  styleUrls: ['./vids-equipment-config.component.css'],
  providers: [TreeDragDropService]
})
export class VidsEquipmentConfigComponent implements OnInit {
  availableData: any = [];
  selection: any = null;
  fillData: any = [];
  FillFinalData: any = [];
  ErrorData: any;
  PermissionData: any;
  DevicesData: any;
  LogedRoleId;
  LogedUserId;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  EquipmentTypeData: any;
  EquipmentDetails: any;
  SystemId = 6;
  PositionList=[{ID:1,Name:"Entry"},{ID:2,Name:"Exit"},{ID:3,Name:"Main Carriageway"},{ID:4,Name:"Parking Spot"}]
  constructor(private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.GetPermissionData();
  }

  ngOnInit(): void {
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuId: 3,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.PermissionData = data.ResponseData;
        this.DataAdd = this.PermissionData.DataAdd;
        this.DataUpdate = this.PermissionData.DataUpdate;
        this.DataView = this.PermissionData.DataView;
        if (this.DataView != 1) {
          this.dm.unauthorized();
        }
        this.EquipmentType();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  EquipmentType() {
    this.spinner.show();
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        this.spinner.hide();
        var dataType = data.ResponseData;
        dataType = dataType.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 3 || e.EquipmentTypeId == 25 || e.EquipmentTypeId == 27 || e.EquipmentTypeId == 28);
        this.GetEquipmentDetails(dataType);
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
      }
    );
  }

  GetEquipmentDetails(dataType: any) {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetBySystemId(this.SystemId).subscribe(
      data => {
        this.spinner.hide();
        this.EquipmentDetails = data.ResponseData;
        for (let j = 0; j < dataType.length; j++) {
          const element = dataType[j];
          var d1 = this.EquipmentDetails.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == element.EquipmentTypeId);
          if (d1.length > 0) {
            var childs = [];
            for (let k = 0; k < d1.length; k++) {
              const element1 = d1[k];
              let onjChild = {
                key: j + '-' + k,
                label: element1.EquipmentName + "-(" + element1.IpAddress + "-" + element1.ChainageName + ")",
                EquipmentTypeId: element1.EquipmentTypeId,
                ChainageName: element1.ChainageName,
                EquipmentId: element1.EquipmentId,
                PositionId:0
              }
              childs.push(onjChild);
            }
            let obj = {
              key: j,
              label: element.EquipmentTypeName,
              children: childs,
              PositionId:0
            }
            this.availableData.push(obj)
          }
        }
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
      }
    );
  }



  SaveDetails() {

  }


  onDragStart(val: any) {
    this.selection = val;

  }

  onDragEnd() {
    this.selection = null;
  }
  onNodeDrop() {
    if (this.fillData.length == 0) {
      if (this.selection.EquipmentTypeId != 28) {
        this.ErrorData = [{ AlertMessage: 'First Need to add Media Converter !' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
      else {
        this.fillData.push(this.selection);
      }
    }
    else {
      var d1 = this.fillData.filter((e: { EquipmentId: any; }) => e.EquipmentId == this.selection.EquipmentId);
      if (d1.length > 0) {
        this.ErrorData = [{ AlertMessage: 'This Equipment already exists !' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
      else {
        if (this.selection.EquipmentTypeId != 28) {
          var d3 = this.fillData.filter((e: { ChainageName: any, EquipmentTypeId: any; }) => e.ChainageName == this.selection.ChainageName && e.EquipmentTypeId == 28);
          if (d3.length == 0) {
            this.ErrorData = [{ AlertMessage: 'First Need to add Media Converter !' }];
            this.dm.openSnackBar(this.ErrorData, false);
          }
          else
            this.fillData.push(this.selection);
        }
        else
          this.fillData.push(this.selection);
      }
    }
    this.ResetNodes();

  }
  ResetNodes() {
    this.FillFinalData=[];
    var child0 = []
      var p0 = this.fillData.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 28);
      if (p0.length > 0) {
        for (let j = 0; j < p0.length; j++) {
          child0.push(p0[j])
          let element1=p0[j]
          
          var LPUList=[];
          var p1 = this.fillData.filter((e: { EquipmentTypeId: any,ChainageName:any; }) => e.EquipmentTypeId == 3 && e.ChainageName==element1.ChainageName);
          if (p1.length > 0) {
            for (let j = 0; j < p1.length; j++) {
              LPUList.push(p1[j])
            }
          }
          var CameraList=[];
          var p2 = this.fillData.filter((e: { EquipmentTypeId: any,ChainageName:any; }) => e.EquipmentTypeId == 25 && e.ChainageName==element1.ChainageName);
          if (p2.length > 0) {
            for (let j = 0; j < p2.length; j++) {
              CameraList.push(p2[j])
            }
          }
          var MDSList=[];
          var p3 = this.fillData.filter((e: { EquipmentTypeId: any,ChainageName:any; }) => e.EquipmentTypeId == 27 && e.ChainageName==element1.ChainageName);
          if (p3.length > 0) {
            for (let j = 0; j < p3.length; j++) {
              MDSList.push(p3[j])
            }
          }

          let mainObj = {
            key: j,
            label: element1.label,
            EquipmentTypeId: element1.EquipmentTypeId,
            ChainageName: element1.ChainageName,
            EquipmentId: element1.EquipmentId,
            LPUList:LPUList,
            CameraList:CameraList,
            MDSList:MDSList,
          }
          this.FillFinalData.push(mainObj)
        }
      }  
     
      console.log(this.FillFinalData)
  }

  childExCol(event) {
    event.target.parentNode.querySelector(".nested").classList.toggle("nested-active")
    event.target.classList.toggle("parentNode-down")
  }

  handleCheck(event:any,row){
    
  }
}
