import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-file-upload-popup',
  templateUrl: './file-upload-popup.component.html',
  styleUrls: ['./file-upload-popup.component.css']
})
export class FileUploadPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  FileUploadDetailId: number = 0;
  LogedUserId: number = 0;
  FileUploaderTypeId: number = 0;
  DetailData: any=null;
  submitted = false;
  ErrorData: any;
  hide = true;
  UploaderTypeList = [{ DataId: 0, DataName: 'None' }, { DataId: 1, DataName: 'FTP' }, { DataId: 2, DataName: 'SFTP' }, { DataId: 3, DataName: 'SSH' }, { DataId: 4, DataName: 'VNC' }];
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<FileUploadPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.FileUploadDetailId = parentData.FileUploadDetailId;
  }

  ngOnInit(): void {
    this.PageTitle = "Create new file upload Details";
    this.DataDetailsForm = new FormGroup({
      UploaderTypeId: new FormControl('', [Validators.required]),
      LocalPath: new FormControl('', [Validators.required]),
      RemotePath: new FormControl('', [Validators.required]),
      ServerUrl: new FormControl('', [Validators.required]),
      ServerPort: new FormControl('', [Validators.required, Validators.pattern(regExps['PortNumber'])]),
      Username: new FormControl('', [Validators.required]),
      Password: new FormControl('', [Validators.required]),
      ScheduleHours: new FormControl(24, [Validators.required]),
      DataStatus: new FormControl(true)
    });
    if (this.FileUploadDetailId > 0) {
      this.PageTitle = "Update file upload Details";
      this.DetailsbyId();
    }

  }

  

  DetailsbyId() {
    this.spinner.show();
    this.dbService.FileUploadDetailGetById(this.FileUploadDetailId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.DetailData = data.ResponseData;
          this.UploaderTypeChange(this.DetailData.UploaderTypeId)
        }
        else {
          this.ClosePoup();
          this.ErrorData = [{ AlertMessage: "role details not found." }];
          this.dm.openSnackBar(this.ErrorData, false);
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

  fillDataByDB() {
    this.DataDetailsForm.controls['UploaderTypeId'].setValue(this.DetailData.UploaderTypeId);
    this.DataDetailsForm.controls['LocalPath'].setValue(this.DetailData.LocalPath);
    this.DataDetailsForm.controls['RemotePath'].setValue(this.DetailData.RemotePath);
    this.DataDetailsForm.controls['ServerUrl'].setValue(this.DetailData.ServerUrl);
    this.DataDetailsForm.controls['ServerPort'].setValue(this.DetailData.ServerPort);
    this.DataDetailsForm.controls['Username'].setValue(this.DetailData.Username);
    this.DataDetailsForm.controls['Password'].setValue(this.DetailData.Password);
    this.DataDetailsForm.controls['ScheduleHours'].setValue(this.DetailData.ScheduleHours);
    if (this.DetailData.DataStatus == 1)
      this.DataDetailsForm.controls['DataStatus'].setValue(true);
    else
      this.DataDetailsForm.controls['DataStatus'].setValue(false);
  }

  ClosePoup() { this.Dialogref.close(false); }

  UploaderTypeChange(UploaderTypeId: any) {
    this.FileUploaderTypeId = UploaderTypeId;
    if(UploaderTypeId==0){
      this.DataDetailsForm.controls['RemotePath'].setValue("NR");
      this.DataDetailsForm.controls['ServerUrl'].setValue("NR");
      this.DataDetailsForm.controls['ServerPort'].setValue(0);
      this.DataDetailsForm.controls['Username'].setValue("NR");
      this.DataDetailsForm.controls['Password'].setValue("NR");
      this.DataDetailsForm.controls['ScheduleHours'].setValue(24);
    }
    else{
      if(this.DetailData!=null){
        this.fillDataByDB()
        this.DataDetailsForm.controls['UploaderTypeId'].setValue(UploaderTypeId);
      }
    }
  }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      FileUploadDetailId: this.FileUploadDetailId,
      UploaderTypeId: this.DataDetailsForm.value.UploaderTypeId,
      LocalPath: this.DataDetailsForm.value.LocalPath,
      RemotePath: this.DataDetailsForm.value.RemotePath,
      ServerUrl: this.DataDetailsForm.value.ServerUrl,
      ServerPort: this.DataDetailsForm.value.ServerPort,
      Username: this.DataDetailsForm.value.Username,
      Password: this.DataDetailsForm.value.Password,
      ScheduleHours: this.DataDetailsForm.value.ScheduleHours,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.FileUploadDetailInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success') > -1) {
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