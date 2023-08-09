using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class MasterConfigIL : CommonIL
    {
        Int16 tollingType;
        Int16 chargingType;
        String appVersion;
        public MasterConfigIL()
        {
            this.tollingType = 2;
            this.chargingType = 2;
            this.appVersion = Constants.Version;
        }
        public short TollingType
        {
            get => tollingType; set => tollingType = value;
        }
        public short ChargingType
        {
            get => chargingType; set => chargingType = value;
        }
        public String AppVersion
        {
            get => appVersion; set => appVersion = value;
        }
    }
}
