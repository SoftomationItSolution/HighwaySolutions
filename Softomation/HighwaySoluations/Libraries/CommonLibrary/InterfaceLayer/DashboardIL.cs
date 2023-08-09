using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class DashboardIL
    {
        DateTime startDateTime;
        DateTime endDateTime;
        String statusTime;
        Decimal averageAmount;
        Decimal averageAuditedUpTime;
        Int64 traficCount;
        Int64 typeId;
        String typeName;
        Int16 drillDown;
        Int16 plazaId;
        Int64 deviceId;

        public DashboardIL()
        {
            this.startDateTime = DateTime.Now;
            this.endDateTime = DateTime.Now;
            this.statusTime = String.Empty;
            this.averageAuditedUpTime = 0;
            this.averageAmount = 0;
            this.traficCount = 0;
            this.typeId = 0;
            this.typeName = String.Empty;
            this.drillDown = 0;
            this.plazaId = 0;
            this.deviceId = 0;
        }

        public DateTime StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public DateTime EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public string StatusTime
        {
            get => statusTime; set => statusTime = value;
        }
        public decimal AverageAmount
        {
            get => averageAmount; set => averageAmount = value;
        }
        public decimal AverageAuditedUpTime
        {
            get => averageAuditedUpTime; set => averageAuditedUpTime = value;
        }
        public long TypeId
        {
            get => typeId; set => typeId = value;
        }
        public long TraficCount
        {
            get => traficCount; set => traficCount = value;
        }
        public string TypeName
        {
            get => typeName; set => typeName = value;
        }
        public short DrillDown
        {
            get => drillDown; set => drillDown = value;
        }
        public short PlazaId
        {
            get => plazaId; set => plazaId = value;
        }
        public long DeviceId
        {
            get => deviceId; set => deviceId = value;
        }
    }
}
