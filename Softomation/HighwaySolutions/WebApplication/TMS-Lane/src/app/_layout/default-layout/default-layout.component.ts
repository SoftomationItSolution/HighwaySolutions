import { AfterViewInit, Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { ConfirmationService } from 'primeng/api';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
  providers: [ConfirmationService]
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
  constructor(private router: Router, public dataModel: DataModel, private spinner: NgxSpinnerService,
    public api: apiIntegrationService, public dialog: MatDialog, public datepipe: DatePipe,
    private confirmationService: ConfirmationService) {
    this.docElement = document.documentElement;
  }

  ngOnInit() {
    this.userData = this.dataModel.getUserData();
    const shiftDetails = this.dataModel.getSSData();

    // Redirect if no user data
    if (this.userData == null) {
      this.router.navigate(['']);
      return;
    }

    this.LoginBy = "Login by: " + this.userData.LoginId;
    this.LoginAt = "Login at: " + this.dataModel.getloginTime();

    if (shiftDetails != null) {
      const today = new Date();

      // Build start time
      const [sh, sm, ss] = shiftDetails.StartTimmng.split(':').map(Number);
      const startTime = new Date(
        today.getFullYear(),
        today.getMonth(),
        today.getDate(),
        sh, sm, ss
      );

      // Build end time
      const [eh, em, es] = shiftDetails.EndTimming.split(':').map(Number);
      this.endTime = new Date(
        today.getFullYear(),
        today.getMonth(),
        today.getDate(),
        eh, em, es
      );

      // Handle overnight shifts (end before start)
      if (this.endTime < startTime) {
        this.endTime.setDate(this.endTime.getDate() + 1);
      }

      this.ShiftDetails =
        "Shift: " +
        shiftDetails.ShiftId +
        " " +
        shiftDetails.StartTimmng +
        " " +
        shiftDetails.EndTimming;
    }

    // Update timer every second
    setInterval(() => {
      this.updateRemainingTime();
    }, 1000);
  }

  ngAfterViewInit() {
    this.toggleFullScreen();
  }

  updateRemainingTime(): void {
    if (!this.endTime) {
      this.remainingTime = "No shift info";
      return;
    }

    const currentTime = new Date();
    const timeDifference = this.endTime.getTime() - currentTime.getTime();

    if (timeDifference > 0) {
      const hours = Math.floor((timeDifference / (1000 * 60 * 60)) % 24);
      const minutes = Math.floor((timeDifference / (1000 * 60)) % 60);
      const seconds = Math.floor((timeDifference / 1000) % 60);

      this.remainingTime = `Remaining Time: ${this.pad(hours)}:${this.pad(
        minutes
      )}:${this.pad(seconds)}`;
      this.currentTime =
        "Current Time: " + this.datepipe.transform(new Date(), "HH:mm:ss");
      this.isLessThanTenMinutes = timeDifference <= 10 * 60 * 1000;
    } else {
      this.remainingTime = "00:00:00"; // Time's up
      this.currentTime =
        "Current Time: " + this.datepipe.transform(new Date(), "HH:mm:ss");
      this.isLessThanTenMinutes = false;

      if (this.dataModel.getLoggedInStatus()) {
        this.Logout();
      }
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
    this.spinner.show()
    this.api.LogoutSystem().subscribe(
      data => {
        this.dataModel.clearStorage();
        this.router.navigate(['']);
        this.spinner.hide()
      },
      (error) => {
        this.dataModel.clearStorage();
        this.router.navigate(['']);
        this.spinner.hide()
      }
    );

  }

  confirm() {
    this.confirmationService.confirm({
      header: 'Are you sure?',
      message: 'Please confirm to proceed.',
      accept: () => {
        this.Logout()
      },
      reject: () => {
      }
    });
  }
}