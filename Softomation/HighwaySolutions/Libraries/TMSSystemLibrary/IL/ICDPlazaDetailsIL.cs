using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDPlazaDetailsIL
    {
        short plazaId;
        string plazaGeoCode;
        Int64 plazaZoneId;
        Int32 plazaAcquirerId;
        string plazaName;
        string plazaState;
        string plazaAddress;
        string plazaFromDistrict;
        string plazaToDistrict;
        string plazaAgencyCode;

        public ICDPlazaDetailsIL()
        {
            plazaId = 0;
            plazaGeoCode = string.Empty;
            plazaZoneId = 0;
            plazaName = string.Empty;
            plazaState = string.Empty;
            plazaAddress = string.Empty;
            plazaFromDistrict = string.Empty;
            plazaToDistrict = string.Empty;
            plazaAgencyCode = string.Empty;
        }
        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
        }
        public Int64 PlazaZoneId
        {
            get
            {
                return plazaZoneId;
            }

            set
            {
                plazaZoneId = value;
            }
        }
        public Int32 PlazaAcquirerId
        {
            get
            {
                return plazaAcquirerId;
            }

            set
            {
                plazaAcquirerId = value;
            }
        }
        public String PlazaName
        {
            get
            {
                return plazaName;
            }

            set
            {
                plazaName = value;
            }
        }
        public String PlazaGeoCode
        {
            get
            {
                return plazaGeoCode;
            }

            set
            {
                plazaGeoCode = value;
            }
        }
        public String PlazaState
        {
            get
            {
                return plazaState;
            }

            set
            {
                plazaState = value;
            }
        }
        public String PlazaAddress
        {
            get
            {
                return plazaAddress;
            }

            set
            {
                plazaAddress = value;
            }
        }
        public String PlazaFromDistrict
        {
            get
            {
                return plazaFromDistrict;
            }

            set
            {
                plazaFromDistrict = value;
            }
        }
        public String PlazaToDistrict
        {
            get
            {
                return plazaToDistrict;
            }

            set
            {
                plazaToDistrict = value;
            }
        }
        public String PlazaAgencyCode
        {
            get
            {
                return plazaAgencyCode;
            }

            set
            {
                plazaAgencyCode = value;
            }
        }

        
    }
}
