import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { CreateIncidentComponent } from '../create-incident/create-incident.component';

@Component({
  selector: 'app-ims-pending',
  templateUrl: './ims-pending.component.html',
  styleUrls: ['./ims-pending.component.css']
})
export class ImsPendingComponent {
  DataAdd = 1;
  DataUpdate = 1;
  DataView = 1;
  LogedRoleId;
  LogedUserId;
  IMSData: any;
  ErrorData: any;
  PermissionData: any;
  SystemId = 0;
  hourFormat = 24
  TotalCount=0;
  FilterDetailsForm!: FormGroup;
  MasterData: any;
  ControlRoomData: any
  PackageFilter: any
  ChainageFilter: any;
  IncidentFilter:any;
  DirectionList = [{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }];
  PriorityList = [{ DataId: 1, DataName: 'Critical' }, { DataId: 2, DataName: 'High' }, { DataId: 3, DataName: 'Medium' }, { DataId: 4, DataName: 'Low' }];
  constructor(private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService, public datepipe: DatePipe,public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit() {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date(SDDate + " 00:00:00")),
      EndDateTime: new FormControl(new Date()),
      ControlRoomFilterList: new FormControl(''),
      PackageFilterList: new FormControl(''),
      ChainageFilterList: new FormControl(''),
      DirectionFilterList: new FormControl(''),
      IncidentFilterList: new FormControl(''),
      PriorityFilterList: new FormControl(''),
    });
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
        else {
          this.GetMasterData();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetMasterData() {
    this.dbService.FilterMasterGetBySystemId(this.SystemId).subscribe(
      data => {
        this.MasterData = data.ResponseData;
        this.ControlRoomData = this.MasterData.ControlRoomDataList;
        this.PackageFilter = this.MasterData.PackageDataList;
        this.ChainageFilter = this.MasterData.ChainageDataList;
        this.IncidentFilter = this.MasterData.IncidentDataList;
        this.GetIMSHistroy();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  

  GetIMSHistroy() {
    this.dbService.IMSGetPending(24).subscribe(
      data => {
        this.spinner.hide();
        this.IMSData = data.ResponseData;
        this.TotalCount = this.IMSData.length;
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

  NewEntry() {
    if (this.DataAdd == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '490px';
      dialogConfig.data = { action: 'Update', IncidentId: ''};
      const dialogRef = this.dialog.open(CreateIncidentComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetIMSHistroy();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onRowEditInit(TransactionRowData: any) {
    if (this.DataUpdate == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '490px';
      dialogConfig.data = { action: 'Update', IncidentId: TransactionRowData.IncidentId };
      const dialogRef = this.dialog.open(CreateIncidentComponent, dialogConfig);
      dialogRef.afterClosed().subscribe(
        data => {
          if (data) {
            this.GetIMSHistroy();
          }
        }
      );
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You dont have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  onMidiaView(TransactionRowData: any){
    var obj={
      PageTitle:"Incident media-("+TransactionRowData.IncidentId+")",
      ImageData:[{
        ImagePath:TransactionRowData.IncidentImagePath
      }],
      VideoData:[{
        VideoPath:TransactionRowData.IncidentVideoPath
      }],
      AudioData:[{
        AudioPath:TransactionRowData.IncidentAudioPath
      }]
    }
    this.dm.MediaView(obj);
  }

  ExColl(event: any) {
    document.getElementById("collapseOne").classList.toggle("show")
    if (document.getElementById("datafilterIcon").classList.contains("fa-chevron-circle-up")) {
      document.getElementById("datafilterIcon").classList.remove("fa-chevron-circle-up")
      document.getElementById("datafilterIcon").classList.add("fa-chevron-circle-down")
    }
    else {
      document.getElementById("datafilterIcon").classList.remove("fa-chevron-circle-down")
      document.getElementById("datafilterIcon").classList.add("fa-chevron-circle-up")
    }

    if (document.getElementById("tbl").classList.contains("listtablepagging-c")) {
      document.getElementById("tbl").classList.remove("listtablepagging-c")
      document.getElementById("tbl").classList.add("listtablepagging")
    }
    else {
      document.getElementById("tbl").classList.remove("listtablepagging")
      document.getElementById("tbl").classList.add("listtablepagging-c")
    }
  }

  FillPackages() {
    if (this.FilterDetailsForm.value.ControlRoomFilterList == null) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else if (this.FilterDetailsForm.value.ControlRoomFilterList.length == 0) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else if (this.FilterDetailsForm.value.ControlRoomFilterList.length == this.ControlRoomData.length) {
      this.PackageFilter = this.MasterData.PackageDataList;
    }
    else {
      var SelectedCR = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      var SelectedCRList = SelectedCR.split(',');
      var PackageData = this.MasterData.PackageDataList;
      this.PackageFilter = [];
      for (let i = 0; i < this.ControlRoomData.length; i++) {
        const crRow = this.ControlRoomData[i];
        for (let j = 0; j < SelectedCRList.length; j++) {
          if (SelectedCRList[j] == crRow.DataId.toString()) {
            var d1 = PackageData.filter((e: { ParentId: any; }) => e.ParentId == crRow.DataId);
            if (d1.length > 0) {
              for (let k = 0; k < d1.length; k++) {
                const element = d1[k];
                this.PackageFilter.push(element);
              }
            }
          }
        }
      }
    }
  }

  FillChainage() {
    if (this.FilterDetailsForm.value.PackageFilterList == null) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else if (this.FilterDetailsForm.value.PackageFilterList.length == 0) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else if (this.FilterDetailsForm.value.PackageFilterList.length == this.PackageFilter.length) {
      this.ChainageFilter = this.MasterData.ChainageDataList;
    }
    else {
      var SelectedPK = this.FilterDetailsForm.value.PackageFilterList.toString();
      var SelectedPKList = SelectedPK.split(',');
      var ChainageData = this.MasterData.ChainageDataList;
      this.ChainageFilter = [];
      for (let i = 0; i < this.PackageFilter.length; i++) {
        const pkgRow = this.PackageFilter[i];
        for (let j = 0; j < SelectedPKList.length; j++) {
          if (SelectedPKList[j] == pkgRow.DataId.toString()) {
            var d1 = ChainageData.filter((e: { DataValue: any; }) => e.DataValue >= pkgRow.MinValue && e.DataValue <= pkgRow.MaxValue);
            if (d1.length > 0) {
              for (let k = 0; k < d1.length; k++) {
                const element = d1[k];
                this.ChainageFilter.push(element);
              }
            }
          }
        }
      }
    }
  }

  SearchEntry() {
    let ControlRoomFilterList = "0"
    if (this.FilterDetailsForm.value.ControlRoomFilterList != null && this.FilterDetailsForm.value.ControlRoomFilterList != '') {
      let crData=this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      if (crData.split(',').length != this.ControlRoomData.length) {
        ControlRoomFilterList = this.FilterDetailsForm.value.ControlRoomFilterList.toString();
      }
    }

    let PackageFilterList = "0"
    if (this.FilterDetailsForm.value.PackageFilterList != null && this.FilterDetailsForm.value.PackageFilterList != '') {
      let crData=this.FilterDetailsForm.value.PackageFilterList.toString();
      if (crData.split(',').length != this.PackageFilter.length) {
        PackageFilterList = this.FilterDetailsForm.value.PackageFilterList.toString();
      }
    }

    let ChainageFilterList = "0"
    if (this.FilterDetailsForm.value.ChainageFilterList != null && this.FilterDetailsForm.value.ChainageFilterList != '') {
      let crData=this.FilterDetailsForm.value.ChainageFilterList.toString();
      if (crData.split(',').length != this.ChainageFilter.length) {
        ChainageFilterList = this.FilterDetailsForm.value.ChainageFilterList.toString();
      }
    }

    let PriorityFilterList = "0"
    if (this.FilterDetailsForm.value.PriorityFilterList != null && this.FilterDetailsForm.value.PriorityFilterList != '') {
      let crData=this.FilterDetailsForm.value.PriorityFilterList.toString();
      if (crData.split(',').length != this.PriorityList.length) {
        PriorityFilterList = this.FilterDetailsForm.value.PriorityFilterList.toString();
      }
    }

    let DirectionFilterList = "0"
    if (this.FilterDetailsForm.value.DirectionFilterList != null && this.FilterDetailsForm.value.DirectionFilterList != '') {
      let crData=this.FilterDetailsForm.value.DirectionFilterList.toString();
      if (crData.split(',').length != this.DirectionList.length) {
        DirectionFilterList = this.FilterDetailsForm.value.DirectionFilterList.toString();
      }
    }

    let IncidentFilterList = "0"
    if (this.FilterDetailsForm.value.IncidentFilterList != null && this.FilterDetailsForm.value.IncidentFilterList != '') {
      let crData=this.FilterDetailsForm.value.IncidentFilterList.toString();
      if (crData.split(',').length != this.IncidentFilter.length) {
        IncidentFilterList = this.FilterDetailsForm.value.IncidentFilterList.toString();
      }
    }
    let SD=this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED=this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    var obj= {
      IncidentStatusList:"1,8",
      ControlRoomFilterList: ControlRoomFilterList,
      PackageFilterList:PackageFilterList,
      ChainageFilterList:ChainageFilterList,
      PriorityFilterList:PriorityFilterList,
      DirectionFilterList:DirectionFilterList,
      IncidentFilterList:IncidentFilterList,
      StartDateTime:SD,
      EndDateTime:ED
    }
    this.spinner.show();
    this.dbService.IMSGetByFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.IMSData = data.ResponseData;    
        this.TotalCount = this.IMSData.length;   
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
}
