import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from "@angular/core";
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from "@angular/router";
import { AdminLayoutRoutes } from "./default-layout.routing";
import { DashboardComponent } from "../pages/dashboard/dashboard.component";
import { TableModule } from "primeng/table";
import { MatFormFieldModule } from "@angular/material/form-field";

import { MatMenuModule } from "@angular/material/menu";
import { MatDividerModule } from "@angular/material/divider";
import { MatInputModule } from "@angular/material/input";
import { MatTooltipModule } from "@angular/material/tooltip";
import { MatButtonModule } from "@angular/material/button";
import { MatCheckboxModule } from "@angular/material/checkbox";
import { MatSelectModule } from "@angular/material/select";
import { MatDatepickerModule } from "@angular/material/datepicker";
import { MatRadioModule } from "@angular/material/radio";
import { OverlayModule } from "primeng/overlay";
import { DropdownModule } from "primeng/dropdown";
import { InputNumberModule } from "primeng/inputnumber";
import { RadioButtonModule } from "primeng/radiobutton";
import { FileUploadModule } from "primeng/fileupload";
import { ConfirmDialogModule } from "primeng/confirmdialog";
import { CalendarModule } from "primeng/calendar";
import { OverlayPanelModule } from "primeng/overlaypanel";
import { ToastModule } from "primeng/toast";
import { SplitterModule } from "primeng/splitter";
import { FieldsetModule } from "primeng/fieldset";
import { MessageModule } from "primeng/message";
import { PanelModule } from "primeng/panel";
import { MatDialogModule } from "@angular/material/dialog";
import { ControlRoomConfigurationComponent } from "../pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component";
import { MatIconModule } from "@angular/material/icon";
import { DataModel } from "../services/data-model.model";
import { ApiService } from "../allservices/api.service";
import { EmittersService } from "../allservices/emitters.service";
// import { DeviceDataComponent } from "../pages/Config/DeviceMaster/device-data/device-data.component";
// import { VehicleClassDataComponent } from "../pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component";
// import { RoleConfigurationComponent } from "../pages/Config/RoleData/role-configuration/role-configuration.component";
// import { UserConfigurationComponent } from "../pages/Config/UserData/user-configuration/user-configuration.component";
// import { RoleConfigurationPopupComponent } from "../pages/Config/RoleData/role-configuration-popup/role-configuration-popup.component";

@NgModule({
    imports: [
        RouterModule.forChild(AdminLayoutRoutes),
       
    ],
    declarations: [
      
    ],
    providers: [DataModel, ApiService, EmittersService],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class DefaultLayoutModule { }