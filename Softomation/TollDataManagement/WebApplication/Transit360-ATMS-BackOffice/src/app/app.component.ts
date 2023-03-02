import { Component, HostListener, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { DOCUMENT, Location } from '@angular/common';
import { ConfirmationService, PrimeNGConfig } from 'primeng/api';
import { ApiService } from './allservices/api.service';
import { EmittersService } from './allservices/emitters.service';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ChnagePasswordPopUpComponent } from './Pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { SystemSettingComponent } from './Pages/Config/PopUps/system-setting/system-setting.component';
declare var $: any;
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  elem;
  LogedRoleId;
  title = 'Toll360 Plaza BackOffice';
  LoginStatus = false;
  NavBarCollaspedStatus;
  currentRoute: string;
  ParentRoute = '';
  route: string;
  CurrentYear: number;
  public innerWidth: any;
  public innerHeight: any;
  ErrorData;
  MenuList: any;
  max = 1;
  ss = 0;
  ssU = 0;
  LogedUserId = 0;
  currentRouteCount = 0;
  now: Date = new Date();
  CurrentLoginId = '';
  @HostListener('window:resize', ['$event'])
  onResize(event) {
    this.innerHeight = window.innerHeight;
    this.innerWidth = window.innerWidth;
    this.emitService.setInnerHeight(this.innerHeight);
    this.emitService.setInnerHeightEmit(this.innerHeight);

    console.log('Resize Height:' + this.innerHeight);
    console.log('Resize Width:' + this.innerWidth);
    this.ChangeHeight();
  }

  @HostListener('window:beforeunload', ['$event']) unloadHandler(event: Event) {
    // this.emitService.setLoggedIn(false);
    // this.emitService.logout();


    // this.LogOutUser();
  }
  constructor(private dialog: MatDialog, @Inject(DOCUMENT) private document: any, router: Router, location: Location,
              private primengConfig: PrimeNGConfig, private emitService: EmittersService, private dbService: ApiService,
              private confirmationService: ConfirmationService) {
    this.LogedRoleId =  parseInt(this.emitService.getRoleDetails());
    this.LogedUserId = parseInt(this.emitService.getUserDetails());

    router.events.subscribe((val) => {
      if (location.path() != '') {
        this.route = location.path().replace('/', '');
        this.currentRoute = this.route;
        this.ParentRoute = '';
        if (this.MenuList != null && this.MenuList != undefined) {
          let result = this.MenuList.filter(e => e.MenuUrl == this.currentRoute);
          if (result.length > 0) {
            let result1 = this.MenuList.filter(e => e.EntryId == result[0].ParentId);
            if (result1.length > 0) {
              this.ParentRoute = result1[0].MenuName;
            }
          }
        }

        this.emitService.CurrentPage.emit(this.currentRoute);
        if (this.currentRouteCount == 0 && this.currentRoute != 'login') {
          this.currentRouteCount = 1;
          if (this.LogedRoleId == null) {
            this.emitService.logout();
          } else if (this.LogedRoleId > -1) {
            this.emitService.setInnerHeight(this.innerHeight);
            this.emitService.setInnerHeightEmit(this.innerHeight);
            this.GetPermissionData();
            this.BindMenu();


          } else {
            this.emitService.logout();
          }
        }
      } else {
        this.route = 'login';
      }
      setInterval(() => {
        this.now = new Date();
      }, 1);
    });
    this.innerHeight = window.innerHeight;
    this.innerWidth = window.innerWidth;
    console.log('Resize Height:' + this.innerHeight);
    console.log('Resize Width:' + this.innerWidth);

    this.emitService.setInnerHeight(this.innerHeight);
    this.emitService.setInnerHeightEmit(this.innerHeight);

  }

    ngOnInit() {
      this.elem = document.documentElement;
      this.CurrentYear = ((new Date()).getFullYear());
      this.primengConfig.ripple = false;
      this.emitService.LogInStatusEmit.subscribe(
        (visibility: boolean) => {
          this.LoginStatus = visibility;
          if (this.LoginStatus == true) {
            this.LogedRoleId =  this.emitService.getRoleDetails();
            this.GetPermissionData();
            this.BindMenu();
          }
        });
      if (this.emitService.getLoggedIn() == 'true') {
          this.LoginStatus = true;
          this.LogedRoleId =  this.emitService.getRoleDetails();
          this.BindMenu();
        }

    }
    ngAfterViewInit(): void {
      this.ChangeHeight();
    }
    BindMenu() {
      this.CurrentLoginId = this.emitService.getSessionId();
      this.dbService.GetMenuMasterByRole(this.LogedRoleId).subscribe(
        data => {
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.MenuList = data.ResponceData;
          } else {
            this.ErrorData = data.Message;
            this.emitService.openSnackBar(this.ErrorData, false);
          }
        },
        (error) => {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      );
    }
    GetPermissionData() {
      const Obj = {
        EventId: 30,
        RoleId: this.LogedRoleId
      };
      this.dbService.RolePermissionGetByEventId(Obj).subscribe(
        data => {
            this.ss = data.ResponceData.DataView;
            this.ssU = data.ResponceData.DataUpdate;
        },
        (error) => {

        }
      );
    }
    openFullscreen() {
      if (this.elem.requestFullscreen) {
        this.elem.requestFullscreen();
      } else if (this.elem.mozRequestFullScreen) {
        /* Firefox */
        this.elem.mozRequestFullScreen();
      } else if (this.elem.webkitRequestFullscreen) {
        /* Chrome, Safari and Opera */
        this.elem.webkitRequestFullscreen();
      } else if (this.elem.msRequestFullscreen) {
        /* IE/Edge */
        this.elem.msRequestFullscreen();
      }
      this.max = 0;
    }
    closeFullscreen() {
      if (this.document.exitFullscreen) {
        this.document.exitFullscreen();
      } else if (this.document.mozCancelFullScreen) {
        /* Firefox */
        this.document.mozCancelFullScreen();
      } else if (this.document.webkitExitFullscreen) {
        /* Chrome, Safari and Opera */
        this.document.webkitExitFullscreen();
      } else if (this.document.msExitFullscreen) {
        /* IE/Edge */
        this.document.msExitFullscreen();
      }
      this.max = 1;
    }
    logout(): void {
      const message = 'Are you sure you want to do logout?';
      this.confirmationService.confirm({
        message,
        accept: () => {
          this.LogOutUser();
        }
      });
    }
    LogOutUser() {
      const obj = {
        LoginId: this.emitService.getSessionId()
      };
      this.dbService.LogoutUser(obj).subscribe(
        data => {
          this.emitService.logout();
        },
        (error) => {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.emitService.openSnackBar(this.ErrorData, false);
          this.emitService.logout();
        });
    }

    ResetPassword() {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '45%';
      this.dialog.open(ChnagePasswordPopUpComponent, dialogConfig);
    }

    SystemSetting() {
      const dialogConfig = new MatDialogConfig();
      dialogConfig.disableClose = true;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '45%';
      dialogConfig.data = { action: 'View'};
      this.dialog.open(SystemSettingComponent, dialogConfig);
    }

    ChangeHeight() {
      $('.main-content').css('height', this.innerHeight - 55);
      $('.side-content').css('height', this.innerHeight - 23);
      $('.main-content-login').css('height', this.innerHeight - 32);
      $('.chart-responsive').css('min-height', this.innerHeight);
    }
}
