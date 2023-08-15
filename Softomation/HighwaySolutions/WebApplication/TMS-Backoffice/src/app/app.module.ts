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
import { MomentDateAdapter } from '@angular/material-moment-adapter';

import { NgxSpinnerModule } from 'ngx-spinner';
import { ImageCropperModule } from 'ngx-image-cropper';

import { SerchFilterPipe } from 'src/services/serch-filter.pipe';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { SnakbarComponent } from './pages/snakbar/snakbar.component';
import { LoginComponent } from './pages/login/login.component';
import { MediaViewComponent } from './pages/media-view/media-view.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { SystemIntegratorMasterComponent } from './pages/configurations/SystemIntegrator/system-integrator-master/system-integrator-master.component';
import { SystemIntegratorPopupComponent } from './pages/configurations/SystemIntegrator/system-integrator-popup/system-integrator-popup.component';

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
    SystemIntegratorPopupComponent
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

    MatRippleModule,
    MatSnackBarModule,
    MatDialogModule,
    MatStepperModule,
    NgxSpinnerModule,
    ImageCropperModule 
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
