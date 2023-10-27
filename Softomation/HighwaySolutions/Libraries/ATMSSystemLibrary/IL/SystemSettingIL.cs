using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class SystemSettingIL : CommonIL
    {
        Int16 totalLane;
        Boolean isATCCIndependently;
        Boolean aTCCByVSDS;
        Boolean aTCCByVIDS;
        Int16 trafficCount;
        Int16 trafficByTime;
        String restrictedVehiclesIds;
        Int16[] restrictedVehiclesIdList;
        List<VehicleClassIL> restrictedVehiclesList;
        Int16 defaultControlRoomId;
        Boolean isWeatherOnline;
        String weatherAPI;
        Int16 weatherAPIHitPerMinite;
        public SystemSettingIL()
        {
            this.totalLane = 4;
            this.isATCCIndependently = true;
            this.aTCCByVSDS = false;
            this.aTCCByVIDS = false;
            this.trafficCount = 500;
            this.trafficByTime = 10;
            this.restrictedVehiclesIds = string.Empty;
            this.restrictedVehiclesList = new List<VehicleClassIL>();
            this.defaultControlRoomId = 1;
            this.isWeatherOnline = true;
            this.weatherAPI = string.Empty;
            this.weatherAPIHitPerMinite = 15;
        }

        public Int16 TotalLane
        {
            get
            {
                return totalLane;
            }

            set
            {
                totalLane = value;
            }
        }
        public Boolean IsATCCIndependently
        {
            get
            {
                return isATCCIndependently;
            }

            set
            {
                isATCCIndependently = value;
            }
        }
        public Boolean ATCCByVSDS
        {
            get
            {
                return aTCCByVSDS;
            }

            set
            {
                aTCCByVSDS = value;
            }
        }
        public Boolean ATCCByVIDS
        {
            get
            {
                return aTCCByVIDS;
            }

            set
            {
                aTCCByVIDS = value;
            }
        }
        public Int16 TrafficCount
        {
            get
            {
                return trafficCount;
            }

            set
            {
                trafficCount = value;
            }
        }
        public Int16 TrafficByTime
        {
            get
            {
                return trafficByTime;
            }

            set
            {
                trafficByTime = value;
            }
        }
        public String RestrictedVehiclesIds
        {
            get
            {
                return restrictedVehiclesIds;
            }

            set
            {
                restrictedVehiclesIds = value;
            }
        }
        public Int16[] RestrictedVehiclesIdList
        {
            get
            {
                return restrictedVehiclesIdList;
            }

            set
            {
                restrictedVehiclesIdList = value;
            }
        }
        public List<VehicleClassIL> RestrictedVehiclesList
        {
            get
            {
                return restrictedVehiclesList;
            }

            set
            {
                restrictedVehiclesList = value;
            }
        }
        public Int16 DefaultControlRoomId
        {
            get
            {
                return defaultControlRoomId;
            }

            set
            {
                defaultControlRoomId = value;
            }
        }
        public Boolean IsWeatherOnline
        {
            get
            {
                return isWeatherOnline;
            }

            set
            {
                isWeatherOnline = value;
            }
        }
        public String WeatherAPI
        {
            get
            {
                return weatherAPI;
            }

            set
            {
                weatherAPI = value;
            }
        }
        public Int16 WeatherAPIHitPerMinite
        {
            get
            {
                return weatherAPIHitPerMinite;
            }

            set
            {
                weatherAPIHitPerMinite = value;
            }
        }
    }
}
