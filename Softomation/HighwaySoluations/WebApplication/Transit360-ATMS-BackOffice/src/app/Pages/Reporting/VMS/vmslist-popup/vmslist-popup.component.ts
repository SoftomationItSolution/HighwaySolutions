import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxSpinnerService } from 'ngx-spinner';
import { ApiService } from 'src/app/allservices/api.service';
import { EmittersService } from 'src/app/allservices/emitters.service';

@Component({
  selector: 'app-vmslist-popup',
  templateUrl: './vmslist-popup.component.html',
  styleUrls: ['./vmslist-popup.component.css']
})
export class VMSListPopupComponent implements OnInit {
  LogedUserId;
  VmsList;
  LogedRoleId;
  constructor(private emitService: EmittersService, @Inject(MAT_DIALOG_DATA) parentData) {
    this.LogedRoleId =  this.emitService.getRoleDetails();
    this.LogedUserId = this.emitService.getUserDetails();
    this.VmsList = parentData.VmsList;
  }

  ngOnInit(): void {

  }

}
