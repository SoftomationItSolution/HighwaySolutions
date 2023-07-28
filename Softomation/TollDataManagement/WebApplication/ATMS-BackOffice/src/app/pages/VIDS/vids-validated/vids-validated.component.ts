import { Component } from '@angular/core';

@Component({
  selector: 'app-vids-validated',
  templateUrl: './vids-validated.component.html',
  styleUrls: ['./vids-validated.component.css']
})
export class VidsValidatedComponent {
  ExColl(event:any){
      document.getElementById("collapseOne").classList.toggle("show")
  }
}
