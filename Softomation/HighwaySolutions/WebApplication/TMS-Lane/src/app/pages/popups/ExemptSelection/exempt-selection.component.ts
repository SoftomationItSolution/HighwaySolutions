import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-exempt-selection',
  templateUrl: './exempt-selection.component.html'
})
export class ExemptSelectionComponent {
  ExemptTypeDetails: any
  constructor(public Dialogref: MatDialogRef<ExemptSelectionComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel) {
    this.ExemptTypeDetails = parentData;
  }

  ngOnInit(): void {
  }

  onExemptTypeChange(event) {
    let ExemptType = this.ExemptTypeDetails.filter(item => item.ExemptTypeId == event);
    if (ExemptType.length > 0) {
      ExemptType = ExemptType[0]
    } else {
      ExemptType = null
    }
    this.Dialogref.close(ExemptType);
  }
}