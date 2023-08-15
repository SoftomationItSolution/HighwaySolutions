using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class VehicleClassIL : CommonIL
    {
        Int16 vehicleClassId;
        String vehicleClassName;
        String vehicleClassDescription;
        Decimal permissibleWeight;

        public VehicleClassIL()
        {
            vehicleClassId = 0;
            vehicleClassName = string.Empty;
            vehicleClassDescription = string.Empty;
            permissibleWeight = 0;
        }

        public short VehicleClassId { get => vehicleClassId; set => vehicleClassId = value; }
        public string VehicleClassName { get => vehicleClassName; set => vehicleClassName = value; }
        public string VehicleClassDescription { get => vehicleClassDescription; set => vehicleClassDescription = value; }
        public decimal PermissibleWeight { get => permissibleWeight; set => permissibleWeight = value; }
    }
}
