import { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule, DatePipe } from '@angular/common';

import { HttpClientModule } from '@angular/common/http';
import { NgApexchartsModule } from 'ng-apexcharts';

import { DropdownModule } from 'primeng/dropdown';
import { FieldsetModule } from 'primeng/fieldset';
import { TableModule } from 'primeng/table';
import { OverlayModule } from 'primeng/overlay';
import { InputNumberModule } from 'primeng/inputnumber';
import { RadioButtonModule } from 'primeng/radiobutton';
import { FileUploadModule } from 'primeng/fileupload';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { CalendarModule } from 'primeng/calendar';
import { OverlayPanelModule } from 'primeng/overlaypanel';
import { MessageModule } from 'primeng/message';
import { PanelModule } from 'primeng/panel';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { TabViewModule } from 'primeng/tabview';
import { DragDropModule } from 'primeng/dragdrop';
import { MultiSelectModule } from 'primeng/multiselect';

import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatRippleModule } from '@angular/material/core';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDialogModule } from '@angular/material/dialog';
import { MatStepperModule } from '@angular/material/stepper';
import {MatSlideToggleModule} from '@angular/material/slide-toggle';
import { MatRadioModule } from '@angular/material/radio';
import { MatIconModule } from '@angular/material/icon';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { NgxSpinnerModule } from 'ngx-spinner';
import { ImageCropperModule } from 'ngx-image-cropper';
import { IMqttServiceOptions, MqttModule } from 'ngx-mqtt';

import { SerchFilterPipe } from 'src/services/serch-filter.pipe';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { SnakbarComponent } from './pages/snakbar/snakbar.component';
import { LoginComponent } from './pages/login/login.component';
import { MediaViewComponent } from './pages/media-view/media-view.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { SystemIntegratorMasterComponent } from './pages/configurations/SystemIntegrator/system-integrator-master/system-integrator-master.component';
import { SystemIntegratorPopupComponent } from './pages/configurations/SystemIntegrator/system-integrator-popup/system-integrator-popup.component';
import { PlzaConfigurationComponent } from './pages/configurations/Plaza/plza-configuration/plza-configuration.component';
import { PlzaConfigurationPopupComponent } from './pages/configurations/Plaza/plza-configuration-popup/plza-configuration-popup.component';
import { LaneConfigurationComponent } from './pages/configurations/Lane/lane-configuration/lane-configuration.component';
import { LaneConfigurationPopupComponent } from './pages/configurations/Lane/lane-configuration-popup/lane-configuration-popup.component';
import { ManufacturerMasterComponent } from './pages/configurations/Manufacturer/manufacturer-master/manufacturer-master.component';
import { ManufacturerPopupComponent } from './pages/configurations/Manufacturer/manufacturer-popup/manufacturer-popup.component';
import { EquipmentMasterComponent } from './pages/configurations/EquipmentMaster/equipment-master/equipment-master.component';
import { EquipmentMasterPopupComponent } from './pages/configurations/EquipmentMaster/equipment-master-popup/equipment-master-popup.component';
import { FastagVehicleClassComponent } from './pages/configurations/VehicleClass/fastag-vehicle-class/fastag-vehicle-class.component';
import { FastagVehicleClassPopupComponent } from './pages/configurations/VehicleClass/fastag-vehicle-class-popup/fastag-vehicle-class-popup.component';
import { SystemVehicleClassComponent } from './pages/configurations/VehicleClass/system-vehicle-class/system-vehicle-class.component';
import { SystemVehicleClassPopupComponent } from './pages/configurations/VehicleClass/system-vehicle-class-popup/system-vehicle-class-popup.component';
import { TransectionTypeComponent } from './pages/configurations/TransactionTypeMaster/transection-type.component';
import { PaymentTypeComponent } from './pages/configurations/PaymentTypeMaster/payment-type.component';
import { ExemptTypeComponent } from './pages/configurations/ExemptTypeMaster/exempt-type.component';
import { RoleConfigurationComponent } from './pages/configurations/RoleData/role-configuration/role-configuration.component';
import { RoleConfigurationPopupComponent } from './pages/configurations/RoleData/role-configuration-popup/role-configuration-popup.component';
import { RolePermissionPopupComponent } from './pages/configurations/RoleData/role-permission-popup/role-permission-popup.component';
import { UserConfigurationComponent } from './pages/configurations/UserData/user-configuration/user-configuration.component';
import { UserConfigurationPopupComponent } from './pages/configurations/UserData/user-configuration-popup/user-configuration-popup.component';
import { UserProfilePopupComponent } from './pages/configurations/UserData/user-profile-popup/user-profile-popup.component';
import { FareConfigurationComponent } from './pages/configurations/FareConfiguration/fare-configuration.component';
import { DenominationPoupComponent } from './pages/float-management/denomination-poup/denomination-poup.component';
import { SystemSettingComponent } from './pages/system-setting/system-setting.component';
import { AppLockComponent } from './pages/configurations/UserData/app-lock/app-lock.component';
import { FloatProcessMasterComponent } from './pages/float-management/float-process/float-process-master/float-process-master.component';
import { FloatProcessPopupComponent } from './pages/float-management/float-process/float-process-popup/float-process-popup.component';
import { ShiftClearanceDetailsComponent } from './pages/float-management/shift-clearance/shift-clearance-details/shift-clearance-details.component';
import { ShiftClearanceDetailsPopupComponent } from './pages/float-management/shift-clearance/shift-clearance-details-popup/shift-clearance-details-popup.component';
import { ConfirmationService } from 'primeng/api';
import { TransactionalDataComponent } from './pages/Transactions/transactional-data/transactional-data.component';
import { TransactionalValidationComponent } from './pages/Transactions/transactional-validation/transactional-validation.component';
import { TransactionalValidatedComponent } from './pages/Transactions/transactional-validated/transactional-validated.component';
import { ReportMasterComponent } from './pages/report-master/report-master.component';
import { FasTagDataPending } from './pages/Transactions/fasTag-data-pending/fasTag-data-pending.component';
import { FasTagDataProcessed } from './pages/Transactions/fasTag-data-processed/fasTag-data-processed.component';
import { ChangePasswordPopUpComponent } from './pages/configurations/UserData/change-password-pop-up/change-password-pop-up.component';
import { ProjectConfigComponent } from './pages/project-config/project-config.component';
import { LSDUComponent } from './pages/lsdu/parent/lsdu.component';
import { LsduLaneComponent } from './pages/lsdu/child/lsdulane.component';

