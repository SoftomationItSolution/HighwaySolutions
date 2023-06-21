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
import { PackagesDetailsComponent } from '../pages/Config/packages-details/packages-details.component';

export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard', component: DashboardComponent },
    { path: 'controlRoom', component: ControlRoomConfigurationComponent },
    { path: 'equipment', component: DeviceDataComponent },
    { path: 'package', component: PackagesDetailsComponent },
    { path: 'vehicleClass', component: VehicleClassDataComponent },
    { path: 'role', component: RoleConfigurationComponent },
    { path: 'users', component: UserConfigurationComponent },
    // { path: 'incidents', component: IncidentDataComponent },
    // { path: 'vms', component: VMSDataComponent },
    // { path: 'met', component: METDataComponent },
     { path: 'vids', component: VidsdataComponent },
    // { path: 'ecb', component: ECBDataComponent },
    { path: 'atcc', component: AtccdataComponent },
    { path: '**', component: PageNotFoundComponent },
    { path: 'unauthorized', component: PageNotFoundComponent }
];
