import { DatePipe } from '@angular/common';
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { MessageService } from 'primeng/api';
import { Subscription } from 'rxjs';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import { CreateIncidentComponent } from '../create-incident/create-incident.component';

@Component({
  selector: 'app-incident-data',
  templateUrl: './incident-data.component.html',
  styleUrls: ['./incident-data.component.css']
})
export class IncidentDataComponent implements OnInit {
  IMSGetTopic = ["IMSLatestData"]
  submitted!: boolean;
  MasterDialog!: boolean;
  ViewDialog!: boolean;
  AssigneeDialog!: boolean;
  ReviewDialog!: boolean;
  MediaDialog!: boolean;
  Masterform!: FormGroup;
  SubMasterform!: FormGroup;
  UpdateFlag: boolean = false;
  checked: boolean = true;
  uploadedFiles: any[] = [];
  error = errorMessages;
  EntryId: number = 0;
  SourceList: any;
  AllCategoryDataList: any;
  IncidentCategoryList: any;
  IncidentSubCategoryList: any;
  IncidentDeviceList: any;
  AllVehicleClassList: any;
  VehicleClassId: any;
  DevicesData: any;
  dataimage: any;
  NearByVMSData: any;
  @ViewChild('fileInput')
  fileInput!: ElementRef;
  fileAttr = 'Choose File';
  myFiles: any;
  CurrentTime: any;
  SelectedAssignee = 0;
  BindData: any;
  MediaPrefix = "";
  TaskList: any;
  CheckList: any;
  SelectedRow: any;
  UserDetails: any;
  SubCatData: any;
  maxFileSize: number = 6000000;
  multiple: boolean = true;
  addAccess: any = 0;
  updateAccess: any = 0;
  viewAccess: any = 0;
  MenuPermission: any;
  Deviceselecteditem: any;
  EnforcementUsersData = [];
  IncidentStatusList = [{ EntryId: 5, IncidentStatusName: 'Closed' }]; //,{EntryId: 6, IncidentStatusName: 'Re-assign'}
  DirectionList = [{ EntryId: 1, Name: 'LHS' }, { EntryId: 2, Name: 'RHS' }]
  AllVMSList: any;
  AllCoordinatesData: any;
  IncidentCoordinates: any;
  AllDeviceDataList: any;
  AllPatrollingVehicleList: any;
  IncidentDeviceCoordinates: any;
  SelectedStatus: any;
  AllUserData: any;
  ReferenceNumber: any;
  SubCatFlag: any;
  RefNo: any;
  RefrenceNumberParam: string = '';
  rowdatafilltered: any;
  LogedRoleId;
  ErrorData;
  constructor(private spinner: NgxSpinnerService, private dbService: apiIntegrationService,
    public datepipe: DatePipe, private router: ActivatedRoute, private dm: DataModel,public dialog: MatDialog,) {
    this.LogedRoleId = this.dm.getRoleId();
    this.router.queryParams.subscribe(params => {
      if (params['RefNo'] != undefined)
        this.RefrenceNumberParam = params['RefNo'];
    });
    this.UserDetails = this.dm.getUserData();
    this.GetAccessPermission();
  }

