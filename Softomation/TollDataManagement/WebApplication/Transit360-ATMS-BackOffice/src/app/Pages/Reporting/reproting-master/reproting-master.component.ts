import { coerceStringArray } from '@angular/cdk/coercion';
import { DatePipe } from '@angular/common';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatOption } from '@angular/material/core/option';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { errorMessages } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-reproting-master',
  templateUrl: './reproting-master.component.html',
  styleUrls: ['./reproting-master.component.css']
})
export class ReprotingMasterComponent implements OnInit {
  DetailsForm: FormGroup;
  error = errorMessages;
  ErrorData;
  LogedUserId;
  ClientId;
  CategoryData;
  SubCategoryData;
  SubCategoryId = 0;
  ShiftData;
  @ViewChild('shiftallSelected') private shiftallSelected: MatOption;
  ShiftAll = 'Select All';
  disableShift = false;
  selectedShiftType;

  @ViewChild('classallSelected') private classallSelected: MatOption;
  ClassData;
  disableClass = false;
  selectedClassType;
  ClassAll = 'Select All';

  @ViewChild('laneallSelected') private laneallSelected: MatOption;
  LaneData;
  disableLane = false;
  selectedLaneType;
  LaneAll = 'Select All';

  @ViewChild('TranTypeallSelected') private TranTypeallSelected: MatOption;
  TranTypeData;
  disableTranType = false;
  selectedTranType;
  TranTypeAll = 'Select All';

  @ViewChild('ExemptTypeallSelected') private ExemptTypeallSelected: MatOption;
  ExemptTypeData;
  disableExemptType = false;
  selectedExemptType;
  ExemptTypeAll = 'Select All';

  @ViewChild('PaymentTypeallSelected') private PaymentTypeallSelected: MatOption;
  PaymentTypeData;
  disablePaymentType = false;
  selectedPaymentType;
  PaymentTypeAll = 'Select All';

  @ViewChild('laneUserallSelected') private laneUserallSelected: MatOption;
  LaneUserData;
  disableLaneUser = false;
  selectedLaneUser;
  LaneUserAll = 'Select All';


  constructor(private dbService: ApiService, private spinner: NgxSpinnerService, private emitService: EmittersService,
              public datepipe: DatePipe) {
    this.LogedUserId = this.emitService.getUserDetails();
    this.ClientId = this.emitService.getClientId();
  }

  ngOnInit(): void {
    this.GetCategoryData();
    this.GetShiftData();
    this.GetClassData();
    this.GetLaneData();
    this.GetTranTypeData();
    this.GetExemptTypeData();
    this.GetPaymentDetails();
    this.GetLaneUsersData();
    const today = new Date();
    const month = today.getMonth();
    const year = today.getFullYear();
    this.DetailsForm = new FormGroup({
      CategoryId: new FormControl('', [
        Validators.required
      ]),
      SubCategoryId: new FormControl('', [
        Validators.required
      ]),
      StartDate: new FormControl(new Date(), [
        Validators.required
      ]),
      EndDate: new FormControl(new Date(), [
        Validators.required
      ]),
      StartTime: new FormControl('00:00', [
        Validators.required
      ]),
      EndTime: new FormControl('23:59', [
        Validators.required
      ]),
      ShiftId: new FormControl('', [
        Validators.required
      ]),
      ClassId: new FormControl('', [
        Validators.required
      ]),
      LaneId: new FormControl('', [
        Validators.required
      ]),
      LaneUserId: new FormControl('', [
        Validators.required
      ]),
      PaymentTypeId: new FormControl(''),
      ExemptTypeId: new FormControl(''),
      TranTypeId: new FormControl('', [
        Validators.required
      ]),
    });

    this.disablePaymentType = true;
    this.disableExemptType = true;
  }

