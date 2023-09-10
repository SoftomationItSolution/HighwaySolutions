using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VehicleClassIL : CommonIL
    {
        Int16 vehicleClassId;
        String vehicleClassName;
        String vehicleClassIcon;
        Decimal allowedSpeed;

        public VehicleClassIL()
        {
            vehicleClassId = 0;
            vehicleClassName = string.Empty;
            vehicleClassIcon = string.Empty;
            allowedSpeed = 0;
        }

       
        public short VehicleClassId
        {
            get => vehicleClassId; set => vehicleClassId = value;
        }
        public string VehicleClassName
        {
            get => vehicleClassName; set => vehicleClassName = value;
        }
        public string VehicleClassIcon
        {
            get => vehicleClassIcon; set => vehicleClassIcon = value;
        }
        public decimal AllowedSpeed
        {
            get => allowedSpeed; set => allowedSpeed = value;
        }
    }
}
