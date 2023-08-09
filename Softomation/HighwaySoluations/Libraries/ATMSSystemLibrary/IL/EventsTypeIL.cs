using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class EventsTypeIL : CommonIL
    {
        Int16 eventTypeId;
        String eventTypeName;
        Boolean eventsRequired;
        Boolean reviewRequired;
        Int16 systemId;
        Int16 challanTypeId;
        String challanTypeName;

        public EventsTypeIL()
        {
            this.eventTypeId = 0;
            this.eventTypeName = string.Empty;
            this.eventsRequired = false;
            this.reviewRequired = false;
            this.systemId = 0;
            this.challanTypeId = 0;
            this.challanTypeName = string.Empty;
        }

        public Int16 EventTypeId
        {
            get
            {
                return eventTypeId;
            }

            set
            {
                eventTypeId = value;
            }
        }
        public String EventTypeName
        {
            get
            {
                return eventTypeName;
            }

            set
            {
                eventTypeName = value;
            }
        }
        public Boolean EventsRequired
        {
            get
            {
                return eventsRequired;
            }

            set
            {
                eventsRequired = value;
            }
        }
        public Boolean ReviewRequired
        {
            get
            {
                return reviewRequired;
            }

            set
            {
                reviewRequired = value;
            }
        }
        public Int16 SystemId
        {
            get
            {
                return systemId;
            }

            set
            {
                systemId = value;
            }
        }
        public Int16 ChallanTypeId
        {
            get
            {
                return challanTypeId;
            }

            set
            {
                challanTypeId = value;
            }
        }
        public String ChallanTypeName
        {
            get
            {
                return challanTypeName;
            }

            set
            {
                challanTypeName = value;
            }
        }
    }
}
