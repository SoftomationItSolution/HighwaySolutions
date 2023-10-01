using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class TrafficDetailsIL
    {
        DateTime startDateTime;
        DateTime endDateTime;
        String timeSloat;
        Int16 eventTypeId;
        String eventTypeName;
        Int16 vehicleClassId;
        String vehicleClassName;
        String vehicleClassIcon;
        Decimal chainageNumber;
        String chainageName;
        Int16 laneNumber;
        String laneName;
        Int64 lEventCount;
        Int64 rEventCount;
        Int64 eventCount;

        public TrafficDetailsIL()
        {
            startDateTime = DateTime.Now;
            endDateTime = DateTime.Now;
            timeSloat = string.Empty;
            eventTypeId = 0;
            eventTypeName = string.Empty;
            vehicleClassId = 0;
            vehicleClassName = string.Empty;
            vehicleClassIcon = string.Empty;
            chainageNumber = 0;
            chainageName = string.Empty;
            laneNumber = 0;
            laneName = string.Empty;
            lEventCount = 0;
            rEventCount = 0;
            eventCount = 0;
        }
        
        public DateTime StartDateTime
        {
            get
            {
                return startDateTime;
            }

            set
            {
                startDateTime = value;
            }
        }
        public DateTime EndDateTime
        {
            get
            {
                return endDateTime;
            }

            set
            {
                endDateTime = value;
            }
        }
        public String TimeSloat
        {
            get
            {
                return timeSloat;
            }

            set
            {
                timeSloat = value;
            }
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
        public Int16 VehicleClassId
        {
            get
            {
                return vehicleClassId;
            }

            set
            {
                vehicleClassId = value;
            }
        }
        public String VehicleClassName
        {
            get
            {
                return vehicleClassName;
            }

            set
            {
                vehicleClassName = value;
            }
        }
        public String VehicleClassIcon
        {
            get
            {
                return vehicleClassIcon;
            }

            set
            {
                vehicleClassIcon = value;
            }
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
                ChainageName = string.Format("{0:0.000}", chainageNumber);
                ChainageName = ChainageName.Replace(".", "+");
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
        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
                LaneName = "Lane-"+Convert.ToString(value);
            }
        }
        public String LaneName
        {
            get
            {
                return laneName;
            }

            set
            {
                laneName = value;
               
            }
        }
        public Int64 LEventCount
        {
            get
            {
                return lEventCount;
            }

            set
            {
                lEventCount = value;
            }
        }
        public Int64 REventCount
        {
            get
            {
                return rEventCount;
            }

            set
            {
                rEventCount = value;
            }
        }
        public Int64 EventCount
        {
            get
            {
                return eventCount;
            }

            set
            {
                eventCount = value;
            }
        }
       
    }
}
