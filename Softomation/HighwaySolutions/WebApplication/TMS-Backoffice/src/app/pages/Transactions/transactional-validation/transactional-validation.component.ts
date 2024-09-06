import { DatePipe } from '@angular/common';
import { Compiler, Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';
import { ConfirmEventType, ConfirmationService } from 'primeng/api';
import { Subscription } from 'rxjs';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-transactional-validation',
  templateUrl: './transactional-validation.component.html',
  styleUrls: ['./transactional-validation.component.css'],
  providers: [ConfirmationService]
})
export class TransactionalValidationComponent {
  subscription!: Subscription;
  FilterDetailsForm!: FormGroup;
  Reviewedform!: FormGroup;
  ShiftData: any;
  LaneUserData: any;
  TransactionTypeData: any;
  LaneDataList: any;
  APIRootPath: any;
  LogedRoleId: any;
  EventHistroyData: any;
  PermissionData: any;
  DataView: Number = 0;
  DataUpdate: Number = 0;
  PlazaDataList: any;
  LaneData: any
  LaneList: any = [];
  UserDetails: any;
  ClassData: any;
  SubClassData: any;
  SubClassList: any = [];
  TotalTransactionCount: any = 0;
  SelectedPlateImage: any;
  SelectedPlateRImage: any;
  SelectedPlateAVCImage: any
  SelectedPlateVideo = '';
  ErrorData: any;
  LogedUserId = 0;
  DataAdd: Number = 0;
  MediaPrefix: any;
  SelectedRow: any=null;
  VideoFound = false;
  SelectedIndex = 0;
  IsReviewedRequired: boolean = true
  ReviewRequired = "Review Required";
  selectedCategory: any;
  TransactionTypeId = 0;
  submitted = false;
  FareData: any;
  selectedReviewedClassCorrectionId: number = 0;
  ReviewedTransactionAmount = 0;
  DifferenceAmount = 0;
  SystemSetting: any;
  MediaDataArray=[]
  className = "";
  dynamicHeight: string = '';
  ReviewedClassCorrectionList = [{ DataId: 0, DataName: "Both" }, { DataId: 1, DataName: "TC" }, { DataId: 2, DataName: "AVC" }, { DataId: 3, DataName: "None" }];
  constructor(private _compiler: Compiler, private dbService: apiIntegrationService, private dm: DataModel,
    private spinner: NgxSpinnerService, public datepipe: DatePipe, private confirmationService: ConfirmationService) {
    this.MediaPrefix = this.dm.getMediaAPI()?.toString();
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.SystemSetting = this.dm.getSSData();
    this.GetPermissionData();
  }

  ngOnInit() {
    var SDDate = this.datepipe.transform(new Date(), 'dd-MMM-yyyy');
    this.FilterDetailsForm = new FormGroup({
      StartDateTime: new FormControl(new Date()),
      EndDateTime: new FormControl(new Date()),
      ShiftFilterList: new FormControl('', []),
      TCUserFilterList: new FormControl('', []),
      PlazaFilterList: new FormControl('', []),
      LaneFilterList: new FormControl('', []),
      TransactionTypeFilterList: new FormControl(''),
      VehicleClassFilterList: new FormControl(''),
      VehicleSubClassFilterList: new FormControl(''),
      PlateNumber: new FormControl(''),
      TransactionId: new FormControl('')
    });
    this.Reviewedform = new FormGroup({
      ReviewedSubClassId: new FormControl('', [Validators.required]),
      ReviewedPlateNumber: new FormControl(''),
      ReviewedTransactionTypeId: new FormControl('', [Validators.required]),
      ReviewedRemark: new FormControl(''),
      ReviewedClassCorrectionId: new FormControl(0, []),
    });
    this.calculateHeight()
  }

  ngAfterViewInit(): void {
    this._compiler.clearCache();
  }

  calculateHeight() {
    const viewportHeight = window.innerHeight;
    const calculatedHeight = viewportHeight - 555;
    this.dynamicHeight = `${calculatedHeight}px`;
  }

