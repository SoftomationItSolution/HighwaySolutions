import { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { NgxSpinnerModule } from 'ngx-spinner';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SerchFilterPipe } from './allservices/Filter/serch-filter.pipe';
import { CommonModule, DatePipe } from '@angular/common';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatRippleModule } from '@angular/material/core';
import { DropdownModule } from 'primeng/dropdown';
import { FieldsetModule } from 'primeng/fieldset';
import {  MatSnackBarModule } from '@angular/material/snack-bar';
import { SnakbarComponent } from './allservices/snakbar/snakbar.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { ControlRoomConfigurationComponent } from './pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { DeviceDataComponent } from './pages/Config/DeviceMaster/device-data/device-data.component';
import { VehicleClassDataComponent } from './pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { RoleConfigurationComponent } from './pages/Config/RoleData/role-configuration/role-configuration.component';
import { RoleConfigurationPopupComponent } from './pages/Config/RoleData/role-configuration-popup/role-configuration-popup.component';
import { UserConfigurationComponent } from './pages/Config/UserData/user-configuration/user-configuration.component';
import { TableModule } from 'primeng/table';
import { MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
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
import { MatDialogModule } from '@angular/material/dialog';
import { PanelModule } from 'primeng/panel';
import { RolePermissionPopupComponent } from './pages/Config/RoleData/role-permission-popup/role-permission-popup.component';
import { VidsdataComponent } from './pages/VIDS/vidsdata/vidsdata.component';
import { VidsEquipmentConfigComponent } from './pages/VIDS/vids-equipment-config/vids-equipment-config.component';
import { VidsIncidentConfigComponent } from './pages/VIDS/vids-incident-config/vids-incident-config.component';
import { VidsValidationComponent } from './pages/VIDS/vids-validation/vids-validation.component';
import { VidsValidatedComponent } from './pages/VIDS/vids-validated/vids-validated.component';
import { AtccdataComponent } from './pages/ATCC/atccdata/atccdata.component';
import { ControlRoomPopupComponent } from './pages/Config/ControlRoom/control-room-popup/control-room-popup.component';
import { UserConfigurationPopupComponent } from './pages/Config/UserData/user-configuration-popup/user-configuration-popup.component';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { DevicePopupComponent } from './pages/Config/DeviceMaster/device-popup/device-popup.component';
import { PackagesDetailsComponent } from './pages/Config/Packages/packages-details/packages-details.component';
import { PackagesPopupComponent } from './pages/Config/Packages/packages-popup/packages-popup.component';
import {MatStepperModule} from '@angular/material/stepper';
import { InputTextModule } from 'primeng/inputtext';
import { VehicleClassPopupComponent } from './pages/Config/VehicleClass/vehicle-class-popup/vehicle-class-popup.component';
import {NgApexchartsModule } from "ng-apexcharts";
import { ChnagePasswordPopUpComponent } from './pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { PasswordModule } from 'primeng/password';
import { ReportsComponent } from './pages/reports/reports.component';
import { UserProfilePopupComponent } from './pages/Config/UserData/user-profile-popup/user-profile-popup.component';
import { TabViewModule } from 'primeng/tabview';
import { MediaViewComponent } from './pages/media-view/media-view.component';
import { IncidentDataComponent } from './pages/IMS/incident-data/incident-data.component';
import { CreateIncidentComponent } from './pages/IMS/create-incident/create-incident.component';
import { ImsProgressComponent } from './pages/IMS/ims-progress/ims-progress.component';
import { ImsPendingComponent } from './pages/IMS/ims-pending/ims-pending.component';
import { IncidentHistoryComponent } from './pages/IMS/incident-history/incident-history.component';
import { IncidentProcessComponent } from './pages/IMS/incident-process/incident-process.component';
import { IncidentAssigneComponent } from './pages/IMS/incident-assigne/incident-assigne.component';
import { IncidentClosedComponent } from './pages/IMS/incident-closed/incident-closed.component';
import { TreeModule } from 'primeng/tree';
import { DragDropModule } from 'primeng/dragdrop';
import { MultiSelectModule } from 'primeng/multiselect';
import { ImageModule } from 'primeng/image';
import { ImageCropperModule } from 'ngx-image-cropper';
import { SystemSettingComponent } from './pages/Config/system-setting/system-setting.component';
import { AppLockComponent } from './pages/Config/UserData/app-lock/app-lock.component';
import { SystemDetailsComponent } from './pages/Config/system-details/system-details.component';
import { VsdsDataComponent } from './pages/VSDS/vsds-data/vsds-data.component';
import { VsdsEquipmentConfigComponent } from './pages/VSDS/vsds-equipment-config/vsds-equipment-config.component';
import { VsdsIncidentConfigComponent } from './pages/VSDS/vsds-incident-config/vsds-incident-config.component';
import { VsdsValidationComponent } from './pages/VSDS/vsds-validation/vsds-validation.component';
import { VsdsValidatedComponent } from './pages/VSDS/vsds-validated/vsds-validated.component';
import { VsdsLaneConfigComponent } from './pages/VSDS/vsds-lane-config/vsds-lane-config.component';
import { LiveViewPopUpComponent } from './pages/live-view-pop-up/live-view-pop-up.component';
import { AtccvalidatedComponent } from './pages/ATCC/atccvalidated/atccvalidated.component';
import { AtccValidationComponent } from './pages/ATCC/atcc-validation/atcc-validation.component';
import { MetEventConfigComponent } from './pages/MET/met-event-config/met-event-config.component';
import { MetDataComponent } from './pages/MET/met-data/met-data.component';
import { VmsDataComponent } from './pages/VMS/vms-data/vms-data.component';
import { VmsPopupComponent } from './pages/VMS/vms-popup/vms-popup.component';
import { QuillModule } from 'ngx-quill';


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
    SnakbarComponent,
    LoginComponent,
    SerchFilterPipe,
    DashboardComponent,
    ControlRoomConfigurationComponent,
    ControlRoomPopupComponent,
    DeviceDataComponent,
    DevicePopupComponent,
    VehicleClassDataComponent,
    VehicleClassPopupComponent,
    RoleConfigurationComponent,
    RoleConfigurationPopupComponent,
    RolePermissionPopupComponent,
    UserConfigurationComponent,
    UserConfigurationPopupComponent,
    ChnagePasswordPopUpComponent,
    UserProfilePopupComponent,
    VidsdataComponent,
    VidsEquipmentConfigComponent,
    VidsIncidentConfigComponent,
    VidsValidationComponent,
    VidsValidatedComponent,
    VsdsDataComponent,
    VsdsEquipmentConfigComponent,
    VsdsIncidentConfigComponent,
    VsdsValidationComponent,
    VsdsValidatedComponent,
    AtccdataComponent,
    PackagesDetailsComponent,
    PackagesPopupComponent,
    IncidentDataComponent,
    CreateIncidentComponent,
    ReportsComponent,
    MediaViewComponent,
    IncidentHistoryComponent,
    IncidentProcessComponent,
    IncidentAssigneComponent,
    IncidentClosedComponent,
    ImsProgressComponent,
    ImsPendingComponent,
    SystemSettingComponent,
    AppLockComponent,
    SystemDetailsComponent,
    VsdsLaneConfigComponent,
    LiveViewPopUpComponent,
    AtccvalidatedComponent,
    AtccValidationComponent,
    MetEventConfigComponent,
    MetDataComponent,
    VmsDataComponent,
    VmsPopupComponent,
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
    TableModule,
    MatIconModule,
    MatTooltipModule,
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
    MatDialogModule,
    MatStepperModule,
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
