using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class SystemIL : CommonIL
    {
        short systemId;
        string systemName;
        string systemDescription;
        int apiPort;
        int appPort;
        string systemImage;
        string systemIcon;
        bool dashBoard;

        public SystemIL()
        {
            systemId = 0;
            systemName = string.Empty;
            systemDescription = string.Empty;
            apiPort=0;
            appPort = 0;
            systemImage = string.Empty;
            systemIcon = string.Empty;
            dashBoard = true;
        }

        public Int16 SystemId
        {
            get
            {
                return systemId;
            }

            set
            {
                systemId = value;
            }
        }

        public String SystemName
        {
            get
            {
                return systemName;
            }

            set
            {
                systemName = value;
            }
        }

        public String SystemDescription
        {
            get
            {
                return systemDescription;
            }

            set
            {
                systemDescription = value;
            }
        }

        public Int32 ApiPort
        {
            get
            {
                return apiPort;
            }

            set
            {
                apiPort = value;
            }
        }

        public Int32 AppPort
        {
            get
            {
                return appPort;
            }

            set
            {
                appPort = value;
            }
        }

        public String SystemImage
        {
            get
            {
                return systemImage;
            }

            set
            {
                systemImage = value;
            }
        }

        public String SystemIcon
        {
            get
            {
                return systemIcon;
            }

            set
            {
                systemIcon = value;
            }
        }

        public Boolean DashBoard
        {
            get
            {
                return dashBoard;
            }

            set
            {
                dashBoard = value;
            }
        }
    }
}
