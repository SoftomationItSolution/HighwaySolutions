import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-project-config',
  templateUrl: './project-config.component.html',
  styleUrls: ['./project-config.component.css']
})
export class ProjectConfigComponent {
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
  submitted = false;
  SystemSetting: any;
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel, public Dialogref: MatDialogRef<ProjectConfigComponent>) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.SystemSetting = this.dm.getSSData()

  }

  ngOnInit(): void {
    this.DataDetailsForm = new FormGroup({
      ProjectName: new FormControl('', [Validators.required]),
      ControlRoomName: new FormControl('', [Validators.required]),
      Address: new FormControl('', [Validators.required]),
      RoadName: new FormControl('', [Validators.required]),
      State: new FormControl('', [Validators.required]),
      Pincode: new FormControl('', [Validators.required,Validators.pattern(regExps['IndianPinCode'])])
    });
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuUrl: "#PopUpProjectConfig",
      SystemId: 0,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByMenu(Obj).subscribe(
      data => {
        this.PermissionData = data.ResponseData;
        if (this.PermissionData != null && this.PermissionData != undefined) {
          this.DataAdd = this.PermissionData.DataAdd;
          this.DataUpdate = this.PermissionData.DataUpdate;
          this.DataView = this.PermissionData.DataView;
          if (this.DataView != 1) {
            this.spinner.hide();
            this.Dialogref.close(false);
            this.dm.unauthorized();
          }
          else{
           this.GetDetails();
          }
        }
        else{
          this.spinner.hide();
          this.Dialogref.close(false);
          this.dm.unauthorized();
        }
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

  GetDetails() {
    this.spinner.show();
    this.dbService.ProjectConfigGet().subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        this.dm.setProjectDetails(JSON.stringify(this.DetailData));
        this.DataDetailsForm.controls['ProjectName'].setValue(this.DetailData.ProjectName);
        this.DataDetailsForm.controls['ControlRoomName'].setValue(this.DetailData.ControlRoomName);
        this.DataDetailsForm.controls['Address'].setValue(this.DetailData.Address);
        this.DataDetailsForm.controls['RoadName'].setValue(this.DetailData.RoadName);
        this.DataDetailsForm.controls['State'].setValue(this.DetailData.State);
        this.DataDetailsForm.controls['Pincode'].setValue(this.DetailData.Pincode);
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

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      ProjectName: this.DataDetailsForm.value.ProjectName,
      ControlRoomName: this.DataDetailsForm.value.ControlRoomName,
      Address: this.DataDetailsForm.value.Address,
      RoadName: this.DataDetailsForm.value.RoadName,
      State: this.DataDetailsForm.value.State,
      Pincode: this.DataDetailsForm.value.Pincode,
    };
    this.spinner.show();
    this.dbService.UpdateProjectConfig(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.GetDetails();
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error: any) => {
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
