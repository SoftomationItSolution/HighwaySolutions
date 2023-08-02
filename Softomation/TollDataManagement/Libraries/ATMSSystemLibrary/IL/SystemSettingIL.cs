using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class SystemSettingIL:CommonIL
    {
        Int16 totalLane;
        Boolean isATCCIndependently;
        Boolean aTCCByVSDS;
        Boolean aTCCByVIDS;
        Int16 trafficCount;
        Int16 trafficByTime;

        public SystemSettingIL()
        {
            this.totalLane = 4;
            this.isATCCIndependently = true;
            this.aTCCByVSDS = false;
            this.aTCCByVIDS = false;
            this.trafficCount = 500;
            this.trafficByTime = 10;
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
    }
}
