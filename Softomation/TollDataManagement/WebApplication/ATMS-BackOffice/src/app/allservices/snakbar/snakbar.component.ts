import { Component, OnInit, Inject } from '@angular/core';
import { MatSnackBarRef, MAT_SNACK_BAR_DATA } from '@angular/material/snack-bar';

@Component({
  selector: 'app-snakbar',
  templateUrl: './snakbar.component.html',
  styleUrls: ['./snakbar.component.css']
})
export class SnakbarComponent implements OnInit {

  constructor(public snackBarRef: MatSnackBarRef<SnakbarComponent>,
              @Inject(MAT_SNACK_BAR_DATA) public data: any) {
    }

  ngOnInit(): void {
  }

}
