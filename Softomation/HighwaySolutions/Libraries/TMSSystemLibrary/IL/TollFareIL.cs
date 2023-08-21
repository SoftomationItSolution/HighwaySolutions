using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class TollFareIL : CommonIL
    {
        Int64 tollFareId;
        DateTime effectedFrom;
        String effectedFromStamp;
        List<TollFareConfigurationIL> tollFareConfigurations;

        public TollFareIL()
        {
            tollFareId = 0;
            effectedFrom = DateTime.MinValue;
            effectedFromStamp = string.Empty;
            tollFareConfigurations = new List<TollFareConfigurationIL>();
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

        public DateTime EffectedFrom
        {
            get
            {
                return effectedFrom;
            }

            set
            {
                effectedFrom = value;
            }
        }

        public String EffectedFromStamp
        {
            get
            {
                return effectedFromStamp;
            }

            set
            {
                effectedFromStamp = value;
            }
        }

        public List<TollFareConfigurationIL> TollFareConfigurations
        {
            get
            {
                return tollFareConfigurations;
            }

            set
            {
                tollFareConfigurations = value;
            }
        }
    }
}
