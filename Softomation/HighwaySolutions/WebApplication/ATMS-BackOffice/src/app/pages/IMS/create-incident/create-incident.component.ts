import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/services/CustomValidation';
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
  IncidentId: string;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted = false;
  SourceList: any;
  IncidentDeviceList: any;
  IncidentCategoryList: any;
  AllDeviceDataList: any;
  VehicleClassList: any;
  IncidentDeviceCoordinates: any;
  PetrollingTeamList: any;
  uploadedFiles:any=[];
  lastFilePath="";
  DirectionList = [{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }];
  PriorityList = [{ DataId: 1, DataName: 'Critical' }, { DataId: 2, DataName: 'High' }, { DataId: 3, DataName: 'Medium' }, { DataId: 4, DataName: 'Low' }];
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<CreateIncidentComponent>, public dialog: MatDialog) {
    this.LogedUserId = this.dm.getUserId();
    this.IncidentId = parentData.IncidentId;
  }

  ngOnInit(): void {
    this.PageTitle = 'Create New Incident';
    this.Masterform = new FormGroup({
      SourceSystemId: new FormControl('', [Validators.required]),
      EquipmentId: new FormControl('', [Validators.required]),
      PriorityId: new FormControl('', [Validators.required]),
      DirectionId: new FormControl('', [Validators.required]),
      IncidentCategoryId: new FormControl('', [Validators.required]),
      ChainageNumber: new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      Latitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      Longitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      VehiclePlateNumber: new FormControl('', []),
      VehicleClassId: new FormControl('', []),
      AssignedToId: new FormControl('', [Validators.required]),
      IncidentDescription: new FormControl('', [Validators.required])
    });
    this.GetIncidentSourceList()
   
  }

  GetIncidentSourceList() {
    this.dbService.IncidentSourceGetActive().subscribe(
      data => {
        this.SourceList = data.ResponseData;
        this.GetAllSystemDevices();
        
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetIncidentCategory() {
    this.dbService.IncidentCategoryGetActive().subscribe(
      data => {
        this.IncidentCategoryList = data.ResponseData;
        this.GetVehicleClass();
       
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetVehicleClass() {
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        this.VehicleClassList = data.ResponseData;
        this.GetPetrollingTeam();
       
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
        this.GetIncidentCategory();
       
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetPetrollingTeam() {
    this.dbService.UserConfigurationGetByUserType(5).subscribe(
      data => {
        this.PetrollingTeamList = data.ResponseData;
        if (this.IncidentId != '') {
          this.PageTitle = 'Update Incident Details';
          this.DetailsbyId();
        }
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  uploadFileEvt(imgFile: any) {
    this.uploadedFiles = [];
    for (let file of imgFile.currentFiles) {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        const Obj = {
          Base64: reader.result,
          file: file
        }
        this.uploadedFiles.push(Obj);
      };
    }
  }

  removeFileEvt() {
    this.uploadedFiles = [];
  }

  FillDevice(val: any) {
    this.IncidentDeviceList = [];
    this.Masterform.controls['EquipmentId'].reset();
    if (val == 1 || val == 2 || val == 7) //for 1033
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 1 || e.EquipmentTypeId == 2 || e.EquipmentTypeId == 25 || e.EquipmentTypeId == 26 || e.EquipmentTypeId == 27 || e.EquipmentTypeId == 32);//filter for select PTZ/TMCS,VIDS,ANPR camera device only
    else if (val == 3) //for TMCS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 1);//filter for select PTZ/TMCS camera device only
    else if (val == 4) //for VIDS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 25);//filter for select VIDS camera device only
    else if (val == 5) //for ANPR and VSDS
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 26);//filter for select ANPR and VSDS camera device only
    else if (val == 6) //for ECB
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 2);//filter for select ECB device only
    else if (val == 8) //for MOTION DETECTION
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 27);//filter for select MDS camera device only
    else if (val == 9) //for ATCC
      this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 32);//filter for select ATCC camera device only
  }

  FillLocation(event: any) {
    let deviceDetails = this.AllDeviceDataList.filter((e: { EquipmentId: any; }) => e.EquipmentId == event);
    if(deviceDetails.length>0){
      this.Masterform.controls['ChainageNumber'].setValue(deviceDetails[0].ChainageNumber)
      this.Masterform.controls['Latitude'].setValue(deviceDetails[0].Latitude)
      this.Masterform.controls['Longitude'].setValue(deviceDetails[0].Longitude)
    }
    else{
      this.Masterform.controls['ChainageNumber'].reset();
      this.Masterform.controls['Latitude'].reset()
      this.Masterform.controls['Longitude'].reset()
    }
  }

  FillPriority(event: any) {
    let IncidentCategorys = this.IncidentCategoryList.filter((e: { IncidentCategoryId: any; }) => e.IncidentCategoryId == event);
    if(IncidentCategorys.length>0)
      this.Masterform.controls['PriorityId'].setValue(IncidentCategorys[0].PriorityId)
    else
      this.Masterform.controls['PriorityId'].reset();
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.IMSGetById(this.IncidentId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.Masterform.controls['SourceSystemId'].setValue(this.DetailData.SourceSystemId);
        this.FillDevice(this.DetailData.SourceSystemId);
        this.Masterform.controls['EquipmentId'].setValue(this.DetailData.EquipmentId);
        this.Masterform.controls['IncidentCategoryId'].setValue(this.DetailData.IncidentCategoryId);
        this.FillPriority(this.DetailData.IncidentCategoryId)
        this.Masterform.controls['PriorityId'].setValue(this.DetailData.PriorityId);
        this.Masterform.controls['DirectionId'].setValue(this.DetailData.DirectionId);
        this.Masterform.controls['ChainageNumber'].setValue(this.DetailData.ChainageNumber);
        this.Masterform.controls['Latitude'].setValue(this.DetailData.Latitude);
        this.Masterform.controls['Longitude'].setValue(this.DetailData.Longitude);
        this.Masterform.controls['AssignedToId'].setValue(this.DetailData.AssignedToId);
        this.Masterform.controls['VehicleClassId'].setValue(this.DetailData.VehicleClassId);
        this.Masterform.controls['VehiclePlateNumber'].setValue(this.DetailData.VehiclePlateNumber);
        this.Masterform.controls['IncidentDescription'].setValue(this.DetailData.IncidentDescription);
        this.lastFilePath=this.DetailData.IncidentImagePath;
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
        this.Dialogref.close();
      }
    );
  }

  ClosePoup() { this.Dialogref.close(false); }

  ClearDetails() {
    this.Masterform.reset();
  }

  ProcessDetails(){
    if(this.IncidentId=='')
      this.SaveDetails()
    else
       this.UpdateDetails()
  }
  SaveDetails() {
    this.submitted=true;
    if (this.Masterform.invalid) {
      return;
    }
    if(this.uploadedFiles==undefined){
      this.ErrorData = [{ AlertMessage: 'Incident Image is required.' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    if(this.uploadedFiles.length==0){
      this.ErrorData = [{ AlertMessage: 'Incident Image is required.' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    const Obj = {
      IncidentId: this.IncidentId,
      PriorityId: this.Masterform.value.PriorityId,
      IncidentCategoryId: this.Masterform.value.IncidentCategoryId,
      IncidentDescription: this.Masterform.value.IncidentDescription,
      DirectionId: this.Masterform.value.DirectionId,
      ChainageNumber: this.Masterform.value.ChainageNumber,
      Latitude: this.Masterform.value.Latitude,
      Longitude: this.Masterform.value.Longitude,
      VehiclePlateNumber: this.Masterform.value.VehiclePlateNumber,
      VehicleClassId: this.Masterform.value.VehicleClassId,
      SourceSystemId: this.Masterform.value.SourceSystemId,
      EquipmentId: this.Masterform.value.EquipmentId,
      IncidentGeneratedById: this.LogedUserId,
      AssignedToId:this.Masterform.value.AssignedToId,
      IncidentImagePath: this.uploadedFiles[0].Base64,
      IncidentGeneratedByTypeId:3,//Operater
      IncidentStatusId: 4,//Assigned
      CreatedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.IncidentCreate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.Dialogref.close(true);
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

  UpdateDetails() {
    this.submitted=true;
    if (this.Masterform.invalid) {
      return;
    }
    if(this.uploadedFiles.length>0){
     this.lastFilePath=this.uploadedFiles[0].Base64;
    }
    const Obj = {
      IncidentId: this.IncidentId,
      PriorityId: this.Masterform.value.PriorityId,
      IncidentCategoryId: this.Masterform.value.IncidentCategoryId,
      IncidentDescription: this.Masterform.value.IncidentDescription,
      DirectionId: this.Masterform.value.DirectionId,
      ChainageNumber: this.Masterform.value.ChainageNumber,
      Latitude: this.Masterform.value.Latitude,
      Longitude: this.Masterform.value.Longitude,
      VehiclePlateNumber: this.Masterform.value.VehiclePlateNumber,
      VehicleClassId: this.Masterform.value.VehicleClassId,
      SourceSystemId: this.Masterform.value.SourceSystemId,
      EquipmentId: this.Masterform.value.EquipmentId,
      IncidentGeneratedById: this.LogedUserId,
      AssignedToId:this.Masterform.value.AssignedToId,
      IncidentImagePath: this.lastFilePath,
      IncidentGeneratedByTypeId:3,//Operater
      IncidentStatusId: 4,//Assigned
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.IncidentUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.Dialogref.close(true);
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
