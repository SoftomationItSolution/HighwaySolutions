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

  menuTogel(){
    let body = document.getElementsByTagName('body')[0];
    if(body.classList.length==0){
      body.classList.add("sidebar-enable");
      body.classList.add("vertical-collpsed");
    }
    else{
      body.classList.remove("sidebar-enable");
      body.classList.remove("vertical-collpsed");
    }
  }

  menuED(event:any){
    console.log(event)
    var target = event.target;
    console.log(target)
    var parent = target.parentElement;//parent of "target"
    console.log(parent)
    let mm = document.getElementById('sidebar-menu')
  }

}