  ngOnInit() {
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

    this.SubMasterform = new FormGroup({
      TaskStatusId: new FormControl('', [
        Validators.required
      ]),
      Comments: new FormControl('', [
        Validators.required
      ]),
    });
    var CurrentDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy')
    var StartDateTime = new Date(CurrentDate + " 00:00:00");
    var EndDateTime = new Date(CurrentDate + " 23:59:59");

    this.GetAllData();
    //this.IncidentSource()
    //this.GetIncidentCategory();
    //this.GetAllSystemDevices();
    //this.GetAllPatrolling();
    //this.GetAllActiveVMSList();
    //this.VehicleClassGetActive();
    //this.GetAllCoordinates();
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.IncidentPendingGet().subscribe(
      data => {
        this.DevicesData = data.ResponseData;
        if (this.DevicesData.length > 0) {
          if (this.RefrenceNumberParam != '') {
            this.rowdatafilltered = this.DevicesData.filter((x: any) => x.ReferenceNumber == this.RefrenceNumberParam);
            this.EditIncident(this.rowdatafilltered[0]);
          }
        }
        this.spinner.hide();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: error.message }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  // GetIncidentCategory() {
  //   //this.spinner.show();
  //   this.dbService.IncidentCategoryGetActive().subscribe(
  //     data => {
  //       this.IncidentCategoryList = data.ResponseData;
  //       //this.spinner.hide();
  //     },
  //     (error) => {
  //       //this.spinner.hide();
  //       try {
  //         this.messageService.add({ severity: 'error', summary: error.error.errorMessages, detail: 'Loading Location', life: 1000 });
  //       } catch (error) {
  //         this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading Location', life: 1000 });
  //       }
  //     }
  //   );
  // }
  // GetIncidentSubCategory(CategoryId: any) {
  //   //this.spinner.show();
  //   this.dbService.IncidentSubCategoryGetByCategoryId(CategoryId).subscribe(
  //     data => {
  //       this.SubCatData = data.ResponseData;
  //       //this.spinner.hide();
  //     },
  //     (error) => {
  //       //this.spinner.hide();
  //       try {
  //         this.messageService.add({ severity: 'error', summary: error.error.errorMessages, detail: 'Loading Location', life: 1000 });
  //       } catch (error) {
  //         this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading Location', life: 1000 });
  //       }
  //     }
  //   );
  // }

  openNew() {

    if (this.updateAccess == 1 || this.addAccess == 1) {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '60%';
      dialogConfig.height = '450px';
      dialogConfig.data = { action: 'Save', ControlRoomId: 0 };
      this.dialog.open(CreateIncidentComponent, dialogConfig);
    }
    else {
      this.ErrorData = [{ AlertMessage: 'You do not have right!' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
    // this.Masterform.reset();
    // this.MasterDialog = true;
    // this.submitted = false;
    // this.EntryId = 0;
    // this.checked = true;
    // this.UpdateFlag = false;
    // this.RefNo = "";
  }
  hideDialog() {
    this.MasterDialog = false;
    this.submitted = false;
    this.EntryId = 0;
  }
  HideCall() {
    //this.GetAllData();
  }

  ViewMedia(refno: any) {
    //   this.dbService.IncidentMediaByRefrence(refno).subscribe(
    //     (data: any) => {
    //       this.MediaDialog = true;
    //       this.BindData = data.ResponseData;
    //       this.ReferenceNumber = refno;
    //     },
    //     (error: any) => {
    //       //this.spinner.hide();
    //       this.messageService.add({ severity: 'error', summary: 'Something went wrong', detail: 'Upload Media', life: 1000 });
    //     }
    //   );

  }

  hideMediaDialog() {
    this.MediaDialog = false;
  }

  UploadMedia(ReferenceNumber: string, MediaPath: string) {
    const Obj = {
      ReferenceNumber: ReferenceNumber,
      MediaPath: MediaPath,
      CreatedBy: this.UserDetails.EntryId,
      ModifiedBy: this.UserDetails.EntryId,
    };
    this.dbService.IncidentMediaSetUp(Obj).subscribe(
      (data: any) => {
      },
      (error: any) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  uploadFileEvt(imgFile: any) {
    // for (let file of imgFile.files) {
    //   const reader = new FileReader();
    //   reader.readAsDataURL(file);
    //   reader.onload = () => {
    //     const Obj = {
    //       Base64: reader.result,
    //       file: file
    //     }
    //     this.uploadedFiles.push(Obj);
    //   };
    // }

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

  ViewTask(data: any) {
    // this.dbService.IncidentTaskListByRefrence(data).subscribe(
    //   data => {
    //     this.TaskList = data.ResponseData;
    //     console.log(this.TaskList);
    //     this.CheckList = data.ResponseData;
    //     for (let i = 0; i < this.TaskList.length; i++) {
    //       this.TaskList[i].ActionStartDateTime = (this.TaskList[i].ActionStartDateTimeStamp);
    //       this.TaskList[i].ActionEndDateTime = (this.TaskList[i].ActionEndDateTimeStamp);
    //     }
    //     this.ViewDialog = true;
    //   },
    //   (error) => {
    //     //this.spinner.hide();
    //     this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
    //   });
  }

  hideViewDialog() {
    this.ViewDialog = false;
  }

  ReviewTask(data: any) {
    this.SelectedRow = data;

    this.TaskList = data;

    this.ReferenceNumber = data.ReferenceNumber;
    //this.GetIncidentSubCategory(data.CategoryId);
    this.ReviewDialog = true;
  }
  hideReviewDialog() {
    this.ReviewDialog = false;
  }

  GetAccessPermission() {
    //this.spinner.show();
    const Obj = {
      MenuId: 26,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.MenuPermission = data.ResponseData;
        if (this.MenuPermission != null && this.MenuPermission != undefined) {
          this.addAccess = this.MenuPermission.DataAdd;
          this.updateAccess = this.MenuPermission.DataUpdate;
          this.viewAccess = this.MenuPermission.DataView;
          if (this.viewAccess != 1) {
            this.dm.unauthorized();
          }
        }
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  // GetAllSystemDevices() {
  //   this.dbService.GetAllDevicesByCentralAPI().subscribe(
  //     data => {
  //       this.AllDeviceDataList = data.ResponseData;
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );
  // }
  // GetAllPatrolling() {
  //   this.dbService.GetAllPatrollingVehicle().subscribe(
  //     data => {
  //       this.AllPatrollingVehicleList = data.ResponseData.map(function (row: any) {
  //         return { EntryId: row.EntryId, DeviceName: row.VehicleName }
  //       })
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );
  // }
  // VehicleClassGetActive() {
  //   this.dbService.VehicleClassGetActive().subscribe(
  //     data => {
  //       this.AllVehicleClassList = data.ResponseData;
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );
  // }
  // IncidentSource() {
  //   this.dbService.IncidentSourceMasterGetAll().subscribe(
  //     data => {
  //       this.SourceList = data.ResponseData;
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );
  // }
  // GetAllCoordinates() {
  //   this.dbService.GetAllCoordinates().subscribe(
  //     data => {
  //       this.AllCoordinatesData = data.ResponseData;
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );

  // }
  // FillDevice(val: any) {
  //   this.IncidentDeviceList = [];
  //   this.Masterform.controls.DeviceId.setValue('');

  //   if (val == 1 || val == 7) //for 1033
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "1" || e.DeviceTypeId == "25" || e.DeviceTypeId == "26");//filter for select PTZ/TMCS,VIDS,ANPR camera device only
  //   if (val == 2) //for Patrolling/Enforcement Vehicle
  //     this.IncidentDeviceList = this.AllPatrollingVehicleList;
  //   if (val == 3) //for TMCS
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "1");//filter for select PTZ/TMCS camera device only
  //   if (val == 4) //for VIDS
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "25");//filter for select VIDS camera device only
  //   if (val == 5) //for ANPR and VSDS
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "26");//filter for select ANPR and VSDS camera device only
  //   if (val == 6) //for ECB
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "2");//filter for select ECB camera device only
  //   if (val == 8) //for MOTION DETECTION
  //     this.IncidentDeviceList = this.AllDeviceDataList.filter((e: { DeviceTypeId: string; }) => e.DeviceTypeId == "27");//filter for select ECB camera device only
  // }

