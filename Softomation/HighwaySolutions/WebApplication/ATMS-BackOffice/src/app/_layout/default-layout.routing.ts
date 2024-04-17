import { Routes } from '@angular/router';
import { PageNotFoundComponent } from '../page-not-found/page-not-found.component';
import { DashboardGraphComponent } from '../pages/dashboard-master/dashboard-graph/dashboard-graph.component';
import { DashboardMapComponent } from '../pages/dashboard-master/dashboard-map/dashboard-map.component';
import { JsmapComponent } from '../pages/dashboard-master/jsmap/jsmap.component';
import { SystemDetailsComponent } from '../pages/Config/system-details/system-details.component';
import { ControlRoomConfigurationComponent } from '../pages/Config/ControlRoom/control-room-configuration/control-room-configuration.component';
import { PackagesDetailsComponent } from '../pages/Config/Packages/packages-details/packages-details.component';
import { EquipmentDetailsComponent } from '../pages/Config/EquipmentMaster/equipment-details/equipment-details.component';
import { VehicleClassDataComponent } from '../pages/Config/VehicleClass/vehicle-class-data/vehicle-class-data.component';
import { LaneConfigComponent } from '../pages/Config/LaneConfig/lane-config.component';
import { RoleConfigurationComponent } from '../pages/Config/RoleData/role-configuration/role-configuration.component';
import { UserConfigurationComponent } from '../pages/Config/UserData/user-configuration/user-configuration.component';

import { VIDSEquipmentConfigComponent } from '../pages/VIDS/vids-equipment-config/vids-equipment-config.component';
import { VIDSEventConfigComponent } from '../pages/VIDS/vids-event-config/vids-event-config.component';
import { VIDSEventHistoryComponent } from '../pages/VIDS/vids-event-history/vids-event-history.component';
import { VIDSEventValidationComponent } from '../pages/VIDS/vids-event-validation/vids-event-validation.component';
import { VIDSEventValidatedComponent } from '../pages/VIDS/vids-event-validated/vids-event-validated.component';

import { VSDSEquipmentConfigComponent } from '../pages/VSDS/vsds-equipment-config/vsds-equipment-config.component';
import { VSDSEventConfigComponent } from '../pages/VSDS/vsds-event-config/vsds-event-config.component';
import { VSDSEventHistoryComponent } from '../pages/VSDS/vsds-event-history/vsds-event-history.component';
import { VSDSEventValidationComponent } from '../pages/VSDS/vsds-event-validation/vsds-event-validation.component';
import { VSDSEventValidatedComponent } from '../pages/VSDS/vsds-event-validated/vsds-event-validated.component';
import { ATCCEquipmentConfigComponent } from '../pages/ATCC/atcc-equipment-config/atcc-equipment-config.component';
import { ATCCEventHistoryComponent } from '../pages/ATCC/atcc-event-history/atcc-event-history.component';
import { ATCCEventValidationComponent } from '../pages/ATCC/atcc-event-validation/atcc-event-validation.component';
import { ATCCEventValidatedComponent } from '../pages/ATCC/atcc-event-validated/atcc-event-validated.component';
import { VMSEquipmentConfigComponent } from '../pages/VMS/vms-equipment-config/vms-equipment-config.component';
import { ECBEquipmentConfigComponent } from '../pages/ECB/ecb-equipment-config/ecb-equipment-config.component';
import { ECBEventHistoryComponent } from '../pages/ECB/ecb-event-history/ecb-event-history.component';
import { VMSMessageDetailsComponent } from '../pages/VMS/vms-message-details/vms-message-details.component';
import { VMSMessageHistroyComponent } from '../pages/VMS/vms-message-histroy/vms-message-histroy.component';
import { IMSPendingComponent } from '../pages/IMS/ims-pending/ims-pending.component';
import { IMSProgressComponent } from '../pages/IMS/ims-progress/ims-progress.component';
import { IMSClosedComponent } from '../pages/IMS/ims-closed/ims-closed.component';
import { WeatherEventConfigComponent } from '../pages/Weather/weather-event-config/weather-event-config.component';
import { WeatherEventHistoryComponent } from '../pages/Weather/weather-event-history/weather-event-history.component';
import { ReportsComponent } from '../pages/reports/reports.component';







export const AdminLayoutRoutes: Routes = [
    { path: 'graphDashboard', component: DashboardGraphComponent },
    { path: 'gisDashboard', component: DashboardMapComponent },
    { path: 'gisDashboard1', component: JsmapComponent },
    { path: 'configSystem', component: SystemDetailsComponent },
    { path: 'configControlRoom', component: ControlRoomConfigurationComponent },
    { path: 'configPackage', component: PackagesDetailsComponent },
    { path: 'configEquipment', component: EquipmentDetailsComponent },
    { path: 'configVehicleClass', component: VehicleClassDataComponent },
    { path: 'configLaneConfig', component: LaneConfigComponent },
    { path: 'configRole', component: RoleConfigurationComponent },
    { path: 'configUsers', component: UserConfigurationComponent },

    { path: 'vidsEquipmentConfig', component: VIDSEquipmentConfigComponent },
    { path: 'vidsEventConfig', component: VIDSEventConfigComponent },
    { path: 'vidsEventHistroy', component: VIDSEventHistoryComponent },
    { path: 'vidsValidation', component: VIDSEventValidationComponent },
    { path: 'vidsValidated', component: VIDSEventValidatedComponent },

    { path: 'vsdsEquipmentConfig', component: VSDSEquipmentConfigComponent },
    { path: 'vsdsEventConfig', component: VSDSEventConfigComponent },
    { path: 'vsdsEventHistroy', component: VSDSEventHistoryComponent },
    { path: 'vsdsValidation', component: VSDSEventValidationComponent },
    { path: 'vsdsValidated', component: VSDSEventValidatedComponent },

    { path: 'atccEquipmentConfig', component: ATCCEquipmentConfigComponent },
    { path: 'atccEventHistroy', component: ATCCEventHistoryComponent },
    { path: 'atccValidation', component: ATCCEventValidationComponent },
    { path: 'atccValidated', component: ATCCEventValidatedComponent },

    { path: 'ecbEquipmentConfig', component: ECBEquipmentConfigComponent },
    { path: 'ecbEventHistroy', component: ECBEventHistoryComponent },

    { path: 'vmsEventConfig', component: VMSEquipmentConfigComponent },
    { path: 'vmsMessageDetails', component: VMSMessageDetailsComponent },
    { path: 'vmsMessageHistory', component: VMSMessageHistroyComponent },

    { path: 'imsPending', component: IMSPendingComponent },
    { path: 'imsProgress', component: IMSProgressComponent },
    { path: 'imsClosed', component: IMSClosedComponent },
    
    { path: 'weatherEventConfig', component: WeatherEventConfigComponent },
    { path: 'weatherEventHistory', component: WeatherEventHistoryComponent },
   
    { path: 'rmsReports', component: ReportsComponent },
    { path: '**', component: PageNotFoundComponent },
    { path: 'unauthorized', component: PageNotFoundComponent },
 
];
