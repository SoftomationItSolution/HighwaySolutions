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
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { CommonModule, DatePipe } from '@angular/common';
import { MatInputModule } from '@angular/material/input';
import { MatCheckboxModule } from '@angular/material/checkbox';
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
import { MatMenuModule } from '@angular/material/menu';
import { MatDividerModule } from '@angular/material/divider';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatRadioModule } from '@angular/material/radio';
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
import { AtccdataComponent } from './pages/ATCC/atccdata/atccdata.component';
import { ControlRoomPopupComponent } from './pages/Config/ControlRoom/control-room-popup/control-room-popup.component';
import { UserConfigurationPopupComponent } from './pages/Config/UserData/user-configuration-popup/user-configuration-popup.component';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { DevicePopupComponent } from './pages/Config/DeviceMaster/device-popup/device-popup.component';
import { PackagesDetailsComponent } from './pages/Config/Packages/packages-details/packages-details.component';
import { PackagesPopupComponent } from './pages/Config/Packages/packages-popup/packages-popup.component';
import {MatStepperModule} from '@angular/material/stepper';
import { IncidentDataComponent } from './pages/incident/incident-data/incident-data.component';
import { CreateIncidentComponent } from './pages/incident/create-incident/create-incident.component';
import { InputTextModule } from 'primeng/inputtext';
import { VehicleClassPopupComponent } from './pages/Config/VehicleClass/vehicle-class-popup/vehicle-class-popup.component';
import {NgApexchartsModule } from "ng-apexcharts";
import { ChnagePasswordPopUpComponent } from './pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { PasswordModule } from 'primeng/password';
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
    VidsdataComponent,
    AtccdataComponent,
    PackagesDetailsComponent,
    PackagesPopupComponent,
    IncidentDataComponent,
    CreateIncidentComponent,
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
    MatButtonModule,
    MatCheckboxModule,
    MatRippleModule, 
    FieldsetModule,
    MatSnackBarModule,
    FormsModule,
    ReactiveFormsModule,
    ReactiveFormsModule,
    TableModule,
    MatFormFieldModule,
    MatIconModule,
    MatMenuModule,
    MatDividerModule,
    MatInputModule,
    MatTooltipModule,
    MatButtonModule,
    MatCheckboxModule,
    MatSelectModule,
    MatDatepickerModule,
    MatRadioModule,
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
    MatButtonModule,
    MatStepperModule,
    InputTextModule,
    PasswordModule
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
