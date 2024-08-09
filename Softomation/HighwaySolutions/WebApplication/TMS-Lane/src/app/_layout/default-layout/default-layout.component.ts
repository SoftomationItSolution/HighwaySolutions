import { AfterViewInit, Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
})

export class DefaultLayoutComponent implements OnInit, AfterViewInit {
  public perfectScrollbarConfig = {
    suppressScrollX: true,
  };
  docElement: HTMLElement;
  isFullScreen: boolean = false;
  userData: any;
  LoginBy = 'Login by:'
  LoginAt = 'Login at:'
  ShiftDetails = 'Shift:'
  SystemVersion = 'TMSv1'
  currentTime: any
  remainingTime: any
  endTime: any
  isLessThanTenMinutes: boolean = false;
  constructor(private router: Router, public dataModel: DataModel,
    public api: apiIntegrationService, public dialog: MatDialog,public datepipe: DatePipe,) {
    this.docElement = document.documentElement;
  }

  ngOnInit() {
    this.userData = this.dataModel.getUserData();
    let shiftDetails = this.dataModel.getSSData();
    if (this.userData == null) {
      this.router.navigate(['']);
    }
    else {
      this.LoginBy = "Login by:" + this.userData.LoginId
      this.LoginAt = "Login at:" + this.dataModel.getloginTime()
    }

    if (shiftDetails != null) {
      const cd=this.datepipe.transform(new Date(), 'dd-MMM-yyyy')
      this.endTime=new Date(cd+' '+shiftDetails.EndTimming)
      //this.endTime.setSeconds(this.endTime.getSeconds() + 1);
      this.ShiftDetails="Shift: "+shiftDetails.ShiftId+' '+shiftDetails.StartTimmng+' '+shiftDetails.EndTimming
    }

    setInterval(() => {
     
      this.updateRemainingTime()
    }, 1000);

  }
  ngAfterViewInit() {
    //this.toggleFullScreen()
  }

  updateRemainingTime(): void {
    const currentTime = new Date();
    const timeDifference = this.endTime.getTime() - currentTime.getTime();
    if (timeDifference > 0) {
      const hours = Math.floor((timeDifference / (1000 * 60 * 60)) % 24);
      const minutes = Math.floor((timeDifference / (1000 * 60)) % 60);
      const seconds = Math.floor((timeDifference / 1000) % 60);
      this.remainingTime = `Remaining Time:${this.pad(hours)}:${this.pad(minutes)}:${this.pad(seconds)}`;
      this.currentTime = "Current Time:" + this.datepipe.transform(new Date(), 'HH:mm:ss');
      this.isLessThanTenMinutes = timeDifference <= 10 * 60 * 1000;
    } else {
      this.remainingTime = '00:00:00';  // Time's up!
      this.currentTime = "Current Time:" + this.datepipe.transform(new Date(), 'HH:mm:ss');
      this.isLessThanTenMinutes = false;
      if(this.dataModel.getLoggedInStatus())
          this.router.navigate(['']);
    }
  }

  pad(num: number): string {
    return num < 10 ? '0' + num : num.toString();
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

  Logout() {
    const obj = {
      LoginId: this.userData.LoginId,
      UserTypeId: this.userData.UserTypeId,
      UserId: this.userData.UserId
    };
    this.api.LogoutUser(obj).subscribe(
      data => {
        this.dataModel.clearStorage();
        this.router.navigate(['']);

      },
      (error) => {
        this.dataModel.clearStorage();
        this.router.navigate(['']);
      }
    );

  }
}