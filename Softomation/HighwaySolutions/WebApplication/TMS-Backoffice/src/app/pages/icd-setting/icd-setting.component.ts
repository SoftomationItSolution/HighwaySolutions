import { Component, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { MatStepper } from '@angular/material/stepper';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-icd-setting',
  templateUrl: './icd-setting.component.html',
  styleUrls: ['./icd-setting.component.css']
})
export class ICDSettingComponent {
  @ViewChild('stepper') stepper!: MatStepper;
  PlazaDetailsForm!: FormGroup;
  UATDetailsForm!: FormGroup;
  ProdDetailsForm!: FormGroup;
  SFTPDetailsForm!: FormGroup;
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
  isEditable = true;
  isLinear = true;
  selectedIndex: number = 1;
  PlazaData: any;
  UATData: any;
  ProdData: any;

  constructor(private dbService: apiIntegrationService, private spinner: NgxSpinnerService,
    private dm: DataModel, public Dialogref: MatDialogRef<ICDSettingComponent>) {
    this.LogedUserId = this.dm.getUserId();
    this.LogedRoleId = this.dm.getRoleId();
    this.SystemSetting = this.dm.getSSData()
  }

  ngOnInit(): void {
    this.PlazaDetailsForm = new FormGroup({
      PlazaId: new FormControl('', [Validators.required]),
      PlazaType: new FormControl('', [Validators.required]),
      PlazaSubType: new FormControl('', [Validators.required]),
      PlazaZoneId: new FormControl('', [Validators.required]),
      OrganizationId: new FormControl('', [Validators.required]),
      IsProducation: new FormControl('', [Validators.required]),
      CertificateName: new FormControl('', [Validators.required]),
      CertificatePassword: new FormControl('', [Validators.required]),
    });
    this.UATDetailsForm = new FormGroup({
      Version: new FormControl('',[Validators.required]),
      BankName: new FormControl('',[Validators.required]),
      BaseUrl: new FormControl('', [Validators.required, Validators.pattern(regExps['HttpsPath'])]),
      RequestPayURL: new FormControl('',[Validators.required]),
      RequestTagDetailsURL: new FormControl('',[Validators.required]),
      CheckTransactionStatusRequestURL: new FormControl('',[Validators.required]),
      SyncTimeRequestURL: new FormControl('',[Validators.required]),
      GetExceptionRequestURL: new FormControl('',[Validators.required]),
      TollPlazaHeartBeatURL: new FormControl('',[Validators.required]),
      RequestQueryExceptionListURL: new FormControl('',[Validators.required]),
      RequestViolationAuditDetailsURL: new FormControl('',[Validators.required]),
      RequestListParticipantURL: new FormControl('',[Validators.required]),
    });
    this.ProdDetailsForm = new FormGroup({
      Version: new FormControl('',[Validators.required]),
      BankName: new FormControl('',[Validators.required]),
      BaseUrl: new FormControl('', [Validators.required, Validators.pattern(regExps['HttpsPath'])]),
      RequestPayURL: new FormControl('',[Validators.required]),
      RequestTagDetailsURL: new FormControl('',[Validators.required]),
      CheckTransactionStatusRequestURL: new FormControl('',[Validators.required]),
      SyncTimeRequestURL: new FormControl('',[Validators.required]),
      GetExceptionRequestURL: new FormControl('',[Validators.required]),
      TollPlazaHeartBeatURL: new FormControl('',[Validators.required]),
      RequestQueryExceptionListURL: new FormControl('',[Validators.required]),
      RequestViolationAuditDetailsURL: new FormControl('',[Validators.required]),
      RequestListParticipantURL: new FormControl('',[Validators.required]),
    });
    this.SFTPDetailsForm = new FormGroup({
      Host: new FormControl('',[Validators.required]),
      Port: new FormControl('',[Validators.required]),
      Username: new FormControl('', [Validators.required]),
      Password: new FormControl('',[Validators.required]),
      RemoteDirectory: new FormControl('',[Validators.required]),
      Init: new FormControl('',[Validators.required]),
      Diff: new FormControl('',[Validators.required]),
    });
    this.GetPermissionData();
  }

