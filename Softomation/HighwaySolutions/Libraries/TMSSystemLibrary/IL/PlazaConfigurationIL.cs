using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class PlazaConfigurationIL : CommonIL
    {
        Int16 systemIntegratorId;
        String systemIntegratorName;
        Int16 plazaId;
        String plazaName;
        String plazaServerIpAddress;
        String plazaZoneId;
        Decimal chainageNumber;
        String chainageName;
        Decimal latitude;
        Decimal longitude;

        public PlazaConfigurationIL()
        {
            this.systemIntegratorId = 0;
            this.systemIntegratorName = string.Empty;
            this.plazaId = 0;
            this.plazaName = string.Empty;
            this.plazaServerIpAddress = string.Empty;
            this.plazaZoneId = string.Empty;
            this.chainageNumber = 0;
            this.chainageName = string.Empty;
            this.latitude = 0;
            this.longitude = 0;
        }
        public short SystemIntegratorId
        {
            get => systemIntegratorId; set => systemIntegratorId = value;
        }
        public string SystemIntegratorName
        {
            get => systemIntegratorName; set => systemIntegratorName = value;
        }
        public short PlazaId
        {
            get => plazaId; set => plazaId = value;
        }
        public string PlazaName
        {
            get => plazaName; set => plazaName = value;
        }
        public string PlazaServerIpAddress
        {
            get => plazaServerIpAddress; set => plazaServerIpAddress = value;
        }
        public string PlazaZoneId
        {
            get => plazaZoneId; set => plazaZoneId = value;
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
        public Decimal Latitude
        {
            get
            {
                return latitude;
            }

            set
            {
                latitude = value;
            }
        }
        public Decimal Longitude
        {
            get
            {
                return longitude;
            }

            set
            {
                longitude = value;
            }
        }
    }
}
