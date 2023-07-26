using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class EventsTypeIL : CommonIL
    {
        Int16 eventsTypeId;
        String eventTypeName;
        Boolean eventsRequired;
        Boolean challanRequired;
        Int16 systemId;

        public EventsTypeIL()
        {
            this.eventsTypeId = 0;
            this.eventTypeName = string.Empty;
            this.eventsRequired = false;
            this.challanRequired = false;
            this.systemId = 0;
        }

        public Int16 EventsTypeId
        {
            get
            {
                return eventsTypeId;
            }

            set
            {
                eventsTypeId = value;
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
        public Boolean ChallanRequired
        {
            get
            {
                return challanRequired;
            }

            set
            {
                challanRequired = value;
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
    }
}
