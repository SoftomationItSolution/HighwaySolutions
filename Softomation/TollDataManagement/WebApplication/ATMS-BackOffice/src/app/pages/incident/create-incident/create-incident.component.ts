import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-create-incident',
  templateUrl: './create-incident.component.html',
  styleUrls: ['./create-incident.component.css']
})
export class CreateIncidentComponent {
  PageTitle: any;
  Masterform!: FormGroup;
  error = errorMessages;
  ControlRoomId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted = false;
  SourceList: any;
  IncidentDeviceList: any;
  AllDeviceDataList:any;
  IncidentDeviceCoordinates:any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<CreateIncidentComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.ControlRoomId = parentData.ControlRoomId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Incident';
    this.Masterform = new FormGroup({
      SourceId: new FormControl('', [
        Validators.required
      ]),
      DeviceId: new FormControl('', [
      ]),
      CategoryId: new FormControl('', [
        Validators.required
      ]),
      ChainageNumber: new FormControl('', [
        Validators.required, Validators.pattern(regExps['ChainageNumber'])
      ]),
      DirectionId: new FormControl('', [
        Validators.required,
      ]),
      Latitude: new FormControl('', [
        Validators.required, Validators.pattern(regExps['Latitude'])
      ]),
      Longitude: new FormControl('', [
        Validators.required, Validators.pattern(regExps['Longitude'])
      ]),
      VehicleNo: new FormControl('', [
      ]),
      VehicleClassId: new FormControl('', [
      ]),
      AssigneeId: new FormControl('', [
        Validators.required,
      ]),
      Description: new FormControl('', [
      ]),
      IncidentProof: new FormControl('', [
      ]),
      NearByVMS: new FormControl('', [
      ]),
      VMSId: new FormControl('', [
      ]),
    });

    this.GetIncidentSourceList()
    this.GetAllSystemDevices();
  }

  GetIncidentSourceList() {
    this.dbService.IncidentSourceGetActive().subscribe(
      data => {
        this.SourceList = data.ResponseData;
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetAllSystemDevices() {
    this.dbService.EquipmentDetailsGetActive().subscribe(
      data => {
        this.AllDeviceDataList = data.ResponseData;
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  FillDevice(val: any) {
     this.IncidentDeviceList = [];
     this.Masterform.controls['DeviceId'].reset();
    if (val == 1 || val == 7) //for 1033
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "1" || e.DeviceTypeId == "25" || e.DeviceTypeId == "26");//filter for select PTZ/TMCS,VIDS,ANPR camera device only
    // if (val == 2) //for Patrolling/Enforcement Vehicle
    //   this.IncidentDeviceList = this.AllPatrollingVehicleList;
    if (val == 3) //for TMCS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "1");//filter for select PTZ/TMCS camera device only
    if (val == 4) //for VIDS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "25");//filter for select VIDS camera device only
    if (val == 5) //for ANPR and VSDS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "26");//filter for select ANPR and VSDS camera device only
    if (val == 6) //for ECB
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "2");//filter for select ECB camera device only
    if (val == 8) //for MOTION DETECTION
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "27");//filter for select ECB camera device only
  }

   FillChainage(event: any) {
    this.IncidentDeviceCoordinates = this.IncidentDeviceList.filter((e: { EntryId: string; }) => e.EntryId == event.value);
    this.Masterform.controls['ChainageNumber'].setValue(this.IncidentDeviceCoordinates[0].ChainageNumber)
  }

  DetailsbyId() {
  }

  ClosePoup() { this.Dialogref.close(); }

  ClearDetails() {
    this.Masterform.reset();
  }

  SaveDetails() {

  }

}
