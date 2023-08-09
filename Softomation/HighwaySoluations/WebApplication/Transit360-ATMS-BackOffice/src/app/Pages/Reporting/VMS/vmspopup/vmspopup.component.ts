import { Component, ElementRef, Inject, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatOption } from '@angular/material/core';
import { MatDialog, MatDialogConfig, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService } from 'primeng/api';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';


@Component({
  selector: 'app-vmspopup',
  templateUrl: './vmspopup.component.html',
  styleUrls: ['./vmspopup.component.css']
})
export class VMSPopupComponent implements OnInit {
DeviceDetailsForm: FormGroup;
error = errorMessages;
EntryId: number;
VMSDevice;
DataStatus = true;
DataStatusDs = 1;
LoginUserId;
ErrorData: any;
HardwareTypeList: any;
SiteList: any;
DevicesData: any;
TMSID;
MessageDurationList = [{ Id: 10, Name: 10 }, { Id: 15, Name: 15 }, { Id: 20, Name: 20 }, { Id: 25, Name: 25 }, { Id: 30, Name: 30 }];
MessageFormatList = [{ Id: 1, Name: 'Text' }, { Id: 2, Name: 'Image' }];
MessageAlignmentList = [{ Id: 1, Name: 'Left' }, { Id: 2, Name: 'Center' }, { Id: 2, Name: 'Right' }];
MessagePattern = [{ Id: 1, Name: 1 }, { Id: 2, Name: 2 }, { Id: 3, Name: 3 }];
MessageLanguageList = [{ Id: 1, Name: 'English' }, { Id: 2, Name: 'Other' }];
MessageTypeList = [{ Id: 1, Name: 'Static' }]; // ,{ Id: 2, Name: "Other" }
FontSizeList = [];
BrightnessList = [];
dataimage: any;
@ViewChild('fileInput') fileInput: ElementRef;
fileAttr = 'Choose File';

@ViewChild('VMSallSelected') private VMSallSelected: MatOption;
VMSAll = 'Select All';
disableVMS = false;
selectedVMS;
selectedMessageFormat = 1;
FontList;

close() { this.Dialogref.close(); }
constructor(private dbService: ApiService, private emitService: EmittersService, private spinner: NgxSpinnerService,
            @Inject(MAT_DIALOG_DATA) data, public Dialogref: MatDialogRef<VMSPopupComponent>, public dialog: MatDialog,
            private confirmationService: ConfirmationService) {
  this.LoginUserId = this.emitService.getUserDetails();
  this.EntryId = data.EntryId;
}

ngOnInit(): void {
  for (let i = 12; i <= 72; i++) {
    this.FontSizeList.push({Id: i, Name: i});
  }
  for (let i = 0; i <= 12; i++) {
    this.BrightnessList.push({Id: i, Name: i});
  }
  this.DeviceDetailsForm = new FormGroup({
    DeviceId: new FormControl('', [
      Validators.required
    ]),
    MessageFormatId: new FormControl('', [
      Validators.required
    ]),
    MessageOrientationId: new FormControl('', [
      Validators.required
    ]),
    FontFormat: new FormControl('', [
      Validators.required
    ]),
    FontSize: new FormControl('', [
      Validators.required
    ]),
    AlignmentId: new FormControl('', [
      Validators.required
    ]),
    MessagePattern: new FormControl('', [
      Validators.required
    ]),
    Brightness: new FormControl('', [
      Validators.required
    ]),
    MessageLanguageId: new FormControl('', [
      Validators.required
    ]),
    MessageDuration: new FormControl('', [Validators.required]),
    MessageBody: new FormControl('', [Validators.required]),
  });
  this.VMSDeviceList();
  this.GetFontList();
}
GetFontList() {
  this.dbService.SystemFont().subscribe(
    data => {
      this.FontList = data.ResponceData.Families;

    },
    (error) => {
    }
  );
}
VMSDeviceList() {
  this.dbService.DevicesMasterGetByType(8).subscribe(
    data => {
      this.VMSDevice = data.ResponceData;
      const op = this.VMSDevice.map(function(item) {
        return item.EntryId;
      });
      op.push(0);
      this.DeviceDetailsForm.controls.DeviceId.setValue(op);
      if (this.EntryId != 0) {
        this.DevicesDataGetById();
      }
    },
    (error) => {
    }
  );
}

onFormatChange(event) {
  this.selectedMessageFormat = event;
  if (event == 2) {
    this.DeviceDetailsForm.controls.FontFormat.setValue('Calibri');
    this.DeviceDetailsForm.controls.FontSize.setValue(0);
    this.DeviceDetailsForm.controls.AlignmentId.setValue(0);
    this.DeviceDetailsForm.controls.Brightness.setValue(0);
    this.DeviceDetailsForm.controls.MessagePattern.setValue(0);
    this.DeviceDetailsForm.controls.MessageBody.setValue('');
    this.DeviceDetailsForm.controls.MessageLanguageId.setValue(0);
  } else {
    this.DeviceDetailsForm.controls.FontFormat.reset();
    this.DeviceDetailsForm.controls.FontSize.reset();
    this.DeviceDetailsForm.controls.AlignmentId.reset();
    this.DeviceDetailsForm.controls.Brightness.reset();
    this.DeviceDetailsForm.controls.MessagePattern.reset();
    this.DeviceDetailsForm.controls.MessageBody.reset();
    this.DeviceDetailsForm.controls.MessageLanguageId.reset();
  }
}

toggleAllSelection(val) {

  if (val == 'VMS') {
    if (this.VMSallSelected.selected) {
      const op = this.VMSDevice.map(function(item) {
        return item.EntryId;
      });
      op.push(0);
      this.DeviceDetailsForm.controls.DeviceId.setValue(op);
      this.VMSAll = 'Select All';
    } else {
      this.DeviceDetailsForm.controls.DeviceId.setValue('');
      this.VMSAll = 'Unselect All';
    }
  }

}

onDeviceChnage(event) {
  this.DeviceDetailsForm.controls.IpAddress.reset();
  this.DeviceDetailsForm.controls.PortNumber.reset();
  const result = this.VMSDevice.filter(e => e.EntryId == event);
  if (result.length > 0) {
  this.DeviceDetailsForm.controls.IpAddress.setValue(result[0].IpAddress);
  this.DeviceDetailsForm.controls.PortNumber.setValue(result[0].PortNumber);
  }
}

onChange(event) {
  if (event.checked) {
    this.DataStatus = true;
    this.DataStatusDs = 1;
  } else {
    this.DataStatus = false;
    this.DataStatusDs = 2;
  }
}

uploadFileEvt(imgFile: any) {
  if (imgFile.target.files && imgFile.target.files[0]) {
    this.fileAttr = '';
    Array.from(imgFile.target.files).forEach((file: File) => {
      this.fileAttr += file.name ;
    });

    // HTML5 FileReader API
    const reader = new FileReader();
    reader.onload = (e: any) => {
      const image = new Image();
      image.src = e.target.result;
      image.onload = rs => {
        const imgBase64Path = e.target.result;
        console.log(imgBase64Path);
        this.dataimage = imgBase64Path;
      };
    };
    reader.readAsDataURL(imgFile.target.files[0]);

    // Reset if duplicate image uploaded again
    this.fileInput.nativeElement.value = '';
  } else {
    this.fileAttr = 'Choose File';
  }
}

DevicesDataGetById() {
  this.spinner.show();
  this.dbService.VMSGetById(this.EntryId).subscribe(
    data => {
      this.spinner.hide();
      this.DevicesData = data.ResponceData;
      this.DataStatusDs = this.DevicesData.DataStatus;
      if (this.DevicesData.DataStatus == 1) {
        this.DataStatus = true;
      } else {
        this.DataStatus = false;
      }
      this.selectedMessageFormat = this.DevicesData.MessageFormatId;
      this.DeviceDetailsForm.controls.MessageFormatId.setValue(this.DevicesData.MessageFormatId);
      this.DeviceDetailsForm.controls.FontFormat.setValue(this.DevicesData.FontFormat);
      this.DeviceDetailsForm.controls.FontSize.setValue(this.DevicesData.FontSize);
      this.DeviceDetailsForm.controls.AlignmentId.setValue(this.DevicesData.AlignmentId);
      this.DeviceDetailsForm.controls.Brightness.setValue(this.DevicesData.Brightness);
      this.DeviceDetailsForm.controls.MessageLanguageId.setValue(this.DevicesData.MessageLanguageId);
      this.DeviceDetailsForm.controls.MessageOrientationId.setValue(this.DevicesData.MessageOrientationId);
      this.DeviceDetailsForm.controls.MessageDuration.setValue(this.DevicesData.MessageDuration);
      this.DeviceDetailsForm.controls.MessageBody.setValue(this.DevicesData.MessageBody);

      if (this.DevicesData.VmsIds == '0') {
        const op = this.VMSDevice.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DeviceDetailsForm.controls.DeviceId.setValue(op);
      } else {
        if (this.DevicesData.VmsList.length > 1) {
         const arr = this.DevicesData.VmsIds.split(',');
         const NewArr = [];
         for (let index = 0; index < arr.length; index++) {
          const element = parseInt(arr[index]);
          NewArr.push(element);
         }
         this.DeviceDetailsForm.controls.DeviceId.setValue(NewArr);
        } else {
          const DeviveId = parseInt(this.DevicesData.VmsIds);
          const NewArr = [];
          NewArr.push(DeviveId);
          this.DeviceDetailsForm.controls.DeviceId.setValue(NewArr);
        }
      }
    },
    (error) => {
      this.spinner.hide();
      try {
        this.ErrorData = error.error;
        this.emitService.openSnackBar(this.ErrorData, false);
      } catch (error) {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    }
  );
}

SaveDeviceDetails(MessagePriority) {
  if (this.selectedMessageFormat == 2) {
    this.DeviceDetailsForm.controls.MessageBody.setValue(this.dataimage);
  }
  if (this.DeviceDetailsForm.invalid) {
    return;
  }
  if (MessagePriority == 1) {
      const message = 'This is emergency broadcast,Do you want to proceed?';
      this.confirmationService.confirm({
            message,
            accept: () => {
              this.OnSubmit(MessagePriority);
            }
          });
    } else {
       this.OnSubmit(MessagePriority);
    }
}

OnSubmit(MessagePriority) {
let VmsIds;
if (this.selectedVMS == undefined) {
    VmsIds = '0';
  } else {
    if (this.selectedVMS.length > this.VMSDevice.length) {
    VmsIds = '0';
    } else {
      VmsIds = this.selectedVMS.join();
      VmsIds = VmsIds.replace('0,', '');
    }
  }
let MessageBody = this.DeviceDetailsForm.value.MessageBody;
if (this.selectedMessageFormat == 2) {
    MessageBody = this.dataimage;
  }
const Obj = {
    EntryId: this.EntryId,
    VmsIds,
    MessageFormatId: this.DeviceDetailsForm.value.MessageFormatId,
    FontFormat: this.DeviceDetailsForm.value.FontFormat,
    FontSize: this.DeviceDetailsForm.value.FontSize,
    AlignmentId: this.DeviceDetailsForm.value.AlignmentId,
    Brightness: this.DeviceDetailsForm.value.Brightness,
    MessageLanguageId: this.DeviceDetailsForm.value.MessageLanguageId,
    MessageOrientationId: this.DeviceDetailsForm.value.MessageOrientationId,
    MessageDuration: this.DeviceDetailsForm.value.MessageDuration,
    MessageBody,
    MessagePriority,
    CreatedBy: this.LoginUserId,
    ModifiedBy: this.LoginUserId,
    DataStatus: this.DataStatusDs,
  };
this.spinner.show();
this.dbService.VMSInsertUpdate(Obj).subscribe(
    data => {
      this.spinner.hide();
      const returnMessage = data.Message[0].AlertMessage;
      if (returnMessage == 'success') {
        this.ErrorData = [{ AlertMessage: 'Success' }];
        this.emitService.setPageRefresh(true);
        this.emitService.openSnackBar(this.ErrorData, true);
        this.close();
      } else {
        this.ErrorData = data;
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    },
    (error) => {
      this.spinner.hide();
      try {
        this.ErrorData = error.error;
        this.emitService.openSnackBar(this.ErrorData, false);
      } catch (error) {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    }
  );
}

ClearData() {
  this.DeviceDetailsForm.reset();
}

}
