import { DatePipe } from '@angular/common';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatOption } from '@angular/material/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-report-master',
  templateUrl: './report-master.component.html',
  styleUrls: ['./report-master.component.css']
})
export class ReportMasterComponent implements OnInit{
  DetailsForm!: FormGroup;
  error = errorMessages;
  LogedUserId;
  PdfCsv=0;
  ClientId: any;
  CategoryData;
  SubCategoryData;
  SubCategoryId = 0;
  ShiftData;
  @ViewChild('shiftallSelected') private shiftallSelected: MatOption;
  ShiftAll="Select All";
  disableShift = false;
  selectedShiftType;

  @ViewChild('classallSelected') private classallSelected: MatOption;
  ClassData
  disableClass = false;
  selectedClassType;
  ClassAll="Select All";

  @ViewChild('laneallSelected') private laneallSelected: MatOption;
  LaneData;
  disableLane = false;
  selectedLaneType;
  LaneAll="Select All";

  @ViewChild('TypeallSelected') private TypeallSelected: MatOption;
  LaneTypeData;
  disableLaneType = false;
  selectedLaneTypeName;
  LaneTypeAll="Select All";

  @ViewChild('TranTypeallSelected') private TranTypeallSelected: MatOption;
  TranTypeData;
  disableTranType = false;
  selectedTranType;
  TranTypeAll="Select All";

  @ViewChild('ExemptTypeallSelected') private ExemptTypeallSelected: MatOption;
  ExemptTypeData;
  disableExemptType = false;
  selectedExemptType;
  ExemptTypeAll="Select All";

  @ViewChild('PaymentTypeallSelected') private PaymentTypeallSelected: MatOption;
  PaymentTypeData;
  disablePaymentType = false;
  selectedPaymentType;
  PaymentTypeAll="Select All";

  @ViewChild('laneUserallSelected') private laneUserallSelected: MatOption;
  LaneUserData;
  disableLaneUser = false;
  selectedLaneUser;
  LaneUserAll="Select All";

