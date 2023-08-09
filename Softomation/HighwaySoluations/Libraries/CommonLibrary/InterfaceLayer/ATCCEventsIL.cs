using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ATCCEventsIL : CommonIL
    {
        DateTime eventDateTime;
        String controlRoomName;
        String deviceName;
        Int64 aTCCId;
        String vehicleClassName;
        Int16 vehicleClassId;
        Int16 axleCount;
        Decimal grossWeight;
        String vehicleImage;
        public ATCCEventsIL()
        {
            this.eventDateTime = DateTime.Now;
            this.controlRoomName = string.Empty;
            this.deviceName = string.Empty;
            this.aTCCId = 0;
            this.axleCount = 0;
            this.grossWeight = 0;
            this.vehicleClassName = string.Empty;
            this.vehicleClassId = 0;
            this.vehicleImage = string.Empty;
        }
        public DateTime EventDateTime
        {
            get => eventDateTime; set => eventDateTime = value;
        }
        public string ControlRoomName
        {
            get => controlRoomName; set => controlRoomName = value;
        }
        public string DeviceName
        {
            get => deviceName; set => deviceName = value;
        }
        public long ATCCId
        {
            get => aTCCId; set => aTCCId = value;
        }
        public short VehicleClassId
        {
            get => vehicleClassId; set => vehicleClassId = value;
        }
        public string VehicleClassName
        {
            get => vehicleClassName; set => vehicleClassName = value;
        }
        public short AxleCount
        {
            get => axleCount; set => axleCount = value;
        }
        public decimal GrossWeight
        {
            get => grossWeight; set => grossWeight = value;
        }
        public string VehicleImage
        {
            get => vehicleImage; set => vehicleImage = value;
        }
    }
}
