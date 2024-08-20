import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DataModel } from 'src/services/data-model.model';

@Component({
  selector: 'app-sub-class-selection',
  templateUrl: './sub-class-selection.component.html'
})
export class SubClassSelectionComponent {
  SubClassDetails: any
  constructor(public Dialogref: MatDialogRef<SubClassSelectionComponent>, public dialog: MatDialog,
    @Inject(MAT_DIALOG_DATA) parentData: any, public dataModel: DataModel) {
    this.SubClassDetails = parentData;
  }

  ngOnInit(): void {
  }

  onVehicleChange(event) {
    let subClass = this.SubClassDetails.filter(item => item.SystemVehicleSubClassId == event);
    if (subClass.length > 0) {
      subClass = subClass[0]
    } else {
      subClass = null
    }
    this.Dialogref.close(subClass);
  }


}