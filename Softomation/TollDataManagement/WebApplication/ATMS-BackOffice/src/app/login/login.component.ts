import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
})
export class LoginComponent implements OnInit {
  CurrentYear: number = ((new Date()).getFullYear());
  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  OnLogin(){
    this.router.navigate(['/dashboard']);
  }

}
