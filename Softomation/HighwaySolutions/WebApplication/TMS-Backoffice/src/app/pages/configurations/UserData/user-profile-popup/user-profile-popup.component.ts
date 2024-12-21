import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DomSanitizer } from '@angular/platform-browser';
import { ImageCroppedEvent } from 'ngx-image-cropper';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-user-profile-popup',
  templateUrl: './user-profile-popup.component.html',
  styleUrls: ['./user-profile-popup.component.css']
})
export class UserProfilePopupComponent implements OnInit {
  imageChangedEvent: any = '';
  croppedImage: any = "";
  LogedUserId = 0;
  DetailData: any;
  ErrorData: any;
  imsgProgress=false;
  Base64Value:any='';
  MediaPrefix:any;
  constructor(private dm: DataModel, public Dialogref: MatDialogRef<UserProfilePopupComponent>,
    public dialog: MatDialog, private spinner: NgxSpinnerService, private dbService: apiIntegrationService,
    private sanitizer: DomSanitizer) {
    this.LogedUserId = this.dm.getUserId();
    this.MediaPrefix = this.dm.getMediaAPI()?.toString();
    
  }

  ngOnInit(): void {
    this.getDetails();

  }

  getDetails(){
    if (this.LogedUserId > 0)
      this.DetailsbyId();
    else {
      this.DetailData = this.dm.getUserData();
      if(this.DetailData.UserProfileImage!=''){
        this.croppedImage=this.MediaPrefix+this.DetailData.UserProfileImage;
      }
    }
  }


  DetailsbyId() {
    this.spinner.show();
    this.dbService.UserConfigurationGetById(this.LogedUserId).subscribe(
      data => {
        this.spinner.hide();
        this.imsgProgress=false;
        this.DetailData = data.ResponseData;
        if(this.DetailData.UserProfileImage!=''){
          this.croppedImage=this.MediaPrefix+this.DetailData.UserProfileImage;
        }
        this.dm.setUserData(JSON.stringify(this.DetailData));
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

  ClosePoup() { this.Dialogref.close(true); }

  fileChangeEvent(event: any): void {
    this.imageChangedEvent = event;
    this.imsgProgress=true;
  }
  imageCropped(event: ImageCroppedEvent) {
    const objectUrl = event.objectUrl;
    if(objectUrl==null)
      return
    this.croppedImage = this.sanitizer.bypassSecurityTrustUrl(objectUrl);
    this.dm.getBase64ImageFromUrl(event.objectUrl).then(result => this.Base64Value=result).catch(err => console.error(err));
  }
  
  imageLoaded() {
    // show cropper
  }
  cropperReady() {
    // cropper ready
  }
  loadImageFailed() {
    // show message
  }

  

  SaveDetails(){
    if(this.Base64Value==''){
      this.ErrorData = [{ AlertMessage: 'Profile image is required.' }];
      this.dm.openSnackBar(this.ErrorData, false);
    }
    else{
      const Obj = {
        UserId: this.LogedUserId,
        UserProfileImage: this.Base64Value
      };
      this.spinner.show();
      this.dbService.UserProfileChange(Obj).subscribe(
        data => {
          this.spinner.hide();
          debugger;
          let returnMessage = data.Message[0].AlertMessage;
          if (returnMessage == 'success') {
            this.ErrorData = [{ AlertMessage: 'Success' }];
            this.dm.openSnackBar(this.ErrorData, true);
            this.getDetails();
          } else {
            this.ErrorData = data;
            this.dm.openSnackBar(this.ErrorData, false);
          }
        },
        (error) => {
          this.spinner.hide();
          try {
            this.ErrorData = error.error.Message;
            this.dm.openSnackBar(this.ErrorData, false);
          } catch (error) {
            this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
            this.dm.openSnackBar(this.ErrorData, false);
          }
        }
      );
    }
  }

}