  GetPermissionData() {
    this.spinner.show();
    const Obj = {
      MenuUrl: "#PopUpIcdConfig",
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
          else {
            this.GetIcdDetails();
          }
        }
        else {
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

  GetIcdDetails() {
    this.spinner.show();
    this.dbService.IcdPlazaGetAll().subscribe(
      data => {
        this.spinner.hide();
        let result = data.ResponseData;
        this.PlazaData = result.PlazaList;
        this.uatDetails(result.UATList)
        this.prodDetails(result.ProdList)
        this.sftpDetails(result.SftpList)
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

  PlazaOnChange(PlazaId: any) {
    const plaza = this.PlazaData.filter((e: { PlazaId: any; }) => e.PlazaId === PlazaId);
    if (plaza.length > 0) {
      const DetailData = plaza[0];
      this.PlazaDetailsForm.controls['PlazaType'].setValue(DetailData.PlazaType);
      this.PlazaDetailsForm.controls['PlazaSubType'].setValue(DetailData.PlazaSubType);
      this.PlazaDetailsForm.controls['PlazaZoneId'].setValue(DetailData.PlazaZoneId);
      this.PlazaDetailsForm.controls['OrganizationId'].setValue(DetailData.OrganizationId);
      this.PlazaDetailsForm.controls['IsProducation'].setValue(DetailData.IsProducation);
      this.PlazaDetailsForm.controls['CertificateName'].setValue(DetailData.CertificateName);
      this.PlazaDetailsForm.controls['CertificatePassword'].setValue(DetailData.CertificatePassword);
    }
  }

  uatDetails(DetailData) {
    this.UATDetailsForm.controls['Version'].setValue(DetailData.Version);
    this.UATDetailsForm.controls['BankName'].setValue(DetailData.BankName);
    this.UATDetailsForm.controls['BaseUrl'].setValue(DetailData.BaseUrl);
    this.UATDetailsForm.controls['RequestPayURL'].setValue(DetailData.RequestPayURL);
    this.UATDetailsForm.controls['RequestTagDetailsURL'].setValue(DetailData.RequestTagDetailsURL);
    this.UATDetailsForm.controls['CheckTransactionStatusRequestURL'].setValue(DetailData.CheckTransactionStatusRequestURL);
    this.UATDetailsForm.controls['SyncTimeRequestURL'].setValue(DetailData.SyncTimeRequestURL);
    this.UATDetailsForm.controls['GetExceptionRequestURL'].setValue(DetailData.GetExceptionRequestURL);
    this.UATDetailsForm.controls['TollPlazaHeartBeatURL'].setValue(DetailData.TollPlazaHeartBeatURL);
    this.UATDetailsForm.controls['RequestQueryExceptionListURL'].setValue(DetailData.RequestQueryExceptionListURL);
    this.UATDetailsForm.controls['RequestViolationAuditDetailsURL'].setValue(DetailData.RequestViolationAuditDetailsURL);
    this.UATDetailsForm.controls['RequestListParticipantURL'].setValue(DetailData.RequestListParticipantURL);
  }
  prodDetails(DetailData) {
    this.ProdDetailsForm.controls['Version'].setValue(DetailData.Version);
    this.ProdDetailsForm.controls['BankName'].setValue(DetailData.BankName);
    this.ProdDetailsForm.controls['BaseUrl'].setValue(DetailData.BaseUrl);
    this.ProdDetailsForm.controls['RequestPayURL'].setValue(DetailData.RequestPayURL);
    this.ProdDetailsForm.controls['RequestTagDetailsURL'].setValue(DetailData.RequestTagDetailsURL);
    this.ProdDetailsForm.controls['CheckTransactionStatusRequestURL'].setValue(DetailData.CheckTransactionStatusRequestURL);
    this.ProdDetailsForm.controls['SyncTimeRequestURL'].setValue(DetailData.SyncTimeRequestURL);
    this.ProdDetailsForm.controls['GetExceptionRequestURL'].setValue(DetailData.GetExceptionRequestURL);
    this.ProdDetailsForm.controls['TollPlazaHeartBeatURL'].setValue(DetailData.TollPlazaHeartBeatURL);
    this.ProdDetailsForm.controls['RequestQueryExceptionListURL'].setValue(DetailData.RequestQueryExceptionListURL);
    this.ProdDetailsForm.controls['RequestViolationAuditDetailsURL'].setValue(DetailData.RequestViolationAuditDetailsURL);
    this.ProdDetailsForm.controls['RequestListParticipantURL'].setValue(DetailData.RequestListParticipantURL);
  }

  sftpDetails(DetailData) {
    this.SFTPDetailsForm.controls['Host'].setValue(DetailData.Host);
    this.SFTPDetailsForm.controls['Port'].setValue(DetailData.Port);
    this.SFTPDetailsForm.controls['Username'].setValue(DetailData.Username);
    this.SFTPDetailsForm.controls['Password'].setValue(DetailData.Password);
    this.SFTPDetailsForm.controls['RemoteDirectory'].setValue(DetailData.RemoteDirectory);
    this.SFTPDetailsForm.controls['Init'].setValue(DetailData.Init);
    this.SFTPDetailsForm.controls['Diff'].setValue(DetailData.Diff);
  }

  ClosePoup() { this.Dialogref.close(false); }
 
  goToStep(index: number): void {
    this.stepper.selectedIndex = index;
  }
 
  SaveDetails() {
    this.submitted = true;
    if (this.PlazaDetailsForm.invalid) {
      this.goToStep(0);
      this.ErrorData = [{ AlertMessage: 'Plaza details is pending!' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    if (this.UATDetailsForm.invalid && this.PlazaDetailsForm.value.IsProducation == false) {
      this.goToStep(1);
      this.ErrorData = [{ AlertMessage: 'Bank UAT details is pending!' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    if (this.ProdDetailsForm.invalid && this.PlazaDetailsForm.value.IsProducation == true) {
      this.goToStep(2);
      this.ErrorData = [{ AlertMessage: 'Bank Prod details is pending!' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    if (this.SFTPDetailsForm.invalid) {
      this.goToStep(3);
      this.ErrorData = [{ AlertMessage: 'Bank sftp details is pending!' }];
      this.dm.openSnackBar(this.ErrorData, false);
      return;
    }
    const plazaDetail={
      PlazaId: this.PlazaDetailsForm.value.PlazaId,
      PlazaType: this.PlazaDetailsForm.value.PlazaType,
      PlazaSubType: this.PlazaDetailsForm.value.PlazaSubType,
      PlazaZoneId: this.PlazaDetailsForm.value.PlazaZoneId,
      OrganizationId: this.PlazaDetailsForm.value.OrganizationId,
      IsProducation: this.PlazaDetailsForm.value.IsProducation,
      CertificateName: this.PlazaDetailsForm.value.CertificateName,
      CertificatePassword: this.PlazaDetailsForm.value.CertificatePassword,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    const uatDetail={
      Version: this.UATDetailsForm.value.Version,
      BankName: this.UATDetailsForm.value.BankName,
      BaseUrl: this.UATDetailsForm.value.BaseUrl,
      RequestPayURL: this.UATDetailsForm.value.RequestPayURL,
      RequestTagDetailsURL: this.UATDetailsForm.value.RequestTagDetailsURL,
      CheckTransactionStatusRequestURL: this.UATDetailsForm.value.CheckTransactionStatusRequestURL,
      SyncTimeRequestURL: this.UATDetailsForm.value.SyncTimeRequestURL,
      GetExceptionRequestURL: this.UATDetailsForm.value.GetExceptionRequestURL,
      TollPlazaHeartBeatURL: this.UATDetailsForm.value.TollPlazaHeartBeatURL,
      RequestQueryExceptionListURL: this.UATDetailsForm.value.RequestQueryExceptionListURL,
      RequestViolationAuditDetailsURL: this.UATDetailsForm.value.RequestViolationAuditDetailsURL,
      RequestListParticipantURL: this.UATDetailsForm.value.RequestListParticipantURL
    }
    const prodDetail={
      Version: this.ProdDetailsForm.value.Version,
      BankName: this.ProdDetailsForm.value.BankName,
      BaseUrl: this.ProdDetailsForm.value.BaseUrl,
      RequestPayURL: this.ProdDetailsForm.value.RequestPayURL,
      RequestTagDetailsURL: this.ProdDetailsForm.value.RequestTagDetailsURL,
      CheckTransactionStatusRequestURL: this.ProdDetailsForm.value.CheckTransactionStatusRequestURL,
      SyncTimeRequestURL: this.ProdDetailsForm.value.SyncTimeRequestURL,
      GetExceptionRequestURL: this.ProdDetailsForm.value.GetExceptionRequestURL,
      TollPlazaHeartBeatURL: this.ProdDetailsForm.value.TollPlazaHeartBeatURL,
      RequestQueryExceptionListURL: this.ProdDetailsForm.value.RequestQueryExceptionListURL,
      RequestViolationAuditDetailsURL: this.ProdDetailsForm.value.RequestViolationAuditDetailsURL,
      RequestListParticipantURL: this.ProdDetailsForm.value.RequestListParticipantURL
    }
    const sftpDetail={
      Host:this.SFTPDetailsForm.value.Host,
      Port:this.SFTPDetailsForm.value.Port,
      Username:this.SFTPDetailsForm.value.Username,
      Password:this.SFTPDetailsForm.value.Password,
      RemoteDirectory:this.SFTPDetailsForm.value.RemoteDirectory,
      Init:this.SFTPDetailsForm.value.Init,
      Diff:this.SFTPDetailsForm.value.Diff
    }
    const Obj = {
      PlazaDetail:plazaDetail,
      UATDetail:uatDetail,
      ProdDetail:prodDetail,
      SftpDetail:sftpDetail
    };
    this.spinner.show();
    this.dbService.UpdateIcdConfig(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.GetIcdDetails();
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
