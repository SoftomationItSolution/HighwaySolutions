using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class IncidentSourceIL : CommonIL
    {
        Int16 sourceId;
        String sourceName;
        String referenceNo;

        public IncidentSourceIL()
        {
            sourceId = 0;
            sourceName = string.Empty;
            referenceNo = string.Empty;
        }

        public Int16 SourceId
        {
            get
            {
                return sourceId;
            }

            set
            {
                sourceId = value;
            }
        }

        public String SourceName
        {
            get
            {
                return sourceName;
            }

            set
            {
                sourceName = value;
            }
        }

        public String ReferenceNo
        {
            get
            {
                return referenceNo;
            }

            set
            {
                referenceNo = value;
            }
        }
    }
}
