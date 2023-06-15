import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { NgxSpinnerModule } from 'ngx-spinner';
import { MatDialogModule } from '@angular/material/dialog';
import { ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatDividerModule } from '@angular/material/divider';
import { MatInputModule } from '@angular/material/input';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatRadioModule} from '@angular/material/radio';
import { OverlayModule } from '@angular/cdk/overlay';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { DropdownModule } from 'primeng/dropdown';
import { InputNumberModule} from 'primeng/inputnumber';
import { RadioButtonModule} from 'primeng/radiobutton';
import { FileUploadModule} from 'primeng/fileupload';
import { ToastModule} from 'primeng/toast';
import { ConfirmDialogModule} from 'primeng/confirmdialog';
import { CalendarModule } from 'primeng/calendar';
import { OverlayPanelModule} from 'primeng/overlaypanel';
import { SplitterModule } from 'primeng/splitter';
import { FieldsetModule } from 'primeng/fieldset';
import { MessageModule} from 'primeng/message';
import { PanelModule} from 'primeng/panel';
import { TableModule } from 'primeng/table';
@NgModule({
  declarations: [
    AppComponent,
    DefaultLayoutComponent,
    LoginComponent,
    PageNotFoundComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatDialogModule,
    NgxSpinnerModule,
    ReactiveFormsModule,
    ReactiveFormsModule,
    MatFormFieldModule,
    MatIconModule,
    MatMenuModule,
    MatDividerModule,
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
    TableModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
