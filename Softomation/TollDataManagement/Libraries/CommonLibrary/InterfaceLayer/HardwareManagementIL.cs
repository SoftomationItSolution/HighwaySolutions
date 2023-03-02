using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class HardwareManagementIL : LaneManagementIL
    {
        Int32 laneId;
        String hardwareName;
        Int16 hardwareTypeId;
        String hardwareType;
        Int16 hardwareProviderId;
        String hardwareProviderName;
        String iconName;
        Int16 connectionTypeId;
        String connectionType;
        String connectionAddress;
        Int16 port;
        String userName;
        String password;

        public HardwareManagementIL()
        {
            this.laneId = 0;
            this.hardwareName = string.Empty;
            this.hardwareTypeId = 0;
            this.hardwareType = string.Empty;
            this.hardwareProviderId = 0;
            this.hardwareProviderName = string.Empty;
            this.iconName = string.Empty;
            this.connectionTypeId = 0;
            this.connectionType = string.Empty;
            this.connectionAddress = string.Empty;
            this.port = 0;
            this.userName = string.Empty;
            this.password = string.Empty;
        }
        public Int32 LaneId
        {
            get
            {
                return laneId;
            }

            set
            {
                laneId = value;
            }
        }
        public String HardwareName
        {
            get
            {
                return hardwareName;
            }

            set
            {
                hardwareName = value;
            }
        }
        public Int16 HardwareTypeId
        {
            get
            {
                return hardwareTypeId;
            }

            set
            {
                hardwareTypeId = value;
            }
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
        public String ConnectionType
        {
            get
            {
                return connectionType;
            }

            set
            {
                connectionType = value;
            }
        }
        public String ConnectionAddress
        {
            get
            {
                return connectionAddress;
            }

            set
            {
                connectionAddress = value;
            }
        }
        public Int16 Port
        {
            get
            {
                return port;
            }

            set
            {
                port = value;
            }
        }

        public String UserName
        {
            get
            {
                return userName;
            }

            set
            {
                userName = value;
            }
        }

        public String Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public Int16 HardwareProviderId
        {
            get
            {
                return hardwareProviderId;
            }

            set
            {
                hardwareProviderId = value;
            }
        }

        public String HardwareProviderName
        {
            get
            {
                return hardwareProviderName;
            }

            set
            {
                hardwareProviderName = value;
            }
        }
    }
}
