import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgxSpinnerModule } from 'ngx-spinner';
import { SidebarModule } from 'primeng/sidebar';
import { AccordionModule} from 'primeng/accordion';
import { CardModule} from 'primeng/card';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import {CUSTOM_ELEMENTS_SCHEMA} from '@angular/core';
import { DropdownModule } from 'primeng/dropdown';
import {InputNumberModule} from 'primeng/inputnumber';
import {PanelModule} from 'primeng/panel';
import {MessageModule} from 'primeng/message';
import {RadioButtonModule} from 'primeng/radiobutton';
import {FileUploadModule} from 'primeng/fileupload';
import {ToastModule} from 'primeng/toast';
import {ConfirmDialogModule} from 'primeng/confirmdialog';
import { SplitterModule } from 'primeng/splitter';
import { FieldsetModule } from 'primeng/fieldset';
import {InputSwitchModule} from 'primeng/inputswitch';
import {ChartModule} from 'primeng/chart';

import { TableModule } from 'primeng/table';
import { LoginComponent } from './Pages/login/login.component';
import { DashboardComponent } from './Pages/dashboard/dashboard.component';
import { ConfirmationService, MessageService } from 'primeng/api';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatDividerModule } from '@angular/material/divider';
import { MatInputModule } from '@angular/material/input';
import { MatDialogModule } from '@angular/material/dialog';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatRadioModule} from '@angular/material/radio';
import { OverlayModule } from '@angular/cdk/overlay';

