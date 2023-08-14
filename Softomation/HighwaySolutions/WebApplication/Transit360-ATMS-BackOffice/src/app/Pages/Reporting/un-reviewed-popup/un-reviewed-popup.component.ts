import { DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmationService } from 'primeng/api';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-un-reviewed-popup',
  templateUrl: './un-reviewed-popup.component.html',
  styleUrls: ['./un-reviewed-popup.component.css']
})
export class UnReviewedPopupComponent implements OnInit {
  CurrentMasterEntryId = 0;
  selectedEntry;
  ErrorData: any;
  FilterData: any;
  DeviceAuditForm: FormGroup;
  TransactionTypeData;
  LoginUserId;
  CurrentEntryId;
  UnReviewedList;
  ClassListData;
  selectedType;
  SelectedPlateImage;
  SelectedPlateVideo;
  APIRootPath;
  DataUpdate;
  TypeList =
  [
    { Id: 0, Name: 'Both' },
    { Id: 1, Name: 'TC' },
    { Id: 2, Name: 'AVC' },
    { Id: 3, Name: 'None' },
  ];

  TransTypeList =
  [
    { Id: 0, Name: 'Non Chargeable' },
    { Id: 1, Name: 'Chargeable' },

  ];
  constructor(@Inject(MAT_DIALOG_DATA) data, public Dialogref: MatDialogRef<UnReviewedPopupComponent>,
              private dbService: ApiService, private emitService: EmittersService, private spinner: NgxSpinnerService,
              public datepipe: DatePipe, private confirmationService: ConfirmationService) {
    this.LoginUserId = this.emitService.getUserDetails();
    this.CurrentEntryId = data.EntryId;
    this.FilterData = data.FilterData;
    this.APIRootPath = data.APIRootPath;
    this.DataUpdate = data.Permission;
  }

