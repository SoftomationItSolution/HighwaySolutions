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
import { CommonModule } from '@angular/common';
import { MatInputModule } from '@angular/material/input';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatRippleModule } from '@angular/material/core';
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
    VehicleClassDataComponent,
    RoleConfigurationComponent,
    RoleConfigurationPopupComponent,
    RolePermissionPopupComponent,
    UserConfigurationComponent,
    VidsdataComponent,
    AtccdataComponent
  ],
  imports: [
    BrowserAnimationsModule,
    BrowserModule,
    ReactiveFormsModule,
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
    DropdownModule,
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
    MatButtonModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA ]
})
export class AppModule { }
