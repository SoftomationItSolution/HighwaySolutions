using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ControlRoomIL : CommonIL
    {
        Int64 controlRoomId;
        String controlRoomName;
        Decimal chainageNumber;
        String chainageName;
        Decimal latitude;
        Decimal longitude;
        Int16 directionId;
        String directionName;
        public ControlRoomIL()
        {
            this.controlRoomId = 0;
            this.controlRoomName = string.Empty;
            this.chainageNumber = 0;
            this.chainageName = string.Empty;
            this.latitude = 0;
            this.longitude = 0;
            this.directionId = 0;
            this.directionName = string.Empty;
        }
        public Int64 ControlRoomId
        {
            get
            {
                return controlRoomId;
            }

            set
            {
                controlRoomId = value;
            }
        }
        public String ControlRoomName
        {
            get => controlRoomName; set => controlRoomName = value;
        }

        public Decimal ChainageNumber
        {
            get
            {
                return chainageNumber;
            }

            set
            {
                chainageNumber = value;
            }
        }

        public String ChainageName
        {
            get
            {
                return chainageName;
            }

            set
            {
                chainageName = value;
            }
        }

        public Decimal Latitude
        {
            get
            {
                return latitude;
            }

            set
            {
                latitude = value;
            }
        }

        public Decimal Longitude
        {
            get
            {
                return longitude;
            }

            set
            {
                longitude = value;
            }
        }

        public Int16 DirectionId
        {
            get
            {
                return directionId;
            }

            set
            {
                directionId = value;
            }
        }

        public String DirectionName
        {
            get
            {
                return directionName;
            }

            set
            {
                directionName = value;
            }
        }
    }
}
