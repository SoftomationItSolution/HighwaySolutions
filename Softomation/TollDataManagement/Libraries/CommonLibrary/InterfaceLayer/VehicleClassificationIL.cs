using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class VehicleClassificationIL:CommonIL
    {
        String className;
        String classDescription;
        Int16 vehicleSpeed;

        public VehicleClassificationIL()
        {
            this.className = string.Empty;
            this.classDescription = string.Empty;
            this.vehicleSpeed = 0;
        }

        public string ClassName
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
        public string ClassDescription
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
        public short VehicleSpeed
        {
            get
            {
                return vehicleSpeed;
            }

            set
            {
                vehicleSpeed = value;
            }
        }
    }
}
