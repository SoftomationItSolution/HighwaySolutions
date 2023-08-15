using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VehicleClassIL : CommonIL
    {
        Int16 vehicleClassId;
        String vehicleClassName;
        String vehicleClassDescription;
        Decimal vehicleClassPermissibleWeight;
        public VehicleClassIL()
        {
            this.vehicleClassId = 0;
            this.vehicleClassName = string.Empty;
            this.vehicleClassDescription = string.Empty;
            this.vehicleClassPermissibleWeight = 0;
        }

        public short VehicleClassId
        {
            get => vehicleClassId; set => vehicleClassId = value;
        }
        public string VehicleClassName
        {
            get => vehicleClassName; set => vehicleClassName = value;
        }
        public string VehicleClassDescription
        {
            get => vehicleClassDescription; set => vehicleClassDescription = value;
        }
        public decimal VehicleClassPermissibleWeight
        {
            get => vehicleClassPermissibleWeight; set => vehicleClassPermissibleWeight = value;
        }
    }
}