  // FillChainage(event: any) {
  //   this.IncidentDeviceCoordinates = this.IncidentDeviceList.filter((e: { EntryId: string; }) => e.EntryId == event.value);
  //   this.Masterform.controls.ChainageNumber.setValue(this.IncidentDeviceCoordinates[0].ChainageNumber);
  // }

  // FillCoordinates() {
  //   this.Masterform.controls.Latitude.reset(); this.Masterform.controls.Longitude.reset(); this.Masterform.controls.NearByVMS.reset();
  //   if (this.Masterform.controls.ChainageNumber.value != undefined && this.Masterform.controls.ChainageNumber.value != '' && this.Masterform.controls.ChainageNumber.value != null) {
  //     this.Masterform.controls.Latitude.reset(); this.Masterform.controls.Longitude.reset(); this.Masterform.controls.NearByVMS.reset();
  //     this.IncidentCoordinates = this.AllCoordinatesData.filter((e: { ChainageNumber: string; }) => e.ChainageNumber == this.Masterform.controls.ChainageNumber.value);
  //     this.Masterform.controls.Latitude.setValue(this.IncidentCoordinates[0].Latitude);
  //     this.Masterform.controls.Longitude.setValue(this.IncidentCoordinates[0].Longitude);
  //     if (this.Masterform.controls.DirectionId.value != undefined && this.Masterform.controls.DirectionId.value != '' && this.Masterform.controls.DirectionId.value != null) {
  //       this.FillNearByVMS(this.Masterform.controls.DirectionId.value);
  //     }
  //   }
  // }

