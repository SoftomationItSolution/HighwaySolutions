import { Component, OnInit } from '@angular/core';
import { TreeDragDropService } from 'primeng/api';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { takeUntil } from 'rxjs';
@Component({
  selector: 'app-vids-equipment-config',
  templateUrl: './vids-equipment-config.component.html',
  styleUrls: ['./vids-equipment-config.component.css'],
  providers: [TreeDragDropService]
})
export class VidsEquipmentConfigComponent implements OnInit {
  availableData: any = [];
  selection: any;
  fillData: any = [];
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
              }
              childs.push(onjChild);
            }
            let obj = {
              key: j,
              label: element.EquipmentTypeName,
              children: childs
            }
            this.availableData.push(obj)
          }
        }
        console.log(this.availableData)
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
    console.log(val);

  }

  SaveChanges() {

  }
  onNodeDrop(event) {
    event.preventDefault();
        event.stopPropagation();
    //this.draghoverNode = false;
}
onNodeDrop1(event:any){
    if(event.dragNode.parent==undefined){
      event.rejected()
      return false;
    }
    else{
      event.accept()
      return true;
    }
  }
}