  toggleAllSelection(val) {
    if (val == 'Shift') {
      if (this.shiftallSelected.selected) {
        const op = this.ShiftData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.ShiftId.setValue(op);
        this.ShiftAll = 'Select All';
      } else {
        this.DetailsForm.controls.ShiftId.setValue('');
        this.ShiftAll = 'Unselect All';
      }
    } else if (val == 'Lane') {
      debugger;
      if (this.laneallSelected.selected) {
        const op = this.LaneData.map(function(item) {
          return item.LaneNumber;
        });
        op.push(0);
        this.DetailsForm.controls.LaneId.setValue(op);
        this.LaneAll = 'Select All';
      } else {
        this.DetailsForm.controls.LaneId.setValue('');
        this.LaneAll = 'Unselect All';
      }
    } else if (val == 'Class') {
      if (this.classallSelected.selected) {
        const op = this.ClassData.map(function(item) {
          return item.ClassId;
        });
        op.push(0);
        this.DetailsForm.controls.ClassId.setValue(op);
        this.ClassAll = 'Select All';
      } else {
        this.DetailsForm.controls.ClassId.setValue('');
        this.ClassAll = 'Unselect All';
      }
    } else if (val == 'User') {
      if (this.laneUserallSelected.selected) {
        const op = this.LaneUserData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.LaneUserId.setValue(op);
        this.LaneUserAll = 'Select All';
      } else {
        this.DetailsForm.controls.LaneUserId.setValue('');
        this.LaneUserAll = 'Unselect All';
      }
    } else if (val == 'TranType') {
      if (this.TranTypeallSelected.selected) {
        const op = this.TranTypeData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.TranTypeId.setValue(op);
        this.TranTypeAll = 'Select All';
      } else {
        this.DetailsForm.controls.TranTypeId.setValue('');
        this.TranTypeAll = 'Unselect All';
      }
    } else if (val == 'ExemptType') {
      if (this.ExemptTypeallSelected.selected) {
        const op = this.ExemptTypeData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.ExemptTypeId.setValue(op);
        this.ExemptTypeAll = 'Select All';
      } else {
        this.DetailsForm.controls.ExemptTypeId.setValue('');
        this.ExemptTypeAll = 'Unselect All';
      }
    } else if (val == 'PaymentType') {
      if (this.PaymentTypeallSelected.selected) {
        const op = this.PaymentTypeData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.PaymentTypeId.setValue(op);
        this.PaymentTypeAll = 'Select All';
      } else {
        this.DetailsForm.controls.PaymentTypeId.setValue('');
        this.PaymentTypeAll = 'Unselect All';
      }
    }
  }
  GetCategoryData() {
    this.spinner.show();
    this.dbService.GetReportCategory().subscribe(
      data => {
        this.spinner.hide();
        this.CategoryData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  CategoryChange(vale) {
    this.spinner.show();
    this.dbService.GetSubReportCategory(vale).subscribe(
      data => {
        this.spinner.hide();
        this.SubCategoryData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  SubCategoryChange(vale) {
    this.SubCategoryId = vale;
    if (vale == 22) {
      const op = this.ExemptTypeData.map(function(item) {
        return item.EntryId;
      });
      this.DetailsForm.controls.ExemptTypeId.setValue(op);
    } else {
      this.DetailsForm.controls.ExemptTypeId.reset();
    }

  }
  GetShiftData() {
    this.spinner.show();
    this.dbService.GetShiftDetails().subscribe(
      data => {
        this.spinner.hide();
        this.ShiftData = data.ResponceData;
        const op = this.ShiftData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.ShiftId.setValue(op);
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetClassData() {
    this.spinner.show();
    this.dbService.ClassMappingGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ClassData = data.ResponceData;
        const op = this.ClassData.map(function(item) {
          return item.ClassId;
        });
        op.push(0);
        this.DetailsForm.controls.ClassId.setValue(op);
        // this.ClassId.setValue(op);
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetLaneData() {
    this.spinner.show();
    this.dbService.LaneConfigurationGetByType(2).subscribe(
      data => {
        this.spinner.hide();
        this.LaneData = data.ResponceData;
        const op = this.LaneData.map(function(item) {
          return item.LaneNumber;
        });
        op.push(0);
        this.DetailsForm.controls.LaneId.setValue(op);
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetTranTypeData() {
    this.spinner.show();
    this.dbService.GetTransactionDetails().subscribe(
      data => {
        this.spinner.hide();
        this.TranTypeData = data.ResponceData;
        const op = this.TranTypeData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.TranTypeId.setValue(op);

      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetExemptTypeData() {
    this.spinner.show();
    this.dbService.GetExemptDetails().subscribe(
      data => {
        this.spinner.hide();
        this.ExemptTypeData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetPaymentDetails() {
    this.spinner.show();
    this.dbService.GetPaymentDetails().subscribe(
      data => {
        this.spinner.hide();
        this.PaymentTypeData = data.ResponceData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  GetLaneUsersData() {
    this.dbService.UserConfigurationGetAllLaneUsers().subscribe(
      data => {
        this.LaneUserData = data.ResponceData;
        const op = this.LaneUserData.map(function(item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls.LaneUserId.setValue(op);
      },
      (error) => {
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
  FilterData() {
    debugger;
    if (this.DetailsForm.valid) {
      let SD, ED, Exempt, Payment, Shift, VehicleClass, Lane, TranType, LaneUser;
      SD = this.datepipe.transform(this.DetailsForm.value.StartDate, 'dd-MMM-yyy');
      SD = SD + ' ' + this.DetailsForm.value.StartTime + ':00';
      const StartDateTime = this.datepipe.transform(SD, 'dd-MMM-yyy HH:mm:ss');

      ED = this.datepipe.transform(this.DetailsForm.value.EndDate, 'dd-MMM-yyy');
      ED = ED + ' ' + this.DetailsForm.value.EndTime + ':59';
      const EndDateTime = this.datepipe.transform(ED, 'dd-MMM-yyy HH:mm:ss');

      if (this.selectedExemptType == undefined) {
        Exempt = '0';
      } else {
        if (this.selectedExemptType.length >= this.ExemptTypeData.length) {
          Exempt = 'ALL';
        } else {
          Exempt = this.selectedExemptType.join();
          Exempt = Exempt.replace(',0', '');
        }
      }
      if (this.selectedPaymentType == undefined) {
        Payment = '0';
      } else {
        if (this.selectedPaymentType.length >= this.PaymentTypeData.length) {
          Payment = 'ALL';
        } else {
          Payment = this.selectedPaymentType.join();
          Payment = Payment.replace(',0', '');
        }
      }
      if (this.selectedShiftType == undefined) {
        Shift = '0';
      } else {
        if (this.selectedShiftType.length >= this.ShiftData.length) {
          Shift = 'ALL';
        } else {
          Shift = this.selectedShiftType.join();
          Shift = Shift.replace(',0', '');
        }
      }
      if (this.selectedClassType == undefined) {
        VehicleClass = '0';
      } else {
        if (this.selectedClassType.length >= this.ClassData.length) {
          VehicleClass = 'ALL';
        } else {
          VehicleClass = this.selectedClassType.join();
          VehicleClass = VehicleClass.replace(',0', '');
        }
      }
      if (this.selectedLaneType == undefined) {
        Lane = '0';
      } else {
        if (this.selectedLaneType.length >= this.ClassData.length) {
          Lane = 'ALL';
        } else {
          Lane = this.selectedLaneType.join();
          Lane = Lane.replace(',0', '');
        }
      }
      if (this.selectedTranType == undefined) {
        TranType = '0';
      } else {
        if (this.selectedTranType.length >= this.TranTypeData.length) {
          TranType = 'ALL';
        } else {
          TranType = this.selectedTranType.join();
          TranType = TranType.replace(',0', '');
        }
      }
      if (this.selectedLaneUser == undefined) {
        LaneUser = '0';
      } else {
        if (this.selectedLaneUser.length >= this.LaneUserData.length) {
          LaneUser = 'ALL';
        } else {
          LaneUser = this.selectedLaneUser.join();
          LaneUser = LaneUser.replace(',0', '');
        }
      }
      const Obj = {
        SubCategoryId: this.DetailsForm.value.SubCategoryId,
        Shift,
        VehicleClass,
        Lane,
        TranType,
        LaneUser,
        ExemptType: Exempt,
        PaymentType: Payment,
        StartDateTime,
        EndDateTime,
        GenratedBy: this.LogedUserId
      };

      this.spinner.show();
      this.dbService.ReportFilter(Obj).subscribe(
        data => {
          this.spinner.hide();
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.ErrorData = [{ AlertMessage: 'Success' }];
            this.emitService.setPageRefresh(true);
            this.emitService.openSnackBar(this.ErrorData, true);
          } else if (returnMessage.includes('.pdf')) {
            this.ErrorData = [{ AlertMessage: 'Success' }];
            window.open(returnMessage, '_blank', );
            this.emitService.setPageRefresh(true);
            this.emitService.openSnackBar(this.ErrorData, true);
          } else {
            this.ErrorData = data.Message;
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        },
        (error) => {
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      );
    }

  }
  ResetFilter() {
    this.DetailsForm.reset();
    this.GetCategoryData();
    this.GetShiftData();
    this.GetClassData();
    this.GetLaneData();
    this.GetTranTypeData();
    this.GetExemptTypeData();
    this.GetPaymentDetails();
    this.GetLaneUsersData();
    this.DetailsForm.controls.StartDate.setValue(new Date());
    this.DetailsForm.controls.EndDate.setValue(new Date());
    this.DetailsForm.controls.StartTime.setValue('00:00');
    this.DetailsForm.controls.EndTime.setValue('23:59');
  }

  TranTypeChange(value) {
    this.disablePaymentType = true;
    this.disableExemptType = true;
    this.DetailsForm.controls.ExemptTypeId.setValue('');
    this.ExemptTypeAll = 'Unselect All';

    this.DetailsForm.controls.PaymentTypeId.setValue('');
    this.PaymentTypeAll = 'Unselect All';

    if (value.length == 1) {
      if (value[0] == 2) {
        console.log('Cash');
        this.disablePaymentType = false;

      } else if (value[0] == 5) {
        console.log('Excempt');
        this.disableExemptType = false;
      }
    }

  }
}
