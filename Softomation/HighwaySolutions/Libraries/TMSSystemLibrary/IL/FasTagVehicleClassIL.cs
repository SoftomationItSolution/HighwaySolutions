using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class FasTagVehicleClassIL : CommonIL
    {
        Int16 fasTagVehicleClassId;
        String fasTagVehicleClassName;
        String fasTagVehicleClassDescription;
        Decimal permissibleWeight;

        public FasTagVehicleClassIL()
        {
            fasTagVehicleClassId = 0;
            fasTagVehicleClassName = string.Empty;
            fasTagVehicleClassDescription = string.Empty;
            permissibleWeight = 0;
        }

        public short FasTagVehicleClassId { get => fasTagVehicleClassId; set => fasTagVehicleClassId = value; }
        public string FasTagVehicleClassName { get => fasTagVehicleClassName; set => fasTagVehicleClassName = value; }
        public string FasTagVehicleClassDescription { get => fasTagVehicleClassDescription; set => fasTagVehicleClassDescription = value; }
        public decimal PermissibleWeight { get => permissibleWeight; set => permissibleWeight = value; }
    }
}
