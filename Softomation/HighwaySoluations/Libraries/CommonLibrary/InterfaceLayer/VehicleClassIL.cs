using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class VehicleClassIL : AVCVehicleClassIL
    {
        Int16 classId;
        String className;
        String classDescription;
        Decimal vehicleWeight;
        List<IHMCLVehicleClassIL> ihmclVehicleClassIL;

        public VehicleClassIL()
        {
            this.classId = 0;
            this.className = string.Empty;
            this.classDescription = string.Empty;
            this.vehicleWeight = 0;
            this.ihmclVehicleClassIL=new List<IHMCLVehicleClassIL>();
        }

        public Int16 ClassId
        {
            get
            {
                return classId;
            }

            set
            {
                classId = value;
            }
        }

        public String ClassName
        {
            get
            {
                return className;
            }

            set
            {
                className = value;
            }
        }

        public String ClassDescription
        {
            get
            {
                return classDescription;
            }

            set
            {
                classDescription = value;
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

        public List<IHMCLVehicleClassIL> IhmclVehicleClassIL
        {
            get
            {
                return ihmclVehicleClassIL;
            }

            set
            {
                ihmclVehicleClassIL = value;
            }
        }
    }
}
