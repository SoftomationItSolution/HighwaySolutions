import { NgModule } from "@angular/core";
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from "@angular/router";
import { AdminLayoutRoutes } from "./default-layout.routing";
import { DashboardComponent } from "../pages/dashboard/dashboard.component";


@NgModule({
    imports: [
        RouterModule.forChild(AdminLayoutRoutes),
        CommonModule,
        ReactiveFormsModule,
    ],
    declarations: [
        DashboardComponent
        
    ]
})
export class DefaultLayoutModule{}