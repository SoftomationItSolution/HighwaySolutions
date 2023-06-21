import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { MessageService, SelectItem } from 'primeng/api';
import { errorMessages, regExps } from 'src/app/allservices/CustomValidation';
import { EmittersService } from 'src/app/allservices/emitters.service';
import { apiIntegrationService } from 'src/app/services/apiIntegration.service';
import { DataModel } from 'src/app/services/data-model.model';

@Component({
  selector: 'app-packages-details',
  templateUrl: './packages-details.component.html',
  styleUrls: ['./packages-details.component.css']
})
export class PackagesDetailsComponent implements OnInit {
  ErrorData:any;
  popupDialog!: boolean;
  packageData: any;
  submitted!: boolean;
  checked: boolean = true;
  onIconName = 'pi pi-check';
  dataform!: FormGroup;
  error = errorMessages;
  EntryId: number = 0;
  UserDetails: any;
  addAccess: any = 0;
  updateAccess: any = 0;
  viewAccess: any = 0;
  MenuPermission: any;
  SysMenuPermission: any;
  LogedRoleId;
  constructor(private pageTitle: DataModel, private spinner: NgxSpinnerService, private dbService: apiIntegrationService,
     private router: Router,private emitService: EmittersService,) {
    this.LogedRoleId =  this.emitService.getRoleDetails();
    this.UserDetails=  this.pageTitle.getUserData();
    this.GetAccessPermission();
  }

  ngOnInit() {
    this.dataform = new FormGroup({
      PackageName: new FormControl('', Validators.required),
      StartChainageNumber: new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      EndChainageNumber: new FormControl('', [Validators.required, Validators.pattern(regExps['ChainageNumber'])]),
      StartLatitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      StartLongitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      EndLatitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Latitude'])]),
      EndLongitude: new FormControl('', [Validators.required, Validators.pattern(regExps['Longitude'])]),
      DataStatus: new FormControl(this.checked),
    });
    this.GetAllData();
  }

  GetAllData() {
    this.spinner.show();
    this.dbService.PackagesGetAll().subscribe(
      data => {
        this.spinner.hide();
        this.packageData = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
        this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }

  openNew() {
    this.dataform.reset();
    this.submitted = false;
    this.EntryId = 0;
    this.checked = true;
    this.dataform.controls['DataStatus'].setValue(this.checked);
    this.popupDialog = true;
  }

  editPhoneBook(data: any) {
    this.submitted = false;
    this.EntryId = data.EntryId;
    this.dataform.controls['PackageName'].setValue(data.PackageName);
    this.dataform.controls['StartLatitude'].setValue(data.StartLatitude);
    this.dataform.controls['StartLongitude'].setValue(data.StartLongitude);
    this.dataform.controls['EndLatitude'].setValue(data.EndLatitude);
    this.dataform.controls['EndLongitude'].setValue(data.EndLongitude);
    this.dataform.controls['StartChainageNumber'].setValue(data.StartChainageNumber);
    this.dataform.controls['EndChainageNumber'].setValue(data.EndChainageNumber);
    this.checked = data.DataStatus == 1 ? true : false;
    this.dataform.controls['DataStatus'].setValue(this.checked);
    this.popupDialog = true;
  }

  hideDialog() {
    this.dataform.reset();
    this.popupDialog = false;
    this.submitted = false;
    this.EntryId = 0;
    this.checked = true;
    this.dataform.controls['DataStatus'].setValue(this.checked);

  }

  saveDetails() {
    this.submitted = true;
    if (this.dataform.valid) {
      this.spinner.show();
      const Obj = {
        EntryId: this.EntryId,
        PackageName: this.dataform.value.PackageName,
        StartLatitude: this.dataform.value.StartLatitude,
        StartLongitude: this.dataform.value.StartLongitude,
        EndLatitude: this.dataform.value.EndLatitude,
        EndLongitude: this.dataform.value.EndLongitude,
        StartChainageNumber: this.dataform.value.StartChainageNumber,
        EndChainageNumber: this.dataform.value.EndChainageNumber,
        DataStatus: this.dataform.value.DataStatus == true ? 1 : 2,
        CreatedBy: this.UserDetails.EntryId,
        ModifiedBy: this.UserDetails.EntryId,
      }
      this.dbService.PackagesSetUp(Obj).subscribe(
        data => {
          this.spinner.hide();
          const returnMessage = data.Message[0].AlertMessage;
          if (returnMessage.indexOf('successfully') > -1) {
            this.GetAllData();
            this.hideDialog();
            this.ErrorData = [{ AlertMessage: returnMessage }];
            this.emitService.openSnackBar(this.ErrorData, false);
          } else {
            for (let index = 0; index < data.Message.length; index++) {
              this.ErrorData = [{ AlertMessage: data.Message[index].AlertMessage }];
              this.emitService.openSnackBar(this.ErrorData, false);
            }
          }
        },
        (error) => {
          this.spinner.hide();
          this.ErrorData = [{ AlertMessage: 'Somthing went wrong' }];
          this.emitService.openSnackBar(this.ErrorData, false);
        }
      );
    }
  }

  GetAccessPermission() {
    this.spinner.show();
    const Obj = {
      MenuId: 7,
      RoleId: this.LogedRoleId
    };
    this.dbService.RolePermissionGetByEventId(Obj).subscribe(
      data => {
        this.spinner.hide();
        this.MenuPermission = data.ResponseData;
        if (this.MenuPermission != null && this.MenuPermission != undefined) {
          this.SysMenuPermission = this.MenuPermission.filter((o: { SystemId: string; }) => o.SystemId == "11")
          let result = this.SysMenuPermission.filter((e: { MenuURL: string; }) => e.MenuURL == ((this.router.url).slice(1)));
          if (result.length > 0) {
            this.viewAccess = result[0].DataView;
            this.addAccess = result[0].DataAdd;
            this.updateAccess = result[0].DataUpdate;
          }
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: 'Somthing went wrong' }];
          this.emitService.openSnackBar(this.ErrorData, false);
      }
    );
  }
}
