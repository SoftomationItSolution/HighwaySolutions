import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-page-not-found',
  templateUrl: './page-not-found.component.html',
  styleUrls: ['./page-not-found.component.css']
})
export class PageNotFoundComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  RedirecttoWallet() {
    let seconds = 5;
    let dvCountDown = document.getElementById('dvCountDown');
    // dvCountDown.style.display = 'block';
    // let lblCount = document.getElementById('lblCount');
    // dvCountDown.style.display = 'block';
    // lblCount.innerHTML = seconds.toString();
    // setInterval(function() {
    //       seconds--;
    //       lblCount.innerHTML = seconds.toString();
    //       if (seconds == 0) {
    //         dvCountDown.style.display = 'none';
    //         // this.endpage();
    //       }
    //   }, 1000);
  }

  // endpage() {

  // }
}