  // GetAllActiveVMSList() {
  //   this.dbService.GetAllActiveVMSList().subscribe(
  //     data => {
  //       this.AllVMSList = data.ResponseData;
  //     },
  //     (error) => {
  //       this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //     }
  //   );
  // }

  // FillNearByVMS(value: any) {
  //   if (this.Masterform.value.ChainageNumber != '' && value != '')
  //     this.dbService.GetNearByVMSByDirection(this.Masterform.value.ChainageNumber, value).subscribe(
  //       data => {
  //         this.NearByVMSData = data.ResponseData;
  //         if (this.NearByVMSData != '')
  //           this.Masterform.controls.NearByVMS.setValue(this.NearByVMSData.DeviceName);
  //       },
  //       (error) => {
  //         this.messageService.add({ severity: 'error', summary: 'Somthing went wrong', detail: 'Loading', life: 1000 });
  //       }
  //     );
  // }

  EditIncident(rowData: any) {
    //   this.Masterform.reset();
    //   this.Masterform.controls.SourceId.setValue(rowData.SourceId);
    //   this.FillDevice(rowData.SourceId); this.Masterform.controls.DeviceId.setValue(rowData.DeviceId == 0 ? '' : rowData.DeviceId);
    //   this.Masterform.controls.DirectionId.setValue(rowData.DirectionId == 0 ? '' : rowData.DirectionId);
    //   this.Masterform.controls.CategoryId.setValue(rowData.CategoryId);
    //   this.Masterform.controls.ChainageNumber.setValue(rowData.ChainageNumber);
    //   this.Masterform.controls.Latitude.setValue(rowData.Latitude);
    //   this.Masterform.controls.Longitude.setValue(rowData.Longitude);
    //   this.FillNearByVMS(rowData.DirectionId); this.Masterform.controls.NearByVMS.setValue(rowData.NearByVMS);
    //   this.Masterform.controls.VehicleNo.setValue(rowData.VehicleNo);
    //   this.Masterform.controls.VehicleClassId.setValue(rowData.VehicleClassId);
    //   this.Masterform.controls.AssigneeId.setValue(rowData.AssignedTo == 0 ? '' : rowData.AssignedTo);
    //   this.Masterform.controls.Description.setValue(rowData.Description);
    //   this.RefNo = (rowData.ReferenceNumber);
    //   this.UpdateFlag = true;
    //   this.MasterDialog = true;
    //   this.submitted = false;
    //   this.incidentstatusId = rowData.IncidentStatusId==4?false:true;
  }

