import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from "@angular/core";
import { RouterModule } from "@angular/router";
import { AdminLayoutRoutes } from "./default-layout.routing";
import { DataModel } from "src/services/data-model.model";

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