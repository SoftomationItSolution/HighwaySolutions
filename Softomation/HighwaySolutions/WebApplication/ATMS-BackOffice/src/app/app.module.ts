import { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgxSpinnerModule } from 'ngx-spinner';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule, DatePipe } from '@angular/common';

import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatRippleModule } from '@angular/material/core';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import {  MatSnackBarModule } from '@angular/material/snack-bar';
import { MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
import {MatSlideToggleModule} from '@angular/material/slide-toggle';
import {MatStepperModule} from '@angular/material/stepper';
import { MatDialogModule } from '@angular/material/dialog';

import { TableModule } from 'primeng/table';
import { OverlayModule } from 'primeng/overlay';
import { InputNumberModule } from 'primeng/inputnumber';
import { RadioButtonModule } from 'primeng/radiobutton';
import { FileUploadModule } from 'primeng/fileupload';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { CalendarModule } from 'primeng/calendar';
import { OverlayPanelModule } from 'primeng/overlaypanel';
import { ToastModule } from 'primeng/toast';
import { SplitterModule } from 'primeng/splitter';
import { MessageModule } from 'primeng/message';
import { PanelModule } from 'primeng/panel';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { TreeModule } from 'primeng/tree';
import { DragDropModule } from 'primeng/dragdrop';
import { MultiSelectModule } from 'primeng/multiselect';
import { ImageModule } from 'primeng/image';
import { TabViewModule } from 'primeng/tabview';
import { DropdownModule } from 'primeng/dropdown';
import { FieldsetModule } from 'primeng/fieldset';

import { ImageCropperModule } from 'ngx-image-cropper';
import { QuillModule } from 'ngx-quill';
import {NgApexchartsModule } from "ng-apexcharts";

import { AppComponent } from './app.component';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { AppRoutingModule } from './app-routing.module';
import { SerchFilterPipe } from './allservices/Filter/serch-filter.pipe';
import { SnakbarComponent } from './allservices/snakbar/snakbar.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { SystemDetailsComponent } from './pages/Config/system-details/system-details.component';
import { SystemSettingComponent } from './pages/Config/system-setting/system-setting.component';
import { ControlRoomConfigurationComponent } from './pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { ControlRoomPopupComponent } from './pages/Config/ControlRoom/control-room-popup/control-room-popup.component';
import { PackagesDetailsComponent } from './pages/Config/Packages/packages-details/packages-details.component';
import { PackagesPopupComponent } from './pages/Config/Packages/packages-popup/packages-popup.component';
import { EquipmentDetailsComponent } from './pages/Config/EquipmentMaster/equipment-details/equipment-details.component';
import { EquipmentDetailsPopupComponent } from './pages/Config/EquipmentMaster/equipment-details-popup/equipment-details-popup.component';
import { EquipmentPopupComponent } from './pages/Config/EquipmentMaster/equipment-popup/equipment-popup.component';
import { VehicleClassDataComponent } from './pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { VehicleClassPopupComponent } from './pages/Config/VehicleClass/vehicle-class-popup/vehicle-class-popup.component';
import { LaneConfigComponent } from './pages/Config/LaneConfig/lane-config.component';
import { RoleConfigurationComponent } from './pages/Config/RoleData/role-configuration/role-configuration.component';
import { RoleConfigurationPopupComponent } from './pages/Config/RoleData/role-configuration-popup/role-configuration-popup.component';
import { RolePermissionPopupComponent } from './pages/Config/RoleData/role-permission-popup/role-permission-popup.component';
import { UserConfigurationComponent } from './pages/Config/UserData/user-configuration/user-configuration.component';
import { UserConfigurationPopupComponent } from './pages/Config/UserData/user-configuration-popup/user-configuration-popup.component';
import { UserProfilePopupComponent } from './pages/Config/UserData/user-profile-popup/user-profile-popup.component';
import { ChnagePasswordPopUpComponent } from './pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { AppLockComponent } from './pages/Config/UserData/app-lock/app-lock.component';
import { LiveViewPopUpComponent } from './pages/PopUp/live-view-pop-up/live-view-pop-up.component';
import { MediaViewComponent } from './pages/PopUp/media-view/media-view.component';

import { VIDSEquipmentConfigComponent } from './pages/VIDS/vids-equipment-config/vids-equipment-config.component';
import { VIDSEventConfigComponent } from './pages/VIDS/vids-event-config/vids-event-config.component';
import { VIDSEventHistoryComponent } from './pages/VIDS/vids-event-history/vids-event-history.component';
import { VIDSEventValidationComponent } from './pages/VIDS/vids-event-validation/vids-event-validation.component';
import { VIDSEventValidatedComponent } from './pages/VIDS/vids-event-validated/vids-event-validated.component';

import { VSDSEquipmentConfigComponent } from './pages/VSDS/vsds-equipment-config/vsds-equipment-config.component';
import { VSDSEventConfigComponent } from './pages/VSDS/vsds-event-config/vsds-event-config.component';
import { VSDSEventHistoryComponent } from './pages/VSDS/vsds-event-history/vsds-event-history.component';
import { VSDSEventValidationComponent } from './pages/VSDS/vsds-event-validation/vsds-event-validation.component';
import { VSDSEventValidatedComponent } from './pages/VSDS/vsds-event-validated/vsds-event-validated.component';
import { ATCCEquipmentConfigComponent } from './pages/ATCC/atcc-equipment-config/atcc-equipment-config.component';
import { ATCCEventHistoryComponent } from './pages/ATCC/atcc-event-history/atcc-event-history.component';
import { ATCCEventValidationComponent } from './pages/ATCC/atcc-event-validation/atcc-event-validation.component';
import { ATCCEventValidatedComponent } from './pages/ATCC/atcc-event-validated/atcc-event-validated.component';
import { VMSEquipmentConfigComponent } from './pages/VMS/vms-equipment-config/vms-equipment-config.component';
import { VMSMessageDetailsComponent } from './pages/VMS/vms-message-details/vms-message-details.component';
import { VMSMessageDetailsPopupComponent } from './pages/VMS/vms-message-details-popup/vms-message-details-popup.component';
import { VMSMessageHistroyComponent } from './pages/VMS/vms-message-histroy/vms-message-histroy.component';
import { IMSPendingComponent } from './pages/IMS/ims-pending/ims-pending.component';
import { IMSProgressComponent } from './pages/IMS/ims-progress/ims-progress.component';
import { IMSClosedComponent } from './pages/IMS/ims-closed/ims-closed.component';
import { CreateIncidentComponent } from './pages/IMS/create-incident/create-incident.component';
import { IncidentProcessComponent } from './pages/IMS/incident-process/incident-process.component';
import { IncidentAssigneComponent } from './pages/IMS/incident-assigne/incident-assigne.component';
import { IncidentHistoryComponent } from './pages/IMS/incident-history/incident-history.component';
import { WeatherEventConfigComponent } from './pages/Weather/weather-event-config/weather-event-config.component';
import { WeatherEventHistoryComponent } from './pages/Weather/weather-event-history/weather-event-history.component';
import { ReportsComponent } from './pages/reports/reports.component';

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
    DefaultLayoutComponent,
    SerchFilterPipe,
    SnakbarComponent,
    LoginComponent,
    DashboardComponent,
    SystemDetailsComponent,
    SystemSettingComponent,
    ControlRoomConfigurationComponent,
    ControlRoomPopupComponent,
    PackagesDetailsComponent,
    PackagesPopupComponent,
    EquipmentDetailsComponent,
    EquipmentPopupComponent,
    EquipmentDetailsPopupComponent,
    VehicleClassDataComponent,
    VehicleClassPopupComponent,
    LaneConfigComponent,
    RoleConfigurationComponent,
    RoleConfigurationPopupComponent,
    RolePermissionPopupComponent,
    UserConfigurationComponent,
    UserConfigurationPopupComponent,
    ChnagePasswordPopUpComponent,
    UserProfilePopupComponent,
    AppLockComponent,
    LiveViewPopUpComponent,
    MediaViewComponent,
    VIDSEquipmentConfigComponent,
    VIDSEventConfigComponent,
    VIDSEventHistoryComponent,
    VIDSEventValidationComponent,
    VIDSEventValidatedComponent,
    VSDSEquipmentConfigComponent,
    VSDSEventConfigComponent,
    VSDSEventHistoryComponent,
    VSDSEventValidationComponent,
    VSDSEventValidatedComponent,
    ATCCEquipmentConfigComponent,
    ATCCEventHistoryComponent,
    ATCCEventValidationComponent,
    ATCCEventValidatedComponent,
    VMSEquipmentConfigComponent,
    VMSMessageDetailsComponent,
    VMSMessageDetailsPopupComponent,
    VMSMessageHistroyComponent,
    IMSPendingComponent,
    IMSProgressComponent,
    IMSClosedComponent,
    CreateIncidentComponent,
    IncidentProcessComponent,
    IncidentHistoryComponent,
    IncidentAssigneComponent,
    WeatherEventConfigComponent,
    WeatherEventHistoryComponent,
    ReportsComponent
  ],
  imports: [
    BrowserAnimationsModule,
    BrowserModule,
    ReactiveFormsModule,
    NgApexchartsModule,
    CommonModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    DropdownModule,
    NgxSpinnerModule,
    MatRippleModule, 
    MatSnackBarModule,
    MatDialogModule,
    MatStepperModule,
    MatIconModule,
    MatTooltipModule,
    MatSlideToggleModule,
    TableModule,
    OverlayModule,
    InputNumberModule,
    RadioButtonModule,
    FileUploadModule,
    ConfirmDialogModule,
    CalendarModule,
    OverlayPanelModule,
    ToastModule,
    SplitterModule,
    FieldsetModule,
    MessageModule,
    PanelModule,
    InputTextModule,
    PasswordModule,
    TabViewModule,
    TreeModule,
    DragDropModule,
    MultiSelectModule,
    ImageModule,
    ConfirmDialogModule,
    ImageCropperModule,
    QuillModule.forRoot() 
  ],
  providers: [
    [DatePipe],
    { provide: MAT_DATE_LOCALE, useValue: 'in' }, // you can change useValue
    { provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
    { provide: MAT_DATE_FORMATS, useValue: MY_NATIVE_DATE_FORMATS },
  ],
  bootstrap: [AppComponent],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA ]
})
export class AppModule { }
