import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import { DefaultLayoutComponent } from './_layout/default-layout/DefaultLayoutComponent';

const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'login', component: LoginComponent },
  {
    path: '',
    component: DefaultLayoutComponent,
    children: [
        {
      path: '',
      loadChildren: () => import('./_layout/default-layout.module').then(x => x.DefaultLayoutModule)
  }]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
