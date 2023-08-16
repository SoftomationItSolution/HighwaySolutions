import { Routes } from '@angular/router';
import { DashboardComponent } from '../pages/dashboard/dashboard.component';
import { PageNotFoundComponent } from '../pages/page-not-found/page-not-found.component';
import { SystemIntegratorMasterComponent } from '../pages/configurations/SystemIntegrator/system-integrator-master/system-integrator-master.component';
import { PlzaConfigurationComponent } from '../pages/configurations/Plaza/plza-configuration/plza-configuration.component';
import { LaneConfigurationComponent } from '../pages/configurations/Lane/lane-configuration/lane-configuration.component';
import { EquipmentManufactureMasterComponent } from '../pages/configurations/EquipmentManufacture/equipment-manufacture-master/equipment-manufacture-master.component';
import { VehicleClassConfigurationComponent } from '../pages/configurations/VehicleClass/vehicle-class-configuration/vehicle-class-configuration.component';
import { EquipmentMasterComponent } from '../pages/configurations/EquipmentMaster/equipment-master/equipment-master.component';

export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard', component: DashboardComponent },
    { path: 'systemIntegrator', component: SystemIntegratorMasterComponent },
    { path: 'plazaMaster', component: PlzaConfigurationComponent },
    { path: 'laneMaster', component: LaneConfigurationComponent },
    { path: 'equipmentManufacture', component: EquipmentManufactureMasterComponent },
    { path: 'equipmentMaster', component: EquipmentMasterComponent },
    { path: 'vehicleClass', component: VehicleClassConfigurationComponent },
    { path: '**', component: PageNotFoundComponent },
    { path: 'unauthorized', component: PageNotFoundComponent },
 
];
