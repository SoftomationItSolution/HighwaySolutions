import { Routes } from '@angular/router';
import { PageNotFoundComponent } from '../page-not-found/page-not-found.component';
import { DashboardComponent } from '../pages/dashboard/dashboard.component';
import { ControlRoomConfigurationComponent } from '../pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { DeviceDataComponent } from '../pages/Config/DeviceMaster/device-data/device-data.component';
import { VehicleClassDataComponent } from '../pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { RoleConfigurationComponent } from '../pages/Config/RoleData/role-configuration/role-configuration.component';
import { UserConfigurationComponent } from '../pages/Config/UserData/user-configuration/user-configuration.component';
import { VidsdataComponent } from "../pages/VIDS/vidsdata/vidsdata.component";
import { AtccdataComponent } from '../pages/ATCC/atccdata/atccdata.component';
import { PackagesDetailsComponent } from '../pages/Config/Packages/packages-details/packages-details.component';
import { ImsProgressComponent } from '../pages/IMS/ims-progress/ims-progress.component';
import { ImsPendingComponent } from '../pages/IMS/ims-pending/ims-pending.component';
import { IncidentClosedComponent } from '../pages/IMS/incident-closed/incident-closed.component';
import { ReportsComponent } from '../pages/reports/reports.component';
import { VidsEquipmentConfigComponent } from '../pages/VIDS/vids-equipment-config/vids-equipment-config.component';
import { VidsValidationComponent } from '../pages/VIDS/vids-validation/vids-validation.component';
import { VidsValidatedComponent } from '../pages/VIDS/vids-validated/vids-validated.component';
import { VidsIncidentConfigComponent } from '../pages/VIDS/vids-incident-config/vids-incident-config.component';


export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard', component: DashboardComponent },
    { path: 'controlRoom', component: ControlRoomConfigurationComponent },
    { path: 'equipment', component: DeviceDataComponent },
    { path: 'package', component: PackagesDetailsComponent },
    { path: 'vehicleClass', component: VehicleClassDataComponent },
    { path: 'role', component: RoleConfigurationComponent },
    { path: 'users', component: UserConfigurationComponent },
    { path: 'atcc', component: AtccdataComponent },
    { path: 'reports', component: ReportsComponent },
    { path: 'imsPending', component: ImsPendingComponent },
    { path: 'imsProgress', component: ImsProgressComponent },
    { path: 'imsClosed', component: IncidentClosedComponent },
    { path: 'vidsEquipmentConfig', component: VidsEquipmentConfigComponent },
    { path: 'vidsEventConfig', component: VidsIncidentConfigComponent },
    { path: 'vidsEventHistroy', component: VidsdataComponent },
    { path: 'vidsValidation', component: VidsValidationComponent },
    { path: 'vidsValidated', component: VidsValidatedComponent },
    { path: '**', component: PageNotFoundComponent },
    { path: 'unauthorized', component: PageNotFoundComponent },
 
];
