using System;
using System.Collections.Generic;

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
        string reportIds;
        short[] reportIdList;
        List<ReportMasterIL> reportMastersList;

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
            reportIds = string.Empty;
            reportMastersList = new List<ReportMasterIL>();
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

        public String ReportIds
        {
            get
            {
                return reportIds;
            }

            set
            {
                reportIds = value;
            }
        }
        public List<ReportMasterIL> ReportMastersList
        {
            get
            {
                return reportMastersList;
            }

            set
            {
                reportMastersList = value;
            }
        }

        public Int16[] ReportIdList
        {
            get
            {
                return reportIdList;
            }

            set
            {
                reportIdList = value;
            }
        }
    }
}
