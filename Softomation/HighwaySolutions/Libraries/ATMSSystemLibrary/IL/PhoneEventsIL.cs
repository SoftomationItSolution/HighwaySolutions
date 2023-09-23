using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class PhoneEventsIL : PhoneBookIL
    {
        String eventMessage;
        Int16 eventId;
        String eventName;
        DateTime eventDateTime;

        public PhoneEventsIL()
        {
            this.eventMessage = String.Empty;
            this.eventId = 0;
            this.eventName = String.Empty;
            this.eventDateTime = DateTime.Now;
        }

        public string EventMessage
        {
            get => eventMessage; set => eventMessage = value;
        }
        public short EventId
        {
            get => eventId; set => eventId = value;
        }
        public string EventName
        {
            get => eventName; set => eventName = value;
        }
        public DateTime EventDateTime
        {
            get => eventDateTime; set => eventDateTime = value;
        }
    }
}
