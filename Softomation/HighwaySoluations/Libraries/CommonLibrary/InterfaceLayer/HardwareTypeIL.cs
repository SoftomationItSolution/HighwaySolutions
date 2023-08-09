using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class HardwareTypeIL : CommonIL
    {
        String hardwareType;
        String iconName;
        Int16 connectionTypeId;

        public HardwareTypeIL()
        {
            this.hardwareType = string.Empty;
            this.iconName = string.Empty;
            this.connectionTypeId = 0;
        }
        public String HardwareType
        {
            get
            {
                return hardwareType;
            }

            set
            {
                hardwareType = value;
            }
        }
        public String IconName
        {
            get
            {
                return iconName;
            }

            set
            {
                iconName = value;
            }
        }
        public Int16 ConnectionTypeId
        {
            get
            {
                return connectionTypeId;
            }

            set
            {
                connectionTypeId = value;
            }
        }
    }
}
