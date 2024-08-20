import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-payment-selection',
  templateUrl: './payment-selection.component.html'
})
export class PaymentSelectionComponent {
  PaymentTypeDetails: any
  constructor(public Dialogref: MatDialogRef<PaymentSelectionComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel) {
    this.PaymentTypeDetails = parentData;
  }

  ngOnInit(): void {
  }

  onPaymentTypeChange(event) {
    let pt = this.PaymentTypeDetails.filter(item => item.PaymentTypeId == event);
    if (pt.length > 0) {
      pt = pt[0]
    } else {
      pt = null
    }
    this.Dialogref.close(pt);
  }


}