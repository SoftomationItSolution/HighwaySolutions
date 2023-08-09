
using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class IncidentActionHistoryIL : CommonIL
    {

        String incidentId;
        Int64 actionTakenById;
        String actionTakenByName;
        DateTime actionTakenDateTime;
        String actionTakenRemark;
        String actionImagePath;
        String actionVideoPath;
        String actionAudioPath;
        Int16 actionStatusId;
        String actionStatusName;
        Int64 assignedToId;
        String assignedToName;
        public IncidentActionHistoryIL()
        {
            incidentId = string.Empty;
            actionTakenById = 0;
            actionTakenByName = string.Empty;
            actionTakenDateTime = DateTime.MinValue;
            actionTakenRemark = string.Empty;
            actionImagePath = string.Empty;
            actionVideoPath = string.Empty;
            actionAudioPath = string.Empty;
            actionStatusId = 0;
            actionStatusName = string.Empty;
            assignedToId = 0;
            assignedToName = string.Empty;
           
        }
        public String IncidentId
        {
            get
            {
                return incidentId;
            }

            set
            {
                incidentId = value;
            }
        }
        public Int64 ActionTakenById
        {
            get
            {
                return actionTakenById;
            }

            set
            {
                actionTakenById = value;
            }
        }
        public String ActionTakenByName
        {
            get
            {
                return actionTakenByName;
            }

            set
            {
                actionTakenByName = value;
            }
        }
        public DateTime ActionTakenDateTime
        {
            get
            {
                return actionTakenDateTime;
            }

            set
            {
                actionTakenDateTime = value;
            }
        }
        public String ActionTakenRemark
        {
            get
            {
                return actionTakenRemark;
            }

            set
            {
                actionTakenRemark = value;
            }
        }
        public String ActionImagePath
        {
            get
            {
                return actionImagePath;
            }

            set
            {
                actionImagePath = value;
            }
        }
        public String ActionVideoPath
        {
            get
            {
                return actionVideoPath;
            }

            set
            {
                actionVideoPath = value;
            }
        }
        public String ActionAudioPath
        {
            get
            {
                return actionAudioPath;
            }

            set
            {
                actionAudioPath = value;
            }
        }
        public Int16 ActionStatusId
        {
            get
            {
                return actionStatusId;
            }

            set
            {
                actionStatusId = value;
            }
        }
        public String ActionStatusName
        {
            get
            {
                return actionStatusName;
            }

            set
            {
                actionStatusName = value;
            }
        }

        public Int64 AssignedToId
        {
            get
            {
                return assignedToId;
            }

            set
            {
                assignedToId = value;
            }
        }
        public String AssignedToName
        {
            get
            {
                return assignedToName;
            }

            set
            {
                assignedToName = value;
            }
        }
    }
}