const MQTT_SERVICE_OPTIONS: IMqttServiceOptions = {
  hostname: GetIpAddress(),
  port: 9001,
  path: '/mqtt',
  protocol: 'ws',
};

export const MY_NATIVE_DATE_FORMATS = {
  parse: {
    dateInput: 'DD-MMM-YYYY',
  },
  display: {
    dateInput: 'DD-MMM-YYYY',
    monthYearLabel: 'MMM YYYY',
    dateA11yLabel: 'DD-MMM-YYYY',
    monthYearA11yLabel: 'MMM YYYY',
  },
};

export const MY_CUSTOM_FORMATS = {
  parseInput: 'l LT',
  fullPickerInput: 'l LT',
  datePickerInput: 'l',
  timePickerInput: 'LT',
  monthYearLabel: 'MMM YYYY',
  dateA11yLabel: 'LL',
  monthYearA11yLabel: 'MMMM YYYY',
};

@NgModule({
  declarations: [
    AppComponent,
    SerchFilterPipe,
    DefaultLayoutComponent,
    SnakbarComponent,
    MediaViewComponent,
    LoginComponent,
    DashboardComponent,
    SystemIntegratorMasterComponent,
    SystemIntegratorPopupComponent,
    PlzaConfigurationComponent,
    PlzaConfigurationPopupComponent,
    LaneConfigurationComponent,
    LaneConfigurationPopupComponent,
    ManufacturerMasterComponent,    
    ManufacturerPopupComponent,
    EquipmentMasterComponent,
    EquipmentMasterPopupComponent,
    FastagVehicleClassComponent,
    FastagVehicleClassPopupComponent,
    SystemVehicleClassComponent,
    SystemVehicleClassPopupComponent,
    TransectionTypeComponent,
    PaymentTypeComponent,
    ExemptTypeComponent,
    RoleConfigurationComponent,
    RoleConfigurationPopupComponent,
    RolePermissionPopupComponent,
    UserConfigurationComponent,
    UserConfigurationPopupComponent,
    ChangePasswordPopUpComponent,
    UserProfilePopupComponent,
    FareConfigurationComponent,
    DenominationPoupComponent,
    SystemSettingComponent,
    ProjectConfigComponent,
    AppLockComponent,
    FloatProcessMasterComponent,
    FloatProcessPopupComponent,
    ShiftClearanceDetailsComponent,
    ShiftClearanceDetailsPopupComponent,
    TransactionalDataComponent,
    TransactionalValidationComponent,
    TransactionalValidatedComponent,
    FasTagDataPending,
    FasTagDataProcessed,
    ReportMasterComponent,
    LSDUComponent,
    LsduLaneComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    FormsModule,
    CommonModule,
    HttpClientModule,
    NgApexchartsModule,

    DropdownModule,
    FieldsetModule,
    TableModule,
    OverlayModule,
    InputNumberModule,
    RadioButtonModule,
    FileUploadModule,
    ConfirmDialogModule,
    CalendarModule,
    OverlayPanelModule,
    MessageModule,
    PanelModule,
    InputTextModule,
    PasswordModule,
    TabViewModule,
    DragDropModule,
    MultiSelectModule,
    
    MatIconModule,
    MatRippleModule,
    MatSnackBarModule,
    MatDialogModule,
    MatStepperModule,
    MatSlideToggleModule,
    MatRadioModule,
    NgxSpinnerModule,
    ImageCropperModule,
    MqttModule.forRoot(MQTT_SERVICE_OPTIONS) 
  ],
  providers: [
    [ConfirmationService],
    [DatePipe],
    { provide: MAT_DATE_LOCALE, useValue: 'in' }, // you can change useValue
    { provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
    { provide: MAT_DATE_FORMATS, useValue: MY_NATIVE_DATE_FORMATS },
  ],
  bootstrap: [AppComponent],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA ]
})
export class AppModule { }
function GetIpAddress(): string | undefined {
  var currentIP='';
  var curretURL = (window.location.href).split(':')
  currentIP = curretURL[1].replace("//", "");
  return currentIP;  //"152.52.51.146";
}