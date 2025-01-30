import { AfterViewInit, Component } from '@angular/core';
import { Router } from '@angular/router';
import { apiIntegrationService } from 'src/services/apiIntegration.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements AfterViewInit{
  title = 'tms-lane-app';
  isFullScreen=false
  docElement: HTMLElement;
  constructor(private dbService: apiIntegrationService,private router: Router,) { this.GetLoginStatus() }
  
  ngAfterViewInit() {
    this.GetLoginStatus()
  }
  
  toggleFullScreen() {
    if (!this.isFullScreen) {
      this.docElement.requestFullscreen();
    }
    else {
      document.exitFullscreen();
    }
    this.isFullScreen = !this.isFullScreen;
  }

  GetLoginStatus(){
    this.dbService.LoginStatusGet().subscribe(
      data => {
        if(data.ResponseData==false){
          this.router.navigate(['']);
        }
        else{
          
        }
      },
      (error) => {
       
      }
    );
  }
}


