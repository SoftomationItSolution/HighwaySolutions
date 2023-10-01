using System.Collections.Generic;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class DashboardSystemDataIL
    {
        List<TrafficDetailsIL> masterTrafficCount;
        List<TrafficDetailsIL> hourTrafficCount;
        List<TrafficDetailsIL> locationTrafficCount;
        List<TrafficDetailsIL> vehicleTrafficCount;
        List<TrafficDetailsIL> laneTrafficCount;
        List<TrafficDetailsIL> laneVehicleTrafficCount;
        List<TrafficDetailsIL> locationEventCount;

        public DashboardSystemDataIL()
        {
            masterTrafficCount = new List<TrafficDetailsIL>();
            hourTrafficCount = new List<TrafficDetailsIL>();
            locationTrafficCount = new List<TrafficDetailsIL>();
            vehicleTrafficCount = new List<TrafficDetailsIL>();
            laneTrafficCount = new List<TrafficDetailsIL>();
            laneVehicleTrafficCount = new List<TrafficDetailsIL>();
            locationEventCount = new List<TrafficDetailsIL>();
        }
        public List<TrafficDetailsIL> MasterTrafficeCount
        {
            get
            {
                return masterTrafficCount;
            }

            set
            {
                masterTrafficCount = value;
            }
        }
        public List<TrafficDetailsIL> HourTrafficCount
        {
            get
            {
                return hourTrafficCount;
            }

            set
            {
                hourTrafficCount = value;
            }
        }
        public List<TrafficDetailsIL> LocationTrafficCount
        {
            get
            {
                return locationTrafficCount;
            }

            set
            {
                locationTrafficCount = value;
            }
        }
        public List<TrafficDetailsIL> VehicleTrafficCount
        {
            get
            {
                return vehicleTrafficCount;
            }

            set
            {
                vehicleTrafficCount = value;
            }
        }
        public List<TrafficDetailsIL> LaneTrafficCount
        {
            get
            {
                return laneTrafficCount;
            }

            set
            {
                laneTrafficCount = value;
            }
        }
        public List<TrafficDetailsIL> LaneVehicleTrafficCount
        {
            get
            {
                return laneVehicleTrafficCount;
            }

            set
            {
                laneVehicleTrafficCount = value;
            }
        }

        public List<TrafficDetailsIL> LocationEventCount
        {
            get
            {
                return locationEventCount;
            }

            set
            {
                locationEventCount = value;
            }
        }

        
    }
}
