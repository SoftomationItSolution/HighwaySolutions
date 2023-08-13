import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DefaultLayoutComponent } from './_layout/default-layout/default-layout.component';
const routes: Routes =[
  { path: '', component: LoginComponent },
  { path: 'login', component: LoginComponent },
  
  {
    path: 'dashboard',
    redirectTo: 'dashboard',
    pathMatch: 'full',
  },  
  {
    path: '',
    component: DefaultLayoutComponent,
    children: [
        {
      path: '',
      loadChildren: () => import('./_layout/default-layout.module').then(x => x.DefaultLayoutModule)
  }]},
  // { path: '**', component: Page404Component },
];



@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      scrollPositionRestoration: 'top',
      anchorScrolling: 'enabled',
      initialNavigation: 'enabledBlocking'
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
