import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { apiIntegrationService } from '../../services/apiIntegration.service';
import { DataModel } from '../../services/data-model.model';
import { Location } from '@angular/common';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ChnagePasswordPopUpComponent } from 'src/app/pages/Config/UserData/chnage-password-pop-up/chnage-password-pop-up.component';
import { UserProfilePopupComponent } from 'src/app/pages/Config/UserData/user-profile-popup/user-profile-popup.component';
@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
})
export class DefaultLayoutComponent implements OnInit {
  UserData: any;
  public perfectScrollbarConfig = {
    suppressScrollX: true,
  };
  docElement: HTMLElement;
  isFullScreen: boolean = false;
  isProfilepopUp: boolean = false;
  userData: any;
  MenuList: any;
  currentRoute: string = "dashboard"
  childRoute: string = ""
  location: Location;
  ParentTitle = "Dashboard"
  ChildTitle = "Dashboard"
  constructor(private router: Router, public dataModel: DataModel,
    public api: apiIntegrationService, location: Location,public dialog: MatDialog,) {
    this.docElement = document.documentElement;
  }

  ngOnInit() {
    this.userData = this.dataModel.getUserData();
    this.GetSystemMenu()
  }
  ngAfterViewInit() {
    this.getTitle();
  }

  GetSystemMenu() {
    this.api.GetMenuMasterByRole(this.userData.RoleId).subscribe(
      data => {
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.MenuList = data.ResponseData;
          this.getTitle();
        }
        else {
          this.Logout();
        }
      },
      (error) => {
        this.Logout();
      }
    );
  }

  rightBar() {
    let body = document.getElementsByTagName('body')[0];
    if (body.classList.contains("right-bar-enabled"))
      body.classList.remove("right-bar-enabled");
    else
      body.classList.add("right-bar-enabled");
  }

  menuTogel() {
    let body = document.getElementsByTagName('body')[0];
    if (body.classList.contains("sidebar-enable")) {
      body.classList.remove("sidebar-enable");
      body.classList.remove("vertical-collpsed");
    }
    else {
      body.classList.add("sidebar-enable");
      body.classList.add("vertical-collpsed");
    }

  }

  menuED(event: any, m) {
    //console.log(m)
    const allChildElementsOfParentWithClass = document.querySelectorAll('.mm-show *')
    allChildElementsOfParentWithClass.forEach((element) => {
      element.classList.remove('mm-show');
      element.classList.remove('mm-active');
    });
    if (m.ChildCount != 0) {
      const cn = document.getElementById("mid_" + m.MenuId)
      let childClass = cn.querySelector('ul')
      childClass.classList.add("mm-show")
    }

    const cn = document.getElementById("mid_" + m.MenuId)
    cn.classList.add("mm-active")
    this.getTitle();
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
        this.dataModel.clearStorage()
        this.router.navigate(['']);
      }
    );



    this.router.navigate(['']);
  }

  getTitle() {
    //var titlee = this.location.prepareExternalUrl(this.location.path());
    var titlee = window.location.pathname.replace('/', '');
    if (titlee.charAt(0) === '#') {
      titlee = titlee.slice(1);
    }
    if (this.MenuList != undefined) {
      var foundObj = this.MenuList.filter((obj: { MenuUrl: any; }) => {
        return obj.MenuUrl === titlee;
      });

      if (foundObj.length > 0) {
        if (foundObj[0].ParentId === 0) {
          this.ParentTitle = foundObj[0].MenuName
        }
        else {
          var parentObj = this.MenuList.filter((obj1: { MenuId: any; }) => {
            return obj1.MenuId === foundObj[0].ParentId;
          });
          if (parentObj.length > 0) {
            this.ParentTitle = parentObj[0].MenuName
          }
          const cn = document.getElementById("mid_" + foundObj[0].ParentId)
          if (cn != null) {
            let childClass = cn.querySelector('ul')
            childClass.classList.add("mm-show")
          }

        }
        this.ChildTitle = foundObj[0].MenuName
      }
    }
    return 'Dashboard';
  }

  chOpen(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '50%';
    dialogConfig.height = '500px';
    this.dialog.open(ChnagePasswordPopUpComponent, dialogConfig);
  }

  pfOpen(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '50%';
    dialogConfig.height = '500px';
    this.dialog.open(UserProfilePopupComponent, dialogConfig);
  }

}
