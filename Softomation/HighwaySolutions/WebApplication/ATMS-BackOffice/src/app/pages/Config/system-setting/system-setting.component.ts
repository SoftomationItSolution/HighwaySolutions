import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/services/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-system-setting',
  templateUrl: './system-setting.component.html',
  styleUrls: ['./system-setting.component.css']
})
export class SystemSettingComponent {
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  PermissionData: any;
  LogedRoleId: number;
  DataUpdate: Number = 0;
  DataAdd: Number = 0;
  DataView: Number = 0;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  LaneData: any;
  submitted = false;
  TabId = 0
  VehicleClassList: any;
  ControlRoomData: any;
  IsWeatherOnline = false;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel, public Dialogref: MatDialogRef<SystemSettingComponent>) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
  }

  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      TotalLane: new FormControl('', [
        Validators.required
      ]),
      IsATCCIndependently: new FormControl(true),
      ATCCByVIDS: new FormControl(false),
      ATCCByVSDS: new FormControl(false),
      TrafficByTime: new FormControl('', [Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
      TrafficCount: new FormControl('', [Validators.required, Validators.pattern(regExps["OnlyDigit"])]),
      RestrictedVehiclesIds: new FormControl(''),
      DefaultControlRoomId: new FormControl('', [Validators.required]),
      IsWeatherOnline: new FormControl(false),
      WeatherAPI: new FormControl('', [Validators.required]),
      WeatherAPIHitPerMinite: new FormControl('', [Validators.required]),
    });
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuUrl: "#PopUpSystemSetting",
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
        } else {
          this.GetLaneList();
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
  IsWeatherChnage(event: any) {
    this.IsWeatherOnline = event.checked;
    // if(event.checked){
    //   if(this.DetailData!=undefined){
    //     this.DataDetailsForm.controls['WeatherAPI'].setValue(this.DetailData.WeatherAPI);
    //   }
      
    // }
  }
  ATCCChanged(event: any) {
    if (event.currentTarget.checked) {
      this.DataDetailsForm.controls['ATCCByVIDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].setValue(false);
      this.DataDetailsForm.controls['ATCCByVSDS'].disable();
      this.DataDetailsForm.controls['ATCCByVIDS'].disable();
    }
    else {
      this.DataDetailsForm.controls['ATCCByVIDS'].setValue(true);
      this.DataDetailsForm.controls['ATCCByVSDS'].setValue(true);
      this.DataDetailsForm.controls['ATCCByVSDS'].enable();
      this.DataDetailsForm.controls['ATCCByVIDS'].enable();
    }
  }

  GetLaneList() {
    this.dbService.LaneGetAll().subscribe(
      data => {

        this.LaneData = data.ResponseData;
        this.GetVehicleClass();
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
  GetVehicleClass() {
    this.dbService.VehicleClassGetActive().subscribe(
      data => {
        let d = data.ResponseData;
        this.VehicleClassList = d.filter((e: { ClassId: any; }) => e.ClassId != 1);
        this.ControlRoom()
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

  ControlRoom() {
    this.dbService.ControlRoomGetActive().subscribe(
      data => {
        this.ControlRoomData = data.ResponseData;
        this.GetDetails()
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetDetails() {
    this.dbService.SystemSettingGet().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.DataDetailsForm.controls['TotalLane'].setValue(this.DetailData.TotalLane);
        this.DataDetailsForm.controls['TrafficCount'].setValue(this.DetailData.TrafficCount);
        this.DataDetailsForm.controls['TrafficByTime'].setValue(this.DetailData.TrafficByTime);
        this.DataDetailsForm.controls['IsATCCIndependently'].setValue(this.DetailData.IsATCCIndependently);
        this.DataDetailsForm.controls['RestrictedVehiclesIds'].setValue(this.DetailData.RestrictedVehiclesIdList);
        this.DataDetailsForm.controls['DefaultControlRoomId'].setValue(this.DetailData.DefaultControlRoomId);
        this.DataDetailsForm.controls['WeatherAPI'].setValue(this.DetailData.WeatherAPI);
        this.DataDetailsForm.controls['WeatherAPIHitPerMinite'].setValue(this.DetailData.WeatherAPIHitPerMinite);
        this.IsWeatherOnline=this.DetailData.IsWeatherOnline;
        this.DataDetailsForm.controls['IsWeatherOnline'].setValue(this.DetailData.IsWeatherOnline);
        if (this.DetailData.IsATCCIndependently) {
          this.DataDetailsForm.controls['ATCCByVIDS'].setValue(false);
          this.DataDetailsForm.controls['ATCCByVSDS'].setValue(false);
          this.DataDetailsForm.controls['ATCCByVSDS'].disable();
          this.DataDetailsForm.controls['ATCCByVIDS'].disable();
        }
        else {
          this.DataDetailsForm.controls['ATCCByVSDS'].setValue(this.DetailData.ATCCByVSDS);
          this.DataDetailsForm.controls['ATCCByVIDS'].setValue(this.DetailData.ATCCByVIDS);
          this.DataDetailsForm.controls['ATCCByVSDS'].enable();
          this.DataDetailsForm.controls['ATCCByVIDS'].enable();
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

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    let RestrictedVehiclesIds = "";
    if (this.DataDetailsForm.value.RestrictedVehiclesIds != null && this.DataDetailsForm.value.RestrictedVehiclesIds != '')
      RestrictedVehiclesIds = this.DataDetailsForm.value.RestrictedVehiclesIds.toString();
    const Obj = {
      TotalLane: this.DataDetailsForm.value.TotalLane,
      IsATCCIndependently: this.DataDetailsForm.value.IsATCCIndependently,
      IsWeatherOnline: this.DataDetailsForm.value.IsWeatherOnline,
      ATCCByVIDS: this.DataDetailsForm.value.ATCCByVIDS,
      ATCCByVSDS: this.DataDetailsForm.value.ATCCByVSDS,
      TrafficCount: this.DataDetailsForm.value.TrafficCount,
      TrafficByTime: this.DataDetailsForm.value.TrafficByTime,
      WeatherAPI: this.DataDetailsForm.value.WeatherAPI,
      WeatherAPIHitPerMinite: this.DataDetailsForm.value.WeatherAPIHitPerMinite,
      RestrictedVehiclesIds: RestrictedVehiclesIds,
      DefaultControlRoomId: this.DataDetailsForm.value.DefaultControlRoomId,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.SystemSettingSetUp(Obj).subscribe(
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
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }
}
