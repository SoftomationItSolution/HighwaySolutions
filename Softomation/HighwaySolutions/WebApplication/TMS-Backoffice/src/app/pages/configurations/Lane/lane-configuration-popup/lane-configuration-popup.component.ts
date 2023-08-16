import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { errorMessages, regExps } from 'src/services/CustomValidation';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-lane-configuration-popup',
  templateUrl: './lane-configuration-popup.component.html',
  styleUrls: ['./lane-configuration-popup.component.css']
})
export class LaneConfigurationPopupComponent implements OnInit {
  PageTitle: string = "";
  DataDetailsForm!: FormGroup;
  error = errorMessages;
  LaneId: number = 0;
  LogedUserId: number = 0;
  DetailData: any;
  submitted = false;
  ErrorData: any;
  PlazaList: any;
  LaneNumberList: any = [];
  LaneDirectionList = [{ DataId: 1, DataName: 'LHS' }, { DataId: 2, DataName: 'RHS' }];
  LaneTypeList = [{ DataId: 0, DataName: 'Normal' },{ DataId: 1, DataName: 'Entry' }, { DataId: 2, DataName: 'Exit' }];
  constructor(private spinner: NgxSpinnerService, @Inject(MAT_DIALOG_DATA) parentData: any, public Dialogref: MatDialogRef<LaneConfigurationPopupComponent>,
    public dialog: MatDialog, private dbService: apiIntegrationService, private dm: DataModel) {
    this.LogedUserId = this.dm.getUserId();
    this.LaneId = parentData.LaneId;
  }

  ngOnInit(): void {
    for (let i = 1; i <= 20; i++) {
      this.LaneNumberList.push({ DataId: i, DataName: 'Lane-' + i });
    }
    this.PageTitle = "Create Lane Master Details";
    this.DataDetailsForm = new FormGroup({
      PlazaId: new FormControl('', [Validators.required]),
      LaneNumber: new FormControl('', [Validators.required]),
      LaneTypeId: new FormControl('', [Validators.required]),
      LaneDirectionId: new FormControl('', [Validators.required]),
      LaneSystemIpAddress: new FormControl('', [Validators.required, Validators.pattern(regExps["IpAddress"])]),
      DataStatus: new FormControl(true),
    });
    this.GetPlazaData();
    if (this.LaneId > 0) {
      this.PageTitle = "Update Lane Master Details";
      this.DetailsbyId();
    }
  }
  GetPlazaData() {
    this.spinner.show();
    this.dbService.PlazaGetActive().subscribe(
      data => {
        this.spinner.hide();
        this.PlazaList = data.ResponseData;
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  DetailsbyId() {
    this.spinner.show();
    this.dbService.LaneGetById(this.LaneId).subscribe(
      data => {
        this.spinner.hide();
        var returnMessage = data.Message[0].AlertMessage;
        if (returnMessage == 'success') {
          var DetailData = data.ResponseData;
          this.DataDetailsForm.controls['PlazaId'].setValue(DetailData.PlazaId);
          this.DataDetailsForm.controls['LaneNumber'].setValue(DetailData.LaneNumber);
          this.DataDetailsForm.controls['LaneTypeId'].setValue(DetailData.LaneTypeId);
          this.DataDetailsForm.controls['LaneDirectionId'].setValue(DetailData.LaneDirectionId);
          this.DataDetailsForm.controls['LaneSystemIpAddress'].setValue(DetailData.LaneSystemIpAddress);
          if (DetailData.DataStatus == 1)
            this.DataDetailsForm.controls['DataStatus'].setValue(true);
          else
            this.DataDetailsForm.controls['DataStatus'].setValue(false);
        }
        else {
          this.ClosePoup();
          this.ErrorData = [{ AlertMessage: "role details not found." }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        this.ErrorData = [{ AlertMessage: "Something went wrong." }];
        this.dm.openSnackBar(this.ErrorData, false);
      }
    );
  }

  ClosePoup() { this.Dialogref.close(false); }

  SaveDetails() {
    this.submitted = true;
    if (this.DataDetailsForm.invalid) {
      return;
    }
    const Obj = {
      LaneId: this.LaneId,
      PlazaId: this.DataDetailsForm.value.PlazaId,
      LaneNumber: this.DataDetailsForm.value.LaneNumber,
      LaneTypeId: this.DataDetailsForm.value.LaneTypeId,
      LaneDirectionId: this.DataDetailsForm.value.LaneDirectionId,
      LaneSystemIpAddress: this.DataDetailsForm.value.LaneSystemIpAddress,
      DataStatus: this.DataDetailsForm.value.DataStatus == true ? 1 : 2,
      CreatedBy: this.LogedUserId,
      ModifiedBy: this.LogedUserId
    }
    this.spinner.show();
    this.dbService.LaneInsertUpdate(Obj).subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.Message[0].AlertMessage;
        if (returnMessage.indexOf('success') > -1) {
          this.ErrorData = [{ AlertMessage: 'Success' }];
          this.dm.openSnackBar(this.ErrorData, true);
          this.Dialogref.close(true);
        } else {
          this.ErrorData = data.Message;
          this.dm.openSnackBar(this.ErrorData, false);
        }
      },
      (error) => {
        this.spinner.hide();
        try {
          this.ErrorData = error.error;
          this.dm.openSnackBar(this.ErrorData, false);
        } catch (error) {
          this.ErrorData = [{ AlertMessage: 'Something went wrong.' }];
          this.dm.openSnackBar(this.ErrorData, false);
        }
      }
    );
  }

}