  ExColl() {
    const collapseOne = document.getElementById("collapseOne")!
    collapseOne.classList.toggle("show")
    const datafilterIcon = document.getElementById("datafilterIcon")!
    const tbl = document.getElementById("tbl")!
    if (datafilterIcon.classList.contains("mdi-arrow-up-circle")) {
      datafilterIcon.classList.remove("mdi-arrow-up-circle")
      datafilterIcon.classList.add("mdi-arrow-down-circle")
    }
    else {
      datafilterIcon.classList.remove("mdi-arrow-down-circle")
      datafilterIcon.classList.add("mdi-arrow-up-circle")
    }

    if (tbl.classList.contains("listtablepagging-cf3")) {
      tbl.classList.remove("listtablepagging-cf3")
      tbl.classList.add("listtablepagging")
    }
    else {
      tbl.classList.remove("listtablepagging")
      tbl.classList.add("listtablepagging-cf3")
    }
  }

  statusChanged(event: any) {
    if (event)
      this.ReviewRequired = "Review Required";
    else
      this.ReviewRequired = "All Transaction";
  }

  GetPermissionData() {
    var MenuUrl = window.location.pathname.replace('/', '');
    const Obj = {
      MenuUrl: MenuUrl,
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
        }
        else {
          this.GetMasterData();
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

  GetMasterData() {
    this.subscription = this.dbService.FilterMasterGet().subscribe(
      data => {
        var MaserData = data.ResponseData;
        this.ShiftData = MaserData.ShiftTiminingList;
        this.LaneUserData = MaserData.TCMasterList;
        this.PlazaDataList = MaserData.PlazaDataList;
        this.LaneData = MaserData.LaneDataList;
        this.ClassData = MaserData.SystemClassList;
        this.SubClassData = MaserData.SystemSubClassList;
        this.TransactionTypeData = MaserData.TransactionTypeList;
        this.GetDefaultData();
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

  GetDefaultData() {
    this.subscription = this.dbService.ReviewPendingGetLatest().subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalTransactionCount = this.EventHistroyData.length;
        this.SelectedIndex = 0;
        this.AutoSelected();
        if (this.TotalTransactionCount > 0) {
          var sd = this.EventHistroyData[this.TotalTransactionCount - 1].TransactionDateTimeStamp;
          this.FilterDetailsForm.controls['StartDateTime'].setValue(new Date(sd));
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

  PlazaChange() {
    this.LaneList = [];
    let pl = this.FilterDetailsForm.value.PlazaFilterList;
    for (let index = 0; index < pl.length; index++) {
      var d1 = this.LaneData.filter((e: { ParentId: any; }) => e.ParentId == pl[index]);
      for (let j = 0; j < d1.length; j++) {
        this.LaneList.push(d1[j])
      }
    }
  }

  VehicleClassChange() {
    let vc = this.FilterDetailsForm.value.VehicleClassFilterList;
    this.SubClassList = [];
    for (let index = 0; index < vc.length; index++) {
      var d1 = this.SubClassData.filter((e: { ParentId: any; }) => e.ParentId == vc[index]);
      for (let j = 0; j < d1.length; j++) {
        this.SubClassList.push(d1[j])
      }
    }
  }

  FilterAllData() {
    this.TotalTransactionCount = 0;
    let ShiftFilterList = "0"
    if (this.FilterDetailsForm.value.ShiftFilterList != null && this.FilterDetailsForm.value.ShiftFilterList != '') {
      let crData = this.FilterDetailsForm.value.ShiftFilterList.toString();
      if (crData.split(',').length != this.ShiftData.length) {
        ShiftFilterList = this.FilterDetailsForm.value.ShiftFilterList.toString();
      }
    }

    let TCUserFilterList = "0"
    if (this.FilterDetailsForm.value.TCUserFilterList != null && this.FilterDetailsForm.value.TCUserFilterList != '') {
      let crData = this.FilterDetailsForm.value.TCUserFilterList.toString();
      if (crData.split(',').length != this.LaneUserData.length) {
        TCUserFilterList = this.FilterDetailsForm.value.TCUserFilterList.toString();
      }
    }

    let PlazaFilterList = "0"
    if (this.FilterDetailsForm.value.PlazaFilterList != null && this.FilterDetailsForm.value.PlazaFilterList != '') {
      let crData = this.FilterDetailsForm.value.PlazaFilterList.toString();
      if (crData.split(',').length != this.PlazaDataList.length) {
        PlazaFilterList = this.FilterDetailsForm.value.PlazaFilterList.toString();
      }
    }

    let LaneFilterList = "0"
    if (this.FilterDetailsForm.value.LaneFilterList != null && this.FilterDetailsForm.value.LaneFilterList != '') {
      let crData = this.FilterDetailsForm.value.LaneFilterList.toString();
      if (crData.split(',').length != this.LaneList.length) {
        LaneFilterList = this.FilterDetailsForm.value.LaneFilterList.toString();
      }
    }

    let VehicleClassFilterList = "0"
    if (this.FilterDetailsForm.value.VehicleClassFilterList != null && this.FilterDetailsForm.value.VehicleClassFilterList != '') {
      let crData = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      if (crData.split(',').length != this.ClassData.length) {
        VehicleClassFilterList = this.FilterDetailsForm.value.VehicleClassFilterList.toString();
      }
    }

    let VehicleSubClassFilterList = "0"
    if (this.FilterDetailsForm.value.VehicleSubClassFilterList != null && this.FilterDetailsForm.value.VehicleSubClassFilterList != '') {
      let crData = this.FilterDetailsForm.value.VehicleSubClassFilterList.toString();
      if (crData.split(',').length != this.SubClassList.length) {
        VehicleSubClassFilterList = this.FilterDetailsForm.value.VehicleSubClassFilterList.toString();
      }
    }

    let TransactionTypeFilterList = "0"
    if (this.FilterDetailsForm.value.TransactionTypeFilterList != null && this.FilterDetailsForm.value.TransactionTypeFilterList != '') {
      let crData = this.FilterDetailsForm.value.TransactionTypeFilterList.toString();
      if (crData.split(',').length != this.TransactionTypeData.length) {
        TransactionTypeFilterList = this.FilterDetailsForm.value.TransactionTypeFilterList.toString();
      }
    }
    let AuditerFilterList = "0"
    let SD = this.datepipe.transform(this.FilterDetailsForm.value.StartDateTime, 'dd-MMM-yyyy HH:mm:ss')
    let ED = this.datepipe.transform(this.FilterDetailsForm.value.EndDateTime, 'dd-MMM-yyyy HH:mm:ss')
    var obj = {
      IsReviewedRequired: this.IsReviewedRequired,
      IsReviewedStatus: false,
      ShiftFilterList: ShiftFilterList,
      TCUserFilterList: TCUserFilterList,
      PlazaFilterList: PlazaFilterList,
      LaneFilterList: LaneFilterList,
      VehicleClassFilterList: VehicleClassFilterList,
      VehicleSubClassFilterList: VehicleSubClassFilterList,
      TransactionTypeFilterList: TransactionTypeFilterList,
      PlateNumber: this.FilterDetailsForm.value.PlateNumber,
      TransactionId: this.FilterDetailsForm.value.TransactionId,
      StartDateTime: SD,
      EndDateTime: ED,
      AuditerFilterList: AuditerFilterList,
    }
    this.spinner.show();
    this.dbService.LaneTransactionFilter(obj).subscribe(
      data => {
        this.spinner.hide();
        this.EventHistroyData = data.ResponseData;
        this.TotalTransactionCount = this.EventHistroyData.length;
        this.SelectedIndex = 0;
        this.AutoSelected();
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

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this._compiler.clearCache();
  }

  onMidiaView(TransactionRowData: any) {
    var ImageDataArray=[]
    var VideoDataArray=[]
    var AudioDataArray=[]
      const file_path=this.dm.getPath(TransactionRowData.TransactionDateTimeStamp,TransactionRowData.LaneNumber);
      if(TransactionRowData.TransactionFrontImage!=''){
        let a={ImagePath: file_path+'lpic/image/'+TransactionRowData.TransactionFrontImage,Name:'LPIC'}
        ImageDataArray.push(a)
      }
      if(TransactionRowData.TransactionBackImage!=''){
        let a={ImagePath: file_path+'ic/image/'+TransactionRowData.TransactionBackImage,Name:'IC'}
        ImageDataArray.push(a)
      }
      if(TransactionRowData.TransactionAvcImage!=''){
        let a={ImagePath: file_path+'avc/'+TransactionRowData.TransactionAvcImage,Name:'AVC'}
        ImageDataArray.push(a)
      }
      if(TransactionRowData.TransactionVideo!=''){
        let a={VideoPath: file_path+'ic/video/'+TransactionRowData.TransactionVideo,Name:'IC-Video'}
        VideoDataArray.push(a)
      }

    if(ImageDataArray.length>0 ||VideoDataArray.length){
      var obj={
        PageTitle: "Lane Transaction-(" + TransactionRowData.TransactionTypeName + ")",
        ImageData:ImageDataArray,
        VideoData:VideoDataArray,
        AudioData:AudioDataArray
      }
      this.dm.MediaView(obj);
    }
    else{
      this.ErrorData = [{ AlertMessage: 'No Media available.' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
  }

  AutoSelected() {
    if (this.EventHistroyData.length > 0) {
      this.SelectedRow = this.EventHistroyData[this.SelectedIndex];
      this.getMediaDetails(this.SelectedRow)
      this.getTollFare(new Date(this.SelectedRow.TransactionDateTimeStamp));
      this.Reviewedform.controls['ReviewedSubClassId'].setValue(this.SelectedRow.VehicleSubClassId);
      this.Reviewedform.controls['ReviewedPlateNumber'].setValue(this.SelectedRow.PlateNumber);
      this.Reviewedform.controls['ReviewedTransactionTypeId'].setValue(this.SelectedRow.TransactionTypeId);
      this.Reviewedform.controls['ReviewedRemark'].reset();
      if (this.SelectedRow.VehicleSubClassId == this.SelectedRow.AvcClassId) {
        this.Reviewedform.controls['ReviewedClassCorrectionId'].setValue(0);
        this.ReviewedClassCorrectionTypeChange(0);
      }
      else {
        if (this.SelectedRow.VehicleAvcClassId>0){
        this.Reviewedform.controls['ReviewedClassCorrectionId'].setValue(2);
        this.ReviewedClassCorrectionTypeChange(2);
        }
        else{
          this.Reviewedform.controls['ReviewedClassCorrectionId'].setValue(1);
          this.ReviewedClassCorrectionTypeChange(1);
        }
      }
    }else{
      this.SelectedRow=null;
    }

  }

  getMediaDetails(TransactionRowData){
    this.MediaDataArray=[]
    const file_path=this.dm.getPath(TransactionRowData.TransactionDateTimeStamp,TransactionRowData.LaneNumber);
      if(TransactionRowData.TransactionFrontImage!=''){
        let a={path: this.MediaPrefix+file_path+'lpic/image/'+TransactionRowData.TransactionFrontImage,name:'LPIC',type:'image'}
        this.MediaDataArray.push(a)
      }
      if(TransactionRowData.TransactionBackImage!=''){
        let a={path: this.MediaPrefix+file_path+'ic/image/'+TransactionRowData.TransactionBackImage,name:'IC',type:'image'}
        this.MediaDataArray.push(a)
      }
      if(TransactionRowData.TransactionAvcImage!=''){
        let a={path: this.MediaPrefix+file_path+'avc/'+TransactionRowData.TransactionAvcImage,name:'AVC',type:'image'}
        this.MediaDataArray.push(a)
      }
      if(TransactionRowData.TransactionVideo!=''){
        let a={path: this.MediaPrefix+file_path+'ic/video/'+TransactionRowData.TransactionVideo,name:'IC',type:'video'}
        this.MediaDataArray.push(a)
        this.dm.delay(100).then(any => {
          this.VideoFound = true;
        });
      }
      this.className = 'col-md-'+ (12 /this.MediaDataArray.length).toString();
  }

  onRowSelect(index: number) {
    this.SelectedIndex = index;
    this.AutoSelected();
  }

  SaveEntry() {
    this.submitted = true;
    if (this.Reviewedform.invalid) {
      return;
    }
    var Remark = this.Reviewedform.value.ReviewedRemark;
    if (Remark == undefined || Remark == null || Remark == '') {
      Remark = ''
    }
    if (this.Reviewedform.value.ReviewedSubClassId != this.SelectedRow.VehicleSubClassId) {
      if (Remark == '') {
        const ErrorData = [{ AlertMessage: "Remark is required." }];
        this.dm.openSnackBar(ErrorData, false);
        return;
      }
    }
    if (this.Reviewedform.value.TransactionTypeId != this.SelectedRow.TransactionTypeId) {
      if (Remark == '') {
        const ErrorData = [{ AlertMessage: "Remark is required." }];
        this.dm.openSnackBar(ErrorData, false);
        return;
      }
    }
    // if (this.Reviewedform.value.ReviewedClassCorrectionId == 0 || this.Reviewedform.value.ReviewedClassCorrectionId == 1)
    //   this.SelectedRow.ReviewedSubClassId = this.SelectedRow.VehicleSubClassId;
    // else if (this.Reviewedform.value.ReviewedClassCorrectionId == 2)
    //   this.SelectedRow.ReviewedSubClassId = this.SelectedRow.VehicleAvcClassId
    // else
    this.SelectedRow.ReviewedSubClassId = this.Reviewedform.value.ReviewedSubClassId;
    this.SelectedRow.ReviewedPlateNumber = this.Reviewedform.value.ReviewedPlateNumber;
    this.SelectedRow.ReviewedTransactionTypeId = this.Reviewedform.value.ReviewedTransactionTypeId;
    this.SelectedRow.ReviewedClassCorrectionId = this.Reviewedform.value.ReviewedClassCorrectionId
    this.SelectedRow.ReviewedTransactionAmount = this.ReviewedTransactionAmount
    this.SelectedRow.DifferenceAmount = this.DifferenceAmount
    this.SelectedRow.ReviewedById = this.LogedUserId;
    this.SelectedRow.ReviewedDateTime = this.datepipe.transform(new Date, 'dd-MMM-yyyy HH:mm:ss')
    this.SelectedRow.ReviewedRemark=Remark
    this.dbService.LaneTransactionValidation(this.SelectedRow).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'transaction audit successfully!.' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.ProcessNextRecord();
        }
        else {
          this.confirmBox(returnMessage + " Do you want to reload data?")
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  CancelEntry(){
    if(this.SelectedRow==null || this.SelectedRow==undefined){
      const ErrorData = [{ AlertMessage: "No transaction found." }];
      this.dm.openSnackBar(ErrorData, false);
      return;
    }
    var Remark = this.Reviewedform.value.ReviewedRemark;
    if (Remark == undefined || Remark == null || Remark == '') {
      Remark = ''
    }
    if (Remark == '') {
      const ErrorData = [{ AlertMessage: "Remark is required." }];
      this.dm.openSnackBar(ErrorData, false);
      return;
    }
    this.SelectedRow.ReviewedById = this.LogedUserId;
    this.SelectedRow.ReviewedDateTime = this.datepipe.transform(new Date, 'dd-MMM-yyyy HH:mm:ss')
    this.SelectedRow.ReviewedRemark=Remark
    this.dbService.LaneTransactionCancel(this.SelectedRow).subscribe(
      data => {
        this.spinner.hide();
        const returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'transaction audit successfully!.' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.ProcessNextRecord();
        }
        else {
          this.confirmBox(returnMessage + " Do you want to reload data?")
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ProcessNextRecord() {
    this.TotalTransactionCount = this.EventHistroyData.length;
    if (this.TotalTransactionCount > 1) {
      this.EventHistroyData.splice(this.SelectedIndex, 1);
      this.TotalTransactionCount = this.EventHistroyData.length;
      this.SelectedIndex = 0;
      this.AutoSelected();
    }
    else {

      this.confirmBox("No more transcation, Do you want to reload data?")
    }
  }

  confirmBox(msg: string) {
    this.confirmationService.confirm({
      message: msg,
      icon: 'mdi mdi-reload-alert',
      accept: () => {
        this.EventHistroyData = [];
        this.FilterAllData();
      },
      reject: (type: ConfirmEventType) => {
        this.ProcessNextRecord();
      }
    });
  }

  viewImage() {
    var myWindow = window.open(this.MediaPrefix + this.SelectedRow.EventImageUrl, "", "width=600");
  }

  ReviewedClassCorrectionTypeChange(value: any) {
    if (value == 3) {
      this.Reviewedform.controls['ReviewedSubClassId'].setValue(this.SelectedRow.VehicleSubClassId);
      this.Reviewedform.controls['ReviewedSubClassId'].enable();
    }
    else if (value == 2) {
      if (this.SelectedRow.VehicleAvcClassId>0){
        this.Reviewedform.controls['ReviewedSubClassId'].setValue(this.SelectedRow.VehicleAvcClassId);
        this.Reviewedform.controls['ReviewedSubClassId'].disable();
      }
      else{
        this.ErrorData = [{ AlertMessage: 'No Avc Class found going to set TC class' }];
        this.dm.openSnackBar(this.ErrorData, false);
        this.Reviewedform.controls['ReviewedClassCorrectionId'].setValue(1);
        this.ReviewedClassCorrectionTypeChange(1);
      }
    }
    else {
      this.Reviewedform.controls['ReviewedSubClassId'].setValue(this.SelectedRow.VehicleSubClassId);
      this.Reviewedform.controls['ReviewedSubClassId'].disable();
    }
    this.checkTollFare(0, this.Reviewedform.controls['ReviewedSubClassId'].value, this.Reviewedform.controls['ReviewedTransactionTypeId'].value);

  }

  ReviewedSubClassChange(value: any) {
    this.checkTollFare(0, value, this.Reviewedform.controls['ReviewedTransactionTypeId'].value);
  }

  TransactionTypeChange(value: any) {
    this.checkTollFare(this.SelectedRow.VehicleClassId, this.SelectedRow.VehicleSubClassId, value);
  }

  getTollFare(EffectiveDate: any) {
    this.spinner.show();
    let StartDate = this.datepipe.transform(EffectiveDate, 'dd-MMM-yyyy')
    this.dbService.TollFareGetByEffectedFrom(StartDate).subscribe(
      data => {
        this.spinner.hide();
        const DevicesData = data.ResponseData;
        this.FareData = DevicesData.TollFareConfigurations;
        this.checkTollFare(this.SelectedRow.VehicleClassId, this.SelectedRow.VehicleSubClassId, this.SelectedRow.TransactionTypeId);
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

  checkTollFare(VehicleClassId: any, VehicleSubClassId: any, TransactionTypeId: any) {
    if (TransactionTypeId == 1 || TransactionTypeId == 3) {
      this.ReviewedTransactionAmount = 0;
    }
    else {
      if (this.FareData != null) {
        let TF;
        if (VehicleSubClassId != 0) {
          TF = this.FareData.filter((e: { SubVehicleClassId: any }) =>
            e.SubVehicleClassId == VehicleSubClassId);
        }
        else {
          TF = this.FareData.filter((e: { SystemVehicleClassId: any; }) =>
            e.SystemVehicleClassId == VehicleClassId);
        }
        if (TF.length > 0) {
          if (this.SystemSetting.CashPenalty)
            this.ReviewedTransactionAmount = TF[0].FasTagPenalty;
          else
            this.ReviewedTransactionAmount = TF[0].TollFare;
        }
        else {
          this.ErrorData = [{ AlertMessage: 'System fare not found.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    }
    this.DifferenceAmount = this.SelectedRow.TagPenaltyAmount + this.SelectedRow.TransactionAmount - this.ReviewedTransactionAmount;
  }
}