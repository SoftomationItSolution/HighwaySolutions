import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { apiIntegrationService } from '../../services/apiIntegration.service';
import { DataModel } from '../../services/data-model.model';

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
  docElement: HTMLElement;
  isFullScreen: boolean = false;
  isProfilepopUp: boolean = false;
  userData:any;
  MenuList:any;
  currentRoute: string="dashboard"
  childRoute: string=""
  constructor(private router: Router,public dataModel: DataModel,
    public api: apiIntegrationService,) {
    this.docElement = document.documentElement;

    
  }

  ngOnInit() {
    this.userData=this.dataModel.getUserData();
    this.GetSystemMenu()
  }

  GetSystemMenu() {
    this.api.GetMenuMasterByRole(this.userData.RoleId).subscribe(
      data => {
        console.log(data)
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          this.MenuList = data.ResponseData;
          console.log(this.MenuList)
        }
        else{
          this.Logout();
        } 
        // else {
        //   this.ErrorData = data.Message;
        //   this.emitService.openSnackBar(this.ErrorData, false);
        // }
      },
      (error) => {
        this.Logout();
        // this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        // this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  rightBar() {
    let body = document.getElementsByTagName('body')[0];
    if(body.classList.contains("right-bar-enabled"))
        body.classList.remove("right-bar-enabled");
    else
      body.classList.add("right-bar-enabled");
  }

  menuTogel() {
    let body = document.getElementsByTagName('body')[0];
    if(body.classList.contains("sidebar-enable")){
      body.classList.remove("sidebar-enable");
      body.classList.remove("vertical-collpsed");
    }
    else{
      body.classList.add("sidebar-enable");
      body.classList.add("vertical-collpsed");
    }
    
  }

  menuED(event: any) {
    var target = event.target;
    if (target.localName == "span") {
      let atag = target.parentElement;
      let p1 = atag.parentElement
      let childClass = p1.querySelector('ul')
      if (childClass != null) {
        if (childClass.classList.contains("mm-show")) {
          p1.classList.remove("mm-active")
          childClass.classList.remove("mm-show")
          atag.setAttribute('aria-expanded', 'false');
          return;
        }
      }
    }
    else {
      let p1 = target.parentElement
      let childClass = p1.querySelector('ul')
      if (childClass != null) {
        if (childClass.classList.contains("mm-show")) {
          p1.classList.remove("mm-active")
          childClass.classList.remove("mm-show")
          target.setAttribute('aria-expanded', 'false');
          return;
        }
      }
    }
    const allChildElementsOfParentWithClass = document.querySelectorAll('.mm-show *')
    allChildElementsOfParentWithClass.forEach((element) => {
      element.classList.remove('mm-show');
      element.classList.remove('mm-active');
    });

    if (target.localName == "span") {
      let atag = target.parentElement;
      let p1 = atag.parentElement
      let childClass = p1.querySelector('ul')
      if (childClass != null) {
        if (childClass.classList.contains("mm-show")) {
          p1.classList.remove("mm-active")
          childClass.classList.remove("mm-show")
          atag.setAttribute('aria-expanded', 'false');
        }
        else {
          p1.classList.add("mm-active")
          childClass.classList.add("mm-show")
          atag.setAttribute('aria-expanded', 'true');

        }
      }
    }
    else {
      let p1 = target.parentElement
      let childClass = p1.querySelector('ul')
      if (childClass != null) {
        if (childClass.classList.contains("mm-show")) {
          p1.classList.remove("mm-active")
          childClass.classList.remove("mm-show")
          target.setAttribute('aria-expanded', 'false');
        }
        else {
          p1.classList.add("mm-active")
          childClass.classList.add("mm-show")
          target.setAttribute('aria-expanded', 'true');
        }
      }
    }
    // let mm = document.getElementById('sidebar-menu')
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

  Logout(){
    const obj = {
      LoginId: this.userData.LoginId,
      UserTypeId: this.userData.UserTypeId,
      UserId:this.userData.UserId
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

}
