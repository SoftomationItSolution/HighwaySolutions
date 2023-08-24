using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class SystemSettingIL : CommonIL
    {
        Int16 defaultPlazaId;
        Int16 tollingTypeId;
        Int16 allotmentDays;
        Boolean cashPenalty;
        Boolean loginAccess;
        Boolean exemptAccess;
        Boolean fleetAccess;
        Decimal openingBalance;
        Decimal closingBalance;

        public SystemSettingIL()
        {
            this.defaultPlazaId = 1;
            this.tollingTypeId = 1;
            this.allotmentDays = 4;
            this.cashPenalty = true;
            this.loginAccess = false;
            this.exemptAccess = false;
            this.fleetAccess = false;
            this.openingBalance = 0;
            this.closingBalance = 0;
        }
        public short DefaultPlazaId
        {
            get => defaultPlazaId; set => defaultPlazaId = value;
        }
        public short TollingTypeId
        {
            get => tollingTypeId; set => tollingTypeId = value;
        }
        public short AllotmentDays
        {
            get => allotmentDays; set => allotmentDays = value;
        }
        public bool CashPenalty
        {
            get => cashPenalty; set => cashPenalty = value;
        }
        public bool LoginAccess
        {
            get => loginAccess; set => loginAccess = value;
        }
        public bool ExemptAccess
        {
            get => exemptAccess; set => exemptAccess = value;
        }
        public bool FleetAccess
        {
            get => fleetAccess; set => fleetAccess = value;
        }
        public Decimal OpeningBalance
        {
            get => openingBalance; set => openingBalance = value;
        }
        public Decimal ClosingBalance
        {
            get => closingBalance; set => closingBalance = value;
        }
    }
}
