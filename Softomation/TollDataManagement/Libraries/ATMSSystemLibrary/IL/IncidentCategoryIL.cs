using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class IncidentCategoryIL : CommonIL
    {
        Int16 incidentCategoryId;
        String incidentCategoryName;
        String incidentCategoryIcon;
        Int16 priorityId;
        String priorityName;
        Int16 orderBy;

        public IncidentCategoryIL()
        {
            incidentCategoryId = 0;
            incidentCategoryName = string.Empty;
            incidentCategoryIcon = string.Empty;
            priorityId = 0;
            priorityName = string.Empty;
            orderBy = 0;
        }
        public Int16 IncidentCategoryId
        {
            get
            {
                return incidentCategoryId;
            }

            set
            {
                incidentCategoryId = value;
            }
        }
        public String IncidentCategoryName
        {
            get
            {
                return incidentCategoryName;
            }

            set
            {
                incidentCategoryName = value;
            }
        }
        public String IncidentCategoryIcon
        {
            get
            {
                return incidentCategoryIcon;
            }

            set
            {
                incidentCategoryIcon = value;
            }
        }
        public Int16 PriorityId
        {
            get
            {
                return priorityId;
            }

            set
            {
                priorityId = value;
            }
        }
        public String PriorityName
        {
            get
            {
                return priorityName;
            }

            set
            {
                priorityName = value;
            }
        }
        public Int16 OrderBy
        {
            get
            {
                return orderBy;
            }

            set
            {
                orderBy = value;
            }
        }
    }
}
