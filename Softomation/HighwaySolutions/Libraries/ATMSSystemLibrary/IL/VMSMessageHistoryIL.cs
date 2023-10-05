using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VMSMessageHistoryIL : EquipmentConfigIL
    {
        Int32 messageId;
        String mediaPath;
        Int16 messageTypeId;
        String messageTypeName;
        Int16 displayTimout;
        DateTime validTillDate;
        String validTillDateStamp;
        String messageDetails;
        DateTime playDateTime;
        String playDateTimeStamp;

        public VMSMessageHistoryIL()
        {
            this.messageId = 0;
            this.mediaPath = string.Empty;
            this.messageTypeId = 0;
            this.messageTypeName = string.Empty;
            this.displayTimout = 0;
            this.validTillDate = DateTime.Now;
            this.validTillDateStamp = string.Empty;
            this.messageDetails = string.Empty;
            this.playDateTime = DateTime.Now;
            this.playDateTimeStamp = string.Empty;
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
        public Int16 MessageTypeId
        {
            get
            {
                return messageTypeId;
            }

            set
            {
                messageTypeId = value;
            }
        }
        public String MessageTypeName
        {
            get
            {
                return messageTypeName;
            }

            set
            {
                messageTypeName = value;
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
        public String ValidTillDateStamp
        {
            get
            {
                return validTillDateStamp;
            }

            set
            {
                validTillDateStamp = value;
            }
        }
        public DateTime PlayDateTime
        {
            get
            {
                return playDateTime;
            }

            set
            {
                playDateTime = value;
            }
        }
        public String PlayDateTimeStamp
        {
            get
            {
                return playDateTimeStamp;
            }

            set
            {
                playDateTimeStamp = value;
            }
        }
    }
}
