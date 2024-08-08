import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { apiIntegrationService } from 'src/services/apiIntegration.service';
import { DataModel } from 'src/services/data-model.model';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  equipmentDetais:any
  equipmentDioDetais:any
  TransactionTypeMaster:any
  PaymentTypeMaster:any
  ExemptTypeMaster:any
  VehicleClasss:any
  VehicleSubClasss:any
  ShiftTimining:any
  TollFare:any
  selectedVehicleClasss:any
  selectedSubVehicleClasss:any
  selectedTransactionType:any
  constructor(private dbService: apiIntegrationService, private dm: DataModel,private spinner: NgxSpinnerService) { }

  ngOnInit(): void {
    this.VehicleClassGet()
  }

  VehicleClassGet(){
    this.dbService.getLaneMasterData().subscribe(
      data => {
        this.spinner.hide();
        let returnMessage = data.message;
        if (returnMessage == 'success') {
          let result=data.ResponseData
          this.equipmentDetais=result[0]
          this.equipmentDioDetais=result[1]
          this.TransactionTypeMaster=result[2]
          this.PaymentTypeMaster=result[3]
          this.ExemptTypeMaster=result[4]
          this.VehicleClasss=result[5]
          this.VehicleSubClasss=result[6]
          this.ShiftTimining=result[7]
          this.TollFare=result[8]
          // this.vehicleClasss = data.ResponseData.vehicleClass;
          // this.vehicleSubClasss = data.ResponseData.vehicleSubClass;
          console.log(data.ResponseData)
        }
        else{
          this.error_msg()
        }
        
      },
      (error) => {
        this.spinner.hide();
        this.error_msg()
      }
    );
  }


  error_msg(){
    const ErrorData  = [{ AlertMessage: 'Something went wrong.' }];
      this.dm.openSnackBar(ErrorData, false);
  }

  onVehicleChange(event){
    debugger

  }

  

  
}