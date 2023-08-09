import { Component, HostListener } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'ATMS-BackOffice';
  @HostListener('window:resize', ['$event'])
  onResize() {
   console.log("height:" + window.innerHeight, "width:" + window.innerWidth);
  }

  constructor(){
    this.onResize();
  }
}
