import { DatePipe } from '@angular/common';
import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import 'quill-emoji/dist/quill-emoji.js';
import Quill from 'quill'
import BlotFormatter from 'quill-blot-formatter';
import { EditorChangeContent, EditorChangeSelection } from 'ngx-quill';
var Font = Quill.import('formats/font');
const fontFamiltArr = ['Arial', 'Calibri', 'Verdana', 'Microsoft Himalaya'];
Font.whitelist = fontFamiltArr;
Quill.register(Font, true);
var Size = Quill.import('attributors/style/size');
const fontSizeArr = ['8px', '10px', '12px', '14px', '16px', '18px', '20px', '22px', '24px'];
Size.whitelist = fontSizeArr;
Quill.register(Size, true);
Quill.register('modules/blotFormatter', BlotFormatter);
@Component({
  selector: 'app-vms-message-details-popup',
  templateUrl: './vms-message-details-popup.component.html',
  styleUrls: ['./vms-message-details-popup.component.css']
})
export class VMSMessageDetailsPopupComponent {
  changedEditor($event: EditorChangeContent | EditorChangeSelection) {
    throw new Error('Method not implemented.');
  }
  PageTitle: any;
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  PackageId: number;
  DataStatus = true;
  LogedUserId;
  ErrorData: any;
  DetailData: any;
  submitted = false;
  VMSDetailsData: any;
  FormateTypeList = [{ DataId: 1, DataName: "Text" }, { DataId: 2, DataName: "Image" }, { DataId: 3, DataName: "Video" }];
  DurationList = [{ DataId: 10, DataName: "10 Second" }, { DataId: 20, DataName: "20 Second" }, { DataId: 30, DataName: "30 Second" }];
  MediaPrefix: any;
  createdEvent: any;
  MediaFile: any;
  modules = {};
  SelectedFormateTypeId = 1;
  uploadedFiles: any[] = [];
  SystemId = 0;
  MessageId = 0;

  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<VMSMessageDetailsPopupComponent>, public dialog: MatDialog, public datepipe: DatePipe) {
    this.LogedUserId = this.dm.getUserId();
    this.PackageId = parentData.PackageId;
    this.MessageId = parentData.MessageId;
    this.modules = {
      'emoji-shortname': true,
      'emoji-textarea': false,
      'emoji-toolbar': true,
      blotFormatter: {
        // empty object for default behaviour.
      },
      'toolbar': {
        container: [
          ['bold', 'italic'],        // toggled buttons
          ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
          [{ 'size': fontSizeArr }],  // custom dropdown
          [{ 'color': [] }],          // dropdown with defaults from theme
          [{ 'font': fontFamiltArr }],
          [{ 'align': [] }],
          ['emoji'],
        ],
        handlers: { 'emoji': function () { } }
      }
    }
  }

  ngOnInit(): void {
    localStorage.setItem('manualData', '');
    localStorage.setItem('manualhtml', '');
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.PageTitle = 'Create New Message';
    this.DataDetailsForm = new FormGroup({
      EquipmentId: new FormControl('', Validators.required),
      MessageTypeId: new FormControl('', Validators.required),
      DisplayTimout: new FormControl('', Validators.required),
      ValidTillDate: new FormControl(new Date(SDDate + " 00:00:00")),
      MessageDetails: new FormControl('', Validators.required),
      DataStatus: new FormControl(true),
    });
    this.SystemGetByName();
    if (this.MessageId > 0) {
      this.PageTitle = 'Update Message';
    }
  }
  SystemGetByName() {
    this.spinner.show();
    let MenuUrl = window.location.pathname.replace('/', '');
    let systenname = MenuUrl.substring(0, 3)
    this.dbService.SystemGetByName(systenname).subscribe(
      data => {
        let SystemDetails = data.ResponseData;
        this.SystemId = SystemDetails.SystemId;
        this.GetVMSList();
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetVMSList() {
    this.spinner.show();
    this.dbService.EquipmentDetailsGetBySystemId(this.SystemId).subscribe(
      data => {
        this.spinner.hide();
        this.VMSDetailsData = data.ResponseData.filter((e: { EquipmentTypeId: any; }) => e.EquipmentTypeId == 8);
        if (this.MessageId > 0) {
          this.DetailsbyId();
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
        this.Dialogref.close();
      }
    );
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.VMSMessageGetById(this.MessageId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        var selectedVMSDevice = [];
        if (this.DetailData.EquipmentIds == '0') {
          for (let index = 0; index < this.VMSDetailsData.length; index++) {
            selectedVMSDevice.push(this.VMSDetailsData[index].EquipmentId);
          }
        }
        else {
          var data = this.DetailData.EquipmentIds.split(',');
          for (let index = 0; index < data.length; index++) {
            selectedVMSDevice.push(parseInt(data[index]));
          }
        }

        this.SelectedFormateTypeId = this.DetailData.MessageTypeId;
        this.DataDetailsForm.controls['EquipmentId'].setValue(selectedVMSDevice);
        this.DataDetailsForm.controls['MessageTypeId'].setValue(this.SelectedFormateTypeId);
        this.DataDetailsForm.controls['DisplayTimout'].setValue(this.DetailData.DisplayTimout);
        this.DataDetailsForm.controls['ValidTillDate'].setValue(this.DetailData.ValidTillDateStamp);
        this.DataDetailsForm.controls['MessageDetails'].setValue(this.DetailData.MessageDetails);
        if (this.DetailData.DataStatus == 1)
          this.DataDetailsForm.controls['DataStatus'].setValue(true);
        else
          this.DataDetailsForm.controls['DataStatus'].setValue(false);

        this.GetMediaFile(this.DetailData.MediaPath);
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
    this.DataDetailsForm.reset();
  }

  created(event: any) {
    this.createdEvent = event;
    this.createdEvent.root.innerHTML = localStorage.getItem('manualhtml')
  }
  contentChanged(obj: any) {
    localStorage.setItem('manualhtml', obj.html);
  }


  GetMediaFile(theUrl: any) {
    this.spinner.show();
    var encodedStringBtoA = btoa(theUrl);
    this.dbService.GetMediaFile(encodedStringBtoA).subscribe(
      data => {
        this.spinner.hide();
        if (this.SelectedFormateTypeId == 1) {
          localStorage.setItem('manualData', data.ResponseData);
          try {
            this.createdEvent.root.innerHTML = data.ResponseData;
          } catch (error) {

          }
        }
        else {
          this.uploadedFiles = [];
          this.MediaFile = data.ResponseData;
          const Obj = {
            Base64: this.MediaFile,
            file: theUrl
          }
          this.uploadedFiles.push(Obj);
          this.DataDetailsForm.controls['MessageDetails'].setValue(this.MediaFile);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }


  onUpload(event: any) {
    this.uploadedFiles = [];
    this.spinner.show();
    const file = event.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      this.spinner.hide();
      this.MediaFile = reader.result;
      const Obj = {
        Base64: reader.result,
        file: file
      }
      this.uploadedFiles.push(Obj);
      this.DataDetailsForm.controls['MessageDetails'].setValue(this.MediaFile);
    };
  }

  onRemove(event: any) {
    this.uploadedFiles = [];
    this.MediaFile = undefined;
    this.DataDetailsForm.controls['MessageDetails'].setValue('');
  }
  onFormatChange(FormatId: any) {
    this.SelectedFormateTypeId = FormatId;
  }
  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.valid == false) {
      return;
    }
    let MediaPath = "";
    if (this.SelectedFormateTypeId == 2 || this.SelectedFormateTypeId == 3) {
      MediaPath = this.uploadedFiles[0].Base64
    }
    else {
      MediaPath = localStorage.getItem('manualhtml') || '';
    }
    const Obj = {
      MessageId: this.MessageId,
      EquipmentIds: this.DataDetailsForm.value.EquipmentId.toString(),
      MediaPath: MediaPath,
      MessageTypeId: this.DataDetailsForm.value.MessageTypeId,
      DisplayTimout: this.DataDetailsForm.value.DisplayTimout,
      MessageDetails: this.DataDetailsForm.value.MessageDetails,
      ValidTillDate: this.datepipe.transform(this.DataDetailsForm.value.ValidTillDate, 'dd-MMM-yyyy') || new Date(),
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    };
    this.spinner.show();
    this.dbService.VMSMessageSetUp(Obj).subscribe(
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