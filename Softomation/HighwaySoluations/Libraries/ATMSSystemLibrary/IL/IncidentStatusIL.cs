using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class IncidentStatusIL : CommonIL
    {
        Int16 incidentStatusId;
        String incidentStatusName;
        String incidentStatusIcon;
        String incidentStatusColorCode;
        Decimal processPercentage;
        public IncidentStatusIL()
        {
            incidentStatusId = 0;
            incidentStatusName = string.Empty;
            incidentStatusIcon = string.Empty;
            incidentStatusColorCode = string.Empty;
            processPercentage = 0;
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

        public Decimal ProcessPercentage
        {
            get
            {
                return processPercentage;
            }

            set
            {
                processPercentage = value;
            }
        }
    }
}
