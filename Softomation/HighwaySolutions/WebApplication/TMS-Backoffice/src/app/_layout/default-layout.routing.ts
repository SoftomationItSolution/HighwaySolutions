import { Routes } from '@angular/router';
import { DashboardComponent } from '../pages/dashboard/dashboard.component';
import { PageNotFoundComponent } from '../pages/page-not-found/page-not-found.component';



export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard', component: DashboardComponent },
    { path: '**', component: PageNotFoundComponent },
    { path: 'unauthorized', component: PageNotFoundComponent },
 
];
