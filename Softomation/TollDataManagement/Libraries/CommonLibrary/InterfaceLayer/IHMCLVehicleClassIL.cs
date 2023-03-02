using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class IHMCLVehicleClassIL : CommonIL
    {
        Int16 iHMCLClassId;
        String iHMCLClassName;
        String iHMCLClassDescription;
        Decimal vehicleWeight;
        public IHMCLVehicleClassIL()
        {
            this.iHMCLClassId = 0;
            this.vehicleWeight = 0;
            this.iHMCLClassName = string.Empty;
            this.iHMCLClassDescription = string.Empty;
        }

        public Int16 IHMCLClassId
        {
            get
            {
                return iHMCLClassId;
            }

            set
            {
                iHMCLClassId = value;
            }
        }

        public String IHMCLClassName
        {
            get
            {
                return iHMCLClassName;
            }

            set
            {
                iHMCLClassName = value;
            }
        }

        public String IHMCLClassDescription
        {
            get
            {
                return iHMCLClassDescription;
            }

            set
            {
                iHMCLClassDescription = value;
            }
        }
        public Decimal VehicleWeight
        {
            get
            {
                return vehicleWeight;
            }

            set
            {
                vehicleWeight = value;
            }
        }
    }
}
