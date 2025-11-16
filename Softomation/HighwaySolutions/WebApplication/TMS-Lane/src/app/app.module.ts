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
import { ListboxModule } from 'primeng/listbox';
import { ConfirmationService } from 'primeng/api';

import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatRippleModule } from '@angular/material/core';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDialogModule } from '@angular/material/dialog';
import { MatStepperModule } from '@angular/material/stepper';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatRadioModule } from '@angular/material/radio';
import { MatIconModule } from '@angular/material/icon';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { NgxSpinnerModule } from 'ngx-spinner';
import { ImageCropperModule } from 'ngx-image-cropper';
// import { IMqttServiceOptions, MqttModule } from 'ngx-mqtt';
import { MqttModule } from 'ngx-mqtt';

import { SerchFilterPipe } from 'src/services/serch-filter.pipe';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { LoginComponent } from './pages/login/login.component';
import { SnakbarComponent } from './pages/popups/snakbar/snakbar.component';
import { MediaViewComponent } from './pages/popups/media-view/media-view.component';
import { FloatProcessPopupComponent } from './pages/popups/float-process-popup/float-process-popup.component';
import { LiveViewPopUpComponent } from './pages/popups/live-view-pop-up/live-view-pop-up.component';
import { SubClassSelectionComponent } from './pages/popups/SubClassSelection/sub-class-selection.component';
import { ExemptSelectionComponent } from './pages/popups/ExemptSelection/exempt-selection.component';
import { PaymentSelectionComponent } from './pages/popups/PaymentSelection/payment-selection.component';
import { FleetCounterComponent } from './pages/popups/FleetCounter/fleet-counter.component';
import { ServiceWorkerModule } from '@angular/service-worker';
import { EtcDashboardComponent } from './pages/etc-dashboard/etc-dashboard.component';
import { PaymentQrComponent } from './pages/popups/PaymentQr/payment-qr.component';
// const MQTT_SERVICE_OPTIONS: IMqttServiceOptions = {
//   hostname: GetIpAddress(),
//   port: 9001,
//   path: '/mqtt',
//   protocol: 'ws',
// };

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
    EtcDashboardComponent,
    FloatProcessPopupComponent,
    LiveViewPopUpComponent,
    SubClassSelectionComponent,
    ExemptSelectionComponent,
    PaymentSelectionComponent,
    FleetCounterComponent,
    PaymentQrComponent
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
    ListboxModule,

    MatIconModule,
    MatRippleModule,
    MatSnackBarModule,
    MatDialogModule,
    MatStepperModule,
    MatSlideToggleModule,
    MatRadioModule,
    NgxSpinnerModule,
    ImageCropperModule,
    MqttModule.forRoot({
      connectOnCreate: false
    }),
    // ServiceWorkerModule.register('ngsw-worker.js', {
    //   enabled: !isDevMode(),
    //   // Register the ServiceWorker as soon as the application is stable
    //   // or after 30 seconds (whichever comes first).
    //   registrationStrategy: 'registerWhenStable:30000'
    // }),

    ServiceWorkerModule.register('ngsw-worker.js', {
      enabled: true,
      registrationStrategy: 'registerImmediately'
    }),
  ],
  providers: [
    [ConfirmationService],
    [DatePipe],
    { provide: MAT_DATE_LOCALE, useValue: 'in' }, // you can change useValue
    { provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
    { provide: MAT_DATE_FORMATS, useValue: MY_NATIVE_DATE_FORMATS },
  ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA]
})
export class AppModule { }
function GetIpAddress(): string | undefined {
  var currentIP = '';
  var curretURL = (window.location.href).split(':')
  currentIP = curretURL[1].replace("//", "");
  return currentIP;  //"152.52.51.146";
}