import { RxReactiveFormsModule } from '@rxweb/reactive-form-validators';
import { SnakbarComponent } from './allservices/snakbar/snakbar.component';
import { RoleConfigurationComponent } from './Pages/Config/RoleData/role-configuration/role-configuration.component';
import { UserConfigurationComponent } from './Pages/Config/UserData/user-configuration/user-configuration.component';
import { RoleConfigurationPopupComponent } from './Pages/Config/RoleData/role-configuration-popup/role-configuration-popup.component';
import { UserConfigurationPopupComponent } from './Pages/Config/UserData/user-configuration-popup/user-configuration-popup.component';
import {  DatePipe } from '@angular/common';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { CalendarModule } from 'primeng/calendar';
import {OverlayPanelModule} from 'primeng/overlaypanel';
import { PageNotFoundComponent } from './allservices/page-not-found/page-not-found.component';
import { ChnagePasswordPopUpComponent } from './Pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { RolePermissionPopupComponent } from './Pages/Config/RoleData/role-permission-popup/role-permission-popup.component';
import { UnReviewedComponent } from './Pages/Reporting/un-reviewed/un-reviewed.component';
import { ReviewedComponent } from './Pages/Reporting/reviewed/reviewed.component';
import { ShiftDetailsPopupComponent } from './Pages/Config/PopUps/shift-details-popup/shift-details-popup.component';
import { UnReviewedPopupComponent } from './Pages/Reporting/un-reviewed-popup/un-reviewed-popup.component';
import { ReprotingMasterComponent } from './Pages/Reporting/reproting-master/reproting-master.component';
import { ChartsModule } from 'ng2-charts';
import { SystemSettingComponent } from './Pages/Config/PopUps/system-setting/system-setting.component';
import { DeviceDataComponent } from './Pages/Config/DeviceMaster/device-data/device-data.component';
import { DevicePopupComponent } from './Pages/Config/DeviceMaster/device-popup/device-popup.component';
import { ControlRoomConfigurationComponent } from './Pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { ControlRoomPopupComponent } from './Pages/Config/ControlRoom/control-room-popup/control-room-popup.component';
import { ControlRoomDevicePopupComponent } from './Pages/Config/ControlRoom/control-room-device-popup/control-room-device-popup.component';
import { GantryPopupComponent } from './Pages/Config/Gantry/gantry-popup/gantry-popup.component';
import { GantryDataComponent } from './Pages/Config/Gantry/gantry-data/gantry-data.component';
import { LaneDataComponent } from './Pages/Config/Lane/lane-data/lane-data.component';
import { LanePopupComponent } from './Pages/Config/Lane/lane-popup/lane-popup.component';
import { GantryMappingComponent } from './Pages/Config/Gantry/gantry-mapping/gantry-mapping.component';
import { VehicleClassPopupComponent } from './Pages/Config/VehicleClass/vehicle-class-popup/vehicle-class-popup.component';
import { VehicleClassDataComponent } from './Pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { IncidentDataComponent } from './Pages/Reporting/IncidentMaster/incident-data/incident-data.component';
import { IncidentPopUpComponent } from './Pages/Reporting/IncidentMaster/incident-pop-up/incident-pop-up.component';
import { VMSDataComponent } from './Pages/Reporting/VMS/vmsdata/vmsdata.component';
import { VMSPopupComponent } from './Pages/Reporting/VMS/vmspopup/vmspopup.component';
import { VMSListPopupComponent } from './Pages/Reporting/VMS/vmslist-popup/vmslist-popup.component';
import { METConfigPopupComponent } from './Pages/Reporting/METS/metconfig-popup/metconfig-popup.component';
import { METDataComponent } from './Pages/Reporting/METS/metdata/metdata.component';
import { ECBDataComponent } from './Pages/Reporting/ECB/ecbdata/ecbdata.component';
import { VidsDataComponent } from './Pages/Reporting/VIDS/vids-data/vids-data.component';
import { SerchFilterPipe } from './allservices/Filter/serch-filter.pipe';
import { ATCCDataComponent } from './Pages/Reporting/ATCC/atccdata/atccdata.component';

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
    PageNotFoundComponent,
    LoginComponent,
    DashboardComponent,
    DeviceDataComponent,
    DevicePopupComponent,
    SnakbarComponent,
    SerchFilterPipe,
    RoleConfigurationComponent,
    UserConfigurationComponent,
    RoleConfigurationPopupComponent,
    UserConfigurationPopupComponent,
    ChnagePasswordPopUpComponent,
    RolePermissionPopupComponent,
    UnReviewedComponent,
    ReviewedComponent,
    ShiftDetailsPopupComponent,
    UnReviewedPopupComponent,
    ReprotingMasterComponent,
    SystemSettingComponent,
    ControlRoomConfigurationComponent,
    ControlRoomPopupComponent,
    ControlRoomDevicePopupComponent,
    GantryPopupComponent,
    GantryDataComponent,
    GantryMappingComponent,
    LaneDataComponent,
    LanePopupComponent,
    IncidentDataComponent,
    IncidentPopUpComponent,
    VehicleClassPopupComponent,
    VehicleClassDataComponent,
    VMSDataComponent,
    VMSPopupComponent,
    VMSListPopupComponent,
    METConfigPopupComponent,
    METDataComponent,
    ECBDataComponent,
    VidsDataComponent,
    ATCCDataComponent
  ],
  imports: [
    BrowserAnimationsModule,
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    SidebarModule,
    AccordionModule,
    CardModule,
    InputSwitchModule,
    // ButtonModule,
    BrowserModule,
    ReactiveFormsModule,
    ToastModule,
    SplitterModule,
    FieldsetModule,
    MessageModule,
    PanelModule,
    TableModule,
    ChartModule,
    DropdownModule,
    InputNumberModule,
    RadioButtonModule,
    FileUploadModule,
    ConfirmDialogModule,
    CalendarModule,
    OverlayPanelModule,
    NgxSpinnerModule,

    FormsModule,
    ReactiveFormsModule,
    RxReactiveFormsModule,
    MatIconModule,
    MatMenuModule,
    MatDividerModule,
    MatFormFieldModule,
    MatInputModule,
    MatTooltipModule,
    MatSnackBarModule,
    MatTooltipModule,
    MatDialogModule,
    MatInputModule,
    MatIconModule,
    MatDividerModule,
    MatButtonModule,
    MatCheckboxModule,
    MatSelectModule,
    MatDatepickerModule,
    MatRadioModule,
    OverlayModule,
    ChartsModule
  ],
  providers:
  [
    [MessageService],
    [ConfirmationService],
    [DatePipe],
    { provide: MAT_DATE_LOCALE, useValue: 'in' }, // you can change useValue
    { provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
    { provide: MAT_DATE_FORMATS, useValue: MY_NATIVE_DATE_FORMATS },
    // { provide: LOCALE_ID,useValue: 'INR'},
    // [CurrencyPipe],
    // {provide: OWL_DATE_TIME_LOCALE, useValue: 'in'},
    // { provide: OWL_DATE_TIME_FORMATS, useValue: MY_CUSTOM_FORMATS }
  ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
