import { DatePipe } from '@angular/common';
import { Component ,Inject} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';
import 'quill-emoji/dist/quill-emoji.js';
import Quill from 'quill'
import Delta from 'quill'
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
  selector: 'app-vms-popup',
  templateUrl: './vms-popup.component.html',
  styleUrls: ['./vms-popup.component.css']
})
export class VmsPopupComponent {
changedEditor($event: EditorChangeContent|EditorChangeSelection) {
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
  FormateTypeList = [{ FormateTypeId: 1, FormateTypeName: "Text" },{ FormateTypeId: 2, FormateTypeName: "Image" },{ FormateTypeId: 3, FormateTypeName: "Video" }];
  DurationList = [{ DurationId: 10, DurationName: "10 Second" },{ DurationId: 20, DurationName: "20 Second" },{ DurationId: 30, DurationName: "30 Second"}];
  MediaPrefix: any;
  createdEvent: any;
  MediaFile: any;
  modules = {};
  SelectedFormateTypeId = 1;
  uploadedFiles: any[] = [];
  SystemId = 0;
  MessageId= 0;
  
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any,
    private dm: DataModel, public Dialogref: MatDialogRef<VmsPopupComponent>, public dialog: MatDialog, public datepipe: DatePipe) {
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
          //['bold', 'italic', 'underline', 'strike'],        // toggled buttons
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
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.PageTitle = 'Create New Message';
    this.DataDetailsForm = new FormGroup({
      VmsId: new FormControl('', Validators.required),
      FormatTypeId: new FormControl('', Validators.required),
      DurationId: new FormControl('', Validators.required),
      validDate: new FormControl(new Date(SDDate + " 00:00:00")),
      MessageDetails:new FormControl('', Validators.required),
      DataStatus: new FormControl(true),
    });
    this.SystemGetByName();
    //this.GetVMSList();
    if (this.MessageId > 0) {
      this.PageTitle = 'Update VMS Details';
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
        //this.PackageId=this.VMSDetailsData[0].PackageId;

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
    this.dbService.MessageDetailsGetById(this.MessageId).subscribe(
      data => {
        this.spinner.hide();
        this.DetailData = data.ResponseData;
        // this.DataDetailsForm.controls['ControlRoomId'].setValue(this.DetailData.ControlRoomId);
        // this.DataDetailsForm.controls['PackageName'].setValue(this.DetailData.PackageName);
        // this.DataDetailsForm.controls['StartLatitude'].setValue(this.DetailData.StartLatitude);
        // this.DataDetailsForm.controls['StartLongitude'].setValue(this.DetailData.StartLongitude);
        // this.DataDetailsForm.controls['EndLatitude'].setValue(this.DetailData.EndLatitude);
        // this.DataDetailsForm.controls['EndLongitude'].setValue(this.DetailData.EndLongitude);
        // this.DataDetailsForm.controls['StartChainageNumber'].setValue(this.DetailData.StartChainageNumber);
        // this.DataDetailsForm.controls['EndChainageNumber'].setValue(this.DetailData.EndChainageNumber);
        // if (this.DetailData.DataStatus == 1) {
        //   this.DataDetailsForm.controls['DataStatus'].setValue(true);
        // } else {
        //   this.DataDetailsForm.controls['DataStatus'].setValue(false);
        // }

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
 contentChanged(obj: any) {
    localStorage.setItem('manualhtml', obj.html);
  }
  
  created(event: any) {
    this.createdEvent = event;
    this.createdEvent.root.innerHTML = localStorage.getItem('manualData')
  }
  onFormatChange(FormatId: any) {
    this.SelectedFormateTypeId = FormatId;
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
    };
  }

  onRemove(event: any) {
    this.uploadedFiles = [];
    this.MediaFile = undefined;
  }
  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.valid) {
      return;
    }
    const Obj = {
      MessageId: this.MessageId,
      VmsId: this.DataDetailsForm.value.VmsId,
      MediaPath: this.uploadedFiles[0].Base64,
      FormatId: this.DataDetailsForm.value.FormatTypeId,
      DisplayTimout: this.DataDetailsForm.value.DurationId,
      ValidTillDate: this.DataDetailsForm.value.validDate,
      MessageDetails: this.DataDetailsForm.value.MessageDetails,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId
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

