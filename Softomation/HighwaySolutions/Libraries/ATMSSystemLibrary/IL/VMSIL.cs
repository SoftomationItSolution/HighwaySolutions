using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VMSIL:CommonIL
    {
        Int32 messageId;
        string vmsIds;
        string mediaPath;
        Int16 formatId;
        string formatName;
        Int16 displayTimout;
        DateTime validTillDate;
        string validTillDateTimeStamp;
        string nodeDetails;
        string styleDetails;
        string cssDetails;
        string messageDetails;
        Int64 programeId;
        Boolean editRequired;
        Boolean makeRequired;
        public VMSIL()
        {
            this.messageId = 0;
            this.vmsIds = string.Empty; 
            this.mediaPath = string.Empty;
            this.formatId = 0;
            this.formatName = string.Empty;
            this.displayTimout = 0;
            this.validTillDate = DateTime.Now;
            this.validTillDateTimeStamp = string.Empty;
            this.nodeDetails = string.Empty;
            this.styleDetails = string.Empty;
            this.cssDetails = string.Empty;
            this.messageDetails = string.Empty;
            this.programeId = 0;
            this.editRequired = false;
            this.makeRequired = false;
        }

        public Int32 MessageId
        {
            get
            {
                return messageId;
            }

            set
            {
                messageId = value;
            }
        }

        public String VmsIds
        {
            get
            {
                return vmsIds;
            }

            set
            {
                vmsIds = value;
            }
        }

        public String MediaPath
        {
            get
            {
                return mediaPath;
            }

            set
            {
                mediaPath = value;
            }
        }

        public Int16 FormatId
        {
            get
            {
                return formatId;
            }

            set
            {
                formatId = value;
            }
        }
        public string FormatName
        {
            get
            {
                return formatName;
            }

            set
            {
                formatName = value;
            }
        }
        public Int16 DisplayTimout
        {
            get
            {
                return displayTimout;
            }

            set
            {
                displayTimout = value;
            }
        }

        public DateTime ValidTillDate
        {
            get
            {
                return validTillDate;
            }

            set
            {
                validTillDate = value;
            }
        }

        public String NodeDetails
        {
            get
            {
                return nodeDetails;
            }

            set
            {
                nodeDetails = value;
            }
        }

        public String StyleDetails
        {
            get
            {
                return styleDetails;
            }

            set
            {
                styleDetails = value;
            }
        }

        public String CssDetails
        {
            get
            {
                return cssDetails;
            }

            set
            {
                cssDetails = value;
            }
        }

        public String MessageDetails
        {
            get
            {
                return messageDetails;
            }

            set
            {
                messageDetails = value;
            }
        }

        public Int64 ProgrameId
        {
            get
            {
                return programeId;
            }

            set
            {
                programeId = value;
            }
        }

        public Boolean EditRequired
        {
            get
            {
                return editRequired;
            }

            set
            {
                editRequired = value;
            }
        }

        public Boolean MakeRequired
        {
            get
            {
                return makeRequired;
            }

            set
            {
                makeRequired = value;
            }
        }

        public String ValidTillDateTimeStamp
        {
            get
            {
                return validTillDateTimeStamp;
            }

            set
            {
                validTillDateTimeStamp = value;
            }
        }
    }
}
