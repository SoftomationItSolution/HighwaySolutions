import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
})
export class DefaultLayoutComponent implements OnInit {
  UserData: any;
  //public navItems = navItems;
  public navItems: any[] = [];
  public navChildItems: any[] = [];
  public perfectScrollbarConfig = {
    suppressScrollX: true,
  };

  constructor() {
    
  }

  ngOnInit() {
    this.GetSystemMenu()
  }

  GetSystemMenu() {
    
  }

}
