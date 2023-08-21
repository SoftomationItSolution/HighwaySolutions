using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class TollFareConfigurationIL 
    {
        Int64 tollFareId;
        Int64 journeyId;
        String journeyName;
        Int16 systemVehicleClassId;
        String systemVehicleClassName;
        Decimal tollFare;
        Decimal returnFare;
        Decimal fasTagPenalty;
        Decimal overweightPenalty;

        public TollFareConfigurationIL()
        {
            tollFareId = 0;
            journeyId = 0;
            journeyName = string.Empty;
            systemVehicleClassId = 0;
            systemVehicleClassName = string.Empty;
            tollFare = 0;
            returnFare = 0;
            fasTagPenalty = 0;
            overweightPenalty = 0;
        }

        public Int64 TollFareId
        {
            get
            {
                return tollFareId;
            }

            set
            {
                tollFareId = value;
            }
        }
        public Int64 JourneyId
        {
            get
            {
                return journeyId;
            }

            set
            {
                journeyId = value;
            }
        }
        public String JourneyName
        {
            get
            {
                return journeyName;
            }

            set
            {
                journeyName = value;
            }
        }
        public Int16 SystemVehicleClassId
        {
            get
            {
                return systemVehicleClassId;
            }

            set
            {
                systemVehicleClassId = value;
            }
        }
        public String SystemVehicleClassName
        {
            get
            {
                return systemVehicleClassName;
            }

            set
            {
                systemVehicleClassName = value;
            }
        }
        public Decimal TollFare
        {
            get
            {
                return tollFare;
            }

            set
            {
                tollFare = value;
            }
        }
        public Decimal ReturnFare
        {
            get
            {
                return returnFare;
            }

            set
            {
                returnFare = value;
            }
        }
        public Decimal FasTagPenalty
        {
            get
            {
                return fasTagPenalty;
            }

            set
            {
                fasTagPenalty = value;
            }
        }
        public Decimal OverweightPenalty
        {
            get
            {
                return overweightPenalty;
            }

            set
            {
                overweightPenalty = value;
            }
        }
    }
}