  SaveIncident() {
    if (this.UpdateFlag == true) {
      this.ModifyIncident();
    }
    else {
      this.submitted = true;
      if (this.Masterform.invalid) {
        return;
      }
      const Obj = {
        SourceId: this.Masterform.value.SourceId,
        DeviceId: this.Masterform.value.DeviceId,
        DirectionId: this.Masterform.value.DirectionId,
        NearByVMSId: this.NearByVMSData.EntryId,
        ChainageNumber: this.Masterform.value.ChainageNumber,
        CategoryId: this.Masterform.value.CategoryId,
        Latitude: this.Masterform.value.Latitude,
        Longitude: this.Masterform.value.Longitude,
        VehicleNo: this.Masterform.value.VehicleNo,
        VehicleClassId: this.Masterform.value.VehicleClassId,
        AssignedTo: this.Masterform.value.AssigneeId,   //Enforcement assignee by default
        Description: this.Masterform.value.Description == null ? '' : this.Masterform.value.Description,
        IncidentStatusId: 1,                            //Open,Pending,InAction,InActionComplete,Close,Reopen
        IncidentTypeId: 2,                              //Auto, Manual
        IncidentGeneratedByTypeId: 1,                   //Operator,Petrolling,Commuter,System
        IncidentGeneratedBySystemId: 10,                //Incident comes from which system
        IncidentGeneratedById: this.UserDetails.EntryId, //Id of Who is creating the incident manually
        CreatedBy: this.UserDetails.EntryId,
        ModifiedBy: this.UserDetails.EntryId,
      };
      this.dbService.IncidentSetUp(Obj).subscribe(
        (data: any) => {
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            for (let index = 0; index < this.uploadedFiles.length; index++) {
              this.UploadMedia(data.Message[1].AlertMessage, this.uploadedFiles[index].Base64);
            }
            this.uploadedFiles = [];
            this.hideDialog();
            this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
            this.dm.openSnackBar(this.ErrorData, false);
          } else {
            const ErrorData = data.Message;
            this.ErrorData = [{ AlertMessage: ErrorData.AlertMessage }];
            this.dm.openSnackBar(this.ErrorData, false);
          }
        },
        (error: any) => {
          this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      );
    }
  }

