using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class PhoneEventsIL : EquipmentDetailsIL
    {
        Int64 phoneBookId;
        Int64 extensionId;
        String extensionName;
        String extensionNumber;
        Int16 phoneTypeId;
        String phoneTypeName;
        Boolean phoneStatusId;
        Boolean onCallStatus;
        public PhoneEventsIL()
        {
            phoneBookId = 0;
            extensionId = 0;
            extensionName = string.Empty;
            extensionNumber = string.Empty;
            phoneTypeId = 0;
            phoneTypeName = string.Empty;
            phoneStatusId = false;
            onCallStatus = false;
        }

        public Int64 PhoneBookId
        {
            get
            {
                return phoneBookId;
            }

            set
            {
                phoneBookId = value;
            }
        }

        public Int64 ExtensionId
        {
            get
            {
                return extensionId;
            }

            set
            {
                extensionId = value;
            }
        }

        public String ExtensionName
        {
            get
            {
                return extensionName;
            }

            set
            {
                extensionName = value;
            }
        }

        public String ExtensionNumber
        {
            get
            {
                return extensionNumber;
            }

            set
            {
                extensionNumber = value;
            }
        }

        public Int16 PhoneTypeId
        {
            get
            {
                return phoneTypeId;
            }

            set
            {
                phoneTypeId = value;
            }
        }

        public String PhoneTypeName
        {
            get
            {
                return phoneTypeName;
            }

            set
            {
                phoneTypeName = value;
            }
        }

        public Boolean PhoneStatusId
        {
            get
            {
                return phoneStatusId;
            }

            set
            {
                phoneStatusId = value;
            }
        }

        public Boolean OnCallStatus
        {
            get
            {
                return onCallStatus;
            }

            set
            {
                onCallStatus = value;
            }
        }
    }
}
