import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from "@angular/core";
import { RouterModule } from "@angular/router";
import { AdminLayoutRoutes } from "./default-layout.routing";
import { DataModel } from "src/services/data-model.model";

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
    providers: [DataModel],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class DefaultLayoutModule { }