  @ViewChild('JouneyallSelected') private JouneyallSelected: MatOption;
  JourneyData;
  disableJourney = false;
  selectedJourney;
  JourneyAll="Select All";
  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService, 
    private emitService: DataModel,
    public datepipe: DatePipe) {
    this.LogedUserId = this.emitService.getUserData();
    // this.ClientId = this.emitService.getClientId();
  }

  ngOnInit(): void {
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
      StartTime: new FormControl("00:00", [
        Validators.required
      ]),
      EndTime: new FormControl("23:59", [
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
      LaneTypeId: new FormControl('', [
        Validators.required
      ]),
      LaneUserId: new FormControl('', [
        Validators.required
      ]),
      PaymentTypeId: new FormControl(''),
      ExemptTypeId: new FormControl(''),
      TranTypeId: new FormControl('', [Validators.required]),
      JourneyId: new FormControl('', [Validators.required]),
    });
    this.GetCategoryData();
    this.GetShiftData();
    this.GetClassData();
    this.GetLaneData();
    this.GetTranTypeData();
    this.GetExemptTypeData();
    this.GetPaymentDetails();
    this.GetLaneUsersData();
    this.GetJourneyData();
    
    const today = new Date();
    const month = today.getMonth();
    const year = today.getFullYear();

    this.disablePaymentType=true;
    this.disableExemptType=true;
  }
  toggleAllSelection(val) {
    if (val == 'Shift') {
      if (this.shiftallSelected.selected) {
        var op = this.ShiftData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['ShiftId'].setValue(op);
        this.ShiftAll="Select All";
      } else {
        this.DetailsForm.controls['ShiftId'].setValue("");
        this.ShiftAll="Unselect All";
      }
    }
    else if (val == 'Lane') {
      if (this.laneallSelected.selected) {
        var op = this.LaneData.map(function (item) {
          return item.LaneNumber;
        });
        op.push(0);
        this.DetailsForm.controls['LaneId'].setValue(op);
        this.LaneAll="Select All";
      } else {
        this.DetailsForm.controls['LaneId'].setValue("");
        this.LaneAll="Unselect All";
      }
    }
    else if (val == 'LaneType') {
      if (this.TypeallSelected.selected) {
        var op = this.LaneTypeData.map(function (item) {
          return item.Id;
        });
        op.push(0);
        this.DetailsForm.controls['LaneTypeId'].setValue(op);
        this.LaneTypeAll="Select All";
      } else {
        this.DetailsForm.controls['LaneTypeId'].setValue("");
        this.LaneTypeAll="Unselect All";
      }
    }
    else if (val == 'Class') {
      if (this.classallSelected.selected) {
        var op = this.ClassData.map(function (item) {
          return item.ClassId;
        });
        op.push(0);
        this.DetailsForm.controls['ClassId'].setValue(op);
        this.ClassAll="Select All";
      } else {
        this.DetailsForm.controls['ClassId'].setValue("");
        this.ClassAll="Unselect All";
      }
    }
    else if (val == 'User') {
      if (this.laneUserallSelected.selected) {
        var op = this.LaneUserData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['LaneUserId'].setValue(op);
        this.LaneUserAll="Select All";
      } else {
        this.DetailsForm.controls['LaneUserId'].setValue("");
        this.LaneUserAll="Unselect All";
      }
    }
    else if (val == 'TranType') {
      if (this.TranTypeallSelected.selected) {
        var op = this.TranTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['TranTypeId'].setValue(op);
        this.TranTypeAll="Select All";
      } else {
        this.DetailsForm.controls['TranTypeId'].setValue("");
        this.TranTypeAll="Unselect All";
      }
    }
    else if (val == 'ExemptType') {
      if (this.ExemptTypeallSelected.selected) {
        var op = this.ExemptTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['ExemptTypeId'].setValue(op);
        this.ExemptTypeAll="Select All";
      } else {
        this.DetailsForm.controls['ExemptTypeId'].setValue("");
        this.ExemptTypeAll="Unselect All";
      }
    }
    else if (val == 'PaymentType') {
      if (this.PaymentTypeallSelected.selected) {
        var op = this.PaymentTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['PaymentTypeId'].setValue(op);
        this.PaymentTypeAll="Select All";
      } else {
        this.DetailsForm.controls['PaymentTypeId'].setValue("");
        this.PaymentTypeAll="Unselect All";
      }
    }
    else if (val == 'Journey') {
      if (this.JouneyallSelected.selected) {
        var op = this.JourneyData.map(function (item) {
          return item.JourneyId;
        });
        op.push(0);
        this.DetailsForm.controls['JourneyId'].setValue(op);
        this.JourneyAll="Select All";
      } else {
        this.DetailsForm.controls['JourneyId'].setValue("");
        this.JourneyAll="Unselect All";
      }
    }
  }
  toggleClickShift(val)
  {
    if(val.length>0)
    {
      var max_value = Math.max.apply(null, val); 
      var min_value = Math.min.apply(null, val);
    }
    let minimunSelectedShift = this.ShiftData.filter(e => e.EntryId == min_value);
    let miximunSelectedShift = this.ShiftData.filter(e => e.EntryId == max_value);

    this.DetailsForm.controls['StartTime'].setValue(minimunSelectedShift[0].StartTimmng);
    this.DetailsForm.controls['EndTime'].setValue(miximunSelectedShift[0].EndTimming);
    
  }

  toggleCheckSelection(val) {
    if (val == 'Shift') {
      if (this.shiftallSelected.selected) {
        var op = this.ShiftData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['ShiftId'].setValue(op);
        this.ShiftAll="Select All";
      } else {
        this.DetailsForm.controls['ShiftId'].setValue("");
        this.ShiftAll="Unselect All";
      }
    }
    else if (val == 'Lane') {
      if (this.laneallSelected.selected) {
        var op = this.LaneData.map(function (item) {
          return item.LaneNumber;
        });
        op.push(0);
        this.DetailsForm.controls['LaneId'].setValue(op);
        this.LaneAll="Select All";
      } else {
        this.DetailsForm.controls['LaneId'].setValue("");
        this.LaneAll="Unselect All";
      }
    }
    else if (val == 'LaneType') {
      if (this.TypeallSelected.selected) {
        var op = this.LaneTypeData.map(function (item) {
          return item.Id;
        });
        op.push(0);
        this.DetailsForm.controls['LaneTypeId'].setValue(op);
        this.LaneTypeAll="Select All";
      } else {
        this.DetailsForm.controls['LaneTypeId'].setValue("");
        this.LaneTypeAll="Unselect All";
      }
    }
    else if (val == 'Class') {
      if (this.classallSelected.selected) {
        var op = this.ClassData.map(function (item) {
          return item.ClassId;
        });
        op.push(0);
        this.DetailsForm.controls['ClassId'].setValue(op);
        this.ClassAll="Select All";
      } else {
        this.DetailsForm.controls['ClassId'].setValue("");
        this.ClassAll="Unselect All";
      }
    }
    else if (val == 'User') {
      if (this.laneUserallSelected.selected) {
        var op = this.LaneUserData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['LaneUserId'].setValue(op);
        this.LaneUserAll="Select All";
      } else {
        this.DetailsForm.controls['LaneUserId'].setValue("");
        this.LaneUserAll="Unselect All";
      }
    }
    else if (val == 'TranType') {
      if (this.TranTypeallSelected.selected) {
        var op = this.TranTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['TranTypeId'].setValue(op);
        this.TranTypeAll="Select All";
      } else {
        this.DetailsForm.controls['TranTypeId'].setValue("");
        this.TranTypeAll="Unselect All";
      }
    }
    else if (val == 'ExemptType') {
      if (this.ExemptTypeallSelected.selected) {
        var op = this.ExemptTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['ExemptTypeId'].setValue(op);
        this.ExemptTypeAll="Select All";
      } else {
        this.DetailsForm.controls['ExemptTypeId'].setValue("");
        this.ExemptTypeAll="Unselect All";
      }
    }
    else if (val == 'PaymentType') {
      if (this.PaymentTypeallSelected.selected) {
        var op = this.PaymentTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['PaymentTypeId'].setValue(op);
        this.PaymentTypeAll="Select All";
      } else {
        this.DetailsForm.controls['PaymentTypeId'].setValue("");
        this.PaymentTypeAll="Unselect All";
      }
    }
    else if (val == 'Journey') {
      // if (this.JouneyallSelected.selected) {
      //   var op = this.JourneyData.map(function (item) {
      //     return item.JourneyId;
      //   });
      //   op.push(0);
      //   this.DetailsForm.controls['JourneyId'].setValue(op);
      //   this.JourneyAll="Select All";
      // } else {
      //   this.DetailsForm.controls['JourneyId'].setValue("");
      //   this.JourneyAll="Unselect All";
      // }
     if(this.selectedJourney.length >= this.JourneyData.length)
     {
        //   var op = this.JourneyData.map(function (item) {
        //   return item.JourneyId;
        // });
        // op.push(0);
        // this.DetailsForm.controls['JourneyId'].setValue(op);
      this.JourneyAll="Select All";
     }
     else{
      var op = this.selectedJourney.map(function (item) {
        return item.JourneyId;
      });
      op.push(0);
      this.DetailsForm.controls['JourneyId'].setValue(op);
      this.JourneyAll="Unselect All";
     }
    }
  }

  GetCategoryData() {
    this.spinner.show();
    this.dbService.GetReportCategory().subscribe(
      data => {
        this.spinner.hide();
        this.CategoryData = data.ResponseData;
        this.GetLaneTypeData();
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }

  CategoryChange(vale) {
    this.spinner.show();
    this.dbService.GetSubReportCategory(vale).subscribe(
      data => {
        this.spinner.hide();
        this.SubCategoryData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }

  SubCategoryChange(vale) {
    this.SubCategoryId = vale;
    if (vale == 22) {
      var op = this.ExemptTypeData.map(function (item) {
        return item.EntryId;
      });
      this.DetailsForm.controls['ExemptTypeId'].setValue(op);
    }
    else {
      this.DetailsForm.controls['ExemptTypeId'].reset();
    }
  }
  GetShiftData() {
    this.spinner.show();
    //GetShiftDetails
    this.dbService.GetShiftTimining().subscribe(
      data => {
        this.spinner.hide();
        this.ShiftData = data.ResponseData;
        var op = this.ShiftData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['ShiftId'].setValue(op);
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetClassData() {
    this.spinner.show();
    //VehicleClassSubGetActive
    this.dbService.SystemVehicleClassGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.ClassData = data.ResponseData;
        var op = this.ClassData.map(function (item) {
          return item.ClassId;
        });
        op.push(0);
        this.DetailsForm.controls['ClassId'].setValue(op);
        // this.ClassId.setValue(op);
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetLaneData() {
    this.spinner.show();
    //LaneGetActiveByPlaza
    const obj={}
    this.dbService.LaneGetByPlazaId(obj).subscribe(
      data => {
        this.spinner.hide();
        this.LaneData = data.ResponseData;
        var op = this.LaneData.map(function (item) {
          return item.LaneNumber;
        });
        op.push(0);
        this.DetailsForm.controls['LaneId'].setValue(op);
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
 
  GetTranTypeData() {
    this.spinner.show();
    // GetTransactionDetails
    this.dbService.TransactionTypeGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.TranTypeData = data.ResponseData;
        var op = this.TranTypeData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['TranTypeId'].setValue(op);
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetExemptTypeData() {
    this.spinner.show();
    //GetExemptDetails
    this.dbService.ExemptTypeGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.ExemptTypeData = data.ResponseData;
      },
      (error:any) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetPaymentDetails() {
    this.spinner.show();
    //PaymentTypeGetAll
    this.dbService.PaymentMethodTypeGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.PaymentTypeData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetLaneUsersData() {
    //UserConfigurationGetAllLaneUsers
    this.dbService.UserConfigurationGetAll().subscribe(
      data => {
        this.LaneUserData = data.ResponseData;
        var op = this.LaneUserData.map(function (item) {
          return item.EntryId;
        });
        op.push(0);
        this.DetailsForm.controls['LaneUserId'].setValue(op);
      },
      (error) => {
        const ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.emitService.openSnackBar(ErrorData, false);
      }
    );
  }
  GetJourneyData() {
    this.spinner.show();
    //JourneyGetAll
    // this.dbService.JourneyGetAll().subscribe(
    //   data => {
    //     this.spinner.hide();
    //     this.JourneyData = data.ResponseData;
    //     var op = this.JourneyData.map(function (item) {
    //       return item.JourneyId;
    //     });
    //     op.push(0);
    //     this.DetailsForm.controls['JourneyId'].setValue(op);
    //   },
    //   (error) => {
    //     this.spinner.hide();
    //     const ErrorData = [{ AlertMessage: "Something went wrong." }];
    //     this.emitService.openSnackBar(ErrorData, false);
    //   }
    //);
  }
  GetLaneTypeData() {
    this.LaneTypeData=[{Id:1,Name:"Entry"},{Id:2,Name:"Exit"}];
    var op1 = this.LaneTypeData.map(function (item) {
      return item.Id;
    });
    op1.push(0);
    this.DetailsForm.controls['LaneTypeId'].setValue(op1);
  }


  FilterData() {     
    if (this.DetailsForm.valid) {
      var SD, ED, Exempt, Payment, Shift, VehicleClass, Lane,LaneType, TranType, LaneUser,Journey;
      SD = this.datepipe.transform(this.DetailsForm.value.StartDate, 'dd-MMM-yyy')
      SD = SD + " " + this.DetailsForm.value.StartTime + ":00"
      let StartDateTime = this.datepipe.transform(SD, 'dd-MMM-yyy HH:mm:ss');

      ED = this.datepipe.transform(this.DetailsForm.value.EndDate, 'dd-MMM-yyy')
      ED = ED + " " + this.DetailsForm.value.EndTime + ":59"
      let EndDateTime = this.datepipe.transform(ED, 'dd-MMM-yyy HH:mm:ss');
      
      this.PdfCsv = 0;
  
    //const WarrantyExpireDate = this.datepipe.transform(this.DeviceMasterform.value.WarrantyExpireDate, 'dd-MMM-yyyy') || new Date();
    //const PurchageDate = this.datepipe.transform(this.DeviceMasterform.value.PurchageDate, 'dd-MMM-yyyy') || new Date();

    if (StartDateTime >= EndDateTime ) {
      const ErrorData = [{ AlertMessage: "End date Time is Always greater then Start date Time" }];
            this.emitService.openSnackBar(ErrorData, true);
      return;
    }

      if (this.selectedExemptType == undefined) {
        Exempt = '0';
      }
      else {
        if (this.selectedExemptType.length >= this.ExemptTypeData.length)
          Exempt = "ALL"
        else{
          if(this.selectedExemptType!=""){
          Exempt = this.selectedExemptType.join();
          Exempt=Exempt.replace(',0','');
          }
          else
          Exempt = "ALL"
        }
      }
      if (this.selectedPaymentType == undefined) {
        Payment = '0';
      }
      else {
        if (this.selectedPaymentType.length >= this.PaymentTypeData.length)
          Payment = "ALL"
        else{
          if(this.selectedPaymentType!=""){
          Payment = this.selectedPaymentType.join();
          Payment=Payment.replace(',0','');
          }
          else
          Payment = "ALL"
        }
      }
      if (this.selectedShiftType == undefined) {
        Shift = '0';
      }
      else {
        if (this.selectedShiftType.length >= this.ShiftData.length)
          Shift = "ALL"
        else{
          Shift = this.selectedShiftType.join();
          Shift=Shift.replace(',0','');
        }
      }
      if (this.selectedClassType == undefined) {
        VehicleClass = '0';
      }
      else {
        if (this.selectedClassType.length >= this.ClassData.length)
          VehicleClass = "ALL"
        else{
          VehicleClass = this.selectedClassType.join();
          VehicleClass=VehicleClass.replace(',0','');
        }
      }
      if (this.selectedLaneType == undefined) {
        Lane = '0';
      }
      else {
        if (this.selectedLaneType.length >= this.LaneData.length)
          Lane = "ALL"
        else{
          Lane = this.selectedLaneType.join();
          Lane=Lane.replace(',0','');
        }
      }

      if (this.selectedLaneTypeName == undefined) {
        LaneType = '0';
      }
      else {
        if (this.selectedLaneTypeName.length >= this.LaneTypeData.length)
        LaneType = "0"
        else{
          LaneType = this.DetailsForm.value.LaneTypeId[0];// this.selectedLaneTypeName.join();
          //LaneType=LaneType.replace(',0','');
        }
      }

      if (this.selectedTranType == undefined) {
        TranType = '0';
      }
      else {
        if (this.selectedTranType.length >= this.TranTypeData.length)
          TranType = "ALL"
        else{
          TranType = this.selectedTranType.join();
          TranType=TranType.replace(',0','');
        }
      }
      if (this.selectedLaneUser == undefined) {
        LaneUser = '0';
      }
      else {
        if (this.selectedLaneUser.length >= this.LaneUserData.length)
          LaneUser = "ALL"
        else{
          LaneUser = this.selectedLaneUser.join();
          LaneUser=LaneUser.replace(',0','');
        }
      }

      if (this.selectedJourney == undefined) {
        Journey = '0';
      }
      else {
        if (this.selectedJourney.length >= this.JourneyData.length)
        Journey = "ALL"
        else{
          Journey = this.selectedJourney.join();
          Journey=Journey.replace(',0','');
        }
      }
      const Obj = {
        SubCategoryId: this.DetailsForm.value.SubCategoryId,
        Shift: Shift,
        VehicleClass: VehicleClass,
        Lane: Lane,
        TranType: TranType,
        LaneUser: LaneUser,
        ExemptType: Exempt,
        PaymentType: Payment,
        StartDateTime: StartDateTime,
        EndDateTime: EndDateTime,
        GenratedBy: this.LogedUserId,
        LaneTypeName:LaneType,
        Journey:Journey,
        I:this.PdfCsv,
      }
      this.spinner.show();
   
      this.dbService.ReportFilter(Obj).subscribe(
        data => {
          this.spinner.hide();
          var returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            const ErrorData = [{ AlertMessage: "Success" }];
            this.emitService.setPageRefresh(true,5);
            this.emitService.openSnackBar(ErrorData, true);
          }
          else if (returnMessage.includes('.pdf')) {
            const ErrorData = [{ AlertMessage: "Success" }];
            window.open(returnMessage, "_blank",);
            this.emitService.setPageRefresh(true,5);
            this.emitService.openSnackBar(ErrorData, true);
          }
          else {
            const ErrorData = data.Message;
            this.emitService.openSnackBar(ErrorData, false);
          }
        },
        (error) => {
          this.spinner.hide();
          const ErrorData = [{ AlertMessage: "Something went wrong." }];
          this.emitService.openSnackBar(ErrorData, false);
        }
      );
    }
  }


  FilterCsvData() {      
    if (this.DetailsForm.valid) {
      var SD, ED, Exempt, Payment, Shift, VehicleClass, Lane,LaneType, TranType, LaneUser,Journey;
      SD = this.datepipe.transform(this.DetailsForm.value.StartDate, 'dd-MMM-yyy')
      SD = SD + " " + this.DetailsForm.value.StartTime + ":00"
      let StartDateTime = this.datepipe.transform(SD, 'dd-MMM-yyy HH:mm:ss');

      ED = this.datepipe.transform(this.DetailsForm.value.EndDate, 'dd-MMM-yyy')
      ED = ED + " " + this.DetailsForm.value.EndTime + ":59"
      let EndDateTime = this.datepipe.transform(ED, 'dd-MMM-yyy HH:mm:ss');
      
      this.PdfCsv = 1;
  
    //const WarrantyExpireDate = this.datepipe.transform(this.DeviceMasterform.value.WarrantyExpireDate, 'dd-MMM-yyyy') || new Date();
    //const PurchageDate = this.datepipe.transform(this.DeviceMasterform.value.PurchageDate, 'dd-MMM-yyyy') || new Date();

    if (StartDateTime >= EndDateTime ) {
      const ErrorData = [{ AlertMessage: "End date Time is Always greater then Start date Time" }];
            this.emitService.openSnackBar(ErrorData, true);
      return;
    }

      if (this.selectedExemptType == undefined) {
        Exempt = '0';
      }
      else {
        if (this.selectedExemptType.length >= this.ExemptTypeData.length)
          Exempt = "ALL"
        else{
          if(this.selectedExemptType!=""){
          Exempt = this.selectedExemptType.join();
          Exempt=Exempt.replace(',0','');
          }
          else
          Exempt = "ALL"
        }
      }
      if (this.selectedPaymentType == undefined) {
        Payment = '0';
      }
      else {
        if (this.selectedPaymentType.length >= this.PaymentTypeData.length)
          Payment = "ALL"
        else{
          if(this.selectedPaymentType!=""){
          Payment = this.selectedPaymentType.join();
          Payment=Payment.replace(',0','');
          }
          else
          Payment = "ALL"
        }
      }
      if (this.selectedShiftType == undefined) {
        Shift = '0';
      }
      else {
        if (this.selectedShiftType.length >= this.ShiftData.length)
          Shift = "ALL"
        else{
          Shift = this.selectedShiftType.join();
          Shift=Shift.replace(',0','');
        }
      }
      if (this.selectedClassType == undefined) {
        VehicleClass = '0';
      }
      else {
        if (this.selectedClassType.length >= this.ClassData.length)
          VehicleClass = "ALL"
        else{
          VehicleClass = this.selectedClassType.join();
          VehicleClass=VehicleClass.replace(',0','');
        }
      }
      if (this.selectedLaneType == undefined) {
        Lane = '0';
      }
      else {
        if (this.selectedLaneType.length >= this.LaneData.length)
          Lane = "ALL"
        else{
          Lane = this.selectedLaneType.join();
          Lane=Lane.replace(',0','');
        }
      }

      if (this.selectedLaneTypeName == undefined) {
        LaneType = '0';
      }
      else {
        if (this.selectedLaneTypeName.length >= this.LaneTypeData.length)
        LaneType = "0"
        else{
          LaneType = this.DetailsForm.value.LaneTypeId[0];// this.selectedLaneTypeName.join();
          //LaneType=LaneType.replace(',0','');
        }
      }

      if (this.selectedTranType == undefined) {
        TranType = '0';
      }
      else {
        if (this.selectedTranType.length >= this.TranTypeData.length)
          TranType = "ALL"
        else{
          TranType = this.selectedTranType.join();
          TranType=TranType.replace(',0','');
        }
      }
      if (this.selectedLaneUser == undefined) {
        LaneUser = '0';
      }
      else {
        if (this.selectedLaneUser.length >= this.LaneUserData.length)
          LaneUser = "ALL"
        else{
          LaneUser = this.selectedLaneUser.join();
          LaneUser=LaneUser.replace(',0','');
        }
      }

      if (this.selectedJourney == undefined) {
        Journey = '0';
      }
      else {
        if (this.selectedJourney.length >= this.JourneyData.length)
        Journey = "ALL"
        else{
          Journey = this.selectedJourney.join();
          Journey=Journey.replace(',0','');
        }
      }
      const Obj = {
        SubCategoryId: this.DetailsForm.value.SubCategoryId,
        Shift: Shift,
        VehicleClass: VehicleClass,
        Lane: Lane,
        TranType: TranType,
        LaneUser: LaneUser,
        ExemptType: Exempt,
        PaymentType: Payment,
        StartDateTime: StartDateTime,
        EndDateTime: EndDateTime,
        GenratedBy: this.LogedUserId,
        LaneTypeName:LaneType,
        Journey:Journey,
        I:this.PdfCsv,
      }
      this.spinner.show();
      this.dbService.ReportFilter(Obj).subscribe(
        data => {
          this.spinner.hide();
          var returnMessage = data.Message[0].AlertMessage;
          
          if (returnMessage == 'success') {
            const ErrorData = [{ AlertMessage: "Success" }];
            this.emitService.setPageRefresh(true,5);
            this.emitService.openSnackBar(ErrorData, true);
          }
          else if (returnMessage.includes('.csv')) {
            const ErrorData = [{ AlertMessage: "Success" }];
            window.open(returnMessage, "_blank",);
            this.emitService.setPageRefresh(true,5);
            this.emitService.openSnackBar(ErrorData, true);
          }
          else {
            const ErrorData = data.Message;
            this.emitService.openSnackBar(ErrorData, false);
          }
        },
        (error) => {
          this.spinner.hide();
          const ErrorData = [{ AlertMessage: "Something went wrong." }];
          this.emitService.openSnackBar(ErrorData, false);
        }
      );
    }
  }

  
  ResetFilter() {
    this.GetLaneTypeData();
    this.DetailsForm.reset();
    this.GetCategoryData();
    this.GetShiftData();
    this.GetClassData();
    this.GetLaneData();
    this.GetTranTypeData();
    this.GetExemptTypeData();
    this.GetPaymentDetails();
    this.GetLaneUsersData();
    this.GetJourneyData();
    this.DetailsForm.controls['StartDate'].setValue(new Date());
    this.DetailsForm.controls['EndDate'].setValue(new Date());
    this.DetailsForm.controls['StartTime'].setValue("00:00");
    this.DetailsForm.controls['EndTime'].setValue("23:59");
  }

  TranTypeChange(value){
    this.disablePaymentType=true;
    this.disableExemptType=true;
    this.DetailsForm.controls['ExemptTypeId'].setValue("");
    this.ExemptTypeAll="Unselect All";

    this.DetailsForm.controls['PaymentTypeId'].setValue("");
    this.PaymentTypeAll="Unselect All";
  
    if(value.length==1){
      if(value[0]==2){ //Cash
        this.disablePaymentType=false;

      }
      else if(value[0]==5){ //Excempt
        this.disableExemptType=false;
      }
    }
    
  }


}
