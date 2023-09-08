using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VSDSLaneConfigIL : CommonIL
    {
        Int16 laneNumber;
        String allowedClassIds;
        Decimal allowedSpeed;
        short[] allowedClassIdList;
        List<VehicleClassIL> allowedClassList;

        public VSDSLaneConfigIL()
        {
            laneNumber = 0;
            allowedClassIds = String.Empty;
            allowedSpeed = 0;
            allowedClassList = new List<VehicleClassIL>();
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

        public String AllowedClassIds
        {
            get
            {
                return allowedClassIds;
            }

            set
            {
                allowedClassIds = value;
            }
        }

        public Decimal AllowedSpeed
        {
            get
            {
                return allowedSpeed;
            }

            set
            {
                allowedSpeed = value;
            }
        }

        public Int16[] AllowedClassIdList
        {
            get
            {
                return allowedClassIdList;
            }

            set
            {
                allowedClassIdList = value;
            }
        }

        public List<VehicleClassIL> AllowedClassList
        {
            get
            {
                return allowedClassList;
            }

            set
            {
                allowedClassList = value;
            }
        }
    }
}
