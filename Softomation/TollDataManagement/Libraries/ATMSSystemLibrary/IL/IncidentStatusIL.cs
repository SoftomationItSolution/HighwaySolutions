using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class IncidentStatusIL : CommonIL
    {
        Int16 incidentStatusId;
        String incidentStatusName;
        String incidentStatusIcon;
        String incidentStatusColorCode;

        public IncidentStatusIL()
        {
            incidentStatusId = 0;
            incidentStatusName = string.Empty;
            incidentStatusIcon = string.Empty;
            incidentStatusColorCode = string.Empty;
        }

        public Int16 IncidentStatusId
        {
            get
            {
                return incidentStatusId;
            }

            set
            {
                incidentStatusId = value;
            }
        }

        public String IncidentStatusName
        {
            get
            {
                return incidentStatusName;
            }

            set
            {
                incidentStatusName = value;
            }
        }

        public String IncidentStatusIcon
        {
            get
            {
                return incidentStatusIcon;
            }

            set
            {
                incidentStatusIcon = value;
            }
        }

        public String IncidentStatusColorCode
        {
            get
            {
                return incidentStatusColorCode;
            }

            set
            {
                incidentStatusColorCode = value;
            }
        }
    }
}
