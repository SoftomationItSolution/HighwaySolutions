import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'et-denomination-poup',
  templateUrl: './denomination-poup.component.html',
  styleUrls: ['./denomination-poup.component.css']
})
export class DenominationPoupComponent implements OnInit {
  DenominationData:any=[];
  TotalAmount:number;
  constructor(@Inject(MAT_DIALOG_DATA) parentData: any,public Dialogref: MatDialogRef<DenominationPoupComponent>) {
    this.DenominationData=parentData.data.DenominationData;
    this.TotalAmount=parentData.data.TransactionAmount;
   }

  ngOnInit(): void {
  }

}
