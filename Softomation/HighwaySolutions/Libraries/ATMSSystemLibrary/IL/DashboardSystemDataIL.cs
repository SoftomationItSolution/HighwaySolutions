using System.Collections.Generic;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class DashboardSystemDataIL
    {
        List<TrafficeDetailsIL> masterTrafficeCount;
        List<TrafficeDetailsIL> hourTrafficeCount;
        List<TrafficeDetailsIL> locationTrafficeCount;
        List<TrafficeDetailsIL> directionTrafficeCount;
        List<TrafficeDetailsIL> vehicleTrafficeCount;

        public DashboardSystemDataIL()
        {
            masterTrafficeCount = new List<TrafficeDetailsIL>();
            hourTrafficeCount = new List<TrafficeDetailsIL>();
            locationTrafficeCount = new List<TrafficeDetailsIL>();
            directionTrafficeCount = new List<TrafficeDetailsIL>();
            vehicleTrafficeCount = new List<TrafficeDetailsIL>();
        }
        public List<TrafficeDetailsIL> MasterTrafficeCount
        {
            get
            {
                return masterTrafficeCount;
            }

            set
            {
                masterTrafficeCount = value;
            }
        }
        public List<TrafficeDetailsIL> HourTrafficeCount
        {
            get
            {
                return hourTrafficeCount;
            }

            set
            {
                hourTrafficeCount = value;
            }
        }
        public List<TrafficeDetailsIL> LocationTrafficeCount
        {
            get
            {
                return locationTrafficeCount;
            }

            set
            {
                locationTrafficeCount = value;
            }
        }
        public List<TrafficeDetailsIL> DirectionTrafficeCount
        {
            get
            {
                return directionTrafficeCount;
            }

            set
            {
                directionTrafficeCount = value;
            }
        }
        public List<TrafficeDetailsIL> VehicleTrafficeCount
        {
            get
            {
                return vehicleTrafficeCount;
            }

            set
            {
                vehicleTrafficeCount = value;
            }
        }
    }
}
