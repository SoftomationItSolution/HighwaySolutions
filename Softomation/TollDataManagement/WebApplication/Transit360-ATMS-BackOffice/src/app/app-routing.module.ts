import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PageNotFoundComponent } from './allservices/page-not-found/page-not-found.component';
import { LoginComponent } from './Pages/login/login.component';
import { DashboardComponent } from './Pages/dashboard/dashboard.component';
import { DeviceDataComponent } from './Pages/Config/DeviceMaster/device-data/device-data.component';
import { ControlRoomConfigurationComponent } from './Pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { GantryDataComponent } from './Pages/Config/Gantry/gantry-data/gantry-data.component';
import { GantryMappingComponent } from './Pages/Config/Gantry/gantry-mapping/gantry-mapping.component';
import { LaneDataComponent } from './Pages/Config/Lane/lane-data/lane-data.component';
import { VehicleClassDataComponent } from './Pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { RoleConfigurationComponent } from './Pages/Config/RoleData/role-configuration/role-configuration.component';
import { UserConfigurationComponent } from './Pages/Config/UserData/user-configuration/user-configuration.component';
import { IncidentDataComponent } from './Pages/Reporting/IncidentMaster/incident-data/incident-data.component';
import { VMSDataComponent } from './Pages/Reporting/VMS/vmsdata/vmsdata.component';
import { METDataComponent } from './Pages/Reporting/METS/metdata/metdata.component';
import { VidsDataComponent } from './Pages/Reporting/VIDS/vids-data/vids-data.component';
import { ECBDataComponent } from './Pages/Reporting/ECB/ecbdata/ecbdata.component';
import { ATCCDataComponent } from './Pages/Reporting/ATCC/atccdata/atccdata.component';


const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'controlRoom', component: ControlRoomConfigurationComponent },
  { path: 'devices', component: DeviceDataComponent },
  { path: 'gantry', component: GantryDataComponent },
  { path: 'gantryMapping', component: GantryMappingComponent },
  { path: 'lane', component: LaneDataComponent },
  { path: 'vehicleClass', component: VehicleClassDataComponent },
  { path: 'role', component: RoleConfigurationComponent },
  { path: 'users', component: UserConfigurationComponent },
  { path: 'incidents', component: IncidentDataComponent },
  { path: 'vms', component: VMSDataComponent },
  { path: 'met', component: METDataComponent },
  { path: 'vids', component: VidsDataComponent },
  { path: 'ecb', component: ECBDataComponent },
  { path: 'atcc', component: ATCCDataComponent },
  { path: '**', component: PageNotFoundComponent },
  { path: 'unauthorized', component: PageNotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
