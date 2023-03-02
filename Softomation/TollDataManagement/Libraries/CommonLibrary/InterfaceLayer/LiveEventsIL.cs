using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LiveEventsIL
    {
        Int16 laneNumber;
        Int16 hardwareTypeId;
        Int16 eventStatus;
        DateTime eventDateTime;
        DateTime createdDate;
       
        public LiveEventsIL()
        {
            this.laneNumber = 0;
            this.hardwareTypeId = 0;
            this.eventStatus = 0;
            this.eventDateTime = DateTime.Now;
            this.createdDate = DateTime.Now;
        }

        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
            }
        }

        public Int16 HardwareTypeId
        {
            get
            {
                return hardwareTypeId;
            }

            set
            {
                hardwareTypeId = value;
            }
        }

        public Int16 EventStatus
        {
            get
            {
                return eventStatus;
            }

            set
            {
                eventStatus = value;
            }
        }

        public DateTime EventDateTime
        {
            get
            {
                return eventDateTime;
            }

            set
            {
                eventDateTime = value;
            }
        }

        public DateTime CreatedDate
        {
            get
            {
                return createdDate;
            }

            set
            {
                createdDate = value;
            }
        }
    }
}
