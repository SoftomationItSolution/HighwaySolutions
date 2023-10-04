using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VMSMessageDetailsIL:CommonIL
    {
        Int32 messageId;
        String equipmentIds;
        String mediaPath;
        Int16 messageTypeId;
        String messageTypeName;
        Int16 displayTimout;
        DateTime validTillDate;
        String validTillDateStamp;
        String messageDetails;
        List<EquipmentDetailsIL> equipmentList;
        public VMSMessageDetailsIL()
        {
            this.messageId = 0;
            this.equipmentIds = string.Empty; 
            this.mediaPath = string.Empty;
            this.messageTypeId = 0;
            this.messageTypeName = string.Empty;
            this.displayTimout = 0;
            this.validTillDate = DateTime.Now;
            this.validTillDateStamp = string.Empty;
            this.messageDetails = string.Empty;
            equipmentList = new List<EquipmentDetailsIL>();
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
        public String EquipmentIds
        {
            get
            {
                return equipmentIds;
            }

            set
            {
                equipmentIds = value;
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
        public List<EquipmentDetailsIL> EquipmentList
        {
            get
            {
                return equipmentList;
            }

            set
            {
                equipmentList = value;
            }
        }
    }
}
