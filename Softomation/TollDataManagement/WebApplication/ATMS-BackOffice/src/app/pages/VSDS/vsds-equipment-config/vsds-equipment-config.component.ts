import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-vsds-equipment-config',
  templateUrl: './vsds-equipment-config.component.html',
  styleUrls: ['./vsds-equipment-config.component.css']
})
export class VsdsEquipmentConfigComponent implements OnInit {
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
  SystemId = 0;
  LaneList:any;
  PositionList = [{ DataId: 3, DataName: "Main Carriageway" }, { DataId: 4, DataName: "Parking Spot" }]

  constructor(private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit(): void {
    this.SystemGetByName()
  }

  SystemGetByName() {
    this.spinner.show();
    let MenuUrl = window.location.pathname.replace('/', '');
    let systenname = MenuUrl.substring(0, 4)
    this.dbService.SystemGetByName(systenname).subscribe(
      data => {
        let SystemDetails = data.ResponseData;
        this.SystemId = SystemDetails.SystemId;
        this.GetPermissionData();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  
  GetPermissionData() {
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
      SystemId: this.SystemId,
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
        else {
          this.GetLane();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetLane() {
    this.dbService.LaneGetActive().subscribe(
      data => {
        this.LaneList = data.ResponseData;
        this.EquipmentType();
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
 
  EquipmentType() {
    this.dbService.EquipmentTypeGetActive().subscribe(
      data => {
        var dataType = data.ResponseData;
        dataType = dataType.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 3 || e.EquipmentTypeId == 5 || e.EquipmentTypeId == 7 || e.EquipmentTypeId == 17||e.EquipmentTypeId == 26 || e.EquipmentTypeId == 27 || e.EquipmentTypeId == 28);
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



  GetEquipmentConfig() {
    this.dbService.EquipmentConfigGetBySystemId(this.SystemId).subscribe(
      data => {
        this.spinner.hide();
        var dataType = data.ResponseData;
        for (let k = 0; k < dataType.length; k++) {
          const element = dataType[k];
          let obj = {
            EquipmentName: element.EquipmentName,
            IpAddress: element.IpAddress,
            EquipmentTypeId: element.EquipmentTypeId,
            EquipmentTypeName: element.EquipmentTypeName,
            ChainageName: element.ChainageName,
            EquipmentId: element.EquipmentId,
            PositionId: element.PositionId,
            LaneNumberId: element.LaneNumberId,
            DirectionId:element.DirectionId,
            DirectionName:element.DirectionName,
          }
          this.fillData.push(obj)
        }
        this.ResetNodes();
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
    this.dbService.EquipmentDetailsGetBySystemId(this.SystemId).subscribe(
      data => {
        this.GetEquipmentConfig();
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
                EquipmentName: element1.EquipmentName,
                IpAddress: element1.IpAddress,
                EquipmentTypeId: element1.EquipmentTypeId,
                EquipmentTypeName: element1.EquipmentTypeName,
                ChainageName: element1.ChainageName,
                EquipmentId: element1.EquipmentId,
                DirectionId:element1.DirectionId,
                DirectionName:element1.DirectionName,
                PositionId: 0
              }
              childs.push(onjChild);
            }
            let obj = {
              key: j,
              EquipmentName: element.EquipmentName,
              IpAddress: element.IpAddress,
              EquipmentTypeId: element.EquipmentTypeId,
              EquipmentTypeName: element.EquipmentTypeName,
              DirectionId:element.DirectionId,
              DirectionName:element.DirectionName,
              children: childs,
              PositionId: 0
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

  onDragStart(val: any) {
    this.selection = val;
    console.log(val)

  }
  onDragEnd() {
    this.selection = null;
  }

  onNodeDrop() {
    if (this.fillData.length == 0) {
      if (this.selection.EquipmentTypeId != 28) {
        this.ErrorData = [{ AlertMessage: 'Media converter is required!' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
      else {
        this.fillData.push(this.selection);
      }
    }
    else {
      var d1 = this.fillData.filter((e: { EquipmentId: any; }) => e.EquipmentId == this.selection.EquipmentId);
      if (d1.length > 0) {
        this.ErrorData = [{ AlertMessage: 'This equipment already exists!' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
      else {
        if (this.selection.EquipmentTypeId != 28) {
          var d3 = this.fillData.filter((e: { ChainageName: any, EquipmentTypeId: any,DirectionId:any,IpAddress:any; }) => e.ChainageName == this.selection.ChainageName && e.DirectionId == this.selection.DirectionId  && e.EquipmentTypeId == 28);
          if (d3.length == 0) {
            this.ErrorData = [{ AlertMessage: 'Media converter is required!' }];
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
    this.FillFinalData = [];
    var child0 = []
    var p0 = this.fillData.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 28);
    if (p0.length > 0) {
      for (let j = 0; j < p0.length; j++) {
        child0.push(p0[j])
        let element1 = p0[j]
        var NetworkSwitchList = [];
        var p1 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any,DirectionId:any; }) => e.EquipmentTypeId == 17 && e.ChainageName == element1.ChainageName && e.DirectionId == element1.DirectionId);
        if (p1.length > 0) {
          for (let j = 0; j < p1.length; j++) {
            NetworkSwitchList.push(p1[j])
          }
        }
        var LPUList = [];
        var p1 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any,DirectionId:any; }) => e.EquipmentTypeId == 3 && e.ChainageName == element1.ChainageName && e.DirectionId == element1.DirectionId);;
        if (p1.length > 0) {
          for (let j = 0; j < p1.length; j++) {
            LPUList.push(p1[j])
          }
        }
        var RadarList = [];
        var p1 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any,DirectionId:any; }) => e.EquipmentTypeId == 5 && e.ChainageName == element1.ChainageName && e.DirectionId == element1.DirectionId);
        if (p1.length > 0) {
          for (let j = 0; j < p1.length; j++) {
            RadarList.push(p1[j])
          }
        }
        var SpeedDisplayList = [];
        var p1 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any,DirectionId:any; }) => e.EquipmentTypeId == 7 && e.ChainageName == element1.ChainageName && e.DirectionId == element1.DirectionId);
        if (p1.length > 0) {
          for (let j = 0; j < p1.length; j++) {
            SpeedDisplayList.push(p1[j])
          }
        }
        var CameraList = [];
        var p2 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any,DirectionId:any; }) => e.EquipmentTypeId == 26 && e.ChainageName == element1.ChainageName && e.DirectionId == element1.DirectionId);
        if (p2.length > 0) {
          for (let j = 0; j < p2.length; j++) {
            CameraList.push(p2[j])
          }
        }
        var MDSList = [];
        var p3 = this.fillData.filter((e: { EquipmentTypeId: any, ChainageName: any; }) => e.EquipmentTypeId == 27 && e.ChainageName == element1.ChainageName);
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
          IpAddress: element1.IpAddress,
          DirectionId:element1.DirectionId,
          DirectionName:element1.DirectionName,
          NetworkSwitchList:NetworkSwitchList,
          LPUList: LPUList,
          RadarList:RadarList,
          SpeedDisplayList:SpeedDisplayList,
          CameraList: CameraList,
          MDSList: MDSList,
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

  SaveDetails() {
    if (this.FillFinalData.length == 0) {
      this.ErrorData = [{ AlertMessage: 'Add equipment in config details!' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    else {
      var FinalData = [];
      for (let k = 0; k < this.FillFinalData.length; k++) {
        let element = this.FillFinalData[k];
        let obj = {
          SystemId: this.SystemId,
          EquipmentId: element.EquipmentId,
          EquipmentTypeId: element.EquipmentTypeId,
          ParentId: 0,
          PositionId: 0,
          CreatedBy: this.LogedUserId,
          ModifiedBy: this.LogedUserId,
        }
        FinalData.push(obj);
        for (let j = 0; j < element.NetworkSwitchList.length; j++) {
          let Lelement = element.NetworkSwitchList[j];
          let Lobj = {
            SystemId: this.SystemId,
            EquipmentId: Lelement.EquipmentId,
            EquipmentTypeId: Lelement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Lelement.PositionId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Lobj);
        }
        for (let j = 0; j < element.LPUList.length; j++) {
          let Lelement = element.LPUList[j];
          let Lobj = {
            SystemId: this.SystemId,
            EquipmentId: Lelement.EquipmentId,
            EquipmentTypeId: Lelement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Lelement.PositionId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Lobj);
        }
        for (let j = 0; j < element.RadarList.length; j++) {
          let Lelement = element.RadarList[j];
          let Lobj = {
            SystemId: this.SystemId,
            EquipmentId: Lelement.EquipmentId,
            EquipmentTypeId: Lelement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Lelement.PositionId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Lobj);
        }
        for (let m = 0; m < element.CameraList.length; m++) {
          let Celement = element.CameraList[m];
          let Cobj = {
            SystemId: this.SystemId,
            EquipmentId: Celement.EquipmentId,
            EquipmentTypeId: Celement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Celement.PositionId,
            LaneNumberId: Celement.LaneNumberId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Cobj);
        }
        for (let m = 0; m < element.SpeedDisplayList.length; m++) {
          let Celement = element.SpeedDisplayList[m];
          let Cobj = {
            SystemId: this.SystemId,
            EquipmentId: Celement.EquipmentId,
            EquipmentTypeId: Celement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Celement.PositionId,
            LaneNumberId: Celement.LaneNumberId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Cobj);
        }
        for (let n = 0; n < element.MDSList.length; n++) {
          let Melement = element.MDSList[n];
          let Mobj = {
            SystemId: this.SystemId,
            EquipmentId: Melement.EquipmentId,
            EquipmentTypeId: Melement.EquipmentTypeId,
            ParentId: element.EquipmentId,
            PositionId: Melement.PositionId,
            CreatedBy: this.LogedUserId,
            ModifiedBy: this.LogedUserId,
          }
          FinalData.push(Mobj);
        }
      }

      this.spinner.show();
      this.dbService.EquipmentConfigSetup(FinalData).subscribe(
        data => {
          this.spinner.hide();
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.ErrorData = [{ AlertMessage: 'Success' }];
            this.dm.openSnackBar(this.ErrorData, true);
          } else {
            this.ErrorData = data.Message;
            this.dm.openSnackBar(this.ErrorData, false);
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
  }
}