  ModifyIncident() {
    this.submitted = true;
    if (this.Masterform.invalid) {
      return;
    }
    const Obj = {
      ReferenceNumber: this.RefNo,
      SourceId: this.Masterform.value.SourceId,
      DeviceId: this.Masterform.value.DeviceId,
      DirectionId: this.Masterform.value.DirectionId,
      NearByVMSId: this.NearByVMSData.EntryId,
      ChainageNumber: this.Masterform.value.ChainageNumber,
      CategoryId: this.Masterform.value.CategoryId,
      Latitude: this.Masterform.value.Latitude,
      Longitude: this.Masterform.value.Longitude,
      VehicleNo: this.Masterform.value.VehicleNo,
      VehicleClassId: this.Masterform.value.VehicleClassId,
      AssignedTo: this.Masterform.value.AssigneeId,   //Enforcement assignee by default
      Description: this.Masterform.value.Description == null ? '' : this.Masterform.value.Description,
      CreatedBy: this.UserDetails.EntryId,
      ModifiedBy: this.UserDetails.EntryId,
    };
    //this.spinner.show();
    this.dbService.IncidentModify(Obj).subscribe(
      (data: any) => {
        //this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          for (let index = 0; index < this.uploadedFiles.length; index++) {
            this.UploadMedia(data.Message[1].AlertMessage, this.uploadedFiles[index].Base64);
          }
          this.uploadedFiles = [];
          //this.GetAllData();

          //To update the List>>>
          var index = this.DevicesData.findIndex(function (aaa: any) { return aaa.ReferenceNumber == Obj.ReferenceNumber })
          if (index > -1) {
            this.DevicesData[index].SourceId = this.Masterform.value.SourceId;
            this.DevicesData[index].SourceName = (this.SourceList.filter((i: any) => i.SourceId === this.Masterform.value.SourceId))[0].SourceName;

            this.DevicesData[index].DeviceId = this.Masterform.value.DeviceId;
            this.DevicesData[index].DeviceName = (this.IncidentDeviceList.filter((i: any) => i.EntryId === this.Masterform.value.DeviceId))[0].DeviceName;

            this.DevicesData[index].DirectionId = this.Masterform.value.DirectionId;
            this.DevicesData[index].DirectionName = (this.DirectionList.filter((i: any) => i.EntryId === this.Masterform.value.DirectionId))[0].Name;

            this.DevicesData[index].CategoryId = this.Masterform.value.CategoryId;
            this.DevicesData[index].CategoryName = (this.IncidentCategoryList.filter((i: any) => i.EntryId === this.Masterform.value.CategoryId))[0].CategoryName;

            this.DevicesData[index].NearByVMSId = this.NearByVMSData.EntryId;
            this.DevicesData[index].ChainageNumber = this.Masterform.value.ChainageNumber;

            this.DevicesData[index].Latitude = this.Masterform.value.Latitude;
            this.DevicesData[index].Longitude = this.Masterform.value.Longitude;
            this.DevicesData[index].VehicleNo = this.Masterform.value.VehicleNo;
            this.DevicesData[index].VehicleClassId = this.Masterform.value.VehicleClassId;

            this.DevicesData[index].AssignedTo = this.Masterform.value.AssigneeId;
            this.DevicesData[index].PatrolVehicleName = (this.AllPatrollingVehicleList.filter((i: any) => i.EntryId === this.Masterform.value.AssigneeId))[0].DeviceName;

            this.DevicesData[index].Description = this.Masterform.value.Description == null ? '' : this.Masterform.value.Description;
            //this.DevicesData[index].CreatedBy = this.UserDetails.EntryId;
            this.DevicesData[index].ModifiedBy = this.UserDetails.EntryId;
          }
          //To update the List<<<<

          this.hideDialog();
          this.ErrorData = [{ AlertMessage: 'Incident Modified Successfully' }];
          this.dm.openSnackBar(this.ErrorData, false);
        } else {
          this.ErrorData = [{ AlertMessage: data.Message.AlertMessage }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error: any) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  OperatorCheck(EntryId: any) {

    var objTask = this.TaskList.find((d: any) => d.EntryId1 === EntryId);
    //alert(objTask.EntryId);
    objTask.ModifiedBy = this.UserDetails.EntryId;
    if (objTask.OperatorActionConfirm == '') {
      this.ErrorData = [{ AlertMessage: 'Write Remark before accept' }];
      this.dm.openSnackBar(this.ErrorData, false);
    } else {

      this.dbService.CheckListActionApproveByOperator(objTask).subscribe(
        (data: any) => {
          //this.spinner.hide();
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {

            //To update the List<<<<
            this.ViewTask(objTask.ReferenceNumber);
            //this.GetAllData();
            this.hideDialog();
            this.ErrorData = [{ AlertMessage: 'Incident Modified' }];
            this.dm.openSnackBar(this.ErrorData, false);
          } else {
            this.ErrorData = [{ AlertMessage: data.Message.AlertMessage }];
            this.dm.openSnackBar(this.ErrorData, false);
          }
        },
        (error: any) => {
          this.ErrorData = [{ AlertMessage: 'Something went wrong' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      );

    }

  }
  incidentstatusId: any;
  ModifyTask() {

    for (let i = 0; i < this.TaskList.length; i++) { // This loop is for all the steps validation
      if (this.TaskList[i].ActionStatus == 1 && (this.TaskList[i].ActionStartDateTime == '' || this.TaskList[i].ActionEndDateTime == '')) {
        //this.messageService.add({ severity: 'error', summary: "Steps: " + this.TaskList[i].StepsName, detail: "Kindly Fill the Action date time", life: 3000 });
        return;
      }
      if (this.TaskList[i].ActionStatus == 1 && (new Date(this.TaskList[i].ActionStartDateTime).setMilliseconds(0) < new Date(this.TaskList[i].CreatedDate).setMilliseconds(0))) {
        //this.messageService.add({ severity: 'error', summary: "Steps: " + this.TaskList[i].StepsName, detail: "Action Time must greater to Incident Created Time", life: 3000 });
        return;
      }
      if (this.TaskList[i].ActionStatus == 1 && (new Date(this.TaskList[i].ActionStartDateTime) > new Date(this.TaskList[i].ActionEndDateTime))) {
        // this.messageService.add({ severity: 'error', summary: "Steps: " + this.TaskList[i].StepsName, detail: "Action Start time will always be lesser to Action End time", life: 3000 });
        return;
      }
    }
    for (let i = 0; i < this.TaskList.length; i++) {
      this.TaskList[i].ModifiedBy = this.UserDetails.EntryId; //Assigned to Patrolling team
      this.TaskList[i].DataStatus = this.TaskList[i].DataStatus == true ? 1 : 0; //For 'Steps Required'
      this.TaskList[i].ActionStatus = this.TaskList[i].ActionStatus == true ? 1 : 0; //For 'Completed Steps'
      this.TaskList[i].ActionStartDateTime = this.datepipe.transform(this.TaskList[i].ActionStartDateTime, 'dd-MMM-yyyy HH:mm:ss') || new Date();
      this.TaskList[i].ActionEndDateTime = this.datepipe.transform(this.TaskList[i].ActionEndDateTime, 'dd-MMM-yyyy HH:mm:ss') || new Date();
    }
    //this.spinner.show();
    this.dbService.TaskListModify(this.TaskList).subscribe(
      (data: any) => {
        //this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.GetAllData();
          this.hideViewDialog();
          // this.messageService.add({ severity: 'success', summary: "Incident Task Modified", detail: "Incident task modified successfully", life: 1000 });
        } else {
          for (let index = 0; index < data.Message.length; index++) {
            //this.messageService.add({ severity: 'warn', summary: 'Incident Task Modified', detail: data.Message[index].AlertMessage, life: 1000 });
          }
        }
      },
      (error: any) => {
        //this.spinner.hide();
        //this.messageService.add({ severity: 'error', summary: 'Something went wrong', detail: 'Contact addedd', life: 1000 });
      }
    );
  }

  CloseTask() {
    debugger;
    this.submitted = true;
    if (this.SubMasterform.invalid) {
      return;
    }
    if (this.SubMasterform.value.TaskStatusId == 5)
      this.SubCatFlag = this.SubMasterform.value.SubCategoryId
    else
      this.SubCatFlag = 0;

    const obj = {
      EntryId: this.EntryId,
      CategoryId: this.SelectedRow.CategoryId,
      ReferenceNumber: this.SelectedRow.ReferenceNumber,
      IncidentStatusId: this.SubMasterform.value.TaskStatusId,
      SubCategoryId: this.SubCatFlag,
      Comments: this.SubMasterform.value.Comments,
      ModifiedBy: this.UserDetails.EntryId,
    };
    this.dbService.IncidentClose(obj).subscribe(
      (data: any) => {
        //this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          //this.GetAllData();
          ///To update the List>>>
          var index = this.DevicesData.findIndex(function (aaa: any) { return aaa.ReferenceNumber == obj.ReferenceNumber })
          if (index > -1) {
            this.DevicesData.splice(index, 1);
          }
          //To update the List<<<<
          this.GetAllData();
          this.hideReviewDialog();
          //this.messageService.add({ severity: 'success', summary: "Incident Assignee Modified", detail: "Incident assignee modified successfully", life: 1000 });
        } else {
          for (let index = 0; index < data.Message.length; index++) {
            //this.messageService.add({ severity: 'warn', summary: 'Incident Assignee Modified', detail: data.Message[index].AlertMessage, life: 1000 });
          }
        }
      },
      (error: any) => {
        //this.spinner.hide();
        // this.messageService.add({ severity: 'error', summary: 'Something went wrong', detail: 'Contact addedd', life: 1000 });
      }
    );
  }
}