  ngOnInit(): void {
    this.GetClassList();
    this.GetTransactionType();
    this.DeviceAuditForm = new FormGroup({
      Class: new FormControl('', [
        Validators.required
      ]),
      AVCClass: new FormControl('', [
        Validators.required
      ]),
      PlateNumber: new FormControl('', [
        Validators.required
      ]),
      Amount: new FormControl('', [
        Validators.required
      ]),
      TransactionType: new FormControl('', [
        Validators.required
      ]),
      TCLoginId: new FormControl('', [
        Validators.required
      ]),
      LaneNumber: new FormControl('', [
        Validators.required
      ]),
      ShiftId: new FormControl('', [
        Validators.required
      ]),
      ReviewerClass: new FormControl('', [
        Validators.required
      ]),
      Remark: new FormControl('', []),
      ExemptType: new FormControl('', []),
      Type: new FormControl('', []),
    });
    this.GetFilterData();


  }
  GetTransactionType() {
    this.spinner.show();
    this.dbService.GetTransactionDetails().subscribe(
      data => {
        this.spinner.hide();
        this.TransactionTypeData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetClassList() {
    this.spinner.show();
    this.dbService.ClassMappingGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ClassListData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  GetFilterData() {
    this.spinner.show();
    this.dbService.GetUnreviewFilter(this.FilterData).subscribe(
      data => {
        this.spinner.hide();
        this.UnReviewedList = data.ResponceData;
        this.emitService.setPageRefresh(true);
        if (this.UnReviewedList.length > 0) {
          if (this.CurrentEntryId != 0) {
          const SelectedfilterData = this.UnReviewedList.filter(d => d.EntryId == this.CurrentEntryId);
          this.selectedEntry = SelectedfilterData[0];
          } else {
            this.selectedEntry = this.UnReviewedList[0];
            this.CurrentEntryId = this.selectedEntry.EntryId;
          }
          this.DataSelected();
       } else {
        this.ErrorData = [{ AlertMessage: 'no data found for review please change filter and try again.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
        this.close();
       }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  SaveAuditedDetails() {
    if (this.DeviceAuditForm.valid) {
      let Remark = this.DeviceAuditForm.value.Remark;
      if (Remark == undefined || Remark == null || Remark == '') {
        Remark = '';
      }
      if (this.selectedType != 0 && Remark == '') {
        this.ErrorData = [{ AlertMessage: 'Remark is required.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
        return;
      }
      if (this.selectedEntry.TransactionTypeId == 5 && Remark == '') {
        this.ErrorData = [{ AlertMessage: 'Remark is required.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
        return;
      }
      if (this.CurrentEntryId > 0) {
        const Obj = {
          TransactionId: this.CurrentEntryId,
          ReveiwedClassCorrection: this.selectedType,
          ReveiwedClassId: this.DeviceAuditForm.value.ReviewerClass,
          ReveiwedTransactionType: this.DeviceAuditForm.value.TransactionType,
          ReveiwedBy: this.LoginUserId,
          ReveiwedRemark: Remark
        };
        this.spinner.show();
        this.dbService.ReviewTransaction(Obj).subscribe(
          data => {
            this.spinner.hide();
            this.ErrorData = data.Message;
            this.emitService.openSnackBar(this.ErrorData, true);
            setTimeout( () => {
              this.ClearData();
              this.CurrentEntryId = 0;
              this.GetFilterData();
            }, 500 );

          },
          (error) => {
            this.spinner.hide();
            this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        );
      } else {
        this.ErrorData = [{ AlertMessage: 'Please select entry for audit.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    } else {
      this.ErrorData = [{ AlertMessage: 'Mandatory fields required.' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

  CancelData() {
    let Remark = this.DeviceAuditForm.value.Remark;
    if (Remark == undefined || Remark == null || Remark == '') {
      this.ErrorData = [{ AlertMessage: 'Remark must be entered.' }];
      this.emitService.openSnackBar(this.ErrorData, false);
      return;
    }
    if (this.CurrentEntryId > 0) {
      const message = 'Are you sure you want to do cancel?';
      this.confirmationService.confirm({
        message,
        accept: () => {
          const Obj = {
            TransactionId: this.CurrentEntryId,
            ReveiwedClassCorrection: this.selectedType,
            ReveiwedClassId: this.DeviceAuditForm.value.ReviewerClass,
            ReveiwedTransactionType: this.DeviceAuditForm.value.TransactionType,
            ReveiwedBy: this.LoginUserId,
            ReveiwedRemark: Remark
          };
          this.spinner.show();
          this.dbService.CancelTransaction(Obj).subscribe(
            data => {
              this.spinner.hide();
              this.ErrorData = data.Message;
              this.emitService.openSnackBar(this.ErrorData, true);
              setTimeout( () => {
                this.ClearData();
                this.CurrentEntryId = 0;
                this.GetFilterData();
              }, 500 );

            },
            (error) => {
              this.spinner.hide();
              this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
              this.emitService.openSnackBar(this.ErrorData, false);
            }
          );
        }
      });
    } else {
      this.ErrorData = [{ AlertMessage: 'Please select entry for audit.' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }
  ScrapData() {
    let Remark = this.DeviceAuditForm.value.Remark;
    if (Remark == undefined || Remark == null || Remark == '') {
      this.ErrorData = [{ AlertMessage: 'Remark must be entered.' }];
      this.emitService.openSnackBar(this.ErrorData, false);
      return;
    }
    if (this.CurrentEntryId > 0) {
      const message = 'Are you sure you want to do scrap?';
      this.confirmationService.confirm({
        message,
        accept: () => {
          const Obj = {
            TransactionId: this.CurrentEntryId,
            ReveiwedClassCorrection: this.selectedType,
            ReveiwedClassId: this.DeviceAuditForm.value.ReviewerClass,
            ReveiwedTransactionType: this.DeviceAuditForm.value.TransactionType,
            ReveiwedBy: this.LoginUserId,
            ReveiwedRemark: Remark
          };
          this.spinner.show();
          this.dbService.ScrapTransaction(Obj).subscribe(
            data => {
              this.spinner.hide();
              this.ErrorData = data.Message;
              this.emitService.openSnackBar(this.ErrorData, true);
              setTimeout( () => {
                this.ClearData();
                this.CurrentEntryId = 0;
                this.GetFilterData();
              }, 500 );


            },
            (error) => {
              this.spinner.hide();
              this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
              this.emitService.openSnackBar(this.ErrorData, false);
            }
          );
        }
      });
    } else {
      this.ErrorData = [{ AlertMessage: 'Please select entry for audit.' }];
      this.emitService.openSnackBar(this.ErrorData, false);
    }
  }

  ClearData() {
    this.DeviceAuditForm.reset();
  }

  onRowSelect(event) {
    this.selectedEntry = event.data;
    this.CurrentEntryId = this.selectedEntry.EntryId;
    this.DataSelected();
  }

  DataSelected() {
    this.DeviceAuditForm.controls.Class.setValue(this.selectedEntry.MappingClassName);
    this.DeviceAuditForm.controls.AVCClass.setValue(this.selectedEntry.AvcClassName);
    this.DeviceAuditForm.controls.TCLoginId.setValue(this.selectedEntry.TCLoginId);
    this.DeviceAuditForm.controls.ExemptType.setValue(this.selectedEntry.ExemptTypeName);
    this.DeviceAuditForm.controls.PlateNumber.setValue(this.selectedEntry.PlateNumber);
    this.DeviceAuditForm.controls.Amount.setValue(this.selectedEntry.TransactionAmount);
    this.DeviceAuditForm.controls.LaneNumber.setValue(this.selectedEntry.LaneNumber);
    this.DeviceAuditForm.controls.ShiftId.setValue('Shift ' + this.selectedEntry.ShiftId);
    this.DeviceAuditForm.controls.ReviewerClass.setValue(this.selectedEntry.MappingClassId);
    this.DeviceAuditForm.controls.ReviewerClass.disable();
    if (this.selectedEntry.MappingClassId == this.selectedEntry.AvcClassId) {
      this.DeviceAuditForm.controls.Type.setValue(0);
    } else {
      this.DeviceAuditForm.controls.Type.setValue(1);
    }
    // this.DeviceAuditForm.controls['TransactionType'].setValue(this.selectedEntry.TransactionTypeId);
    if (this.selectedEntry.TransactionTypeId == 5) {
      this.DeviceAuditForm.controls.TransactionType.enable();
      this.DeviceAuditForm.controls.TransactionType.setValue(0);
    } else {
      this.DeviceAuditForm.controls.TransactionType.setValue(1);
      this.DeviceAuditForm.controls.TransactionType.disable();
    }
    this.SelectedPlateImage = this.APIRootPath + '/Transcation/' + this.selectedEntry.TransactionImage;
    this.SelectedPlateVideo = this.APIRootPath + '/Transcation/' + this.selectedEntry.TransactionVideo;

  }

  TypeChnage(val) {
    if (val == 3) {
      this.DeviceAuditForm.controls.ReviewerClass.enable();
      this.DeviceAuditForm.controls.ReviewerClass.setValue(this.selectedEntry.MappingClassId);
    } else if (val == 2) {
      this.DeviceAuditForm.controls.ReviewerClass.enable();
      this.DeviceAuditForm.controls.ReviewerClass.setValue(this.selectedEntry.AvcClassId);
      this.DeviceAuditForm.controls.ReviewerClass.disable();
    } else if (val == 1) {
      this.DeviceAuditForm.controls.ReviewerClass.enable();
      this.DeviceAuditForm.controls.ReviewerClass.setValue(this.selectedEntry.MappingClassId);
      this.DeviceAuditForm.controls.ReviewerClass.disable();
    } else {
      if (this.selectedEntry.MappingClassId == this.selectedEntry.AvcClassId) {
        this.DeviceAuditForm.controls.ReviewerClass.enable();
        this.DeviceAuditForm.controls.ReviewerClass.setValue(this.selectedEntry.MappingClassId);
        this.DeviceAuditForm.controls.ReviewerClass.disable();
      } else {
        this.ErrorData = [{ AlertMessage: 'Invalid Option.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
        return false;
      }
    }


  }

  close() {
    this.emitService.setPageRefresh(true);
    this.Dialogref.close();
  }

  CheckImage() {
    let popupWindow = window.open(this.SelectedPlateImage, 'popUpWindow', 'height=500,width=500,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
	}

}
